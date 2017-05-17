(function($) {
    /**
     * ListSorter
     *
     * Class Overview
     *
     * Provides the functionality to make a list sortable like tablesorter
     *------------------------------------------------------------------*/

    /**
     * Constructor
     *
     * @elem DOM element for the widget (div with the list whicih we want to behave like a table)
     * @userConfig Object containing configuration params to overwrite the default ones
     *      userConfig{}
     *          headerClass -  Class of the div behaving as thead of the table
     *          headClass - Class on each of the cells in the header
     *          bodyClass - Class of the ul behaving as the tbody of the table
     *          rowSelector - Selector for the rows (list elements) in the table
     *          cellClass - Class on each of the div in the li of the ul with 'bodyClass'  
     *          cssAsc - Class to apply on the header cell to show the ascending arrow
     *          cssDesc - Class to apply on the header cell to show the descending arrow
     *          parsers - List of all the parsers which will be applied on this table. This is sorted per columns of the table.
     *          headers - To enable/disable sorting on specific headers of a specific type.
     *              Example: $('#targetDiv').listSorter({ headers: { 0: { sorter: text}, 1: {sorter: false}, 2: {sorter: numeric} } }); 
     *              Possible values of sorter are: text, numeric and false
     *          sortList - Array of [count, order] to provide the default sorting   
     *              Example: $('#targetDiv').listSorter({ sortList: [[0,1]] }); 
     *              This will sort first (0) column of the table in descending(1) order
     *          headerList - Array to contain the list of header cells
     *          sortInitialOrder - "asc" or "desc". Default is "asc" (ascending).
     *------------------------------------------------------------------*/

    var ListSorter = function(elem, userConfig) {
        var elem = $(elem);
        var self = this;

        // Default config object
        var config = {
            headerClass: ".thead",
            headClass: ".hcell",
            bodyClass: ".tbody",
            rowSelector: "li",
            cellClass: ".cell",
            cssAsc: "headerSortUp",
            cssDesc: "headerSortDown",
            parsers: {},
            headers: {},
            sortList: [],
            headerList: [],
            sortInitialOrder: "asc",
        }

        // Overwrite defaults with user defined values
        $.each(userConfig, function(index, configValue) {
            config[index] = configValue;
        });

        self._sortCSS = [config.cssDesc, config.cssAsc];
        self.order = null;
        self.count = null;
        //Array to contain all the possible sort parsers options
        self._parsers = [];

        this.init = function() {
            //list out all the possile sort parsers
            self._setAllParsers();
            //find the headers of the table
            self._headers = self._buildHeaders();
            //try to auto detect column sort type, and store in tables config
            config.parsers = self._buildParserCache();
            // build the cache for the tbody cells
            self._cache = self._buildCache();
            // if user has supplied a sort list to constructor.
            if (config.sortList.length > 0) {
                //that means we have to sort the list on load
                self._sortOnLoad();
            }
            //initiate the Event handlers
            self._initEvents();
        };

        /**
         * _setAllParsers
         * 
         * @description Adds all the possible sort parsers to self._parsers array
         * @return {}
         */
        this._setAllParsers = function() {
            var addParser = function(parser) {
                var len = self._parsers.length,
                        newParser = parser.id.toLowerCase(),
                        exists = false;
                //check if the parser already exists...
                for (var i = 0; i < len; i++) {
                    if (self._parsers[i][newParser]) {
                        exists = true;
                        return;
                    }
                }
                //...if not then push it to the array of parsers
                if (!exists) {
                    self._parsers.push(parser);
                }
            }

            //self._parsers[0]. Text (default) parsers 
            addParser({
                id: "text",
                is: function(str) {
                    return true;
                },
                format: function(str) {
                    return $.trim(str.toLocaleLowerCase());
                },
                type: "text"
            });

            //self._parsers[1]. Numeric parser
            addParser({
                id: "digit",
                is: function(str) {
                    return self._isDigit(str);
                },
                format: function(str) {
                    return self._formatFloat(str);
                },
                type: "numeric"
            });

        };

        /**
         * _isDigit
         * 
         * @description Return true if the param s is Numeric
         * @param {String} str
         * @returns {Boolean}
         */
        this._isDigit = function(str) {
            // replace all an wanted chars and match.
            return /^[-+]?\d*$/.test($.trim(str.replace(/[,.']/g, '')));
        };

        /**
         * _formatFloat
         * 
         * @description Return true if the param s is Float
         * @param {String} str
         * @returns {Boolean}
         */
        this._formatFloat = function(str) {
            var i = parseFloat(str);
            return (isNaN(i)) ? 0 : i;
        };


        /**
         * _buildHeaders
         * 
         * @description Create an array [config.headerList] of headers with order and count fo each header
         * @returns $tableHeaders - return the jquery object for the headers of the table 
         * 
         */
        this._buildHeaders = function() {

            var $tableHeaders = $(config.headClass, elem).each(function(index) {
                // here 'this' is each '.hcell'
                this.column = Number($(this).attr('data-idx'));
                this.order = self._formatSortingOrder(config.sortInitialOrder);
                this.count = this.order;
                // add cell to headerList array
                config.headerList[index] = this;
            });

            return $tableHeaders;
        };

        /**
         * _buildParserCache
         * 
         * @returns {Array}
         */
        this._buildParserCache = function() {
            var thebody = elem.find(config.bodyClass);

            if (!thebody || thebody.length === 0)
                return; // In the case of empty tables

            var rows = thebody.find(config.rowSelector);
            if (rows[0]) {

                var list = [],
                        cells = $(rows).eq(0).find(config.cellClass),
                        l = cells && cells.length,
                        p;

                for (var i = 0; i < l; i++) {

                    p = false;

                    //if the options contain something like: $('table').tablesorter({ headers: { 0: { sorter: text}, 1: {sorter: true} } });
                    if ((config.headers[i] && config.headers[i].sorter)) {

                        p = self._getParserById(config.headers[i].sorter);
                    }
                    //if user has not defined the parsing type of the column then we have to figure it out
                    if (!p) {
                        p = self._detectParserForColumn(rows, 0, i);
                    }

                    list.push(p);
                }
            }
            return list;
        };

        /**
         * _formatSortingOrder
         * 
         * @description Returns 1 or 0 for 'desc' or 'asc' respectively
         * @param {String} v
         * @returns {Number}
         */
        this._formatSortingOrder = function(v) {
            if (typeof(v) != "Number") {
                return (v.toLowerCase() == "desc") ? 1 : 0;
            } else {
                return (v == 1) ? 1 : 0;
            }
        };

        /**
         * _getParserById
         * 
         * @description Fetches the parser definition based on the passed ID (name). Returns 'false' if the parser with the passed ID is not found
         * @param {String} name
         * @returns specific self_parser object or {Boolean} false
         */
        this._getParserById = function(name) {
            var l = self._parsers.length;
            for (var i = 0; i < l; i++) {
                if (self._parsers[i].id.toLowerCase() == name.toLowerCase()) {
                    return self._parsers[i];
                }
            }
            return false;
        };

        /**
         * _detectParserForColumn
         * 
         * @description Fetches the parser definition (when the ID is not specified) based on the value in the cell nodes
         * @param {jQuery Selector} rows
         * @param {Numeric} rowIndex
         * @param {Numeric} cellIndex
         * @returns {Object} specific self._parser object or self._parser[0]
         */
        this._detectParserForColumn = function(rows, rowIndex, cellIndex) {
            var l = self._parsers.length,
                    node = false,
                    nodeValue = false,
                    keepLooking = true;
            do {
                if (rows[rowIndex]) {
                    node = self._getNodeFromRowAndCellIndex(rows, rowIndex, cellIndex);
                    nodeValue = $(node).text(); //trimAndGetNodeText(table.config, node);
                } else {
                    keepLooking = false;
                }
                rowIndex++;
            } while (nodeValue === '' && keepLooking)

            for (var i = 1; i < l; i++) {
                if (self._parsers[i].is(nodeValue, node)) {
                    return self._parsers[i];
                }
            }
            // 0 is always the generic parser (text)
            return self._parsers[0];
        };

        /**
         * _getNodeFromRowAndCellIndex
         * 
         * @description A function to fetch the cell node based on the row-index and column-index
         * @param {jQuery Selector} rows
         * @param {Numeric} rowIndex
         * @param {Numeric} cellIndex
         * @returns {jQuery node}
         */
        this._getNodeFromRowAndCellIndex = function(rows, rowIndex, cellIndex) {
            return $(rows).eq(rowIndex).find(config.cellClass).eq(cellIndex);
        };

        /**
         * _buildCache
         * 
         * @description text
         * @returns cache
         */
        this._buildCache = function() {
            var thebody = elem.find(config.bodyClass);
            if (!thebody || thebody.length == 0)
                return;

            var tableRows = thebody.find(config.rowSelector),
                    tableCols = tableRows && tableRows.eq(0).find(config.cellClass),
                    totalRows = (tableRows && tableRows.length) || 0,
                    totalCols = (tableCols && tableCols.length) || 0,
                    cache = {
                row: [],
                normalized: []
            },
            row, cols;

            for (var i = 0; i < totalRows; ++i) {

                /** Add the table data to main data array */
                row = $(tableRows).eq(i);
                cols = [];

                cache.row.push(row);

                for (var j = 0; j < totalCols; ++j) {
                    //for each cell add the appropriate parser format
                    cols.push(config.parsers[j].format($(row).find(config.cellClass).eq(j).text()));
                }

                cols.push(cache.normalized.length); // add position for rowCache
                cache.normalized.push(cols);
                cols = null;
            }
            ;

            return cache;
        };

        /**
         * _initEvents
         * 
         * @description Function to initiate the events related to this plugin 
         */
        this._initEvents = function() {
            //handle the click on the header cells
            self._headers.click(function(e) {
                var thebody = elem.find(config.bodyClass);
                if (!thebody || thebody.length == 0)
                    return;

                var tableRows = thebody.find(config.rowSelector),
                        totalRows = (tableRows && tableRows.length) || 0,
                        selectedThead = this;

                //if there are any rows in the table, then only do the following
                if (totalRows > 0) {
                    //get the column index of the selected column
                    var currentColIndex = selectedThead.column;
                    //get the sort order of the current column
                    selectedThead.order = selectedThead.count++ % 2;
                    //reinitiate (empty) the sort list
                    config.sortList = [];
                    //set the sortList array
                    config.sortList.push([currentColIndex, selectedThead.order]);
                }
                // set css for headers
                self._setHeadersCss();
                // this single line below is doing all the magical stuff
                self._appendToTable(self._actualSort());
                // stop normal event by returning false
                return false;
            });
        };

        /**
         * _setHeadersCss
         * 
         * @description Sets the CSS (config.cssDesc or config.cssAsc) on the headers when one of them is clicked
         * @param {type} 
         * @returns 
         */
        this._setHeadersCss = function() {
            var list = config.sortList;
            var headers = self._headers;
            var sortCss = self._sortCSS; //[config.cssDesc, config.cssAsc]
            // remove all header information
            headers.removeClass(sortCss[0]).removeClass(sortCss[1]);

            var h = [];
            headers.each(function() {
                h[this.column] = $(this);
            });
            for (var i = 0, l = list.length; i < l; i++) {
                h[list[i][0]].addClass(sortCss[list[i][1]]);
            }
        };

        /**
         * _appendToTable
         * 
         * @description Appends the sorted rows back to the table
         * @param {type} sortedCache
         * @returns {undefined}
         */
        this._appendToTable = function(sortedCache) {
            var c = sortedCache,
                    r = c.row,
                    n = c.normalized,
                    totalRows = n.length,
                    checkCell = (n[0].length - 1),
                    tableBody = elem.find(config.bodyClass).eq(0),
                    rows = [];

            for (var i = 0; i < totalRows; i++) {
                var pos = n[i][checkCell];

                rows.push(r[pos]);

                for (var j = 0, l = r[pos].length; j < l; j++) {
                    $(tableBody).append(r[pos][j]);
                }

            }
            //flushing the variable
            rows = null;
        };

        /**
         * _actualSort
         * 
         * @description This function actually sorts the values of the columns
         * @returns cache
         */
        this._actualSort = function() {
            var sortList = config.sortList,
                cache = self._cache;

            var sortWrapper = function(a, b) {
                var column = sortList[0][0],
                    order = sortList[0][1],
                    type = config.parsers[column].type;

                //case: text - ascending
                if (type === 'text' && order == 0) {
                    return (a[0] == b[0] ? 0 : (a[0] === null ? Number.POSITIVE_INFINITY : (b[0] === null ? Number.NEGATIVE_INFINITY : (a[0] < b[0]) ? -1 : 1)));
                
                //case: text - descending
                } else if (type === 'text' && order == 1) {
                    return (a[0] == b[0] ? 0 : (a[0] === null ? Number.POSITIVE_INFINITY : (b[0] === null ? Number.NEGATIVE_INFINITY : (a[0] > b[0]) ? -1 : 1)));
                    
                //case: numeric - ascending
                } else if (type === 'numeric' && order == 0) {
                    return (a[0] === null && b[0] === null ? 0 : (a[0] === null ? Number.POSITIVE_INFINITY : (b[0] === null ? Number.NEGATIVE_INFINITY : a[0] - b[0])));

                //case: numeric - descending
                } else if (type === 'numeric' && order == 1) {
                    return (a[0] == b[0] ? 0 : (a[0] === null ? Number.POSITIVE_INFINITY : (b[0] === null ? Number.NEGATIVE_INFINITY : a[0] - b[0])));
                
                //default case: if value is the same keep orignal order. Original order is stored in the last element of each item in cache.normalized
                } else {
                    var orgOrderCol = cache.normalized[0].length - 1;
                    return a[orgOrderCol] - b[orgOrderCol];
                }
                
                //fall back. If nothing works out, alteast make it return 0
                return 0;
            }

            cache.normalized.sort(sortWrapper);

            return cache;
        };



        /**
         * _makeSortFunction
         * 
         * @description A utility function to figure out different kinds of sorting. eg. text ascending/descending sort, numeric ascending/descending sort etc
         * @param {String} type : text or numeric
         * @param {String} direction : asc or desc
         * @param {type} index : column count
         * @returns {String}
         */
        this._makeSortFunction = function(type, direction, index) {
            var a = "a[" + index + "]",
                    b = "b[" + index + "]";
            if (type == 'text' && direction == 'asc') {
                return "(" + a + " == " + b + " ? 0 : (" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : (" + a + " < " + b + ") ? -1 : 1 )));";
            } else if (type == 'text' && direction == 'desc') {
                return "(" + a + " == " + b + " ? 0 : (" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : (" + b + " < " + a + ") ? -1 : 1 )));";
            } else if (type == 'numeric' && direction == 'asc') {
                return "(" + a + " === null && " + b + " === null) ? 0 :(" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : " + a + " - " + b + "));";
            } else if (type == 'numeric' && direction == 'desc') {
                return "(" + a + " === null && " + b + " === null) ? 0 :(" + a + " === null ? Number.POSITIVE_INFINITY : (" + b + " === null ? Number.NEGATIVE_INFINITY : " + b + " - " + a + "));";
            }
        };

        /**
         * _sortOnLoad
         * 
         * @description This function is called if the config.sortList is set by the user to sort the table by default
         * @returns {undefined}
         */
        this._sortOnLoad = function() {
            // update header count index
            self._updateHeaderSortCount();
            // set css for headers
            self._setHeadersCss();
            // sort the table and append it to the dom
            self._appendToTable(self._actualSort());
        };

        /**
         * _updateHeaderSortCount
         * 
         * @description Update the 'count' property of the headers in config.headerList which are specified in the config.sortList 
         * @returns {undefined}
         */
        this._updateHeaderSortCount = function() {
            var c = config,
                    l = c.sortList.length;
            for (var i = 0; i < l; i++) {
                var s = c.sortList[i],
                        o = c.headerList[s[0]];
                o.count = s[1];
                o.count++;
            }
        }

    };

    /**
     * $.fn.listSorter
     *
     * JQuery plugin to sort a list just like table (tablesorter)
     * @config Object configuration params defined above
     *
     * $('#myButtonID').contextMenu(config);
     *------------------------------------------------------------------*/
    $.fn.listSorter = function(config) {
        return this.each(function() {
            var elem = $(this);
            // Return if this element has been instanciated already
            if (elem.data('ListSorter')) {
                return;
            }
            // Create a new object
            var listSorter = new ListSorter(elem, config);
            listSorter.init();
        });
    };
})(jQuery);


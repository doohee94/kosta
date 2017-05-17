$.datepicker.regional['ko'] = {
		        closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        weekHeader: 'Wk',
		        dateFormat: 'yy-mm-dd',
		        firstDay: 0,
		        isRTL: false,
		        showButtonPanel: true,
		        closeText: '닫기',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        beforeShow: unlimited_datepicker,
		        onChangeMonthYear: unlimited_datepicker,
		        showMonthAfterYear: true};

function unlimited_datepicker(input){
    setTimeout( function() {
      var btn = $('<button class="ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all" type="button">최대</button>');
      btn.unbind("click").bind("click" , function(){
        $(input).val("9999-12-31");
        $(input).datepicker("hide");
      });
      btn.appendTo( $(input).datepicker("widget").find(".ui-datepicker-buttonpane"));
    }, 1);
}
	
$.datepicker.setDefaults($.datepicker.regional['ko']);

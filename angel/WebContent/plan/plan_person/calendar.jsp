<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>clendar</title>

<link rel="stylesheet" href="assets/css/jquery.smartPop.css" />
<link rel='stylesheet' href='fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.css' />
<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-size : 14px;
        background-color: white;
    }
    #calendar {
  
        max-width : 100%; 
  
        margin : 10px;
    }
	.fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/jquery.smartPop.js"></script>
<script src='fullcalendar-3.4.0/fullcalendar-3.4.0/lib/moment.min.js'></script>
<script src='fullcalendar-3.4.0/fullcalendar-3.4.0//fullcalendar.js'></script>

<script type="text/javascript">

jQuery(document).ready(function($) {


	$('#calendar').fullCalendar({
    	
    	header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listMonth'
        },
        editable : true,
        defaultDate: moment().format('YYYY-MM-DD'), 	
        events: {
        	
        	url : 'ajx.jsp',
        	type : 'post',
        	dataType : 'json',
        	
        },
    	 weekends: true,
    	
    	 navLinks : true
    	 
    	,navLinkDayClick:function(date, jsEvent, view) { 
    		
    		
    		$("#sDay").val(date.toISOString());
    		
    		  $.smartPop.open({ width: 900, height: 600, url: 'popup.jsp' });

    	
    		
    	}//날짜클릭
       
    	,eventClick :function(eventC){
    		
    		
    		
    		var eday = eventC.end;
    		
    		if(eday== null){
    			eday = eventC.start;
    		}
    		
    		$("#MsDay").val(eventC.start.toISOString());
    		$("#MeDay").val(eday.toISOString());
    		$("#Minsert").val(eventC.title);
    		
    		alert("이벤트");
    	}
 
         
    });//캘린더
  
    
    
});
    
    

</script>

</head>
<body>
<div>  
<br/><br/>
<div id='calendar'></div>


</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계부 달력</title>
<link rel="stylesheet" href="css/jquery.smartPop.css" />
<link href='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.css' rel='stylesheet' />
<link href='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/jquery.smartPop.js"></script>
<script src='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/moment.min.js'></script>
<script src='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.js'></script>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,listWeek'
			},
		    defaultDate: moment().format('YYYY-MM-DD'),
			navLinks: false, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
		    eventSources: [
		        // your event source
		        {
					url : '/angel/cost/temp.jsp',
					type : 'post',
					dataType : 'json', 		
		        }
		        // any other sources...
		    ],
		    eventClick: function(calEvent, jsEvent, view) {
				//지출 수정 팝업 띄워주기
		        alert('Event: ' + calEvent.title);
		        alert('지출한날' + calEvent.start.toISOString());
		        $.smartPop.open({ width: 900, height: 500, url: '/angel/cost/modifyCost.jsp' });
		    },
		    dayClick: function(date, jsEvent, view) {
		    	//입력 팝업 띄워주기
		        alert('Clicked on: ' + date.format());
		        $.smartPop.open({ width: 900, height: 500, url: '/angel/cost/inputCost.jsp' });
		    }

		});		
		$('#view').click(function(){
			//그래프 팝업 띄워주기
			 $.smartPop.open({ width: 900, height: 500, url: '/angel/cost/costTable.jsp' });

		});

		
	});
	
</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

	<div id='calendar'></div>
<div align="right">
	<img src="../imgs/view.png"  id="view" width="95" height="95"/>
</div>
</body>
</html>
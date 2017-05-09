<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계부 달력</title>
<link href='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.css' rel='stylesheet' />
<link href='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/moment.min.js'></script>
<script src='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/jquery.min.js'></script>
<script src='/angel/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.js'></script>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
		    defaultDate: moment().format('YYYY-MM-DD'),
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [ 	]
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
  <input type='button'value='입력'/>
  <input type='button'value='수정'/>
  <input type='button'value='삭제'/>
</div>


</body>
</html>
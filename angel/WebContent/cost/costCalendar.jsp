<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계부 달력</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
				right: 'month,listWeek'
			},
		    defaultDate: moment().format('YYYY-MM-DD'),
			navLinks: true, // can click day/week names to navigate views
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
		    ]

		});		
		$('#view').click(function(){
			alert("뷰");
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
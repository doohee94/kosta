<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="css/jquery-ui.css" />
<link rel="stylesheet" href="css/hello_cloud.css" />

<link href="css/weather.css" rel="stylesheet"
	type="text/css" />

<link href="css/viewtext.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/jquery-ui-1.11.1.js"></script>
<script src="js/jquery.ui.datepicker.option.js"></script>
<title>view</title>
<script type="text/javascript">

$(function(){
	var date = new Date();
	var month = date.getMonth();
	$('#dProd').val($.datepicker.formatDate('yy-mm-dd', date));
	$("#dProd").datepicker({
		showOn:"button",
		buttonImage: 'imgs/btn_calendar.gif',
		buttonImageOnly: true
		
	});

});
</script>
</head>
<body>

		

	<div class="weather_tab">

		<div class="icon sun-shower">
			<div class="cloud"></div>
			<div class="sun">
				<div class="rays"></div>
			</div>
			<div class="rain" ></div>
		</div>

		<div class="icon thunder-storm">
			<div class="cloud"></div>
			<div class="lightning">
				<div class="bolt"></div>
				<div class="bolt"></div>
			</div>
		</div>

		<div class="icon cloudy">
			<div class="cloud"></div>
			<div class="cloud"></div>
		</div>

		<div class="icon flurries">
			<div class="cloud"></div>
			<div class="snow">
				<div class="flake"></div>
				<div class="flake"></div>
			</div>
		</div>

		<div class="icon sunny">
			<div class="sun">
				<div class="rays"></div>
			</div>
		</div>

		<div class="icon rainy">
			<div class="cloud"></div>
			<div class="rain"></div>
		</div>
	</div>


	<div class="paper">
    	<div class="paper-content">
    	<p>	
				<label for = "title">제목:</label><input type= 'text' id = "title" />
			
		
		 <input type="text" id="dProd" readonly/> 
		</p>
        	<textarea >textarea tag.</textarea>
   		</div>
	</div>
    

</body>
</html>
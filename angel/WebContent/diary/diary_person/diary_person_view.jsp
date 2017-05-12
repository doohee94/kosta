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
	var rain = document.getElementById("sun-shower");
	$('#dProd').val($.datepicker.formatDate('yy-mm-dd', date));
	$("#dProd").datepicker({
		showOn:"button",
		buttonImage: 'imgs/btn_calendar.gif',
		buttonImageOnly: true
		
	});
	
	$(".sun-shower").click(function(){
		$(".rain").toggleClass("rainToggle");	//class를 on/of를 하는 방법 : toggleClass
		$(".sun").toggleClass("sunToggle");
	});
	
	$(".cloudy").click(function(){
		$(".cloud:nth-child(2)").toggleClass("cloudToggle");
	});
	
	$(".thunder-storm").click(function(){
		$(".bolt").toggleClass("boltToggle1");	
		$(".bolt:nth-child(2)").toggleClass("boltToggle2");
	});
	
	 
	$(".flurries").click(function(){
		$(".flake").toggleClass("flakeToggle3");	
		$(".flake").toggleClass("flakeToggle4");
		$(".flake").toggleClass("flakeToggle1");
		$(".flake").toggleClass("flakeToggle2");
		
		
	});
	 
});
</script>
</head>
<body>

		

	<div class="weather_tab">

		<div class="icon sun-shower" id="sun-shower">
			<div class="cloud" id="cloud"></div>
			<div class="sun" id="sun">
				<div class="rays" id="rays"></div>
			</div>
			<div class="rain" ></div>
		</div>

		<div class="icon thunder-storm" id="thunder-storm">
			<div class="cloud"></div>
			<div class="lightning">
				<div class="bolt"></div>
				<div class="bolt"></div>
			</div>
		</div>

		<div class="icon cloudy" id="cloudy">
			<div class="cloud"></div>
			<div class="cloud"></div>
		</div>

		<div class="icon flurries" id="flurries">
			<div class="cloud"></div>
			<div class="snow">
				<div class="flake"></div>
				<div class="flake"></div>
			</div>
		</div>

		<div class="icon sunny" id="sunny">
			<div class="sun">
				<div class="rays"></div>
			</div>
		</div>

		<div class="icon rainy" id="rainy">
			<div class="cloud"></div>
			<div class="rain"></div>
		</div>
	</div>


	<div class="paper">
    	<div class="paper-content">
    	<p>	
				<label for = "title" id="title2">제목:</label><input type= 'text' id = "title" name = 'title' />
			
		
		 <input type="text" id="dProd" readonly/> 
		</p>
        	<textarea >textarea tag.</textarea>
   		</div>
	</div>
    

</body>
</html>
<%@page import="mybatis.diary.model.Diary"%>
<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("id");
	String coupleId = (String)session.getAttribute("cid");
	memberId = "ckswhd1128";
	coupleId = "aaaa";
	
	Diary list= (Diary)request.getAttribute("param");
%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/jquery-ui-1.11.1.js"></script>
<script src="js/jquery.ui.datepicker.option.js"></script>
<title>view</title>
<script type="text/javascript">

function replaceAll(str, searchStr, replaceStr) {
    return str.split(searchStr).join(replaceStr);
}


$(function(){
	var date = new Date();
	var month = date.getMonth();
	var rain = document.getElementById("rain");
	
	var text = '<%= list.getDiaryContent() %>';
	
	
	$('#texta').val(replaceAll(text,"<br/>", "\r\n"));
	
	$('#sun-shower').click(function(){
		$('#weather').val("비 해 구름");
		alert("비 해 구름 선택했다. 그렇다.")
	});
	$('#thunder-storm').click(function(){
		$('#weather').val("번개");
		alert("번개 구름. 날벼락조심")
	});
	$('#cloudy').click(function(){
		$('#weather').val("구름");
		alert("구름. 먹구름 100퍼")
	});
	$('#flurries').click(function(){
		$('#weather').val("눈");
		alert("눈. 빙판길 조심")
	});
	$('#sunny').click(function(){
		$('#weather').val("해");
		alert("해. 햇볕은 쨍쨍~")
	});
	$('#rainy').click(function(){
		$('#weather').val("비");
		alert("비. 우산챙기시요");
	});


});
</script>
</head>
<body>
<div class="weather_tab">

		<div class="icon sun-shower"  id="sun-shower" name="sun-shower">
			<div class="cloud"></div>
			<div class="sun">
				<div class="rays"></div>
			</div>
			<div class="rain" ></div>
		</div>

		<div class="icon thunder-storm" id="thunder-storm" name="thunder-storm">
			<div class="cloud"></div>
			<div class="lightning">
				<div class="bolt"></div>
				<div class="bolt"></div>
			</div>
		</div>

		<div class="icon cloudy" id="cloudy" name="cloudy">
			<div class="cloud"></div>
			<div class="cloud"></div>
		</div>

		<div class="icon flurries" id="flurries" name="flurries">
			<div class="cloud"></div>
			<div class="snow">
				<div class="flake"></div>
				<div class="flake"></div>
			</div>
		</div>

		<div class="icon sunny" id="sunny" name="sunny">
			<div class="sun">
				<div class="rays"></div>
			</div>
		</div>

		<div class="icon rainy" id="rainy" name="rainy">
			<div class="cloud"></div>
			<div class="rain"></div>
		</div>
	</div>


	<div class="paper">
    	<div class="paper-content">
    	<p>	
			<label for = "title" id="title2">제목:</label><input type= 'text' id = "title" name = 'title' value="<%= list.getDiaryTitle()%>" readonly/>
			<input type="text" id="dProd" value="<%= list.getDiaryDate() %>" readonly/> 
		</p>
  	      	<textarea id = 'texta' name='texta'readonly></textarea>
   		</div>
	</div>
	<input type="hidden" id="weather" name = "weather">
   	<a href=".diary?cmd=update-page-couple&diarynum=<%=list.getDiaryNum()%>"><img src="/extest/imgs/update.png" id="change" name="change"></img></a>					   
	<a href=".diary?cmd=delete-couple&diarynum=<%=list.getDiaryNum()%>"><img src="/extest/imgs/delete.png" id="delete" name="delete"></img></a>
</body>
</html>
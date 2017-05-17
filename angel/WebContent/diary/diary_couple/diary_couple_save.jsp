<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
 String memberId = (String)session.getAttribute("id");
 String coupleId = (String)session.getAttribute("cid");
 memberId = "ckswhd1128";
 coupleId = "aaaa"; 
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/extest/css/jquery-ui.css" />
<link rel="stylesheet" href="/extest/css/hello_cloud.css" />

<link href="/extest/css/weather.css" rel="stylesheet"
	type="text/css" />

<link href="/extest/css/viewtext.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/extest/js/jquery-ui-1.11.1.js"></script>
<script src="/extest/js/jquery.ui.datepicker.option.js"></script>
<title>view</title>
<script type="text/javascript">

$(function(){
	
	$(window).on("beforeunload", function () {
        return "영상을 50초 이상 시청하지 않아 학습이 완료 되지 않았습니다.\n그래도 종료하시겠습니까?";
    });
	
	var date = new Date();
	var month = date.getMonth();
	$('#dProd').val($.datepicker.formatDate('yy-mm-dd', date));
	$("#dProd").datepicker({
		showOn:"button",
		buttonImage: '/extest/imgs/btn_calendar.gif',
		buttonImageOnly: true
		
	});
	$('#commit').click(function(){
		
// 		var frmObj = document.forms[0];
	      
// 	      frmObj.action = ".diary?cmd=insert-do"; 
// 	      frmObj.submit();

		var title = $("#title").val();
		var content = $("#content").val().replace(/\n/g, "<br/>");
			
		var dProd = $("#dProd").val();
		var weather =  $("#weather").val();
		
		var fm = document.getElementById("fm");
		if($("#title").val() == "" ){
            alert("Plase Insert title");
            return false;
         }
		if($("#weather").val() == "" ){
            alert("Plase Insert weather");
            return false;
         }
		if($("#dProd").val() == "" ){
            alert("Plase Insert Date");
            return false;
         }
		if($("#content").val() == "" ){
             alert("Plase Insert content");
             return false;
          }
		fm.submit();
	    
// 	      var url = ".diary?cmd=insert-do&title="+title+"&content="
// 	    		  		+content+"&dProd="+dProd+"&weather="+weather;
// 	      $(location).attr("href",url);
		
	});
	
	$('#sun-shower').click(function(){
		$('#weather').val("비 해 구름");
		alert("비 해 구름 선택했다.")
	});
	$('#thunder-storm').click(function(){
		$('#weather').val("번개");
		alert("번개 구름.")
	});
	$('#cloudy').click(function(){
		$('#weather').val("구름");
		alert("구름. ")
	});
	$('#flurries').click(function(){
		$('#weather').val("눈");
		alert("눈")
	});
	$('#sunny').click(function(){
		$('#weather').val("해");
		alert("해")
	});
	$('#rainy').click(function(){
		$('#weather').val("비");
		alert("비. ");
	});
	
});
</script>
</head>
<body>
<form id="fm" name="fm" method = "post" action=".diary">
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
			<label for = "title" id="title2">제목:</label><input type= 'text' id = "title" name ="title"/>
			<input type="text" id="dProd" name = "dProd"readonly/> 
		</p>
        	<textarea id="content" name="content" placeholder="내용을 입력해주세요." autofocus></textarea>
   		</div>
	</div>
	<input type="hidden" id="cmd" name = "cmd" value="insert-do-couple"/> 
    <input type="hidden" id="weather" name = "weather"> 
	<img src="/extest/imgs/confirm.png" id="commit" name="commit"></img>			
	<input type="hidden" id="id" name = "id" value="<%=memberId%>"/>				
	<input type="hidden" id="cid" name = "cid" value="<%=coupleId%>"/>
	</form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectLink = "/angel/UserControl?cmd="; %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 및 비밀번호 찾기</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CSS 추가 -->
<link rel="stylesheet" type="text/css" href="/angel/main/css/login1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		   
		$(".ok1").click(function(){
			
			//ajax를 이용하여!!!!!!
			$.ajax({
				url:'<%=projectLink%>searchId&ajax=true',
				type:"post",
				data : {
					name:$(".name").val(),
					tel:$(".tel1").val()
				},
				dataType:'text',
				success:function(data){
					document.getElementById("searchResult").innerHTML="ID  : "+data;
				}
			})
		})

		$(".ok2").click(function(){
			
			//ajax를 이용하여!!!!!!
			$.ajax({
				url:'<%=projectLink%>searchPw&ajax=true',
				type:"post",
				data : {
					id:$(".id").val(),
					tel:$(".tel2").val()
				},
				dataType:'text',
				success:function(data){
					document.getElementById("searchResult2").innerHTML="Password  : "+data;
				}
			})
		})

		
		
		$(".cancel").click(function(){
			close();
		})

		
	});
</script>
</head>
<body>
<form id="frm" name="frm" method="post" action="<%=projectLink%>searchIdPw">
<div class="container">
  <h2 style='color:#FF5675'  >Find ID and PassWord</h2>
  <br/>
  <ul class="nav nav-tabs">
    <li class="active"><a class="idTitle" data-toggle="tab" href="#home" style='color:pink'>ID</a></li>
    <li><a data-toggle="tab"  class = "pwTitle" href="#menu1" style='color:pink'>PW</a></li>
  </ul>
  
  <div class="tab-content">
  	<div id="home" class="tab-pane fade in active">
   	<h3>Let's find ID</h3>
   	(Please input your NAME and TEL)<br/>
  	Name <input type="text"  autocomplete="off" name="name" class="name"/>
   	TEL <input type="text" autocomplete="off" class="tel1" name="tel1" placeholder="tel ex)010-8308-1520"/>
   	<div id="searchResult"></div>
   	<div style="float:right">
	<span class="ok1" style="color:#FF5675;font-weight:bold">OK</span>
	<span class="cancel" style="color:#FF5675;font-weight:bold">NO</span>
	</div>
	</div>
	
	<div id="menu1" class="tab-pane fade">
   	<h3>Let's find Password</h3>
   	(Please input your ID and TEL)<br/>
   	ID <input type="text" autocomplete="off" name="id" class="id">
   	TEL <input type="text" autocomplete="off" name="tel" class="tel2" placeholder="tel ex)010-8308-1520"/>
    <div id="searchResult2"></div>
    <div style="float:right">
	<span class="ok2" style="color:#FF5675;font-weight:bold">OK</span>
	<span class="cancel" style="color:#FF5675;font-weight:bold">NO</span>
	</div>
	</div>
  </div>
</div>
</form>
</body>
</html>
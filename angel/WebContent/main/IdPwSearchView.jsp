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
					document.getElementById("searchResult").innerHTML="당신의 아이디는  : "+data;
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
					document.getElementById("searchResult2").innerHTML="당신의 아이디는  : "+data;
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
  <h2>아이디 및 비밀번호 찾기</h2>
  <br/>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">ID 찾기</a></li>
    <li><a data-toggle="tab" href="#menu1">PW 찾기</a></li>
  </ul>
  
  <div class="tab-content">
  	<div id="home" class="tab-pane fade in active">
   	<h3>아이디 찾기를 선택하셨습니다.</h3>
   	(본인의 이름, 핸드폰번호를 입력해주세요.)<br/>
  	이름 <input type="text"  autocomplete="off" name="name" class="name"/>
   	핸드폰번호 <input type="text" autocomplete="off" class="tel1" name="tel1" placeholder="tel ex)010-8308-1520"/>
   	<div id="searchResult"></div>
	<div class="ok1">확인</div>
	<div class="cancel">취소</div>
	</div>
	
	<div id="menu1" class="tab-pane fade">
   	<h3>비밀번호 찾기를 선택하셨습니다.</h3>
   	(본인의 아이디, 핸드폰번호를 입력해주세요.)<br/>
   	아이디 <input type="text" autocomplete="off" name="id" class="id">
   	핸드폰번호 <input type="text" autocomplete="off" name="tel" class="tel2" placeholder="tel ex)010-8308-1520"/>
    <div id="searchResult2"></div>
	<div class="ok2">확인</div>
	<div class="cancel">취소</div>
	</div>
  </div>
</div>
</form>
</body>
</html>
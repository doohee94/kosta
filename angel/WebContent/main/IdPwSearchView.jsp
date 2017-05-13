<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디와 비밀번호 찾기 팝업화면</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- CSS 추가 -->
<link rel="stylesheet" type="text/css" href="/angel/main/css/login1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".ok").click(function(){
			alert("ok");
			
		})

		$(".cancel").click(function(){
			alert("cancel");
		})

		
	});
</script>
</head>
<body>

<div class="container">
  <h2>아이디 및 비밀번호 찾기</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">ID 찾기</a></li>
    <li><a data-toggle="tab" href="#menu1">PW 찾기</a></li>
  </ul>
  
  <div class="tab-content">
  	<div id="home" class="tab-pane fade in active">
   	<h3>아이디 찾기를 선택하셨습니다.</h3>
   	(본인의 이름, 핸드폰번호를 입력해주세요.)<br/>
  	이름 <input type="text" name="name">
   	핸드폰번호 <input type="text" name="tel">
	<div class="ok">확인</div>
	<div class="cancel">취소</div>
	</div>
	
	<div id="menu1" class="tab-pane fade">
   	<h3>비밀번호 찾기를 선택하셨습니다.</h3>
   	(본인의 아이디, 핸드폰번호를 입력해주세요.)<br/>
   	아이디 <input type="text" name="id">
   	핸드폰번호 <input type="text" name="tel">
	<div class="ok">확인</div>
	<div class="cancel">취소</div>
	</div>
  </div>
</div>
</body>
</html>
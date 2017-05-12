<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String projectLink = "/angel/UserControl?cmd="; %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인화면(첫 번째로 켜는 화면임)</title>
<!-- CSS 추가 -->
<link rel="stylesheet" href="css/login1.css"/>
<link rel="stylesheet" type="text/css" href="css/login2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".login").click(function(){
			// 로그인 버튼을 누른다.
			// 아이디와 비밀번호가 맞는지 DB와 확인, 맞다면 main, 틀리면 팝업으로 로그인 실패 뜬다고 알려주기
		});
	
		$(".btn span:first-child").click(function(){
			alert("회원가입");
			
		});
	
		$(".btn span:last-child").click(function(){
			alert("아이디/비밀번호 찾기");
		});
	
		
	});
</script>
</head>
<body>

<div class="wrapper">
	<div align="center">
	<h3 class="sign-in">Angel</h3>
	</div>
	<br/>
	<form id="frm" name="frm" method="post" action="<%=projectLink%>main_page">
		<div align="center">
		
		<input class="user-input" type="text" name="id" id="id" placeholder="id is"/>
 		</div>
		<div align="center">
			<input type="password" name="pw" id="pw" placeholder="password is"/>
 		</div>
 		<div align="center">
 		<input type="submit" value="Login"/>
 		</div>
 		<br/>
 		<div class="btn" align="center">
        	<span><div class="button">Register</div></span>
        	<span><div class="button">Lost your password?</div></span>
        </div>
	</form>
</div>

</body>
</html>
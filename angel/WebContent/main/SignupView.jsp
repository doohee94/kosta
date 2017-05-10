<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
<!-- CSS 추가 -->
<link rel="stylesheet" href="css/sign1.css" />
<link rel="stylesheet" type="text/css" href="css/sign2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
	
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
	<h3 class="sign-in">Sign Up</h3><br/>
	
	<!-- 	여기에 사진과 사진을 넣을 공간을 마련 -->
	<form>
	
	<div align="center">
	<img src="img/profile1.jpg" alt="boy">
	<div class="photo" style="color:white">사진등록</div>
	</div>
	<br/>
	
		<table>
		<tr>
		<td>
			<input class="user-input" type="text" name="id" id="id" placeholder="아이디"/>		
		</td>
		</tr>
		<tr>
		<td>
			<input class="user-input" type="text" name="pw" id="pw" placeholder="비밀번호"/>		
		</td>
		<td>
			<input class="user-input" type="text" name="pwCheck" id="pwCheck" placeholder="비밀번호 확인"/>		
		</td>
		</tr>
		<tr>
		<td>
			<input class="user-input" type="text" name="name" id="id" placeholder="이름"/>		
		</td>
		<td>
			<input class="user-input" type="text" name="gender" id="id" placeholder="성별"/>		
		</td>
		</tr>
				<tr>
		<td>
			<input class="user-input" type="text" name="tel" id="tel" placeholder="전화번호"/>		
		</td>
		<td>
			<input class="user-input" type="text" name="birth" id="id" placeholder="생년월일"/>		
		</td>
		</tr>
		</table>
	</form>

	<div align="center">
 	<span class="register" >회원가입</span>
 	<span class="register" >취소</span>
 	</div>	
 		
</div>

</body>
</html>
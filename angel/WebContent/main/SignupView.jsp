<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String projectLink = "/angel/UserControl?cmd="; %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
<!-- CSS 추가 -->
<link rel="stylesheet" href="/angel/main/css/sign1.css" />
<link rel="stylesheet" type="text/css" href="/angel/main/css/sign2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
	
		$(".photo").click(function(){
			// 회원가입시 사진도 필요하지~
			alert("사진등록");
			
			
		});
		

	
		$(".cancel").click(function(){
			alert("아이디/비밀번호 찾기");
		});
	
		
	});
</script>
</head>
<body>

<div class="wrapper">
	<h3 class="sign-in">Sign Up</h3><br/>
	
	<!-- 	여기에 사진과 사진을 넣을 공간을 마련 -->
	
	
	<div align="center">
	<img src="img/profile1.jpg" alt="boy">
	<br/>
	
	<!-- 	<button class="replace">파일 업로드</button> -->
	<input type="file" name="photo" /> <br/>
	
	</div>
	<br/>
	<form name="frm" method="post" action="<%=projectLink%>memberSignUp">
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
 	<input type="submit" class="register" value="회원가입"/>
 	<span class="cancel">취소</span>
 	</div>	
 		
</div>

</body>
</html>
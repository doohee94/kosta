<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String projectLink = "/angel/UserControl?cmd="; %>
<%
	// 로그인 실패시 알려주기 위해 request로 받아왔음
	String loginCheck = (String)request.getAttribute("loginCheck");
//  System.out.print(loginCheck+"는 로그인 체크 결과값임");
	
	if(loginCheck==null){
		// 로그인 전 초기 로딩시.....ㅎㅎㅎㅎㅎ
	}
	else if(loginCheck.equals("false")){
		System.out.print("다시로그인고고!");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인화면(첫 번째로 켜는 화면임)</title>
<!-- CSS 추가 -->
<link rel="stylesheet" href="/angel/main/css/login1.css"/>
<link rel="stylesheet" type="text/css" href="/angel/main/css/login2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
 		$(".login").click(function(){
 			// 로그인 버튼을 누른다. (!!ajax를 사용!!)
 			// 아이디와 비밀번호가 맞는지 DB와 확인, 맞다면 main, 틀리면 팝업으로 로그인 실패 뜬다고 알려주기
// 			$.ajax({
// 				url : "loginCheck.jsp",
// 				type : "get",
// 				data : {id:$("#id").val(), pw:$("#pw").val()},
// 				dataType : "text",
// 				success:function(data){
// 					if(data.trim()==false){
// 						alert("로그인 실패");
						
// 					}
// 					else if(data.trim()==true){
// 						alert("로그인 성공");
// 						//session을 만들면 됨
// 						//페이지를 넘겨준다. main으로...
// 					}
// 				}
// 			})
			
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
	<form id="frm" name="frm" method="post" action="<%=projectLink%>loginCheck">
		<div align="center">
		
		<input class="user-input" type="text" name="id" id="id" placeholder="id is"/>
 		</div>
		<div align="center">
			<input type="password" name="pw" id="pw" placeholder="password is"/>
 		</div>
 		<div align="center">
		<input type="submit" value="Login" class="login">
<!--  		<div class="login">Login</div> -->
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
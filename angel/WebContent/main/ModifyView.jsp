<%@page import="java.util.StringTokenizer"%>
<%@page import="model.user.MemberVo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String projectLink = "/angel/UserControl?cmd="; 
	MemberVo member = (MemberVo)request.getAttribute("modifyMember");
	String bday = member.getMemberBirth();
	StringTokenizer st = new StringTokenizer(bday);
	String birthDay = st.nextToken();
// 	System.out.print("ModifyView.jsp   "+member.getMemberId()+"\n");
// 	System.out.print("ModifyView.jsp   "+member.getMemberPw()+"\n");
// 	System.out.print("ModifyView.jsp   "+member.getMemberName()+"\n");
// 	System.out.print("ModifyView.jsp   "+member.getMemberGender()+"\n");
// 	System.out.print("ModifyView.jsp   "+member.getMemberTel()+"\n");
// 	System.out.print("ModifyView.jsp   "+member.getMemberBirth()+"\n");
// 	System.out.print("ModifyView.jsp   "+member.getPhotoRealpath()+"\n");
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
<!-- CSS 추가 -->
<link rel="stylesheet" href="/angel/main/css/sign1.css" />
<link rel="stylesheet" type="text/css" href="/angel/main/css/sign2.css">
<link rel="stylesheet" type="text/css" href="/angel/main/css/radio.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
	$(function(){

		// 라디오버튼은 이렇게
		if("male"=="<%=member.getMemberGender()%>"){
			$("input:radio[name='gender']:radio[value='male']").prop("checked", true);
		}else{
			$("input:radio[name='gender']:radio[value='female']").prop("checked", true);
		};

		
		
		
		
		$(".photo").click(function(){
			// 회원가입시 사진도 필요하지~
			alert("사진등록");	
		});
		
		$("#pwCheck").change(function(){
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if(pw==pwCheck){
				$("#idCheckResult").val("비밀번호를 잘 입력했어요");		
			}else{
				$("#idCheckResult").val("비밀번호 다시 입력해보아요^^");						
			}
		})
		
		$("#pw").change(function(){
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			if(pw==pwCheck){
				$("#idCheckResult").val("비밀번호를 잘 입력했어요");		
			}else{
				$("#idCheckResult").val("비밀번호 다시 입력해보아요^^");						
			}
		})
		
		  
		$("#id").change(function(){
// 			var inputId = $("#id").val();
// 			alert(id);
			// ajax를 사용하여!!!!!!!!!!!!!
			$.ajax({
				url:'<%=projectLink%>idCheck&ajax=true',
				type:"post",
				data : {id:$("#id").val()},
				dataType:'text',
				success:function(data){
					//var idCheck = request.getAttribute("idCheck");
					// 입력한 아이디가 존재하면 존재한다고 알려줘
					// 존재하지 않으면 안존재한다고 알려조야지...사용가능한아이디에요
					if(data=="false"){
						$("#idCheckResult").val("이미 존재하는 아이디 입니다.");
						$("#id").val("");
					}else{
						$("#idCheckResult").val("사용 가능한 아이디 입니다.");						
					}
				}
			})
		});
	
		$(".cancel").click(function(){
			// 회원가입 취소 버튼을 누르면 다시 로그인 하는 창으로 돌아가요~
			location.href="<%=projectLink%>backToLoginView";
		});
		

	
		
	});
</script>
</head>
<body>

<div class="wrapper">
	<h4 class="sign-in">Sign Up</h4><br/>
	<!-- 	여기에 사진과 사진을 넣을 공간을 마련 -->
	
	<form name="frm" method="post" action="<%=projectLink%>memberSignUp" enctype="multipart/form-data">
<!-- 	<input type="hidden" id='cmd' name='cmd' value="memberSignUp"/> -->
	<div align="center">
	<img src="<%=member.getPhotoRealpath()%>" width=200px height=150px alt="boy">
	<br/>
	
	<!-- 	<button class="replace">파일 업로드</button> -->
	<input type="file" name="photo" /> <br/>
	
	</div>
	<br/>
	
		<table>
		<tr>
		<td>
			<input class="user-input" type="text" autocomplete="off" name="id" id="id" placeholder="id" value=<%=member.getMemberId()%>>		
		</td>
		<td>
			<input class="user-input" style="color:#FF5675" type="text" disabled="disabled" name="idCheckResult" id="idCheckResult" placeholder=""/>
		</td>
		</tr>
		<tr>
		<td>
			<input class="user-input" type="password" autocomplete="off" name="pw" id="pw" placeholder="password" value="<%=member.getMemberPw()%>">		
		</td>
		<td>
			<input class="user-input" type="password" autocomplete="off" name="pwCheck" id="pwCheck" placeholder="confirm password" value="<%=member.getMemberPw()%>">		
		</td>
		</tr>
		<tr>
		<td>
			<input class="user-input" type="text" autocomplete="off" name="name" id="name" placeholder="name" value="<%=member.getMemberName()%>">		
		</td>
		<td align="center">
			<input type="radio" name="gender" id="gender" class="gender" value="male">male
			<span style="color:white">공백을주자</span>
			<input type="radio" name="gender" id="gender" class="gender" value="female">female		
<!-- 			<select name=gender id="gender"> -->
<!-- 				<option value="여성">여성</option> -->
<!-- 				<option value="남성">남성</option> -->
<!-- 			</select> -->
<!-- 		<input class="user-input" type="text" name="gender" id="gender" placeholder="성별"/>		 -->
		</td>
		</tr>
				<tr>
		<td>
			<input class="user-input" type="text" autocomplete="off" name="tel" id="tel" placeholder="tel ex)010-8308-1520" value="<%=member.getMemberTel()%>">		
		</td>
		<td>
			<input class="user-input" type="text" autocomplete="off" name="birth" id="birth" placeholder="birth ex)19929017" value="<%=birthDay%>">		
		</td>
		</tr>
		</table>

	<div align="center">
 	<input type="submit" class="register" value="Modify"/>
 	<span class="cancel">Cancel</span>
 	</div>	
 	</form>
 		
</div>

</body>
</html>
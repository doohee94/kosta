<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String projectName = "/extest";
 
 String memberId = (String)session.getAttribute("id");
 String coupleId = (String)session.getAttribute("cid");
 memberId = "ckswhd1128";
 coupleId = "aaaa";
%>    


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 메인</title>
</head>
<body>
	메인화면이라 . . . 그냥 상상하고 . . . save
	<a href="<%= projectName %>/.diary?cmd=list-page&id=<%=memberId%>">person</a><br/><br/>
	<a href="<%= projectName %>/.diary?cmd=list-page-couple&id=<%=memberId%>&cid=<%=coupleId%>">couple</a><br/><br/>
</body>
</html>

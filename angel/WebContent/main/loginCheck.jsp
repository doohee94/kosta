<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String projectLink = "/angel/UserControl?cmd="; %>

<%
// 	String id="", pw = "";
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.print("넘겨온아이디"+id);
	System.out.print("넘겨온비번"+pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){

	
	$("#frm").submit();
});
</script>
<title></title>
</head>
<body>
<form id="frm" name="frm" method="post" action="<%=projectLink%>loginCheck">
	<input class="user-input" type="hidden" name="id" id="id" value="<%=id%>">
	<input type="hidden" name="pw" id="pw" value="<%=pw%>">
</form>
</body>
</html>
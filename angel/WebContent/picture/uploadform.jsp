<%@ page contentType="text/html; charset=euc-kr" %>

<% String projectName = "/angel"; %>
<html>
<head><title>���� ���</title></head>
<body>
<form action='<%=projectName %>/pds' method='post' enctype='multipart/form-data'>
����: <input type="file" name="file" /> <br/>
����: <input type="text" name="description" /> <br/>
<input type="submit" value="���ε�" />
</form>
</body>
</html>

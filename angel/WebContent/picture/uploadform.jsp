 <%@ page contentType="text/html; charset=euc-kr" %>

<% String projectName = "/project"; %>
<html>
<head><title>파일 등록</title></head>
<body>
<form action='<%=projectName %>/pds' method='post' enctype='multipart/form-data'>
파일: <input type="file" name="file" /> <br/>
제목: <input type="text" name="title" />
설명: <input type="text" name="description" /> <br/>
<input type="submit" value="업로드" />
</form>
</body>
</html>

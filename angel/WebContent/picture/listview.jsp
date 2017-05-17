<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<html>
<head><title>자료실 목록</title></head>
<body>
<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>사진이름</td>
		<td>내용</td>
		<td>path</td>
	
	</tr>
	
<c:choose>
	<c:when test="${empty listModel }">
	
	<tr>
		<td colspan="5">
			게시글이 없습니다.
		</td>
	</tr>
</c:when>


<c:otherwise>
<c:forEach var="photo" items ="${listModel }">

	<tr>
		<td>${photo.photo_num }</td>
		<td>${photo.member_id}</td>
		<td>${photo.photo_title}</td>
		<td>${photo.photo_content}</td>
		<td><img src='/angel/fileupload/${photo.photo_path}'/></td>
<%-- 		<td><a href='download.jsp?id=${item.id }'>다운받기</a></td> --%>
	</tr>
	</c:forEach>
</c:otherwise>
</c:choose>
	
	<tr>
		<td colspan="5">
			<a href="h_uploadform.jsp">파일 첨부</a>
		</td>
	</tr>	
</table>
</body>
</html>
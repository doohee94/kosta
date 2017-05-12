<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<html>
<head><title>�ڷ�� ���</title></head>
<body>
<table border="1">
	<tr>
		<td>��ȣ</td>
		<td>���̵�</td>
		<td>�����̸�</td>
		<td>����ũ��</td>
	
	</tr>
	
<c:choose>
	<c:when test="${empty listModel }">
	
	<tr>
		<td colspan="5">
			�Խñ��� �����ϴ�.
		</td>
	</tr>
</c:when>


<c:otherwise>
<c:forEach var="item" items ="${listModel }">

	<tr>
		<td>${photo_num }</td>
		<td>${member_id}</td>
		<td>${photo_name}</td>
		<td>${photo_path}</td>
<%-- 		<td><a href='download.jsp?id=${item.id }'>�ٿ�ޱ�</a></td> --%>
	</tr>
	</c:forEach>
</c:otherwise>
</c:choose>
	
	<tr>
		<td colspan="5">
			<a href="uploadform.jsp">���� ÷��</a>
		</td>
	</tr>	
</table>
</body>
</html>
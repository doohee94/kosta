<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pds.service.ListPdsPhotoService"%>
<%@ page import="pds.model.PdsPhoto"%>
<%@ page import="java.util.List" %>
<%

ListPdsPhotoService listSerivce = ListPdsPhotoService.getInstance();
List<PdsPhoto> PhotoListModel = listSerivce.getPdsPhotoList();
request.setAttribute("listModel", PhotoListModel);
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<link rel="stylesheet" href="./css/glisse.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/glisse.js"></script>

<script>
$(function () {
    $('.pics').glisse({
        changeSpeed: 550, 
        speed: 500,
        effect:'rotate',
        fullscreen: true
    }); 
});
</script>
</head>
<body>


<c:forEach var="photo" items ="${listModel }">

<img class="pics" src='/angel/fileupload/${photo.photo_path}'  height='150px' max-width:100% data-glisse-big="" title=""/>
	</c:forEach>

<div class="button">
         <div align="center">
         
         	<a href="/angel/picture/h_uploadform.jsp"><img src="/angel/picture/pics/input.png" width="60 height="60" align="middle"  /></a>
         	<a href="/angel/picture/list.jsp"><img src="/angel/picture/pics/list.png" width="60 height="60" align="middle"/></a>
        
         </div>
       </div>  


</body>
</html>
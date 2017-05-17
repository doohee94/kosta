<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="pds.service.ListPdsPhotoService"%>
<%@ page import="pds.model.PdsPhoto"%>
<%@ page import="java.util.List" %>
<%

	ListPdsPhotoService listSerivce = ListPdsPhotoService.getInstance();
	List<PdsPhoto> PhotoListModel = listSerivce.getPdsPhotoList();
	request.setAttribute("listModel", PhotoListModel);
	
%>
<jsp:forward page="listview.jsp" />
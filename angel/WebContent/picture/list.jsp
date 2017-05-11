<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="pds.service.ListPdsPhotoService"%>
<%@ page import="pds.model.PdsPhoto"%>
<%@ page import="java.util.List" %>
<%

	ListPdsPhotoService listSerivce = ListPdsPhotoService.getInstance();
	List<PdsPhoto> PhotoListModel = listSerivce.getPdsPhotoList();
	request.setAttribute("listModel", PhotoListModel);
	
%>
<jsp:forward page="list_view.jsp" />
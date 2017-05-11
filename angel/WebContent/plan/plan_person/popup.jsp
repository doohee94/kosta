<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="assets/css/Cost_input.css" rel="stylesheet">
<link rel="stylesheet" href="calendar/css/jquery-ui.css" />

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

<script type="text/javascript">

jQuery.noConflict();
jQuery(document).ready(function($) {
	
	
	
	$("#sDay").val(opener.document.);
	
	  
	  var progressTriangle = $('#progress-triangle');
	  
	  $('#sDay').focus(function() {
	    progressTriangle.animate({
	      top: "48px"
	    });
	  });
	  
	  $('#sTime').focus(function() {
		    progressTriangle.animate({
		      top: "118px"
		    });
		  });
	  
	  $('#eDay').focus(function() {
		    progressTriangle.animate({
		      top: "190px"
		    });
		  });
	  
	  $('#eTime').focus(function() {
		    progressTriangle.animate({
		      top: "262px"
		    });
		  });
	  
	  
	  $('#title').focus(function() {
	    progressTriangle.animate({
	      top: "334px"
	    });
	  });

	  
	  
	  
	  //@@@@@유효성@@@@@@@@
	  
	  
	  //@@@등록@@@@
	  $("#submit").click(function(){
		  
		  
		  
		  
		  
		  
		  
	  });
	  
	  
	  //@@취소@@@@
 	$("#cancle").click(function(){
		  
 		
	  });
	  
	  

	});

</script>
</head>
<body>

	<form id="container">
  <div id="progress-triangle"></div>
  
  <label for="sDay">
    <div class="holder">
      시작날짜 :
      <input type="text" name="sDay" autocomplete="off" id="sDay"/>
    </div>
  </label>
  
  <label for="sTime">
    <div class="holder">
      시작시간 :
       <select name="sTime" id="sTime">
           <%for(int i=0; i<=24;i++){ %>
           
          <option value="<%=i%>"><%=i %></option>
           
           <%} %>
           
         </select>
         시
    </div>
  </label>
  
  <label for="eDay">
    <div class="holder">
      종료날짜 :
      <input type="text" name="eDay" autocomplete="off" id="eDay"/>
    </div>
  </label>
  
  <label for="eTime">
    <div class="holder">
      종료시간 :
    <select name="eTime" id="eTime">
           
           <%for(int i=0; i<=24;i++){ %>
           
           <option value="<%=i%>"><%=i %></option>
           
           <%} %>
           
         </select>
         시
    </div>
  </label>
  

	<label for="title">
    <div class="holder">
      일정내용 :
      <input type="text" name="title" autocomplete="off" id="title"/>
    </div>
  </label>
 	<br/>
 	<div class="button">
         <div align="center">
         		<input type='button' name="submit" id="submit" value="등록"/>
         		<input type='button' name="cancle" id="cancle" value="취소"/>
         </div>
       </div>  
       
</form>
</body>
</html>
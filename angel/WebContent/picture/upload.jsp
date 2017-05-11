<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<link href="./css/input.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() { //수정해라전부
	  $('#cost').focus();
	  
	  var progressTriangle = $('#progress-triangle');
	  
	  $('#cost').focus(function() {
	    progressTriangle.animate({
	      top: "48px"
	    });
	  });
	  $('#content').focus(function() {
	    progressTriangle.animate({
	      top: "118px"
	    });
	  });
	  $('#select').focus(function() {
	    progressTriangle.animate({
	      top: "190px"
	    });
	  });

	});
</script>
<title>사진업로드</title>
</head>
<body>
<form id="container">
  <div id="progress-triangle"></div>
  
  <label for="cost">
    <div class="holder">
      사진이름:
      <input type="text" name="cost" autocomplete="off" id="cost">
    </div>
  </label>
  
  <label for="content">
    <div class="holder">
      내용 :
      <input type="text" name="content" autocomplete="off" id="content">
    </div>
  </label>

 
          <br/>
       <div class="button">
         <div align="center">
         	<a href="./picture.jsp"><img src="./pics/list.png" width="60 height="60" align="middle"  /></a>
         	<a href="./uploadform.jsp"><img src="./pics/plus.png" width="60 height="60" align="middle"/>
         	<img src="./pics/cancel.png" width="60 height="60" align="middle"/>
         </div>
       </div>  
</form>
</body>
</html>
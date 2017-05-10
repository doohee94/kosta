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
<title>가계부 입력</title>
</head>
<body>
<form id="container">
  <div id="progress-triangle"></div>
  
  <label for="cost">
    <div class="holder">
      금액 :
      <input type="text" name="cost" autocomplete="off" id="cost">
    </div>
  </label>
  
  <label for="content">
    <div class="holder">
      내용 :
      <input type="text" name="content" autocomplete="off" id="content">
    </div>
  </label>

  <label for="select">
    <div class="holder">
       항목 :
         <select name="select" id="select">
           <option> 식비 </option>
           <option> 유흥 </option>
           <option> 기타 </option>
         </select>
     </div> 
          <br/>
       <div class="button">
         <div align="center">
         	<img src="../imgs/insert.png" width="60 height="60" align="middle"/>
         </div>
       </div>  
</form>
</body>
</html>
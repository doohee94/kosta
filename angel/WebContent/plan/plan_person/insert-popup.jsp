<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%

	String sDay = request.getParameter("sDay");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<link href="/test/plan/plan_person/assets/css/Cost_input.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	

<script type="text/javascript">

jQuery.noConflict();
jQuery(document).ready(function($) {
	
	var startDay = '<%=sDay%>';
	
	
	
 	$("#sDay").val(startDay);
	
	  
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
		  
		  if($("#sDay").val() == "" || $("#eDay").val() == "" || $("#title").val() == ""){
			  alert("모든 항목을 입력해주세요!");
			  return false;
		  }
		  
		  //정규화
		  var sDay = $("#sDay").val();
		  var eDay = $("#eDay").val();
		  
		  var dayRegExp =/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;  
		  var Sresult = sDay.match(dayRegExp);
		  var Eresult = eDay.match(dayRegExp);
		  if(!Sresult || !Eresult ){  
			  alert("날짜 형식을 맞춰주세요");
			  return false;
		  }
		  
		  var sTime = $("#sTime option:selected").val();
		  var eTime = $("#eTime option:selected").val();
			
		  var FullSDay = sDay + "T" + sTime+":00:00Z";
		  var FullEDay = eDay + "T" + eTime+":00:00Z";
			
		 var fsd = new Date(FullSDay);
		 var fed = new Date(FullEDay);
		 
		 if(fsd>fed){
			 alert("종료날짜가 시작날짜보다 더 빠릅니다!");
			 return false;
		 }
		 
		 //타이틀, endTiemd, sTiemd, 
		  var title = $("#title").val();
		 FullSDay = sDay + " " + sTime+":00:00";
		 FullEDay = eDay + " " + eTime+":00:00";
		 
// 		document.container2.action = "plan?cmd=insert-page?startDay="+FullSDay+"&endDay="+FullEDay;
//  		document.container2.submit();

			var url =  "plan?cmd=insert-page&title="+title+"&startDay="+FullSDay+"&endDay="+FullEDay;
			$(location).attr('href',url);
 		
	
	  });//클릭 
	  

	});//ready

</script>
</head>
<body>

	<form id="container" name="container2" >
  <div id="progress-triangle"></div>
  
  <label for="sDay">
    <div class="holder">
      시작날짜 :
      <input type="text" name="sDay" autocomplete="off" id="sDay"  placeholder="ex)2017-05-11"/>
    </div>
  </label>
  
  <label for="sTime">
    <div class="holder">
      시작시간 :
       <select name="sTime" id="sTime">
        <%for(int i=0; i<=24;i++){ %>
           
           <%  if(i<10){%>
        	
        	  <option value="0<%=i%>">0<%=i %></option>
        	   
        	   
        	 <%}else{ %> 
           
           <option value="0<%=i%>"><%=i %></option>
         <%} %>
           
           <%} %>
           
         </select>
         시
    </div>
  </label>
  
  <label for="eDay">
    <div class="holder">
      종료날짜 :
      <input type="text" name="eDay" autocomplete="off" id="eDay"  placeholder="ex)2017-05-11"/>
    </div>
  </label>
  
  <label for="eTime">
    <div class="holder">
      종료시간 :
    <select name="eTime" id="eTime">
           
           <%for(int i=0; i<=24;i++){ %>
           
           <%  if(i<10){%>
        	
        	  <option value="0<%=i%>">0<%=i %></option>
        	   
        	   
        	 <%}else{ %> 
           
           <option value="0<%=i%>"><%=i %></option>
         <%} %>
           
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
         		<input type='button' name="submit" id="submit" onclick="top.smartPopClose(); return false;"
						value="등록"/>
         		
         </div>
       </div>  
       
</form>
</body>
</html>
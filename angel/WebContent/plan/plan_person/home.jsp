<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% String projectName = "/test";
String coupleID = (String)request.getAttribute("couple");
String loginId = (String)request.getAttribute("id");
//System.out.print("home 화면, loginId는      : " + loginId+'\n');
//System.out.print("home 화면, coupleId는      : " + coupleID+'\n');
//session에 로그인 아이디, 커플 아이디를 등록함.

request.getSession(true);
if(loginId != null){
session.setAttribute("loginId", loginId);
session.setAttribute("coupleId", coupleID);
}
String id = (String)session.getAttribute("loginId");
String cid =  (String)session.getAttribute("coupleId");

%> 
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->


<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/angel/plan/plan_person/assets/css/main.css" />
		
		<!-- 풀캘린더 -->
		<link rel='stylesheet' href='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/fullcalendar.css' />
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		
		<noscript><link rel="stylesheet" href="/angel/plan/plan_person/assets/css/noscript.css" /></noscript>
		
		
		<style type="text/css">

    body {
        margin :40px 10px;
        padding : 0;
        font-size : 14px;
    }
    #calendar {
         max-width : 100%; 
  
        margin : 20px;

    }
    
    #startDay, #endDay, #content {
    
    	height : 30px;
    	width :  200px;
    }
   
   #startTime, #endTime{
    	width :  100px;
    	font-style: #fffffff;
    	color : black;
		height : 40px;
		font-size: 15px;
   }
   
   
#color{
	width :  150px;
	height : 40px;
	font-size: 15px;
	
}
   
   .fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */


/*@@@@@@@@@@@@@@@@@@@@@@모달*/

.modal.modal-center { text-align: center; }

.modal-dialog.modal-fullsize {
 width: 100%;
 height: 100%;
  margin: 0; 
  padding: 0; 
   text-align: center;
  }



   .modal-content.modal-fullsize {
 width: 600px;
  height: 500px; 
  margin: 0; 
  padding: 0;
  display: inline-block; text-align: left; vertical-align: middle; 
 text-align: center;


}

#mymodal2.modal-fullsize{
 width: 400px;
  height: 200px; 
  margin: 0; 
  padding: 0;
  display: inline-block; text-align: left; vertical-align: middle; 
 text-align: center;

}


  
</style>
		
		
		<title>Astral by HTML5 UP</title>
		
		
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/jquery.min.js'></script>
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/moment.min.js'></script>
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0//fullcalendar.js'></script>
		<script src="/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/locale-all.js"></script>
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		
	
		
		<script type="text/javascript">



jQuery(document).ready(function($) {
	
	   //@@@@@@@@@@컬러피커@@@@@@@@
	   
	   
	
	var id='<%=id%>';
	

    $('#calendar').fullCalendar({
    	
    	
       header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listMonth'
        },
        editable : true,
        defaultDate: moment().format('YYYY-MM-DD'),    
        events: {
           
			
        	url : 'plan?cmd=list-page&ajax=true&id='+id,
           dataType : 'json'
        
        },
        weekends: true,
       
        navLinks : true
        
       ,navLinkDayClick:function(date, jsEvent, view) { 
          
          $("#startDay").val(date.toISOString());
           $("#myModal").modal("show");
          
       }//날짜클릭
       
       ,eventDrop:function(event,jsEvent,view){
    	   $('#id').val(event.id);
    		var sday = event.start.toISOString().split("T");
    		var eday = event.end.toISOString().split("T");
    		
    		$('#mSday').val(sday[0]+" "+sday[1]);
    		 $('#mEday').val(eday[0]+" "+eday[1]);
    	   
    	   $("#myModal2").modal("show");
       }
       
       ,eventClick:function(event){
    	   
    	   $('#id').val(event.id);
    	   $("#myModal3").modal("show");
    	   
       }

  
    });//캘린더
    
    
    	  $("#submit").click(function(){
    		  
    		  if($("#startDay").val() == "" || $("#endDay").val() == "" || $("#content").val() == ""){
    			  alert("Plase Insert All Text");
    			  return false;
    		  }
    		  
    		  //정규화
    		  var sDay = $("#startDay").val();
    		  var eDay = $("#endDay").val();
    		  
    		  var dayRegExp =/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;  
    		  var Sresult = sDay.match(dayRegExp);
    		  var Eresult = eDay.match(dayRegExp);
    		  if(!Sresult || !Eresult ){  
    			  alert("Plase Check Your Date");
    			  return false;
    		  }
    		  
    		  //영어 정규화
    		   var title = $("#content").val();
    		  var engExp = /^[a-zA-Z0-9\s]+$/;
    		  
    		  var titleCheck = title.match(engExp);
    		  
    		  if(!titleCheck){
    			  alert('Please Wrtie Only English or Digit');
    			  return false;
    		  }
    		                                                                                                                                                                                       
    		  
    		  var sTime = $("#startTime option:selected").val();
    		  var eTime = $("#endTime option:selected").val();
    			
    		  var FullSDay = sDay + "T" + sTime+":00:00Z";
    		  var FullEDay = eDay + "T" + eTime+":00:00Z";
    			
    		 var fsd = new Date(FullSDay);
    		 var fed = new Date(FullEDay);
    		 
    		 if(fsd>fed){
    			  alert("Plase Check Your Date");
    			 return false;
    		 }
    		 
    		 //타이틀, endTiemd, sTiemd, 
    		  var title = $("#content").val();
    		 FullSDay = sDay + " " + sTime+":00:00";
    		 FullEDay = eDay + " " + eTime+":00:00";
    		 
    		 //컬러
    		 var color = $('#color option:selected').val();
    		
    		 
    			var url =  "plan?cmd=insert-page&title="+title+"&startDay="+FullSDay+"&endDay="+FullEDay+"&color="+color;
    			$(location).attr('href',url);
    			
     		   	
    	  });//클릭 
 			
   	  $("#modify").click(function(){
    	var id = $('#id').val();
    	var sDay =  $('#mSday').val();
    	var eDay =   $('#mEday').val();
    	
    	
   		var url =  "plan?cmd=modify-page&id="+id+"&sDay="+sDay+"&eDay="+eDay;
		$(location).attr('href',url);
	
    	  });//수정 클릭 
    	  
    	  
    	  $("#delete").click(function(){
    	    	var id = $('#id').val();
    	   		var url =  "plan?cmd=delete-page&id="+id;
    			$(location).attr('href',url);
    	    
    	    	  });//삭제 클릭 
    	    	  
    	    //탭
    	  var jbOffset = $( '.jbMenu' ).offset();
          $( window ).scroll( function() {
            if ( $( document ).scrollTop() > jbOffset.top ) {
              $( '.jbMenu' ).addClass( 'jbFixed' );
            }
            else {
              $( '.jbMenu' ).removeClass( 'jbFixed' );
            }
          });
          
          //컬러 설정 변경
          
          $("#color").change(function(){
        	  
        	  $('#color').css("color","#"+$('#color option:selected').val());
          });
          
    	    	  
}); //ready


		
		</script>
		
	</head>
	<body id="home_body">

<%@ include file="head.jsp" %>
   
<div id="sidemain" class="jbContent">  <!-- @@@@@여기 해줘야 바뀜 -->
		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
					<nav id="nav">
						<a href="#me" class="icon fa-home active"><span>Calendar</span></a>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="me" class="panel">
								<header>
								<h2>CALENDAR</h2>
								</header>							
									<br/>	<br/>
								<div id='calendar'></div>
								
								
								
		<!-- INSERT  Modal-->
	<div class="modal fade" id="myModal" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog  modal-fullsize">

			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4 class="modal-title">INSERT YOUR SCHEDULE </h4>
				</div>
				<div class="modal-body">

					<form id="container2" name="container2">
						START DAY <input type="text" name="startDay" autocomplete="off" id="startDay"placeholder="ex)2017-05-11" /> 
						
						START TIME <select name="startTime"
							id="startTime" >
							<%for(int i=0; i<=24;i++){ %>
							<%  if(i<10){%>
							<option value="0<%=i%>">0<%=i %></option>
							<%}else{ %>
							<option value="<%=i%>"><%=i %></option>
							<%} %>
							<%} %>
						</select>  <br />
						
						END DAY<input type="text" name="endDay" autocomplete="off"
							id="endDay" placeholder="ex)2017-05-11"   /> 
							
							END TIME <select
							name="endTime" id="endTime"  >

							<%for(int i=0; i<=24;i++){ %>

							<%  if(i<10){%>

							<option value="0<%=i%>" >0<%=i %></option>


							<%}else{ %>

							<option value="<%=i%>"><%=i %></option>
							<%} %>

							<%} %>

						</select>
						<br /> <br /> 
						 EVENT COLOR <select id='color' name='color'>
						 		
						 	   <option value="ffffff" style="color:#ffffff; background-color:#000000; ">WHITE</option>
						 		<option value="6495ED" style="color:	#6495ED; ">CornflowerBlue</option>
						 		<option value="90EE90" style="color:#90EE90; ">LightGreen </option>
						 		<option value="FF0000" style="color:	#FF0000; ">RED</option>
						 	
						 
						 </select>
						<br /><br />
						 CONTENT <input type="text" name="title" autocomplete="off"	id="content"  name="content" placeholder="only english" /> <br />
							
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"  id="submit" name="submit">INSERT</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					</div>
				

			</div>
		</div>
	</div>
	

		<!-- MODIFY  Modal-->
	<div class="modal fade" id="myModal2" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog  modal-fullsize">

			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4 class="modal-title">CHECK</h4>
				</div>
				<div class="modal-body">
							
						Are you really going to change the schedule?
					
					</div>
					<div class="modal-footer">
						<input type="hidden" id = "id" name="id"/>
						<input type="hidden" id = "mSday" name="mSday"/>
						<input type="hidden" id = "mEday" name="mEday"/>
						<button type="button" class="btn btn-default"  id="modify" name="modify">YES</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">NO</button>
					</div>
				

			</div>
		</div>
	</div>
	<!-- DELETE  Modal-->
	<div class="modal fade" id="myModal3" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog  modal-fullsize">

			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4 class="modal-title">CHECK</h4>
				</div>
				<div class="modal-body">
							
						Are you really going to DELETE the schedule? 
					
					</div>
					<div class="modal-footer">
						<input type="hidden" id = "id" name="id"/>
						<input type="hidden" id = "mSday" name="mSday"/>
						<input type="hidden" id = "mEday" name="mEday"/>
						<button type="button" class="btn btn-default"  id="delete" name="delete">YES</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">NO</button>
					</div>
				

			</div>
		</div>
	</div>

	</article>
	</div>
			
	<!-- Footer -->
					<div id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>

			</div>

</div>
		<!-- Scripts -->
			<script src="/angel/plan/plan_person/assets/js/jquery.min.js"></script>
			<script src="/angel/plan/plan_person/assets/js/skel.min.js"></script>
			<script src="/angel/plan/plan_person/assets/js/skel-viewport.min.js"></script>
			<script src="/angel/plan/plan_person/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/angel/plan/plan_person/assets/js/main.js"></script>
			 <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script> //@@@@@@@@@@@여기도@@@@@@@@@@@@@
function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    document.getElementById("sidemain").style.marginLeft = "350px";
}

function closeNav() {
	 document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("sidemain").style.marginLeft= "0";
}


</script>
			
	</body>
</html>
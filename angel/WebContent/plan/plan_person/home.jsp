<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<% request.setCharacterEncoding("utf-8"); %>

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
   
    	height : 30px;
    	width :  100px;
   }
   .fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */


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

    $('#calendar').fullCalendar({
    	
    	
       header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listMonth'
        },
        editable : true,
        defaultDate: moment().format('YYYY-MM-DD'),    
        events: {
           
			
        	url : 'plan?cmd=list-page&ajax=true',
         // type : 'post',
           dataType : 'json'
          // contentType: "application/x-www-form-urlencoded; charset=UTF-8"
       		
        
        },
        weekends: true,
       
        navLinks : true
        
       ,navLinkDayClick:function(date, jsEvent, view) { 
          
          $("#startDay").val(date.toISOString());
           $("#myModal").modal("show");
          
       }//날짜클릭
       
       ,eventDrop:function(event,jsEvent,view){
    	   
    	   $("#myModal2").modal("show");
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
    		 
    			var url =  "plan?cmd=insert-page&title="+title+"&startDay="+FullSDay+"&endDay="+FullEDay;
    			$(location).attr('href',url);
    			
     		   	
    	  });//클릭 
 			
   	  $("#modify").click(function(){
    		  
   		  	a
   		  		
    
    			
     		   	
    	  });//수정 클릭 
    	  
    

}); //ready

		
		
		</script>
		
	</head>
	<body id="home_body">
	<br/>	<br/>
		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
					<nav id="nav">
						<a href="#me" class="icon fa-home active"><span>Home</span></a>
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
							id="startTime">
							<%for(int i=0; i<=24;i++){ %>
							<%  if(i<10){%>
							<option value="0<%=i%>">0<%=i %></option>
							<%}else{ %>
							<option value="<%=i%>"><%=i %></option>
							<%} %>
							<%} %>
						</select>  <br />
						
						END DAY<input type="text" name="endDay" autocomplete="off"
							id="endDay" placeholder="ex)2017-05-11" /> 
							
							END TIME <select
							name="endTime" id="endTime">

							<%for(int i=0; i<=24;i++){ %>

							<%  if(i<10){%>

							<option value="0<%=i%>">0<%=i %></option>


							<%}else{ %>

							<option value="<%=i%>"><%=i %></option>
							<%} %>

							<%} %>

						</select>
						<br /> <br /> <br />
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
						<button type="button" class="btn btn-default"  id="modify" name="modify">YES</button>
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

		<!-- Scripts -->
			<script src="/angel/plan/plan_person/assets/js/jquery.min.js"></script>
			<script src="/angel/plan/plan_person/assets/js/skel.min.js"></script>
			<script src="/angel/plan/plan_person/assets/js/skel-viewport.min.js"></script>
			<script src="/angel/plan/plan_person/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/angel/plan/plan_person/assets/js/main.js"></script>
			
			
			
			

	</body>
</html>
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
		<link rel="stylesheet" href="/angel/cost/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/angel/cost/assets/css/noscript.css" /></noscript>
		
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
    
    #day, #content, #mDay, #mContent, #cost, #mCost {
    
    	height : 30px;
    	width :  200px;
    	font-size : 14px;
    	color : black;
    }
   
   #category, #mCategory{
   
    	height : 40px;
    	width :  100px;
    	font-size : 14px;
    	color : black;
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
        editable : false,
        defaultDate: moment().format('YYYY-MM-DD'),    
        events: {
           
        	url : 'cost?cmd=cost-list&ajax=true&memberId=hyorang',
		//  type : 'post',
			dataType : 'json'
			, 
			error: function() {
			$('#script-warning').show();	
	
        	},
        },
        weekends: true,
       
        navLinks : true,
        
       	navLinkDayClick:function(date, jsEvent, view) { 
          //날짜 클릭하는 데이값 받서 day 필드에 넣기
           $("#day").val(date.toISOString());
          //모달창 띄워 주기
           $("#myModal").modal("show");
          
       }//날짜클릭시 입력창
       ,eventClick: function(event, jsEvent, view) {
           $("#myModal2").modal("show");   
           var costNo = event.id.split("-");         
           $("#costNo").val(costNo[0]);
           $("#mCost").val(costNo[1]);
           $("#mContent").val(event.title);
           $("#mCategory").val(costNo[2]).attr("selected", "selected");
       }//이벤트 클릭으로 인한 수정

  
    });//캘린더
    
    	//입력
    	  $("#submit").click(function(){
    		  
    		  if($("#content").val() == "" || $("#day").val() == "" || $("#category").val() == ""|| $("#cost").val()==""){
    			  alert("Plase Insert All Text");
    			  return false;
    		  }
    		  
    		  //정규화
    		  var day = $("#day").val();
			  var cost = $("#cost").val()
    		  var dayRegExp =/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
    		  var costRegExp = /^[0-9]*$/;
    		  var dResult = day.match(dayRegExp);
    		  var cResult = cost.match(costRegExp);
    		  if(!dResult){  
    			  alert("Plase Check Your Date");
    			  return false;
    		  }
    		  if(!cResult){  
    			  alert("Plase Check Your Cost");
    			  return false;
    		  }
    		 
    		 //타이틀, endTiemd, sTiemd, 
    		  var content = $("#content").val();
    		  var category =  $("#category").val();
    		  var memberId= $("#memberId").val();
    		  var url =  "cost?cmd=input-cost&content="+content+"&day="+day+"&category="+category+"&cost="+cost+"&memberId="+memberId;
    		  $(location).attr('href',url);
    			
     		   	
    	  });//클릭 
    	  //수정(입력하는 방식)
   	  $("#mSubmit").click(function(){
    		  
    		  if($("#mContent").val() == "" || $("#mDay").val() == "" || $("#mCategory").val() == ""|| $("#mCost").val() == "" ){
    			  alert("Plase Insert All Text");
    			  return false;
    		  }
    		  
    		  //정규화
    		  var day = $("#mDay").val();
			  var cost = $("#mCost").val()
    		  var dayRegExp =/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
    		  var costRegExp = /^[0-9]*$/;
    		  var dResult = day.match(dayRegExp);
    		  var cResult = cost.match(costRegExp);
    		  if(!dResult){  
    			  alert("Plase Check Your Date");
    			  return false;
    		  }
    		  if(!cResult){  
    			  alert("Plase Check Your Cost");
    			  return false;
    		  }
    		 
    		 //타이틀, endTiemd, sTiemd, 
    		  var content = $("#mContent").val();
    		  var category =  $("#mCategory").val();
    		  var memberId= $("#memberId").val();
    		  var cost =$("#mCost").val();
    		  var costNo = $("#costNo").val();
    		  var url =  "cost?cmd=modify-cost&content="+content+"&day="+day+"&category="+category+"&cost="+cost+"&memberId="+memberId+"&costNo="+costNo;
     		   $(location).attr('href',url);		   	
    	  });//클릭 
    	  $("#delete").click(function(){
    		  var memberId= $("#memberId").val(); 
    		  var costNo = $("#costNo").val();
    		  var url = "cost?cmd=delete-cost&memberId="+memberId+"&costNo="+costNo;
    	  		$(location).attr('href',url);
    	  });//클릭

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
								<input type='hidden' id='memberId' name='memberId' value='hyorang'>
								<input type='hidden' id='costNo' name='costNo' value=''>
								
								</header>							
									<br/>	<br/>
								<div id='calendar'></div>
								</article>
								</div>

	<!-- INSERT Cost  Modal-->
	<div class="modal fade" id="myModal" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog  modal-fullsize">

			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4 class="modal-title">INSERT YOUR COST </h4>
				</div>
				<div class="modal-body">

					<form id="container2" name="container2">
						<br/>
						DAY <input type="text" name="day" autocomplete="off" id="day"placeholder="ex)2017-05-11" /> 
						<br/>
						<br/>
						 COST <input type="text" autocomplete="off"	id="cost"  name="cost" placeholder="ex) 2000￦ => 2000" />
						 <br/>
						 <br/>
						 CONTENT <input type="text" autocomplete="off"	id="content"  name="content" placeholder="only english" /> 
						 <br/>
						 <br/>						
						 CATEGORY <select name="category" id="category">
						 <option value="Eating">Eating</option>
						 <option value="plaing">Playing</option>
						 <option value="ETC">ETC</option>
						 </select>
						  <br />
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"  id="submit" name="submit">INSERT</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					</div>
				

			</div>
		</div>
	</div>
		<!-- Modify Cost  Modal-->
	<div class="modal fade" id="myModal2" role="dialog"
		aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog  modal-fullsize">

			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<h4 class="modal-title">MODIFY YOUR COST </h4>
				</div>
				<div class="modal-body">

					<form id="container2" name="container2">
					<br/> <br/>
						DAY <input type="text" name="mDay" autocomplete="off" id="mDay"placeholder="ex)2017-05-11" value="" /> 
						<br/> <br/>
						 CONTENT <input type="text" autocomplete="off"	id="mContent"  name="mContent" placeholder="only english" value="" /> 
						 <br/>
						<br/>
						 COST <input type="text" autocomplete="off"	id="mCost"  name="mCost" placeholder="ex) 2000￦ => 2000" value="" />
						 <br/>
						<br/>
						 CATEGORY <select name="mCategory" id="mCategory">
						 <option value="Eating">Eating</option>
						 <option value="plaing">Playing</option>
						 <option value="ETC">ETC</option>
						 </select>
						  <br />
					</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"  id="mSubmit" name="mSubmit">MODIFY</button>
						<button type="button" class="btn btn-default"  id="delete" name="delete">DELETE</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
					</div>
				

			</div>
		</div>
	</div>

				<!-- Footer -->
					<div id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/angel/cost/assets/js/jquery.min.js"></script>
			<script src="/angel/cost/assets/js/skel.min.js"></script>
			<script src="/angel/cost/assets/js/skel-viewport.min.js"></script>
			<script src="/angel/cost/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/angel/cost/assets/js/main.js"></script>

	</body>
</html>
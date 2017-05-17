<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% String project = "/angel/UserControl?cmd=";
   String id = (String)session.getAttribute("id");
   
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
			span{
			
				font-size : 50px;
				font-style: oblique;
				display: block;
			}
			main{
			text-align: center;
		
				
			}
			.inputs{
			 margin-left: 34%;
			 border-style: dashed;
			 color : balck;
			 size : 100px;
			}
			#checkCouple{
			 margin-left: 47.5%;
			}
			
			#check_bnt{
			margin-left: 49%;
			size : 20px;
			}
			.text{
			text-align: center;
			}
			
			#field{
			
				background-color: lightgray;
				width : 80%;
				margin-left:  100px;
				 border-style: dashed;
				 border-width: thick;
			}
			
			#me{
					background-color: #f7f7f7;
				
			}
			
			#head{
				padding-left : 20%;
				font-size: 40px;
				font-style: inherit;
			}
		</style>
		
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/jquery.min.js'></script>
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/moment.min.js'></script>
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0//fullcalendar.js'></script>
		
		<script type="text/javascript">
		$(function(){
			
			$("#coupleId").change(function(){
				  //id가 존재하고 그 사람 커플 아이디가 null 이면! 
				    var cid = $("#coupleId").val();
	    			var id = '<%=id%>';
	    			
	    			if(cid == id){
	    				alert("You cannot Insert Your ID");
	    				return false;
	    			}
	    			
	    		  $.ajax({
	    			 
	    			  url:'<%=project%>Couple_idCheck&ajax=true&cid='+cid,
	    			  type : "post",
	    			  dataType : "text",
	    			  success : function(data){
	    				  alert(data);
	    				  if(data == "false"){
	    					  $("#ck").val("There is no corresponding ID or there is already a couple.");
	    					  $("#check").val("false");
	    				  }else{
	    					  $("#check").val("true");
	    					  $("#ck").val("Coupling is possible.");
	    				  }
	    			  }//성공
	    			  
	    		  });
				
			});
			
			$("#check_bnt").click(function(){
				alert("누름");
				 if($("#date").val() == ""  || $("#coupleId").val() ==""){
	    			  alert("Plase Insert All Content");
	    			  return false;
	    		  }
				 var dayRegExp =/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;  
	    		  var date = $("#date").val();
	    		  if(!date){    
	    			  alert("Plase Check Your Love Start Date!");
	    			  return false;
	    		  }  
	    		  if( $("check").val() == "false"){
	    			  alert("Plase Check Your Lover's ID");
	    			  return false;
	    		  }
	    		  
	    		  var cid = $("#coupleId").val();
	    		  var id = '<%=id%>';
	    		  
	    		  var url = "<%=project%>make_couple&cid="+cid+"&id="+id+"&date="+date;
	    		  alert(url);
	    		  $(location).attr("href",url);
	    		  
			});//클릭
		});
		</script>
		
	</head>
	
	<body>
		<%@ include file="head.jsp" %>
		
	<div id="sidemain" class="jbContent">  
		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
					<nav id="nav">
						<a href="#me" class="icon fa-home active"><span>Make</span></a>
					</nav>

				<!-- Main -->
					<div id="main" name="main" >

						<!-- Me -->
							<article id="me" class="panel" >
							<div id="head">
								INSERT YOUR LOVER'S ID! 
							</div>
							<input type="hidden" id="check"/>
						<br/><br/><br/>
						<div  id="field">
								<div style="text-align: center" id='temp' >
										<span>LOVER ID</span>
								</div>
									 <input type="text" id="coupleId" name="coupleId" class = "inputs"/><br/><br/>
									<br>
									
									<input type="text" id="ck" name="ck" class = "inputs" readonly="readonly" style="width: 350px; "/><br/><br/>
									
										<br>
										<div style="text-align: center" id='temp1' >
										<span>LOVE START DATE</span>
								</div>
									<input type="text" class="inputs" name="date" id="date" placeholder="ex)2017-05-01" />	
									<br>
									<img src="/angel/main/img/heart_bnt.png" name="check_bnt" id="check_bnt"></img>									
									 <br> <br> <br/>
									<div class="text">Please Insert Your Lover's ID. <br> <br> IF you Do that,<br>  <br/>You can share Couple Diary With your Lover!</div>
									 
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
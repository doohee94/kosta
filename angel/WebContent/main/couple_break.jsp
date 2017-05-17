<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% String projectLink = "/angel/CoupleControl?cmd=";%>
<%
// 	로그인을 하기 위해, 아이디, 이름을 가져온다. 커플 아이디, 이름도 가져와야함.
	String break_id = (String)session.getAttribute("loginId");
	String break_cid = (String)session.getAttribute("coupleId");

	String couple = (String)request.getAttribute("couple");
	String couplePath = (String)request.getAttribute("couplePath");
	String memberPath = (String)request.getAttribute("memberPath");	
	System.out.print("CoupleMainView.jsp)break_id      : " + break_id+'\n');
	System.out.print("CoupleMainView.jsp)break_cid      : " + break_cid+'\n');	
	System.out.print("CoupleMainView.jsp)couple      : " + couple+'\n');
	System.out.print("CoupleMainView.jsp)couplePath      : " + couplePath+'\n');
	System.out.print("CoupleMainView.jsp)memberPath      : " + memberPath+'\n');
	
  
%>
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
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<noscript><link rel="stylesheet" href="/angel/plan/plan_person/assets/css/noscript.css" /></noscript>
		
		<style type="text/css">

		</style>	
		
		<title>Astral by HTML5 UP</title>
		
		
		<script src='/angel/plan/plan_person/fullcalendar-3.4.0/fullcalendar-3.4.0/lib/jquery.min.js'></script>
		<link rel="stylesheet" type="text/css" href="/angel/couple/css/couple.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script type="text/javascript">		



jQuery(document).ready(function($) {
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
						<a href="#me" class="icon fa-home active"><span>Home</span></a>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Me -->
							<article id="me" class="panel">
								<header>
								
<h3 class="sign-in">Please Think Again</h3>								
<h3 class="sign-in">If You Click Heart, You Can Break Couple</h3>								
<div class="total">								
<div class="profile" align="center">
<img src="<%=memberPath%>" height="128px" width="128px" alt="boy">
<img src="/angel/couple/img/heart.png" alt="heart" id="heart" style="cursor:url(hammer.png), help">
<img src="<%=couplePath%>" height="128px" width="128px" alt="girl">
</div>

</div>

<!-- <div align="center"> -->
<!--   <table> -->
<!--     <tr bgcolor="pink"> -->
<!--       <th colspan='2'>지난이벤트</th> -->
<!--       <th colspan='2'>다가올이벤트</th> -->
<!--     </tr> -->
<!--     <tr> -->
<!--       <td>2016-01-01</td> -->
<!--       <td>200일</td> -->
<!--       <td>2017-09-09</td> -->
<!--       <td>1000일</td> -->
<!--     </tr> -->
<!--     <tr> -->
<!--       <td></td> -->
<!--       <td></td> -->
<!--       <td>2017-12-25</td> -->
<!--       <td>크리스마스</td> -->
<!--     </tr> -->
<!--   </table> -->
<!-- </div> -->
<%-- 								<input type='hidden' id='memberId' name='memberId' value='<%=loginId%>'/> --%>
<%-- 								<input type='hidden' id='coupleId' name='coupleId' value='<%=coupleId%>'/> --%>
								
								</header>							
									<br/>	<br/>
								<div id='calendar'></div>
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
			<script src="/angel/cost/assets/js/jquery.min.js"></script>
			<script src="/angel/cost/assets/js/skel.min.js"></script>
			<script src="/angel/cost/assets/js/skel-viewport.min.js"></script>
			<script src="/angel/cost/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/angel/cost/assets/js/main.js"></script>
<script> //@@@@@@@@@@@여기도@@@@@@@@@@@@@

$(function(){
	$("#heart").click(function(){
		//alert("클릭!!");
		
		// member, couple을 찾아 update 해줄꺼야
		// 뭘 update? couple membercouple, coupledate를 각각 null로 만들어야!!!
				
		location.href="<%=projectLink%>CoupleBreak&id=<%=break_id%>&cid=<%=break_cid%>";	
	
		
		
		
	})
})

function openNav() {
			    document.getElementById("mySidenav").style.width = "350px";
			    document.getElementById("sidemain").style.marginLeft = "350px";
			    document.getElementById("welcome").innerHTML="Welcome <%=break_id%>!";
			  
			}

function closeNav() {
	 document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("sidemain").style.marginLeft= "0";
}


</script>
			
	</body>
</html>
	</body>
</html>
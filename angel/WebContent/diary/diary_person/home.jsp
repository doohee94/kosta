<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<link rel="stylesheet" href="/extest/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/extest/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body id="home_body">

<%@ include file="head.jsp" %>

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
								<%@ include file='diary_person_list.jsp' %>
							</article>

						
				<!-- Footer -->
					<div id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/extest/assets/js/jquery.min.js"></script>
			<script src="/extest/assets/js/skel.min.js"></script>
			<script src="/extest/assets/js/skel-viewport.min.js"></script>
			<script src="/extest/assets/js/util.js"></script>
			<script src="/extest/assets/js/main.js"></script>

<script> //@@@@@@@@@@@여기도@@@@@@@@@@@@@
function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    document.getElementById("sidemain").style.marginLeft = "350px";
    document.getElementById("welcome").innerHTML="xxx님이 로그인하셨습니다.";
}

function closeNav() {
	 document.getElementById("mySidenav").style.width = "0";
	    document.getElementById("sidemain").style.marginLeft= "0";
}


</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Angel</title>
<link rel="stylesheet" href="/angel/diary/diary_couple/header/css/tab.css"/>


<style type="text/css">

 .jbTitle {
        text-align: center;
      }
      .jbMenu {
        background-color: #e68a6e;
        padding: 10px 0px;
        width: 100%;
      }
     
      .jbFixed {
        position: fixed;
        top: 0px;
      }
      
       .jbContent {
        height: 900px;
      }
      
      #logo{
      
      	  height: 120px;
      
      }
      #logo_in_nave{
      
      height: 85px;
      }
      
      
      /* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */

/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
    top: 0;
    left: 0;
    background-color: #eab3a2; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#sidemain {
    transition: margin-left .5s;
    padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}


footer{
	margin-top : 70px;
	background-color: #e68a6e;
	height : 50px;
}

#logout{
	display: inline-block;	
	margin-left : 60%;
}
  

</style>
<script type="text/javascript" src="/angel/diary/diary_couple/header/js/tab.js"></script>

<script type="text/javascript">

$(function(){
	
	 $("#naviImg").hover(function(){
   	  
   	  $('#naviImg').attr("src","/angel/diary/diary_couple/header/img/over.png");
     }, function(){
   	  $('#naviImg').attr("src","/angel/diary/diary_couple/header/img/out.png");
   	  
     });
	 
});

</script>

</head>
<body>

 <div class="jbTitle">
   		<img src="/angel/diary/diary_couple/header/img/logosamlple.png" id="logo" name="logo"></img>
    </div>
    
    <div class="jbMenu">
      <p>
     <img src="/angel/diary/diary_couple/header/img/out.png" onclick="openNav()" id='naviImg' name="naviImg"></img>
      </p>
      
      
    </div>
    
<br/>
<div id="mySidenav" class="sidenav">
	<div class="jbTitle"  >
   		<img src="/angel/diary/diary_couple/header/img/logosamlple.png" id="logo_in_nave" name="logo_in_nave"  ></img>
    </div>
    <br/>
   <div style="text-align: center">환영해요......</div> <br/>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()"  >&times;</a>



  <ul class="acc-menu" id="accordionMenu1">  
    <li data-extension="open">
        <div class="main-title"><span class="folder"> </span><a>Personal <br/></a></div> 
        <ul class="sub">
            <li><a href="/.diary?cmd=list-page">Diary</a></li> <br/>
            <li><a href="/plan?cmd=list-page">Plan</a></li> <br/>
            <li><a href="/cost?cmd=cost-list">Household Account</a></li><br/>
            <li><a>Photo</a></li><br/>
        </ul>
    </li>

    <li data-extension="open">
        <div class="main-title"><span class="folder"> </span><a>Setting <br/> </a></div> 
        <ul class="sub">
            <li><a>Option</a></li><br/>
            <li><a>Information</a></li><br/>
        </ul>
    </li>
</ul>

	<br/><br/><br/><br/><br/>


	
			<footer>
			<div id='logout' name='logout' >LOGOUT</div>
			<img src="/angel/diary/diary_couple/header/img/logout.png"></img>
			</footer>
			
	
	
</div>
    


</body>
</html>
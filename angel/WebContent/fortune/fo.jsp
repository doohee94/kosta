<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>




</head>
<body>

<% int result; %><!-- 랜덤숫자 출력 -->
<% result= (int)( Math.random()*100 )  + 1;%>

<!-- 쿠키눌렀을때 효과 -->

<script type="text/javascript">



function showmap() { 
 if(document.all.spot.style.visibility=="hidden") {
   document.all.spot.style.visibility="visible";
   return false;
 }
 if(document.all.spot.style.visibility=="visible") {
  document.all.spot.style.visibility="hidden";
  return false;
 }
}
</script>
  

<!-- a태그에 링크걸기 -->
<a href="#" onclick="showmap(spot);" title=""><img src="./imgj/fofull.png" alt="" /></a>
<a href="#" onclick="showmap(spot);" title=""><img src="./imgj/fofull.png" alt="" /></a>
<a href="#" onclick="showmap(spot);" title=""><img src="./imgj/fofull.png" alt="" /></a>

<!-- 레이어팝업 -->
<div id="spot" style="position:absolute; visibility:hidden;">
<img src="./imgj/foopen.png" alt="" />
<div>
<div style="position: absolute;">
<div class="text" style="position:relative; left:200px;  right:300px; bottom:200px; top:=0px;" >
 <p>우왕숫자다</p>
 <p ><%= result %></p>
   
    </div>
    </div>
    </div>
</div>




</body>
</html>
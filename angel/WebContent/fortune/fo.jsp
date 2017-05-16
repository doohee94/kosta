<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>fortune</title>

</head>
<body>

<% 
int result; // 랜덤숫자 출력 
result= (int)( Math.random()*10 )  + 1;

String[] say = {"No one has ever had \n an idea in a dress suit. ","To love deeply in one direction makes \n us more loving in all others.","Live simply that others may simply live.",
		"Life is just a bowl of pits.","I am not afraid of storms for I am \n learning how to sail my ship.","To help a friend in need is easy, \n but to give him your time is not always opportune.",
		"Self-confidence is the first \n requisite to great undertakings.","If I have lost confidence in myself, \n I have the universe against me.","All noble things are as difficult as they are rare.",
		"The only greatness for man is immortality.","I never think of the future - it comes soon enough."};
				
%>

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
<a href="#" onclick="showmap(spot);" title=""><img src="/angel/fortune/imgj/fofull.png" alt="" width="170" height="170" align="middle" /></a>
<a href="#" onclick="showmap(spot);" title=""><img src="/angel/fortune/imgj/fofull.png" alt="" width="170" height="170" align="middle" /></a>
<a href="#" onclick="showmap(spot);" title=""><img src="/angel/fortune/imgj/fofull.png" alt="" width="170" height="170" align="middle" /></a><!-- 레이어팝업 -->
<div id="spot" style="position:absolute; visibility:hidden;">
<img src="/angel/fortune/imgj/foopen.png" alt="" />
<div>
<div style="position: absolute;">
<div class="text" style="position:relative; left:200px;  right:300px; bottom:200px; top:=0px;" >

 <p align="center" ><%= say[result] %></p>
   
    </div>
    </div>
    </div>
</div>
</body>
</html>
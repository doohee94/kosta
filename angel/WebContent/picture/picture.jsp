<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="./js/glisse.js"></script>
<link rel="stylesheet" href="./css/glisse.css" />
<img class="pics" src="./pics/thumb.jpg"  height='300px' max-width:100% data-glisse-big="" />
<img class="pics" src="./pics/thumb-1.jpg"   height='300px' max-width:100% data-glisse-big="./pics/thumb-1.jpg" rel="group1"/>
<img class="pics" src="./pics/thumb-2.jpg"  height='300px' data-glisse-big="./pics/thumb-2.jpg" rel="group1"/>
<img class="pics" src="./pics/thumb-3.jpg"   height='300px' data-glisse-big="./pics/thumb-3.jpg" rel="group1"/>
<img class="pics" src="./pics/thumb-4.jpg"   height='300px' data-glisse-big="./pics/thumb-4.jpg" rel="group1" title="어어어어"/>
<img class="pics" src="./pics/thumb-5.jpg"    height='300px'  max-width:100%  data-glisse-big="./pics/thumb-5.jpg" rel="group1"/>

<script>
$(function () {
    $('.pics').glisse({
        changeSpeed: 550, 
        speed: 500,
        effect:'rotate',
        fullscreen: true
    }); 
});
</script>
</head>
<body>

<div class="button">
         <div align="center">
         	<a href="./upload.jsp"><img src="./pics/input.png" width="60 height="60" align="middle"  /></a>
         	<a href="./delete.jsp"><img src="./pics/delete.png" width="60 height="60" align="middle"/></a>
         </div>
       </div>  


</body>
</html>
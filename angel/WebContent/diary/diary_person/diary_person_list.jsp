<%@page import="model.diary.DiaryVo"%>
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% Date date = new Date();
SimpleDateFormat today_f = new SimpleDateFormat("yyyy-MM-dd");
String today =today_f.format(date); 
List <DiaryVo> list = (List <DiaryVo>)request.getAttribute("param");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일기장리스트</title>

<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
h1{
display: inline-block;
}
#year{
margin-left: 250px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery.listSorter.js"></script>
<script type="text/javascript">

	$(function(){
		
		var year = $('#year option:selected').val();
		var month = $('#month option:selected').val();
		$('#search').click(function(){
// 			$.ajax({  
// 				url: '/.diary?cmd=list-page&year='+year+"&month="+month,
// 				type : 'get',
				
// 			});

			

		});
	});

</script>
</head>
<body>

	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<h1>일기장</h1>
			<select  class="select" id= "year" tabindex="1">
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>
            <option value="2017">2017</option>
            <option value="2018">2018</option>
            <option value="2019">2019</option>
            <option value="2020">2020</option>
                   </select>
			<select name="month" id="month" >
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> 
			<input type='button' value='검색' id = 'search'>
			<div id="tableLikeList" class="row panel panel-default">
				<div class="thead panel-heading clearfix">
					<div data-idx="0" class="col-md-6 hcell">
						<p class="text-center">
							<strong>작성일자</strong> <span class="glyphicon"></span>
						</p>
					</div>
					<div data-idx="1" class="col-md-6 hcell">
						<p class="text-center">
							<strong>일기제목</strong> <span class="glyphicon"></span>
						</p>
					</div>
				</div>
				<ul class="tbody cb list-group">
				
					<% for(int i = 0; i<list.size(); i++){ %>
					<li class="list-group-item clearfix">
					<div data-idx="0" class="pointer col-md-6 cell">
					<p class="text-center">  <%= list.get(i).getDiaryDate() %>    </p>
					</div>
					
					<div data-idx="1" class="pointer col-md-6 cell">
					<p class="text-center"> <a href=".diary?cmd=view-page&diarynum=<%=list.get(i).getDiaryNum()%>"><%= list.get(i).getDiaryTitle() %></a>     </p>
					</div>
					</li>
					<%} %>
					
				</ul>
			</div>
		</div>
	</div>
	
	<script>
		$('#tableLikeList').listSorter({
			sortList : [ [ 0, 0 ] ]
		});
	</script>
</body>
</html>
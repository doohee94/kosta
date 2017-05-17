
<%@page import="mybatis.diary.model.Diary"%>
<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
String memberId = (String)session.getAttribute("id");
String coupleId = (String)session.getAttribute("cid");

Date date = new Date();
SimpleDateFormat today_f = new SimpleDateFormat("yyyy-MM-dd");
String today =today_f.format(date); 

List <Diary> list = (List <Diary>)request.getAttribute("param");
String d = (String)request.getAttribute("date");

if(d== null){
	d=today;
}

if(list.size() == 0){
	System.out.println("불러 올 일기가 없습니다. ");
}
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일기장리스트</title>

<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="/angel/diary/diary_person/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/angel/diary/diary_person/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css" />
<link href="/angel/diary/diary_person/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
h1{
display: inline-block;
}
#year{
margin-left: 250px;
}

.list-group-item clearfix{

width:200px;


}

#month, #year{
	height:50px;
	font-size: 20px;
	
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/angel/diary/diary_person/js/jquery.listSorter.js"></script>
<script type="text/javascript">

	$(function(){
		var selDate = '<%=d%>';
		if(selDate.split("/") == null){
			alert(selDate.split("-")[0]);
		}
		$('#search').click(function(){
			var year = $('#year option:selected').val();
			var month = $('#month option:selected').val();
			var date = year +"/"+month;
			var url = ".diary?cmd=list-research&date="+date;
			
			$(location).attr('href',url);
		});
	});
</script>
</head>
<body>

	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<h1>일기장</h1>
			<select  class="select" id= "year" tabindex="1">
            <option value="11">2011년</option>
            <option value="12">2012년</option>
            <option value="13">2013년</option>
            <option value="14">2014년</option>
            <option value="15">2015년</option>
            <option value="16">2016년</option>
            <option value="17">2017년</option>
            <option value="18">2018년</option>
            <option value="19">2019년</option>
            <option value="20">2020년</option>
            </select>
			<select name="month" id="month" >
					<option value="01">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
			<input type='button' value='검색' id = 'search'>
			
			
			<div id="tableLikeList" >
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
				
			<%if(list.size()>0){ %>
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
				<%}else{ %>
						<div>일기가 없습니다.</div>
				<%} %>
			</div>
		</div>
	</div>
	
	<a href=".diary?cmd=insert-page&id=<%=memberId%>"><img src="/angel/diary/diary_person/imgs/insert.png" id='insert' name="insert"></img></a>
	
	<script>
		$('#tableLikeList').listSorter({
			sortList : [ [ 0, 0 ] ]
		});
	</script>
</body>
</html>
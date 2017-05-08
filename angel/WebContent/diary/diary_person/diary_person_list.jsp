<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<% Date date = new Date();
SimpleDateFormat today_f = new SimpleDateFormat("yyyy-MM-dd");
String today =today_f.format(date); %>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/jquery.listSorter.js"></script>

</head>
<body>

	
	
	
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<h1>일기장</h1>
			<div id="tableLikeList" class="row panel panel-default">
				<div class="thead panel-heading clearfix">
					<div data-idx="0" class="col-md-6 hcell">
						<p class="text-center">
							<strong>일기제목</strong> <span class="glyphicon"></span>
						</p>
					</div>
					<div data-idx="1" class="col-md-6 hcell">
						<p class="text-center">
							<strong>작성일자</strong> <span class="glyphicon"></span>
						</p>
					</div>
				</div>
				<ul class="tbody cb list-group">
					<li class="list-group-item clearfix">
						<div data-idx="0" class="pointer col-md-6 cell">
							<p class="text-center">1992-01-01</p>
						</div>
						<div data-idx="1" class="pointer col-md-6 cell">
							<p class="text-center">정주완3</p>
						</div>
					</li>
					<li class="list-group-item clearfix">
						<div data-idx="0" class="pointer col-md-6 cell">
							<p class="text-center">1985-01-01</p>
						</div>
						<div data-idx="1" class="pointer col-md-6 cell">
							<p class="text-center">이도휘1</p>
						</div>
					</li>
					<li class="list-group-item clearfix">
						<div data-idx="0" class="pointer col-md-6 cell">
							<p class="text-center">2011-01-01</p>
						</div>
						<div data-idx="1" class="pointer col-md-6 cell">
							<p class="text-center">선민전4</p>
						</div>
					</li>
					<li class="list-group-item clearfix">
						<div data-idx="0" class="pointer col-md-6 cell">
							<p class="text-center">2017-09-01</p>
						</div>
						<div data-idx="1" class="pointer col-md-6 cell">
							<p class="text-center">박요원2</p>
						</div>
					</li>
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
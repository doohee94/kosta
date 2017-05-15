<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<% String projectName = "/practice"; %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/practice/plan/plan_person/assets/css/tab.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/practice/plan/plan_person/js/tab.js"></script>
<title>메뉴</title>
</head>
<body>
<ul class="acc-menu" id="accordionMenu1">
    <li data-extension="close">
        <div class="main-title"><span class="folder"> </span><a>Personal</a></div>
        <ul class="sub">
            <li><a href="<%= projectName %>/.diary?cmd=list-page">Diary</a></li>
            <li><a href="<%= projectName %>/plan?cmd=list-page">Plan</a></li>
            <li><a href="<%= projectName %>/cost?cmd=cost-list">Household Account</a></li>
            <li><a>Photo</a></li>
        </ul>
    </li>

    <li data-extension="close">
        <div class="main-title"><span class="folder"> </span><a>Setting</a></div>
        <ul class="sub">
            <li><a>Option</a></li>
            <li><a>Information</a></li>
        </ul>
    </li>
</ul>

</body>
</html>
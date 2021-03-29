<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>공 : 생</title>
<link rel="icon" href="resources/image/favicon.png">
<link rel="stylesheet" href="resources/myLib/mainCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function calcHeight() {
		//find the height of the internal page
		var the_height= document.getElementById('the_iframe').contentWindow.document.body.scrollHeight;
		//change the height of the iframe
		document.getElementById('the_iframe').height= the_height; top.location.href = "#";
	}
	if(top.location != window.location) top.location.reload();
	if(window.opner) {window.opner.top.location.reload(); self.close;}
</script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<div id="topmenu">
		<a href="home"><img src="resources/image/gstitle.png" id="logo"></a>
		<ul>
			<li><a href="" target="section">All Places</a>
			<li><a href="" target="section">Search</a>
			<li><a href="mypage" target="section">My Page</a>
			
			<c:if test="${empty loginID}"> 
			<li><a href="mloginf" target="section">Login</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			<a href="mjoinf" target="section">Join Us</a>
			</c:if>
			<c:if test="${loginID != null}"> 
			<li><a href="logout">Logout</a>
			</c:if>
		</ul>
	</div>
	
	<div id="section">
		<div class="scrollBlind">
		<iframe src="mainp" name="section" id="the_iframe" onload="calcHeight(),window.scrollTo(0,0)" height="1"></iframe>
		</div>
	</div>
	<!--  
	<div id="footer">
		<hr style="border:0.3px solid #d9d9d9; margin-top:30px;"><br>
		<a href="managerlogin" id="managerlogin">관리자 페이지 로그인</a><br>
		<p style="margin-bottom: 30px">COPYRIGHT (C) 2021 GONGSAENG RIGHTS RESERVED / DESIGNED BY HAEMIL YI</p>
		<br>   
	</div>
	-->
</body>
</html>
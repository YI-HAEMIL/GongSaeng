<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>공 : 생</title>
<link rel="icon" href="resources/image/favicon.png">
<link rel="stylesheet" href="resources/myLib/mainCSS.css" type="text/css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="topmenu">
		<img src="resources/image/gstitle.png" id="logo">
		<ul>
			<li><a href="" target="section">All Places</a>
			<li><a href="" target="section">Search</a>
			<li><a href="" target="section">My Page</a>
			<li><a href="" class="loginmenu">Login</a>&nbsp;&nbsp; | &nbsp;&nbsp; <a href="">Join Us</a>
			<!--<c:if test="${loginID = null}"></c:if>-->
			<c:if test="${loginID != null}"> 
			<li><a href="" class="loginmenu">Logout</a>
			</c:if>
		</ul>
	</div>
	
	<div id="main">
		<div id="circle"></div>
		<img src="resources/image/gstext.png" id="txt"><br>
		<img src="resources/image/gstext2.png" id="txt2">
	</div>
	<div id="vertical"></div>
	<div id="section">
		<p style="font-family:Roboto; margin-top:130px; font-size: larger; font-weight: bold">Recommendation</p>
		<p style="font-family:Spoqa Han Sans Neo Regular; margin-top:-10px;">오늘의 추천 공간, 이런 공간은 어때요?✨<p>
		<div class="placecard"><hr></div>
		<div class="placecard"><hr></div>
		<div class="placecard"><hr></div>
	</div>
	<div id="footer">
		
	</div>
</body>
</html>
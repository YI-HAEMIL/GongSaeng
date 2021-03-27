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
		<a href="home"><img src="resources/image/gstitle.png" id="logo"></a>
		<ul>
			<li><a href="" target="section">All Places</a>
			<li><a href="" target="section">Search</a>
			<li><a href="mypage" target="section">My Page</a>
			<li><a href="mloginf" target="section">Login</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			<a href="mjoinf" target="section">Join Us</a>
			<!--<c:if test="${loginID = null}"></c:if>-->
			<c:if test="${loginID != null}"> 
			<li><a href="logout">Logout</a>
			</c:if>
		</ul>
	</div>
	<div id="section">
		<iframe src="mainp" name="section"></iframe>
	</div>
	
	<div id="footer">
		<hr style="border:0.3px solid #d9d9d9"><br>
		<a href="managerlogin" id="managerlogin">관리자 페이지 로그인</a><br>
		<p style="margin-bottom: 30px">COPYRIGHT (C) 2021 GONGSAENG RIGHTS RESERVED / DESIGNED BY HAEMIL YI</p>
		<br>   
	</div>
</body>
</html>
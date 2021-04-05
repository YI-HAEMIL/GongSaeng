<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>공 : 생</title>
<link rel="icon" href="resources/image/favicon.png">
<link rel="stylesheet" href="resources/myLib/mainCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove.js"></script>
<script type="text/javascript">
	var isRun=false;
	function main(){
		if(isRun == true) { return; } isRun = true;
		$.ajax({
			type:'Get',
			url:'mainp',
		    success : function(resultpage){
		        $("#resultArea").html(resultpage);
		        isRun=false;
		    	},
			error:function(){
				alert("서버 오류 발생, 다시 시도해주세요.");
				}	
			});
	}
	window.onload=main();
</script>
</head>
<body>
<c:if test="${msg != null }">
	<script>alert('${msg}')</script>
</c:if>
	<div id="topmenu">
		<a href="home"><img src="resources/image/gstitle.png" id="logo"></a>
		<ul>
			<li><span id="">All Places</span>
			<li><span id="">Search</span>
			<li><span id="mypage">My Page</span>
			
			<c:if test="${empty loginID}"> 
			<li><span id="mloginbtn">Login</span>&nbsp;&nbsp; | &nbsp;&nbsp;
			<span id="mjoinf">Join Us</span>
			</c:if>
			<c:if test="${loginID != null}"> 
			<li><span id="logout">Logout</span>
			</c:if>
		</ul>
	</div>
	<div id=resultArea style="margin-top:82px;" onload="main()"></div>
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
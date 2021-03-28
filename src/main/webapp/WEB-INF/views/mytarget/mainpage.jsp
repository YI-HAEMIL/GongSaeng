<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="resources/myLib/mainCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<div id="main">
		<div id="circle"></div>
		<img src="resources/image/gstext.png" id="txt"><br>
		<img src="resources/image/gstext2.png" id="txt2">
	</div>
	<div id="vertical"></div>
	<p style="font-family:Roboto; margin-top:70px; font-size: larger; font-weight: bold">Recommendation</p>
	<p style="font-family:Spoqa Han Sans Neo Regular; margin-top:-10px;">오늘의 추천 공간, 이런 공간은 어때요?✨<p>
	<div class="placecard"><hr class="cardline"></div>
	<div class="placecard"><hr class="cardline"></div>
	<div class="placecard"><hr class="cardline"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="resources/myLib/targetCSS.css?ver=1.0" type="text/css">
<link rel="stylesheet" href="resources/myLib/placeCSS.css" type="text/css">
<link rel="stylesheet" href="resources/slick/slick.css" type="text/css">
<link rel="stylesheet" href="resources/slick/slick-theme.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/slick/slick.min.js"></script>
<script src="resources/gscript/pageMove3.js"></script>
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
	
	<div class="p_cardPage">
		<div class="p_cardList">
			<c:forEach var="li" items="${pvoList}" varStatus="status">
				<div class="placecard" id="${li.bizm_id}" onclick="placemodal(id)">
					<c:forEach var="img" items="${thumbList}" varStatus="st">
						<c:if test="${status.index eq st.index}">
							<img src="${img}" class="cardimg">
						</c:if>
					</c:forEach>
					<table class="cardinfo">
						<tr>
							<th>${li.place_nm}</th>
						</tr>
						<tr>
							<td colspan="2">${li.place_price}원/시간</td>
						</tr>
						<tr>
							<td>기본 ${li.place_max}명</td>
							<td style="padding-left: 0px;">리뷰</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>
	
	<!-- 모달창(장소 디테일 페이지) -->
	<div class="modal">
		<div class="modal_cArea">
		</div>
	</div>
</body>
</html>
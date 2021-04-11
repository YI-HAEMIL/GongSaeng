<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="resources/myLib/placeCSS.css?ver=2.1" type="text/css">
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
	<div id="keyword">
		<span id="keywordtxt">
			<c:choose>
					<c:when test="${keyword eq 'A'}">서울 북부</c:when>
					<c:when test="${keyword eq 'B'}">서울 남부</c:when>
					<c:when test="${keyword eq 'C'}">서울 서부</c:when>
					<c:when test="${keyword eq 'D'}">서울 동부</c:when>
					<c:when test="${keyword eq 'E'}">수도권</c:when>
					<c:otherwise>${keyword}</c:otherwise>
			</c:choose>
		</span>
	</div>
	<br>
	<!-- 장소 지역검색 결과 리스트 출력 -->
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
	
	<!-- 모달창(장소 디테일 페이지) -->
	<div class="modal">
		<div class="modal_cArea">
		</div>
	</div>
	
</body>
</html>
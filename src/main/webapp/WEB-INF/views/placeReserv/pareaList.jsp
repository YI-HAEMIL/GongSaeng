<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="resources/myLib/placeCSS.css?ver=1.6" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove3.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<!-- 상단 카테고리 메뉴바 (미완) -->
	<div id="main_category_all">
		<div id="main_category_txtbox">
			<div style="flex-direction: row">
				<p class="title">
					<c:forEach var="t" items="${title}">
						<c:out value="${t}" />
					</c:forEach>
				</p>
				<br>
				<div>
					
				</div>
			</div>
		</div>
	</div>
	
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
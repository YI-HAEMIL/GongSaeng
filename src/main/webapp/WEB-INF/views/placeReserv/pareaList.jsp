<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="resources/myLib/placeCSS.css?ver=1.3" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove3.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
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
	<div class="p_cardPage">
		<div class="p_cardList">
			<c:forEach begin="1" end="${pvoSize}" varStatus="status">
				<div class="placecard">
				<c:forEach var="img" items="${thumbList}" varStatus="st">
					<c:if test="${status.index-1 eq st.index}">
					<img src="${img}" class="cardimg">
					</c:if>
				</c:forEach>
				<table class="cardinfo">
				<c:forEach var="li" items="${pvoList}" varStatus="st">
					<c:if test="${status.index-1 eq st.index}">
					<tr>
						<th>${li.place_nm}</th>
						<td style="color:#fff; font-size:x-small" id="bid" onclick="placeOne(innerText)">
							${li.bizm_id}
						</td>
					</tr>
					<tr>
						<td colspan="2">${li.place_price}원 / 시간</td>
					</tr>
					<tr>
						<td>기본 ${li.place_max}명</td>
						<td style="padding-left:0px;">리뷰</td>
					</tr>
					</c:if>
				</c:forEach>
				</table>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="modal">
		<div class="modal_content">
			<br>
			<div id="imgArea">
				
			</div>
			<br>
			<span>장소 소개</span>
			<hr class="modal_hr">
			<pre style="font-size:smaller;">${ppVO.place_con}</pre>
			
			<br>
			<span>장소 이용 규칙</span>
			<hr class="modal_hr">
			<pre style="font-size:smaller;">${ppVO.place_rule}</pre>
		</div>
		<div class="modal_content2">
			<span>
				<c:choose>
					<c:when test="${parea[0]eq'A'}">서울 북부</c:when>
					<c:when test="${parea[0]eq'B'}">서울 남부</c:when>
					<c:when test="${parea[0]eq'C'}">서울 서부</c:when>
					<c:when test="${parea[0]eq'D'}">서울 동부</c:when>
					<c:otherwise>수도권</c:otherwise>
				</c:choose>
				 &#183; ${parea[1]}</span><br>
			<span>${psize[0]}평 &#183; ${psize[1]}㎡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 ${ppVO.place_max}명</span><br>
			<span>${ppVO.place_nm}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ppVO.bizm_id}</span><br>
		</div>
	</div>
</body>
</html>
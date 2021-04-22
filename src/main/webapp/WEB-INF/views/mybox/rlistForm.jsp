<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<br><p>예약 내역을 확인하는 공간입니다.</p>
	
	<span>전체 예약 내역</span>
	<hr class="reserv_hr">
	<br>
	<table>
		<tr>
			<td>예약 번호</td>
			<td>대관 장소번호</td>
			<td>대관 날짜</td>
			<td>대관 시간</td>
		</tr>
		<c:forEach var="li" items="${rvoList}">
			<tr>
				<td>${li.reserv_id}</td>
				<td>${li.place_id}</td>
				<td>${li.use_date}</td>
				<td>${li.use_starttime}&nbsp;-&nbsp;${li.use_endtime}</td>
			<tr>
		</c:forEach>
	</table>
	<br>

	<span>다가오는 예약 내역</span>
	<hr class="reserv_hr">
	<br>
	<table>
		<tr>
			<td>예약 번호</td>
			<td>대관 장소번호</td>
			<td>대관 날짜</td>
			<td>대관 시간</td>
		</tr>
		<c:forEach var="li" items="${rvoList}">
			<c:if test="${0 eq li.confirm}">
				<tr>
					<td>${li.reserv_id}</td>
					<td>${li.place_id}</td>
					<td>${li.use_date}</td>
					<td>${li.use_starttime}&nbsp;-&nbsp;${li.use_endtime}</td>
				<tr>
			</c:if>
		</c:forEach>
	</table>
	<br>

	<span>지난 예약 내역</span>
	<hr class="reserv_hr">
	<br>
	<table>
		<tr>
			<td>예약 번호</td>
			<td>대관 장소번호</td>
			<td>대관 날짜</td>
			<td>대관 시간</td>
		</tr>
		<c:forEach var="li" items="${rvoList}">
			<c:if test="${li.confirm > 0 }">
				<tr>
					<td>${li.reserv_id}</td>
					<td>${li.place_id}</td>
					<td>${li.use_date}</td>
					<td>${li.use_starttime}&nbsp;-&nbsp;${li.use_endtime}</td>
				<tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>
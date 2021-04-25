<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS2.css?ver=1.1"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/reservUpload.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
<br><br>
	<span>전체 예약 내역</span>
	<hr class="reserv_hr">
	<br>
	<table class="reserview">
		<tr>
			<td class="rth">예약 번호</td>
			<td class="rth">대관 장소번호</td>
			<td class="rth">대관 날짜</td>
			<td class="rth">대관 시간</td>
		</tr>
		<c:forEach var="li" items="${rvoList}">
			<tr>
				<td class="rtd" id="rid" onclick="rdetail($('#rid').innerText)">${li.reserv_id}</td>
				<td class="rtd">${li.place_id}</td>
				<td class="rtd">${li.use_date}</td>
				<td class="rtd">${li.use_starttime}&nbsp;-&nbsp;${li.use_endtime}</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align:left;" class="rdetail">
					<span id="c${li.reserv_id}" class="content"></span>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br><br>

	<span>다가오는 예약 내역</span>
	<hr class="reserv_hr">
	<br>
	<table class="reserview">
		<tr>
			<td class="rth">예약 번호</td>
			<td class="rth">대관 장소번호</td>
			<td class="rth">대관 날짜</td>
			<td class="rth">대관 시간</td>
		</tr>
		<c:forEach var="li" items="${rvoList}">
		<c:if test="${0 eq li.confirm}">
				<tr>
					<td class="rtd">${li.reserv_id}</td>
					<td class="rtd">${li.place_id}</td>
					<td class="rtd">${li.use_date}</td>
					<td class="rtd">${li.use_starttime}&nbsp;-&nbsp;${li.use_endtime}</td>
				</tr>
				<tr>
				<td colspan="4" style="text-align:left;" class="rdetail">
					<span class="content"></span>
				</td>
			</tr>
		</c:if>
		</c:forEach>
	</table>
	<br><br>

	<span>지난 예약 내역</span>
	<hr class="reserv_hr">
	<br>
	<table class="reserview">
		<tr>
			<td class="rth">예약 번호</td>
			<td class="rth">대관 장소번호</td>
			<td class="rth">대관 날짜</td>
			<td class="rth">대관 시간</td>
		</tr>
		<c:forEach var="li" items="${rvoList}">
		<c:if test="${li.confirm > 0 }">
				<tr>
					<td class="rtd">${li.reserv_id}</td>
					<td class="rtd">${li.place_id}</td>
					<td class="rtd">${li.use_date}</td>
					<td class="rtd">${li.use_starttime}&nbsp;-&nbsp;${li.use_endtime}</td>
				</tr>
				<tr>
				<td colspan="4" style="text-align:left;" class="rdetail">
					<span class="content"></span>
				</td>
			</tr>
		</c:if>
		</c:forEach>
	</table>
	<br><br>
</body>
</html>
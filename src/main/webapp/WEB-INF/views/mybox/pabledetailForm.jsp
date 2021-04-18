<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usable Timetable</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<link rel="stylesheet" href="resources/datepicker/datepicker.min.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/placeUpload.js"></script>
<script src="resources/datepicker/datepicker.min.js"></script>
<script src="resources/datepicker/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<table id="abletimet">
		<tr>
			<td class="datetd">날짜</td>
			<td>시작 시간</td>
			<td>종료 시간</td>
			<td></td>
		</tr>
		<c:forEach var="li" items="${avoList}">
			<tr>
				<td class="datetd">${li.able_date}</td>
				<td><input type="hidden" id="starttime" value="${li.able_starttime}"> ${li.able_starttime}</td>
				<td><input type="hidden" id="endtime" value="${li.able_endtime}">${li.able_endtime}</td>
				<td><span id="adelete-submit"><button id="abledate" value="${li.able_date}">DELETE</button></span>
			</tr>
		</c:forEach>
	</table>
	<br>
</body>
</html>
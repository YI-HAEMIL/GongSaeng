<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<link rel="stylesheet" href="resources/datepicker/datepicker.min.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/datepicker/datepicker.min.js"></script>
<script src="resources/datepicker/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<table id="abletimet">
		<tr>
			<th></th>
			<th class="datetd">날짜</th>
			<th>시작 시간</th>
			<th>종료 시간</th>
		</tr>
		<c:forEach var="li" items="${avoList}">
			<tr>
				<td><input type="checkbox" id="ableckbox" name="snum" value="${li.able_date}">
				<td class="datetd">${li.able_date}</td>
				<td><input type="hidden" id="starttime" value="${li.able_starttime}"> ${li.able_starttime}</td>
				<td><input type="hidden" id="endtime" value="${li.able_endtime}">${li.able_endtime}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	
	<br>
</body>
</html>
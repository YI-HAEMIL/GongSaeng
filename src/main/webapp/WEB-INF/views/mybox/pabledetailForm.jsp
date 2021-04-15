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
	<table id="abletimet">
		<tr>
			<th></th>
			<th>날짜</th>
			<th>시작 시간</th>
			<th>종료 시간</th>
		</tr>
		<c:forEach var="li" items="${avoList}">
			<tr>
				<td><input type="checkbox" name="snum" value="${li.able_date}">
				<td>${li.able_date}</td>
				<td>${li.able_starttime}</td>
				<td>${li.able_endtime}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
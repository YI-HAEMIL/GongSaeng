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
	<br><p>장소 이용 가능한 시간을 업로드하는 곳입니다.</p>
	<br>
    <div>
    	<input type="text"
		       id="datepicker"
		       data-multiple-dates-separator=", "
		       data-position='bottom left'
		       placeholder="날짜를 선택해주세요(다중선택가능)"/>
		<input type="text" id=""
			   placeholder="시간을 선택해주세요"/>
    </div><br>
    <script>
    $("#datepicker").datepicker({
    	language: 'ko',
    	multipleDates: true
    }); 
    </script>
    <div id="ableResult">
    </div>
</body>
</html>
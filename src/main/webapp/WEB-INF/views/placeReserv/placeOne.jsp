<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css?ver=1.3" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
<div>
	<div>
		<span>${area[0]} &#183; ${area[1]}</span><br>
		<span>${size[0]}평 &#183; ${size[1]}㎡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 ${pVO.place_max}명</span><br>
		<span>${pVO.place_nm}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${pVO.bizm_id}</span><br>
		<div id="imgArea">
				
		</div>
		<span>장소 소개</span>
		<hr>
		<textarea>${pVO.place_con}</textarea>
			
		<br>
		<span>장소 이용 규칙</span>
		<hr>
		<textarea>${pVO.place_rule}</textarea>
	</div>
</div>
</body>
</html>
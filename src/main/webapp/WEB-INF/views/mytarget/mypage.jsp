<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css?ver=1.0" type="text/css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
	$('#mybox', parent.document).get(0).contentDocument.location.reload(); 
</script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
<div id="tapmenu">
	<ul>
		<c:if test="${empty loginID}">
			<script>alert('로그인이 필요한 서비스입니다')</script>
			<script>parent.document.location.reload()</script>
		</c:if>
		<c:if test="${group eq 'basic'}">
		<li><a href="minfo" class="thar" target="mypagebox">개인정보수정</a>  
		<li><a href="" class="thar" target="mypagebox">예약 확인</a> 
		<li><a href="" class="thar" target="mypagebox">내가 쓴 글</a>
		<li><a href="" class="thar" target="mypagebox">북마크 관리</a>
		</c:if>
		<c:if test="${group eq 'business'}">
		<li><a href="binfo" class="thar" target="mypagebox">개인정보수정</a>  
		<li><a href="" class="thar" target="mypagebox">예약 확인</a> 
		<li><a href="" class="thar" target="mypagebox">장소 등록 및 수정</a>
		</c:if>
	</ul>
</div>

<div id="mypagebox">
	<c:if test="${group eq 'basic'}">
	<iframe src="minfo" name="mypagebox" id="mybox"></iframe>
	</c:if>
	<c:if test="${group eq 'business'}">
	<iframe src="binfo" name="mypagebox"></iframe>
	</c:if>
</div>
</body>
</html>
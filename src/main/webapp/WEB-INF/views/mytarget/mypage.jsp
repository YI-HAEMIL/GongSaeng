<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script>
	function calcHeight() {
		//find the height of the internal page
		var the_height= document.getElementById('mybox').contentWindow.document.body.scrollHeight;
		//change the height of the iframe
		document.getElementById('mybox').height= the_height;
	}
	
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
		<li><a href="pinsertf" class="thar" target="mypagebox">장소 등록</a>
		<li><a href="pdetail" class="thar" target="mypagebox">장소 수정 및 삭제</a>
		</c:if>
	</ul>
</div>

<div id="mypagebox" onload="calcHeight()">
	<c:if test="${group eq 'basic'}">
	<iframe src="minfo" name="mypagebox" id="mybox" onload="calcHeight()"></iframe>
	</c:if>
	<c:if test="${group eq 'business'}">
	<iframe src="binfo" name="mypagebox" id="mybox" onload="calcHeight()"></iframe>
	</c:if>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css?ver=1.7" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove2.js"></script>
<script>
$(function(){
	var menu = document.getElementsByClassName('thar');
	function handleClick(event){
		console.log(event.target);
		console.log(event.target.classList);
		
		if(event.target.classList[1] === 'clicked') {
			event.target.classList.remove("clicked");
		} else {
			for (var i = 0; i < menu.length; i++) {
				menu[i].classList.remove("clicked");
			}
			event.target.classList.add("clicked");
		}
	}
	function init() {
		for (var i = 0; i < menu.length; i++) {
	        menu[i].addEventListener("click", handleClick);
		}
	}
	init();
});
</script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
<div id="tapmenu">
	<ul>
		<c:if test="${group eq 'basic'}">
		<li><span id="minfobtn"><a class="thar">개인정보수정</a></span>
		<li><span id=""><a class="thar">예약 확인</a></span> 
		<li><span><a class="thar">내가 쓴 글</a></span>
		<li><span><a class="thar">북마크 관리</a></span>
		</c:if>
		<c:if test="${group eq 'business'}">
		<li><span id="binfobtn"><a class="thar">개인정보수정</a></span>  
		<li><span id=""><a class="thar">예약 확인</a></span>  
		<li><span id="pinsertbtn"><a class="thar">장소 등록</a></span>  
		<li><span id="pdetailbtn"><a class="thar">장소 수정 및 삭제</a></span>  
		<li><span id="pablebtn"><a class="thar">장소 이용 시간</a></span>  
		</c:if>
	</ul>
</div>

<div id="mypagebox">
	<c:if test="${group eq 'basic'}"><script>onload=minfo()</script></c:if>
	<c:if test="${group eq 'business'}"><script>onload=binfo();</script></c:if>
</div>
<br>
</body>
</html>
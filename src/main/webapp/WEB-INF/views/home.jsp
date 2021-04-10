<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>공 : 생</title>
<link rel="icon" href="resources/image/favicon.png">
<link rel="stylesheet" href="resources/myLib/mainCSS.css?ver=1.3" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70479aea1165b5f91675f4fc638a746e&libraries=services"></script>
<script type="text/javascript">
	var isRun=false;
	function main(){
		if(isRun == true) { return; } isRun = true;
		$.ajax({
			type:'Get',
			url:'mainp',
		    success : function(resultpage){
		        $("#resultArea").html(resultpage);
		        isRun=false;
		    	},
			error:function(){
				alert("서버 오류 발생, 다시 시도해주세요.");
				}	
			});
	}
	window.onload=main();
</script>
</head>
<body>
<c:if test="${msg != null }">
	<script>alert('${msg}')</script>
</c:if>
	<div id="topmenu">
		<a href="home"><img src="resources/image/gstitle.png" id="logo"></a>
		<ul>
			<li><span id="toggle_all">All Places</span>
			<li><span id="toggle_search">Search</span>
			<li><span id="mypage">My Page</span>
			
			<c:if test="${empty loginID}"> 
			<li><span id="mloginbtn">Login</span>&nbsp;&nbsp; | &nbsp;&nbsp;
			<span id="mjoinf">Join Us</span>
			</c:if>
			<c:if test="${loginID != null}"> 
			<li><span id="logout">Logout</span>
			</c:if>
		</ul>
		
		<div id="category_all" onclick="togglemenu()">
	        <div id="category_back">
	        	<div id="category_txtbox">
	        		<div style="flex-direction: column">
			       		<p class="title" onclick="menuMove(innerText)"><c:out value="${title[0]}" /></p>
			       		<c:forEach var="s" items="${north}">
			       			<div class="subtitle_btn">
				        	<p class="subtitle" onclick="submenuMove(innerText)"><c:out value="${s}" /></p>
				        	</div>
			            </c:forEach>
		            </div>
	        		<div style="flex-direction: column">
			       		<p class="title" onclick="menuMove(innerText)"><c:out value="${title[1]}" /></p>
			       		<c:forEach var="s" items="${south}">
			       			<div class="subtitle_btn">
				        	<p class="subtitle" onclick="submenuMove(innerText)"><c:out value="${s}" /></p>
				        	</div>
			            </c:forEach>
		            </div>
	        		<div style="flex-direction: column">
			       		<p class="title" onclick="menuMove(innerText)"><c:out value="${title[2]}" /></p>
			       		<c:forEach var="s" items="${west}">
				            <div class="subtitle_btn">
				        	<p class="subtitle" onclick="submenuMove(innerText)"><c:out value="${s}" /></p>
				        	</div>
			            </c:forEach>
		            </div>
	        		<div style="flex-direction: column">
			       		<p class="title" onclick="menuMove(innerText)"><c:out value="${title[3]}" /></p>
			       		<c:forEach var="s" items="${east}">
				            <div class="subtitle_btn">
				        	<p class="subtitle" onclick="submenuMove(innerText)"><c:out value="${s}" /></p>
				        	</div>
			            </c:forEach>
		            </div>
	        		<div style="flex-direction: column">
			       		<p class="title" onclick="menuMove(innerText)"><c:out value="${title[4]}" /></p>
			       		<c:forEach var="s" items="${carea}">
				            <div class="subtitle_btn">
				        	<p class="subtitle" onclick="submenuMove(innerText)"><c:out value="${s}" /></p>
				        	</div>
			            </c:forEach>
		            </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div id="resultArea" style="margin-top:82px;" onload="main()"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<link rel="stylesheet" href="resources/myLib/mainCSS.css" type="text/css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:if test="${msg != null }">
	<script>alert('${msg}')</script>
</c:if>
	<br><br>
	LOGIN
	<hr width=100px><br><br>
	<div id="loginbox">
        <h4>Business Member Login</h4>
        <span>가입시 입력하신 아이디와 비밀번호로 로그인이 가능합니다.</span><br><br>
		<form action="blogin" method="post">
			<table id="logint">
				<tr>
					<td><input type="text" name="id" id="id" placeholder="ID"><br>
					<span id="iMessage" class="message"></span></td>
					<td><input type="submit" class="button" value="LOGIN" onclick="return inCheck()"></td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password" placeholder="PASSWORD"><br>
						<span id="pMessage" class="message"></span></td>
					<td><input type="reset" class="button" value="RESET"></td>
				</tr>
			</table>				
		</form>
		<br>
			<div style="display:inline-block; background-color:#f0f0f0; width:500px; height:85px;">
				<br>
				<span>일반 회원이시라면, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<a href="mloginf" target="section">일반 회원 로그인</a><br>
				<span>비즈니스 회원 등록을 원하신다면, 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<a href="bjoinf" target="section">비즈니스 회원 등록</a>
			</div>
		<br><br>
	</div>
</body>
</html>
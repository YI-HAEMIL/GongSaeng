<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
<link rel="stylesheet" href="resources/myLib/joinCSS.css" type="text/css">
</head>
<body>
<c:if test="${msg != null}">
	<script>alert('${msg}')</script>
</c:if>
	<br>
	BUSINESS MEMBER SIGN IN
	<hr width=220px><br><br>
	<div id="joinbox">
	<form action="binsert" method="post" id="myForm" enctype="multipart/form-data">
		<table id="joint">
			<tr>
				<td class="bth">I D</td>
				<td>
					<input type="text" name="bizm_id" id="bizm_id">&nbsp;&nbsp;
					<input type="button" value="ID중복확인" id="idDup" class="button" onclick="idDupCheck()"><br>
					<span id=iMessage class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">PASSWORD</td>
				<td><input type="password" name="bizm_pwd" id="bizm_pwd" size="10"><br>
					<span id="pMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">PW CONFIRM</td>
				<td><input type="password" name="pwcheck" id="pwcheck" size="10"><br>
					<span id="ppMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">NAME</td>
				<td><input type="text" name="bizm_nm" id="bizm_nm" value="" size="10"><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">PHONE NUMBER</td>
				<td><input type="text" name="bizm_pnum" id="bizm_pnum" value="" size="10" placeholder="- 없이 11자리 입력"><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">EMAIL</td>
				<td><input type="text" name="bizm_email" id="bizm_email" placeholder="member@gongsaeng.com"><br>
					<span id="bMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">LICENCE NUMBER</td>
				<td><input type="text" name="bizm_licnum" id="bizm_licnum" placeholder=""><br>
					<span id="bMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="button" value="SUBMIT" disabled onclick="return inCheck()">&nbsp;&nbsp;
					<input type="reset"  class="button" value="RESET">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<br>
	<div class="txtbox">
		<br>
		<span>일반회원으로 가입하고자 한다면, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<a href="mjoinf" target="section">일반 회원 회원가입</a><br>
		<span>비즈니스 회원 등록이 되어 있다면,
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<a href="bloginf" target="section">비즈니스 회원 로그인</a>
	</div>
</body>
</html>
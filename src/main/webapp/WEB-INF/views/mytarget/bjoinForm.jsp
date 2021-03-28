<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
<link rel="stylesheet" href="resources/myLib/joinCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/gsCheck.js"></script>
<script>
	var iCheck=false;
	var pCheck=false;
	var p2Check=false;
	var nCheck=false;
	var pnCheck=false;
	var eCheck=false;
	var lCheck=false;
	
	$(function(){
		$('#id').focus();
		$('#id').focusout(function(){
			iCheck=idCheck();
		}); //id
		
		$('#password').focusout(function(){
			pCheck=pwCheck();
		}); //password
		
		$('#password2').focusout(function(){
			p2Check=pw2Check();
		}); //password2
		
		$('#name').focusout(function(){
			nCheck=nmCheck();
		}); //name
		
		$('#phonenum').focusout(function(){
			pnCheck=pnumCheck();
		}); //phonenum
		
		$('#email').focusout(function(){
			eCheck=emCheck();
		}); //email
		
		$('#licensenum').focusout(function(){
			lCheck=lnCheck();
		})
		
	}); //ready
	
	function validate(){
		if(iCheck==false){
			$('#iMessage').html('ID를 확인해주세요');
			$('#id').focus();
		}
		if(pCheck==false){
			$('#pMessage').html('비밀번호를 확인해주세요');
			$('#password').focus();
		}
		if(p2Check==false){
			$('#p2Message').html('비밀번호를 확인해주세요');
			$('#password2').focus();
		}
		if(nCheck==false){
			$('#nMessage').html('이름을 확인해주세요');
			$('#name').focus();
		}
		if(pnCheck==false){
			$('#pnMessage').html('핸드폰 번호를 확인해주세요');
			$('#phonenum').focus();
		}
		if(eCheck==false){
			$('#eMessage').html('이메일을 확인해주세요');
			$('#email').focus();
		}
		if(lCheck==false){
			$('#lMessage').html('사업자등록번호를 확인해주세요');
			$('#licensenum').focus();
		}
		if(iCheck==true && pCheck==true && p2Check==true
			&& nCheck==true && pnCheck==true && eCheck==true && lCheck==true) {
			alert('입력 성공, 전송하시겠습니까?');
		} else{
			return false;
		}
	} //validate

</script>
</head>
<body>
<c:if test="${msg != null}">
	<script>alert('${msg}')</script>
</c:if>
	<br>
	BUSINESS MEMBER SIGN IN
	<hr width=220px><br><br>
	<div id="joinbox">
	<form action="binsert" method="post" id="myForm" onsubmit="return validate();">
		<table id="joint">
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;I D</td>
				<td>
					<input type="text" name="bizm_id" id="id">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="ID중복확인" id="idDup" class="button" onclick="idDupCheck()">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="iMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD</td>
				<td><input type="password" name="bizm_pwd" id="password" placeholder="특수문자 포함 6-20자리 입력">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="pMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;PW CONFIRM</td>
				<td><input type="password" name="pwcheck" id="password2">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="p2Message" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;NAME</td>
				<td><input type="text" name="bizm_nm" id="name">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;PHONE NUMBER</td>
				<td><input type="text" name="bizm_pnum" id="phonenum" placeholder="- (하이픈) 없이 11자리 입력">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="pnMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;EMAIL</td>
				<td><input type="text" name="bizm_email" id="email" placeholder="member@gongsaeng.com">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="eMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;LICENCE NUMBER</td>
				<td><input type="text" name="bizm_licnum" id="licensenum" placeholder="- (하이픈) 없이 10자리 입력">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="lMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center; border-bottom:1px solid #fff;">
					<input type="submit" class="button" value="SUBMIT">&nbsp;&nbsp;
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
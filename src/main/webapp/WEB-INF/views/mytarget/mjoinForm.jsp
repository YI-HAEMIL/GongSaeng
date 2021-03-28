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
		if(iCheck==true && pCheck==true && p2Check==true
			&& nCheck==true && pnCheck==true && eCheck==true) {
			alert('입력 성공, 전송하시겠습니까?');
		} else{
			return false;
		}
	} //validate
	
	
	/* 모달창(미완)
	function offClick() {
		document.querySelector('.modal_wrap').style.display = 'none';
		document.querySelector('.black_bg').style.display = 'none';
	}

	// ID 중복 확인하기 
	function idDupCheck() {
		if (iCheck == false) {
			iCheck = idCheck();
		} else {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}
	} //idDupCheck
	*/
</script>
</head>
<body>
<c:if test="${msg != null}">
	<script>alert('${msg}')</script>
</c:if>
	<br>
	MEMBER SIGN IN
	<hr width=150px><br><br>
	<div id="joinbox">
	<form action="minsert" method="post" id="myForm" onsubmit="return validate();">
		<table id="joint">
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;I D</td>
				<td>
					<input type="text" name="basicm_id" id="id">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="ID중복확인" id="idDup" class="button" onclick="idDupCheck()">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="iMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD</td>
				<td><input type="password" name="basicm_pwd" id="password" placeholder="특수문자 포함 6-20자리 입력">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="pMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;PW CONFIRM</td>
				<td><input type="password" id="password2">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="p2Message" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;NAME</td>
				<td><input type="text" name="basicm_nm" id="name">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;PHONE NUMBER</td>
				<td><input type="text" name="basicm_pnum" id="phonenum" placeholder="- (하이픈) 없이 11자리 입력">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="pnMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;EMAIL</td>
				<td><input type="text" name="basicm_email" id="email" placeholder="member@gongsaeng.com">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="eMessage" class="message"></span>
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
		<span>비즈니스 회원으로 가입하고자 한다면, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<a href="bjoinf" target="section">비즈니스 회원 회원가입</a><br>
		<span>회원가입이 되어 있다면,
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<a href="mloginf" target="section">일반 회원 로그인</a>
	</div>
	
	<!--
	<div class="back_bg"></div>
	<div class="modal_wrap">
		<div class="modal_close" onclick="return offClick()"><a href="#">close</a></div>
	    <div>
	    	<script>
			function idOK() {
				opener.$('#id').val('${newID}');
				opener.document.getElementById('submit').disabled='';
				opener.document.getElementById('idDup').disabled='disabled';
				
				// JQ 방식으로 속성에 접근
				// => attr , prop 비교
				// => attr()는 HTML의 속성(Attribute) ,기능, 입력된 값을 취급 
				// => prop()는 JavaScript의 프로퍼티(Property), 실제값, property가 가지는 본연의 값
				//opener.$('#id').attr('readonly','readonly');
				opener.document.$('#id').prop('readonly',true);
				opener.document.$('#password').focus();
				document.querySelector('.modal_wrap').style.display ='none';
		        document.querySelector('.black_bg').style.display ='none';
			}
			</script>
			
	        <span>ID 중복확인</span>
	        <form action="idCheck" method="post">
		        <input type="text" id="id" name="id" value="">
				<input type="submit" class="button" value="ID중복확인" onclick="return idCheck()">
				<span id="iMessage" class="message"></span>
			</form>
			<div id="msgBlock">
				<c:if test="${idUse=='T'}">
					${newID} 는 사용 가능한 아이디입니다.
					<input type="button" class="button" value="idOK" onclick="idOK()">
				</c:if>
				<c:if test="${idUse=='F'}">
					${newID} 는 이미 사용중인 아이디입니다.<br>
					다시 입력해주세요.
					<script>
						$('#id').focus();
						opener.document.getElementById('id').value='';
					</script>
				</c:if>
			</div>
	    </div>
	</div>
	-->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
<link rel="stylesheet" href="resources/myLib/joinCSS.css?ver=1.2" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/gsCheck.js"></script>
<script>
	var isRun=false;
	
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
			return true;
		} else{
			return false;
		}
	} //validate
	
	/* JSON으로 ID 중복확인 */
	$(function(){	
		$('#idDup').click(function(){
			$.ajax({
				type:'Get',
				url:'midCheck',
				data:{
					basicm_id:$('#id').val()
				},
				success:function(resultData){
					if(resultData.idUse=='T') {
					$('#iMessage').html('사용 가능한 아이디입니다');
					$('#id').prop('readonly',true);
					$('#submit').prop('disabled',false);
					$('#idDup').prop('disabled',true);
					$('#password').focus();
					} else {
						$('#iMessage').html('이미 사용중인 아이디입니다');
						$('#id').prop('value','');
						$('#id').focus();
					}
				},
				error:function(){
					alert('오류가 발생하였습니다. 다시 시도해주세요');
					$('#resultArea').load('mjoinf');
				}
			}); //ajax
		}); //idDup click
	}); //ready
	
	/* submit */
	$(document).on('click', '#minsert', function() {
		if(validate()==false){
			return;
		} else {
			if(isRun == true) { return; } isRun = true;
			$.ajax({
				type:'Post',
				url:'minsert',
				data:{
					basicm_id:$('#id').val(),
					basicm_pwd:$('#password').val(),
					basicm_nm:$('#name').val(),
					basicm_pnum:$('#phonenum').val(),
					basicm_email:$('#email').val()
				},
				success:function(resultData){
					if(resultData.joinSuccess=='T') {
						alert(resultData.msg);
						$('#resultArea').load('mloginf');
					} else {
						alert(resultData.msg);
						$('#resultArea').load('mjoinf');
					}
					isRun=false;
				},
				error:function(){
					alert("서버 오류 발생, 다시 시도해주세요.");
					$('#resultArea').load('mjoinf');
				}	
			}); //ajax
		}
	});
	
	$(document).on('click', '#bjoinf', function() {
		if(isRun == true) { return; } isRun = true;
		$.ajax({
			type:'Get',
			url:'bjoinf',
			success:function(resultPage){
				$('#resultArea').html(resultPage);
				isRun=false;
				},
			error:function(){
				alert("오류 발생, 다시 시도해주세요.");
				$('#resultArea').load('mjoinf');
			}	
		}); //ajax
	});
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
	<form action="minsert" method="post">
		<table id="joint">
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;I D</td>
				<td>
					<input type="text" name="basicm_id" id="id">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="ID중복확인" id="idDup" class="button">&nbsp;&nbsp;&nbsp;&nbsp;
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
					<span id="minsert"><input type="button" class="button" value="SUBMIT"
							id="submit" disabled='disabled'></span>&nbsp;&nbsp;
					<input type="reset"  class="button" value="RESET">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<br>
	<div class="txtbox">
		<br>
		<span>시간과 돈을 들여 차근차근 꾸민 공간을 
		<br>다른 사람과 공유하고 새로운 추억을 쌓을 수 있는 기회.<br></span>
		<span id="bjoinf" style="text-decoration: underline; color: blue; cursor: pointer;">비즈니스 회원으로 가입</span>
		<span>해보세요. 다양한 혜택이 있습니다.</span><br>
	</div>
</body>
</html>
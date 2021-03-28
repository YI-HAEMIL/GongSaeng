<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/gsCheck.js"></script>
<script>
	var pCheck=false;
	var p2Check=false;
	var nCheck=false;
	var pnCheck=false;
	var eCheck=false;
	
	$(function(){
		$('#password').focus();
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
		if(pCheck==true && p2Check==true && nCheck==true && pnCheck==true && eCheck==true) {
			alert('입력 성공, 전송하시겠습니까?');
		} else{
			return false;
		}
	} //validate

</script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<br><p>회원정보를 확인 및 수정하는 공간입니다.</p>
	<form action="mupdate" method="post" onsubmit="return validate();">
	<table id="updatet">
		<tr>
			<td style="text-align:left; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;기본 정보</td>
			<td style="text-align:right; font-weight:bold;">*필수입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td class="th">I D *</td>
			<td>
				<input type="text" name="basicm_id" id="id" value="${mVO.basicm_id}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="th">PASSWORD *</td>
			<td>
				<input type="password" name="basicm_pwd" id="password" value="${mVO.basicm_pwd}"><br>
				<span id="pMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PW CONFIRM *</td>
			<td>
				<input type="password" name="pwcheck" id="password2" value="${mVO.basicm_pwd}"><br>
				<span id="p2Message" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">NAME *</td>
			<td>
				<input type="text" name="basicm_nm" id="name" value="${mVO.basicm_nm}"><br>
				<span id="nMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PHONE NUMBER *</td>
			<td>
				<input type="text" name="basicm_pnum" id="phonenum" value="${mVO.basicm_pnum}"><br>
				<span id="pnMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th" style="border-bottom:1px solid #c3cbe0">EMAIL *</td>
			<td style="border-bottom:1px solid #c3cbe0">
				<input type="text" name="basicm_email" id="email" value="${mVO.basicm_email}"><br>
				<span id="eMessage" class="message"></span>
			</td>
		</tr>
	</table>
	<br>
		<input type="submit" class="button" style="text-align: center;" value="회원 정보 수정">&nbsp;&nbsp;
		<a href="mdelete"><input type="button" class="button" value="회원 탈퇴" style="text-align: center;"></a>
	</form>	
	
</body>
</html>
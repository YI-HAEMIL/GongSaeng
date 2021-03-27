<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<br><p>회원정보를 확인 및 수정하는 공간입니다.</p>
	<form action="mupdate" method="post">
	<table id="updatet">
		<tr>
			<td style="text-align:left; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;기본 정보</td>
			<td style="text-align:right; font-weight:bold;">*필수입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td class="th">I D *</td>
			<td><input type="text" name="basicm_id" id="basicm_id" value="${mVO.basicm_id}" readonly="readonly"><br> 
				<span id=iMessage class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PASSWORD *</td>
			<td><input type="password" name="basicm_pwd" id="basicm_pwd"><br>
				<span id="pMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PW CONFIRM *</td>
			<td><input type="password" name="pwcheck" id="pwcheck"><br>
				<span id="ppMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">NAME *</td>
			<td><input type="text" name="basicm_nm" id="basicm_nm" value="${mVO.basicm_nm}"><br>
			<span id="nMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PHONE NUMBER *</td>
			<td><input type="text" name="basicm_pnum" id="basicm_pnum" value="${mVO.basicm_pnum}"><br>
				<span id="nMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th" style="border-bottom:1px solid #c3cbe0">EMAIL *</td>
			<td style="border-bottom:1px solid #c3cbe0"><input type="text" name="basicm_email" id="basicm_email" value="${mVO.basicm_email}"><br>
				<span id="bMessage" class="message"></span>
			</td>
		</tr>
	</table>
	<br>
	<input type="submit" class="button" style="text-align: center;" value="회원 정보 수정">&nbsp;&nbsp;
	<a href="mdelete"><input type="button" class="button" value="회원 탈퇴" style="text-align: center;"></a>
	</form>	
	
</body>
</html>
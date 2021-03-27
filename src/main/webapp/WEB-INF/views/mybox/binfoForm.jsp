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
	<form action = "bupdate" method="post">
	<table id="updatet">
		<tr>
			<td style="text-align:left; font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;기본 정보</td>
			<td style="text-align:right; font-weight:bold;">*필수입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td class="th">I D *</td>
			<td><input type="text" name="bizm_id" id="bizm_id" value="${bVO.bizm_id}" readonly="readonly"><br> 
				<span id=iMessage class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PASSWORD *</td>
			<td><input type="password" name="bizm_pwd" id="bizm_pwd"><br>
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
			<td><input type="text" name="bizm_nm" id="bizm_nm" value="${bVO.bizm_nm}"><br>
			<span id="nMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">PHONE NUMBER *</td>
			<td><input type="text" name="bizm_pnum" id="bizm_pnum" value="${bVO.bizm_pnum}"><br>
				<span id="nMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th">EMAIL *</td>
			<td><input type="text" name="bizm_email" id="bizm_email" value="${bVO.bizm_email}"><br>
				<span id="nMessage" class="message"></span>
			</td>
		</tr>
		<tr>
			<td class="th" style="border-bottom:1px solid #c3cbe0">LICENCE NUMBER *</td>
			<td style="border-bottom:1px solid #c3cbe0">
				<input type="text" name="bizm_licnum" id="bizm_licnum" value="${bVO.bizm_licnum}" readonly="readonly"><br>
				<span id="bMessage" class="message"></span>
			</td>
		</tr>
	</table>
	<br>
	<input type="submit" class="button" style="text-align: center;" value="회원 정보 수정">&nbsp;&nbsp;
	<a href="bdelete"><input type="button" class="button" src="bdelete" value="회원 탈퇴" style="text-align: center;"></a>
	</form>
</body>
</html>
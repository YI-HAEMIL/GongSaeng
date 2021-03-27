<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css" type="text/css">
<link rel="stylesheet" href="resources/myLib/joinCSS.css" type="text/css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
</head>
<body>
	<p>회원정보를 확인 및 수정하는 공간입니다.</p><br>
	
	<table id="joint">
		<tr>
			<td class="th" width=150px>I D</td>
			<td>1${mVO.basicm_id}</td>
		</tr>
		<tr>
			<td class="th" width=150px>PASSWORD</td>
			<td>1${mVO.basicm_pwd}</td>
		</tr>
		<tr>
			<td class="th" width=150px>NAME</td>
			<td>1${mVO.basicm_nm}</td>
		</tr>
		<tr>
			<td class="th" width=150px>PHONE NUMBER</td>
			<td>1${mVO.basicm_pnum}</td>
		</tr>
		<tr>
			<td class="th" width=150px>EMAIL</td>
			<td>1${mVO.basicm_email}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" class="button" style="text-align:center;" src="mupdate"
				value="회원 정보 수정" disabled onclick="return inCheck()">&nbsp;&nbsp;
				<input type="text" class="button" src="mdelete" value="회원 탈퇴" style="text-align:center; font-si">
			</td>
		</tr>
	</table>
	
</body>
</html>
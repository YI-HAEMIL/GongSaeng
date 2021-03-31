<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Insert</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/fileUpload.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<br><p>대관 예약을 받을 장소를 등록하는 공간입니다.</p>
	<form action = "pinsert" method="post" id="myplacein" enctype="multipart/form-data">
		<table id="placet">
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소명</td>
				<td>
					<input type="text" name="place_nm" id="name" class="pinput">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;위치</td>
				<td><input type="text" name="place_loc" id="location" class="pinput">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="lMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;평수(크기)</td>
				<td><input type="text" name="place_size" id="size" class="pinput">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="sMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;최대 수용 인원</td>
				<td><input type="text" name="place_max" id="max" class="pinput">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="mMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;이용 금액 (2시간 기준)</td>
				<td><input type="text" name="place_price" id="price" class="pinput">&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="pMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 소개 내용</td>
				<td><textarea name="place_con" id="content"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="cMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 이용 규칙</td>
				<td><textarea name="place_rule" id="rule"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="rMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 이미지<br>(다중 업로드 가능)</td>
				<td style="text-align:left;">
					<label for="uploadFile">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/image/imgupicon.png" style="width:70px; height:70px; cursor:pointer;">
					</label>
					<input type="file" name="uploadFile" id="uploadFile" multiple="multiple" class="pinput" onchange="previewImage(this, 'View_area')" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span id="View_area" style="border: 0px;"></span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="View_area" style="border: 0px;"></span>&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	<br>
		<input type="submit" class="button" style="text-align: center;" value="SUBMIT">&nbsp;&nbsp;
		<input type="reset"  class="button" value="RESET">
	</form>
	<br>
</body>
</html>
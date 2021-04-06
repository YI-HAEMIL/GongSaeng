<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css?ver=1.2" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/placeUpload.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
<br><p>등록한 장소를 수정 및 삭제하는 공간입니다.</p>
	<form action = "pupdate" method="post" id="myplaceup">
		<table id="placet">
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 번호</td>
				<td style="text-align:left">
					<input type="hidden" name="place_id" id="id" value="${pVO.place_id}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${pVO.place_id}
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소명</td>
				<td>
					<input type="text" name="place_nm" id="name" class="pinput" value="${pVO.place_nm}"><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;지역 선택</td>
				<td>
					<input type="hidden" name="place_area" id="place_area">
					
					<label for="areaU" style="font-size: small">주소 대분류&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<script>setSelect("${area[0]}");</script>
					<select id="areaU" name="areaU" onchange="areaChange(this)">
						<option>선택해주세요</option>
						<option value="A">서울 북부</option>
						<option value="B">서울 남부</option>
						<option value="C">서울 서부</option>
						<option value="D">서울 동부</option>
						<option value="E">수도권</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					
					<label for="areaD" style="font-size: small">주소 소분류&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<script>setSelect2("${area[1]}");</script>
					<select id="areaD" name="areaD">
						<option>선택해주세요</option>
					</select><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;상세 주소</td>
				<td><input type="text" name="place_loc" id="location" class="pinput" value="${pVO.place_loc}"><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;면적</td>
				<td style="text-align:left;">&nbsp;&nbsp;
					<input type="hidden" name="place_size" id="place_size">
					<input type="text" id="sizenum1" class="pinput" onkeyup="calcSize(1)" value="${size[0]}">&nbsp;&nbsp;
 					<span style="font-size:small;">평&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</span>
 					<input type="text" id="sizenum2" class="pinput" onkeyup="calcSize(2)"  value="${size[1]}">
 					<span style="font-size:small;">&nbsp;&nbsp;㎡</span>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;기본 수용 인원</td>
				<td style="text-align:left;">&nbsp;&nbsp;
					<input type="text" name="place_max" id="max" class="pinput" value="${pVO.place_max}">
					<span style="font-size:small;">&nbsp;&nbsp;&nbsp;명</span><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;이용 금액 / 1시간</td>
				<td style="text-align:left;">&nbsp;&nbsp;
					<input type="text" name="place_price" id="price" class="pinput" value="${pVO.place_price}">
					<span style="font-size:small;">&nbsp;&nbsp;&nbsp;원</span><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 소개 내용</td>
				<td><textarea name="place_con" id="content">${pVO.place_con}</textarea><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 이용 규칙</td>
				<td><textarea name="place_rule" id="rule">${pVO.place_rule}</textarea><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 이미지<br>(다중 업로드 가능)</td>
				<td style="text-align:left;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="uploadFile">
					<img src="resources/image/imgupicon.png" id="file_add" style="width:70px; height:70px; cursor:pointer;">
					</label>
					<input type="file" name="uploadFile" id="uploadFile" multiple class="pinput"
							onchange="previewImage(this, 'View_area')" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;
					
 					<span id="View_area" style="border: 0px;">
						<c:forEach var="prevImg" items="${prevImgList}">
							<img src="${prevImg.file_path}" style="width:70px;height:70px;">
						</c:forEach>
					</span>
				</td>
			</tr>
		</table>
	<br>
		<span id="pupdate-submit"><input type="button" class="button" style="text-align: center;" value="장소 정보 수정"></span>&nbsp;&nbsp;
		<span id="pdelete-submit"><input type="button" class="button" style="text-align: center;" value="장소 삭제"></span>
	</form>
	<br>
</body>
</html>
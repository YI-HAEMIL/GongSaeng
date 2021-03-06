<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Insert</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS1.css?ver=1.3" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/placeUpload.js"></script>
<script src="resources/gscript/placeCheck.js"></script>
<script>
	var nCheck=false;
	var aCheck=false;
	var lCheck=false;
	var sCheck=false;
	var mCheck=false;
	var pCheck=false;
	var cCheck=false;
	var rCheck=false;
	var iCheck=false;
		
	$(function(){
		$('#name').focus();
		$('#name').focusout(function(){
			nCheck=nmCheck();
		});
		
		$('#areaU').focusout(function(){
			aCheck=arCheck();
		});
		
		$('#location').focusout(function(){
			lCheck=locCheck();
		});
		
		$('#sizenum1').focusout(function(){
			sCheck=szCheck();
		});
		
		$('#max').focusout(function(){
			mCheck=maxCheck();
		});
		
		$('#price').focusout(function(){
			pCheck=priCheck();
		});
		
		$('#content').focusout(function(){
			cCheck=conCheck();
		});
		
		$('#rule').focusout(function(){
			rCheck=rulCheck();
		});
		
		$('#uploadFile').focusout(function(){
			iCheck=imgCheck();
		});
	}); //ready
		
	function validate() {
		if(nCheck==false){
			$('#nMessage').html('장소명(제목)을 확인해주세요');
			$('#name').focus();
		}
		if(aCheck==false){
			$('#aMessage').html('지역 선택을 확인해주세요');
			$('#areaU').focus();
		}
		
		if(lCheck==false){
			$('#lMessage').html('상세 주소를 확인해주세요');
			$('#location').focus();
		}
		if(sCheck==false){
			$('#sMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;면적을 확인해주세요');
			$('#size').focus();
		}
		if(mCheck==false){
			$('#mMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;수용 인원을 확인해주세요');
			$('#max').focus();
		}
		if(pCheck==false){
			$('#pMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;이용 금액을 확인해주세요');
			$('#price').focus();
		}
		if(cCheck==false){
			$('#cMessage').html('장소 소개 내용을 확인해주세요');
			$('#content').focus();
		}
		if(rCheck==false){
			$('#rMessage').html('장소 이용 규칙을 확인해주세요');
			$('#rule').focus();
		}
		if(iCheck==false){
			$('#iMessage').html('이미지 업로드를 확인해주세요');
			$('#uploadFile').focus();
		}
		if(nCheck==true && aCheck==true && lCheck==true && sCheck==true && mCheck==true &&
				pCheck==true && cCheck==true && rCheck==true && iCheck==true){
			return true;
		} else {
			return false;
		}
	}
</script>
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
					<input type="text" name="place_nm" id="name" class="pinput"><br>
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;지역 선택</td>
				<td>
					<input type="hidden" name="place_area" id="place_area">
					<label for="areaU" style="font-size: small">지역 대분류&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select id="areaU" name="areaU" onchange="areaChange(this)">
						<option value="">선택해주세요</option>
						<option value="A">서울 북부</option>
						<option value="B">서울 남부</option>
						<option value="C">서울 서부</option>
						<option value="D">서울 동부</option>
						<option value="E">수도권</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="areaD" style="font-size: small">지역 소분류&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<select id="areaD" name="areaD">
						<option value="">선택해주세요</option>
					</select><br>
					<span id="aMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;상세 주소</td>
				<td>
					<input type="text" name="place_loc" id="location" class="pinput"><br>
					<span id="lMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;면적</td>
				<td style="text-align:left;">
					<input type="hidden" name="place_size" id="place_size">
					<input type="text" id="sizenum1" class="pinput" onkeyup="calcSize(1)">&nbsp;&nbsp;
 					<span style="font-size:small;">평&nbsp;&nbsp;&nbsp;&nbsp;/</span>
 					<input type="text" id="sizenum2" class="pinput" onkeyup="calcSize(2)">
 					<span style="font-size:small;">&nbsp;&nbsp;㎡</span>
					<span id="sMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;기본 수용 인원</td>
				<td style="text-align:left;">
					<input type="text" name="place_max" id="max" class="pinput">
					<span style="font-size:small;">&nbsp;&nbsp;&nbsp;명</span>
					<span id="mMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;이용 금액 / 1시간</td>
				<td style="text-align:left;">
					<input type="text" name="place_price" id="price" class="pinput">
					<span style="font-size:small;">&nbsp;&nbsp;&nbsp;원</span>
					<span id="pMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 소개 내용</td>
				<td><textarea name="place_con" id="content"></textarea><br>
					<span id="cMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 이용 규칙</td>
				<td><textarea name="place_rule" id="rule"></textarea><br>
					<span id="rMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="th">&nbsp;&nbsp;&nbsp;&nbsp;장소 이미지<br>(다중 업로드 가능)</td>
				<td style="text-align:left;">
					<!-- <label for="uploadFile">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/image/imgupicon.png" style="width:70px; height:70px; cursor:pointer;">
					</label> -->
					<input type="file" name="uploadFile" id="uploadFile" multiple="multiple" class="pinput"
							onchange="previewImage(this, 'View_area')"><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="View_area" style="border: 0px;"></span><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="iMessage" class="message"></span>
				</td>
			</tr>
		</table>
	<br>
		<span id="pinsert-submit"><input type="button" class="button" style="text-align: center;" value="SUBMIT"></span>&nbsp;&nbsp;
		<input type="reset"  class="button" value="RESET">
	</form>
	<br>
</body>
</html>
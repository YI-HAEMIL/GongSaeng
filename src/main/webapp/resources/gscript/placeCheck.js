/*
 *  회원가입 및 로그인 유효성 check 스크립트문
 */

function nmCheck() {
	var name=$('#name').val();
	if(name.length < 1) {
		$('#nMessage').html('장소명(제목)을 입력해주세요');
		return false;
	} else if (name.length > 20) {
		$('#nMessage').html('장소명(제목)은 20자 이내로 작성해주세요');
		return false;
	} else {
		$('#nMessage').html('');
		return true;
	}
} //nmCheck

function arCheck(){
	var area1=$('#areaU').val();
	var a1txt=$('#areaU').text();
	var area2=$('#areaD').val();
	var a2txt=$('#areaD').text();
	if(area1 == null || a1txt == '선택해주세요') {
		$('#aMessage').html('지역을 선택해주세요');
		return false;
	} else if(area2 == null || a2txt == '선택해주세요') {
		$('#aMessage').html('지역을 선택해주세요');
		return false;
	} else {
		$('#aMessage').html('');
		return true;
	}
}

function locCheck(){
	var location = $('#location').val();
	if(location == null || location == "") {
		$('#lMessage').html('상세 주소를 입력해주세요');
		return false;
	} else {
		$('#lMessage').html('');
		return true;
	}
}

function szCheck(){
	var size1 = $('#sizenum1').val();
	var size2 = $('#sizenum2').val();
	if(size1 == null || size2 == null || size1 == 'NaN' || size2 == 'NaN' ){
		$('#sMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;면적을 입력해주세요');
		return false;
	} else if(size1.replace(/[0-9]/gi,'').length>0 || size2.replace(/[0-9]/gi,'').length>0) {
		$('#sMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;면적은 숫자로만 입력해주세요');
		return false;
	} else {
		$('#sMessage').html('');
		return true;
	}
}

function maxCheck(){
	var max = $('#max').val();
	if(max == null || max == "") {
		$('mMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수용 인원을 입력해주세요');
		return false;
	} else if(max.length > 3) {
		$('mMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수용 인원이 너무 많습니다');
		return false;
	} else if(max.replace(/[0-9]/gi,'').length>0){
		$('mMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수용 인원은 숫자로만 입력해주세요');
		return false;
	} else {
		$('mMessage').html('');
		return true;
	}
}

function priCheck(){
	var price = $('#price').val();
	if(price == null || price == ""){
		$('#pMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용 금액을 입력해주세요');
		return false;
	} else if(price.length > 7) {
		$('#pMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시간 당 요금이 백만원을 초과할 수 없습니다');
		return false;
	} else if(price.replace(/[0-9]/gi,'').length>0){
		$('#pMessage').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용 금액은 숫자로만 입력해주세요');
		return false;
	} else {
		$('#pMessage').html('');
		return true;
	}
}

function conCheck() {
	var content = $('#content').val();
	if(content == null || content == ""){
		$('#cMessage').html('장소 소개 내용을 입력해주세요');
		return false;
	} else {
		$('#cMessage').html('');
		return true;
	}
}

function rulCheck() {
	var rule = $('#content').val();
	if(rule == null || rule == ""){
		$('#rMessage').html('장소 이용 규칙을 입력해주세요');
		return false;
	} else {
		$('#rMessage').html('');
		return true;
	}
}

function imgCheck() {
	var img = $('#uploadFile').val();
	if(img == null || img == ""){
		$('#iMessage').html('장소를 보여줄 이미지를 첨부해주세요');
		return false;
	} else {
		$('#iMessage').html('');
		return true;
	}
}
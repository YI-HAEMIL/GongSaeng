/*
 *  회원가입 및 로그인 유효성 check 스크립트문
 */

function idCheck() {
	var id=$('#id').val();
	if(id.length < 4) {
		$('#iMessage').html('ID는 4글자 이상 입력해주세요');
		return false;
	} else if (id.replace(/[a-z.0-9]/gi,'').length > 0) {
		$('#iMessage').html('ID는 영문과 숫자로만 입력해주세요');
		return false;
	} else {
		$('#iMessage').html('');
		return true;
	}
} //idCheck

function pwCheck() {
	var password=$('#password').val();
	var pLength=password.length;
	if(pLength < 6 || pLength > 20) {
		$('#pMessage').html('비밀번호는 6~20자리 이내로 입력해주세요');
		return false;
	} else if (password.replace(/[!-*]/gi,'').length>=pLength) {
		$('#pMessage').html('비밀번호는 특수문자를 반드시 한 개 이상 입력해주세요');
		return false;
	} else {
		$('#pMessage').html('');
		return true;
	}
} //pwCheck

// 비밀번호 재입력 확인
function pw2Check() {
	var password=$('#password').val();
	var password2=$('#password2').val();
	if(password != password2) {
		$('#p2Message').html('비밀번호가 일치하지 않습니다');
		return false;
	} else {
		$('#p2Message').html('');
		return true;
	}
} //pw2Check

function nmCheck() {
	var name=$('#name').val();
	if(name.length<2){
		$('#nMessage').html('이름은 2글자 이상 입력해주세요');
		return false;
	} else if (name.replace(/[a-z.가-힇]/gi,'').length > 0) {
		$('#nMessage').html('이름은 한글과 영문으로만 입력해주세요');
		return false;
	} else {
		$('#nMessage').html('');
		return true;
	}
} //nmCheck

function pnumCheck() {
	var phonenum=$('#phonenum').val();
	if(phonenum.length!=11){
		$('#pnMessage').html('핸드폰 번호 11자리를 정확히 입력해주세요');
		return false;
	} else if (phonenum.replace(/[0-9]/gi,'').length>0) {
		$('#pnMessage').html('핸드폰 번호는 숫자로만 입력해주세요');
		return false;
	} else {
		$('#pnMessage').html('');
		return true;
	}
} //pnumCheck

function emCheck() {
	var email=$('#email').val();
	var emailform=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!emailform.test(email)){
		$('#eMessage').html('이메일 형식이 올바르지 않습니다');
		return false;
	} else {
		$('#eMessage').html('');
		return true;
	}
} //emCheck

function lnCheck() {
	var licensenum=$('#licensenum').val();
	
	var keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
	var chk = 0;
	var numberMap = licensenum.split('').map(function(d) {
		return parseInt(d, 10);
	});
	
	if(licensenum.replace(/[0-9]/gi,'').length>0) {
		$('#lMessage').html('사업자등록번호는 숫자만 입력해주세요');
		return false;
	} else if(numberMap.length != 10) {
		$('#lMessage').html('사업자등록번호 10자리를 정확히 입력해주세요');
		return false;
	} else if(numberMap.length == 10){ // 사업자등록번호 유효성 검사
		var keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
		var chk = 0;
		
		keyArr.forEach(function(d, i){
			chk += d * numberMap[i];
		});
		
		chk += parseInt((keyArr[8] * numberMap[8])/ 10, 10);
		console.log(chk);
		
		if(Math.floor(numberMap[9]) === ( (10 - (chk % 10) ) % 10)) {
			$('#lMessage').html('');
			return true;
		} else {
			$('#lMessage').html('유효하지 않는 사업자등록번호입니다.');
		return false;
		}
	} 
} //lnCheck


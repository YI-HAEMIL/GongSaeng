/* 메인페이지에서 페이지 이동 ajax 처리 스크립트문 */
var isRun = false;

// 토글 메뉴
$(document).on('click', '#toggle_all', function() {
	togglemenu();
});
function togglemenu(){
	$('#category_all').toggle();
}

//메뉴 이동
function menuMove(innerText) {
	if (isRun == true) { return; } isRun = true;
	var areaU = innerText;
	console.log(areaU);
	var areaUnit;
	
	if(areaU == "서울 북부") {
		areaUnit="A";
	} else if(areaU == "서울 남부") {
		areaUnit="B";
	} else if(areaU == "서울 서부") {
		areaUnit="C";
	} else if(areaU == "서울 동부") {
		areaUnit="D";
	} else {
		areaUnit="E";
	}
	console.log(areaUnit);
	
	$.ajax({
		type: 'Get',
		url: 'parea',
		data:{
			keyword: areaUnit
		},
		success: function(resultPage) {
			$('#resultArea').html(resultPage);
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	}); //ajax
}

function submenuMove(innerText) {
	if (isRun == true) { return; } isRun = true;
	var areaD = innerText;
	console.log(areaD);
	
	$.ajax({
		type: 'Get',
		url: 'parea',
		data:{
			keyword: areaD
		},
		success: function(resultPage) {
			$('#resultArea').html(resultPage);
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	}); //ajax
}


// 마이페이지
$(document).on('click', '#mypage', function() {
	if (isRun == true) { return; } isRun = true;
	$.ajax({
		type: 'Get',
		url: 'mypage',
		success: function(resultPage) {
			$('#resultArea').html(resultPage);
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	}); //ajax
});

// 로그인 페이지
$(document).on('click', '#mloginbtn', function() {
	mloginf();
});
function mloginf() {
	if (isRun == true) { return; } isRun = true;
	$.ajax({
		type: 'Get',
		url: 'mloginf',
		success: function(resultPage) {
			$('#resultArea').html(resultPage);
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	}); //ajax
}

// 회원가입페이지
$(document).on('click', '#mjoinf', function() {
	if (isRun == true) { return; } isRun = true;
	$.ajax({
		type: 'Get',
		url: 'mjoinf',
		success: function(resultPage) {
			$('#resultArea').html(resultPage);
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	}); //ajax
});

// 로그아웃	
$(document).on('click', '#logout', function() {
	if (isRun == true) { return; } isRun = true;
	$.ajax({
		type: 'Get',
		url: 'logout',
		success: function(resultPage) {
			$('#resultArea').html(resultPage);
			location.reload();
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	}); //ajax
});
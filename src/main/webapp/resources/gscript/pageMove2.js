/* 메인페이지에서 페이지 이동 ajax 처리 스크립트문 */
var isRun = false;

//회원 정보
$(document).on('click', '#minfobtb', function() {
	minfo();
});
function minfo(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'minfo',
		success:function(resultPage){
			$('#mypagebox').html(resultPage);
			isRun=false;
			},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
		}	
	}); //ajax
}

$(document).on('click', '#binfobtn', function() {
	binfo();
});
function binfo(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'binfo',
		success:function(resultPage){
			$('#mypagebox').html(resultPage);
			isRun=false;
			},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
		}	
	}); //ajax
}


// 장소 입력
$(document).on('click', '#pinsertbtn', function() {
	pinsertf();
});
function pinsertf(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'pinsertf',
		success:function(resultPage){
			$('#mypagebox').html(resultPage);
			isRun=false;
			},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
		}	
	}); //ajax
}

// 장소 업데이트
$(document).on('click', '#pdetailbtn', function() {
	pdetail();
});
function pdetail(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'pdetail',
		success:function(resultPage){
			$('#mypagebox').html(resultPage);
			isRun=false;
			},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
		}	
	}); //ajax
}

// 장소 이용 시간 등록 폼
$(document).on('click', '#pablebtn', function() {
	pablef();
});
function pablef(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'pablef',
		success:function(resultPage){
			$('#mypagebox').html(resultPage);
			$('#ableResult').load('abledetail');
			isRun=false;
			},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
		}	
	}); //ajax
}
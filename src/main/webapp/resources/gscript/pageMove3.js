/* 장소 리스트 페이지에서 페이지 이동 ajax 처리 스크립트문 */
var isRun = false;


//장소 상세 페이지 이동
function placemodal(id) {
	var bid = id;
	console.log(bid);

	$.ajax({
		type: 'Get',
		url: 'placemodal',
		data: {
			bizm_id: bid
		},
		success: function(resultPage) {
			window.scrollTo(0, 0);
			$('.modal_cArea').html(resultPage);
			$('.modal').fadeIn();
			$('.sliderimg').resize(); // 팝업 열때 슬라이드 깨짐 방지
			map.relayout();
			document.body.classList.add("stop-scrolling");
			isRun = false;
		},
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	});//ajax
}

//모달창 끄기
$(document).mouseup(function (e) {
	var modal = $('.modal');
	var modal2 = $('.modal_cArea');
	if(modal.has(e.target).length===1&&modal2.has(e.target).length!=1){
		modal.fadeOut();
		document.body.classList.remove("stop-scrolling");
	}
});
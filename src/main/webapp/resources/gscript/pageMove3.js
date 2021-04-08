/* 장소 리스트 페이지에서 페이지 이동 ajax 처리 스크립트문 */
var isRun = false;

//장소 상세 페이지 이동
function placeOne(innerText){
	if (isRun == true) { return; } isRun = true;
	var bizmid=innerText;
	console.log(bizmid);
	
	$.ajax({
		type:'Get',
		url: 'placeone',
		data: {
			bizm_id:bizmid
		},
		success:function(resultPage){
			window.scrollTo(0,0);
			$('.modal').html(resultPage);
			$('.modal').fadeIn();
			document.body.classList.add("stop-scrolling");
			isRun = false;
		}, 
		error: function() {
			alert("서버 오류 발생, 다시 시도해주세요.");
		}
	});//ajax
}


// 모달창 끄기
$(document).on('click', '.modal', function(){
	$('.modal').fadeOut();
	 document.body.classList.remove("stop-scrolling"); 
});
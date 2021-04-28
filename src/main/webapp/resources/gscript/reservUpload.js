var isRun = false;

$(document).on('click', '#reserv-submit', function(){
    rinsert();
});
function rinsert() {
   	if(isRun == true) { return; } isRun = true;
   	$.ajax({
   		type: "POST",
   		url: "rinsert",
   		data: {
   			reserv_id:reservid,
  			place_id:$('#pid').val(),
   			use_date:$('#usedate').val(),
   			use_starttime:$('#startTime option:selected').val(),
   			use_endtime:$('#endTime option:selected').val(),
   			use_number:$('#usenum').val(),
   			use_purpose:$('#purpose').val()
   		},
   		success:function(resultData){
   			if(resultData.insertSuccess=='T') {
   				alert(resultData.msg);
   				location.reload();
   			} else {
   				alert(resultData.msg);
   				location.reload();
   			}
   			isRun=false;
   		},
   		error:function(){
   			alert("서버 오류 발생, 다시 시도해주세요.");
   			location.reload();
   		}	
	});
}


function rdetail(rid) {
	var reservid=rid;
	if($('#c'+reservid).html()==''){
		$.ajax({
			type:"Get",
			url: "rdetail",
			data:{
				reserv_id:reservid
			},
			success:function(resultData) {
				$('.rdetail').removeClass("rdetailpd"); // 초기화
				$('.content').html(''); // result span clear 초기화
				
				$('#r'+reservid).addClass("rdetailpd");
				$('#c'+reservid).html(resultData.content);
			},
			error: function() {
				alert('서버 오류, 잠시 후 다시 시도해주세요');
			}
		}); //ajax
	} else {
		$('#r'+reservid).removeClass("rdetailpd");
		$('.content').html('');
	}
}

function rdelete(rid,pid,udate) {
	var reservid=rid;
	var placeid=pid;
	var date=udate;
	$.ajax({
		type:"Get",
		url: "rdelete",
		data:{
			reserv_id:reservid,
			place_id:placeid,
			able_date:date
		},
		success:function(resultData) {
			if(resultData.deleteSuccess=='T') {
   				alert(resultData.msg);
				if(resultData.group=='business'){
	   				$('#mypagebox').load('rinfo_b');
				} else {
					$('#mypagebox').load('rinfo_m');
				}
   			} else {
   				alert(resultData.msg);
   				location.reload();
   			}
   			isRun=false;
		},
		error: function() {
			alert('서버 오류, 잠시 후 다시 시도해주세요');
		}
	}); //ajax
}

function placemodal2(id) {
	var pid = id;
	console.log(pid);

	$.ajax({
		type: 'Get',
		url: 'placemodal2',
		data: {
			place_id: pid
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


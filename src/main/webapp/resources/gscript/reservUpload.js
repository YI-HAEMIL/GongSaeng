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
	if($('.content').html()==''){
		$.ajax({
			type:'Get',
			url: rdetail,
			data:{
				reserv_id:reservid
			},
			success:function(resultData) {
				$('.content').html(''); // result span clear
				$('.content').html(resultData.content);
			},
			error: function() {
				alert('서버 오류, 잠시 후 다시 시도해주세요');
			}
		}); //ajax
	} else {
		$('.content').html('');
	}
}
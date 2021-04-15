var isRun = false;

var fileArr;
var fileInfoArr=[];

// 주소 selectbox
function areaChange(e) {
	var north = ["서촌","북촌/익선동","성북구","혜화","부암동","동대문"];
	var south = ["청담/삼성동","신사/압구정","강남/양재","고터/반포"];
	var west = ["한남","이태원","연남동","망원/서교","신촌","용산","문래동"];
	var east = ["성수","잠실","건대","강동구"];
	var carea = ["수원","성남","판교","파주","송도","하남"];
	
	if(e.value=="A") var d = north;
	else if(e.value=="B") var d = south;
	else if(e.value=="C") var d = west;
	else if(e.value=="D") var d = east;
	else if(e.value=="E") var d = carea;
	
	$('#areaD').empty();
	for(x in d){
		var opt = document.createElement("option");
		opt.value=d[x];
		opt.innerHTML=d[x];
		$('#areaD').append(opt);
	}
}

// select box 2개, size input 2개 value 합치기
function getsValue(){
	var areaU=$("#areaU option:selected").val();
	var areaD=$("#areaD option:selected").val();
	var place_area="";
	place_area=areaU+","+areaD;
	console.log(place_area);
	$("#place_area").val(place_area);
}
function getSize(){
   var sizenum1=$('#sizenum1').val();
   var sizenum2=$('#sizenum2').val();
   var place_size="";
   place_size=sizenum1+"/"+sizenum2;
   $("#place_size").val(place_size);
}

// 면적 계산 & 자동 input
function calcSize(chk){
	  if(chk==1){ 
		var sizechange=parseFloat(document.getElementById('sizenum1').value) * 3.3058;
		document.getElementById('sizenum2').value=sizechange.toFixed(0);
	  }
	  else { 
		var sizechange=parseFloat(document.getElementById('sizenum2').value) / 3.3058;
		document.getElementById('sizenum1').value=sizechange.toFixed(0);
		
		place_size=sizechange+"/"+$('#sizenum2').val();
		$('#place_size').val(place_size);
	  }
}

// detail 페이지에서 selected 설정
function setSelect(value) {
	if (value) {
		var str = value;
		console.log(str);
		$("#areaU").val(str).prop("selected", true);
		
		var north = ["서촌","북촌/익선동","성북구","혜화","부암동","동대문"];
		var south = ["청담/삼성동","신사/압구정","강남/양재","고터/반포"];
		var west = ["한남","이태원","연남동","망원/서교","신촌","용산","문래동"];
		var east = ["성수","잠실","건대","강동구"];
		var carea = ["수원","성남","판교","파주","송도","하남"];
			
		if(str=="A") var d = north;
		else if(str=="B") var d = south;
		else if(str=="C") var d = west;
		else if(str=="D") var d = east;
		else if(str=="E") var d = carea;
			
		for(x in d){
			var opt = document.createElement("option");
			opt.value=d[x];
			opt.innerHTML=d[x];
			$('#areaD').append(opt);
		}
	}
}
function setSelect2(value) {
	if (value) {
		var str2 = value;
		console.log(str2);
		$("#areaD").val(str2).prop("selected", true);
	}
}

// -----------------------------------------------------------------------------------------

// 파일 삭제
/*
function fileRemove(index) {
    console.log("index: "+index);
    fileInfoArr.splice(index,1);
 
    var imgId="#img_id_"+index;
    $(imgId).remove();
    console.log(fileInfoArr);
}
*/

// 썸네일 미리보기
function previewImage(targetObj, View_area) {
	$('#View_area').empty();
	
	var files = targetObj.files;
	fileArr = Array.prototype.slice.call(files); // Object 타입인 files를 Array로 저장하겠다

	var preview = document.getElementById(View_area);
	if(files.length < 11) {
		
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			fileInfoArr.push(file);
			//push 메서드는 배열의 끝에 하나 이상의 요소 추가, 배열의 새로운 길이 반환
			
			var imageType = /image.*/; // 이미지 파일일 경우에만 허용
			if (!file.type.match(imageType)) {
				alert('이미지 형식만 업로드 가능합니다. 다시 시도해주세요');
			} else {
				var span = document.createElement('span');
				span.id = "img_id_" + i;
				span.style.width = '70px';
				span.style.height = '70px';
				preview.appendChild(span);
	
				var img = document.createElement('img');
				img.className = "addImg";
				img.classList.add("obj");
				img.file = file;
				img.style.width = 'inherit';
				img.style.height = 'inherit';
				img.style.cursor = 'pointer';
//				const idx=i;
//				img.onclick=()=>fileRemove(idx);	//이미지 클릭했을때 삭제 함수
				span.appendChild(img);
	
				if (window.FileReader) { // FireFox,Chrome,Opera 확인
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						}
					})(img);
					reader.readAsDataURL(file);
				}
				
			} // if-else
		}  //for
	
	} else {
		alert('이미지는 최대 10장까지 업로드 할 수 있습니다');
	}

} //previewImage


// -----------------------------------------------------------------------------------------
// insert submit
$(document).on('click','#pinsert-submit',function(){
	if(validate()==false){
		return;
	} else {
		getsValue();
		getSize();
		pinsert();
	}
});

function pinsert() {
	if(isRun == true) { return; } isRun = true;
    var data=new FormData($('#myplacein')[0]);
 	
    $.ajax({
        type:"Post",
        url: "pinsert",
        data: data,
        processData:false,
        contentType:false,
        enctype:'multipart/form-data',
		success:function(resultData){
			if(resultData.insertSuccess=='T') {
				alert(resultData.msg);
				$('#mypagebox').load('pablef');
			} else {
				alert(resultData.msg);
				$('#mypagebox').load('pinsertf');
			}
			isRun=false;
		},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
			$('#mypagebox').load('pinsertf');
		}	
    });
}


// update submit
$(document).on('click', '#pupdate-submit', function(){
	if(validate()==false){
		return;
	} else {
		getsValue();
		getSize();
		pupdate();
	}
});
function pupdate(){
	if(isRun == true) { return; } isRun = true;
	 var data=new FormData($('#myplaceup')[0]);
	$.ajax({
        type:"Post",
        url: "pupdate",
        data: data,
        processData:false,
        contentType:false,
        enctype:'multipart/form-data',
		success:function(resultData){
			if(resultData.updateSuccess=='T') {
				alert(resultData.msg);
				$('#mypagebox').load('pdetail');
			} else {
				alert(resultData.msg);
				$('#mypagebox').load('pdetail');
			}
			isRun=false;
		},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
			$('#mypagebox').load('pdetail');
		}	
    });
}

// delete submit
$(document).on('click', '#pdelete-submit', function(){
	pdelete();
});
function pdelete(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'pdelete',
		enctype:'application/x-www-form-urlencoded',
		data:{
			place_id:$('#id').val()
		},
		success:function(resultData){
			if(resultData.deleteSuccess=='T') {
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
			$('#mypagebox').load('pdetail');
		}	
	}); //ajax
}


// 장소 이용 시간 insert submit
$(document).on('click','#able-submit', function(){
	ableinsert();
});
function ableinsert(){
	if(isRun == true) { return; } isRun = true;
	var datepicker=$('#datepicker').val();
	var date=datepicker.split(',');
	
	for(var i=0;i<date.length;i++){
		console.log(date[i]);
	}

	for(var i=0;i<date.length;i++){
		(function(i) {
			$.ajax({
				type:'Get',
				url:'ableinsert',
				data:{
					place_id:$('#place_id').val(),
					bizm_id:$('#bizm_id').val(),
					able_date:date[i],
					able_starttime:$('#startTime').val(),
					able_endtime:$('#endTime').val()
				},
				success:function(resultData){
					if(resultData.insertSuccess=='T') {
						$('#ableResult').load('abledetail');
					} else {
						$('#mypagebox').load('pablef');
					}
					isRun=false;
				},
				error:function(){
					alert("서버 오류 발생, 다시 시도해주세요.");
					$('#mypagebox').load('pablef');
				}	
			}); //ajax
		})(i);
	}
}

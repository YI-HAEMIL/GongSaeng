var fileArr;
var fileInfoArr=[];

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
				const idx=i;
				img.onclick=()=>fileRemove(idx);	//이미지 클릭했을때 삭제 함수
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

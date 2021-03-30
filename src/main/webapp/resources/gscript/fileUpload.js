/* 이미지 업로드 및 미리보기 */

var fileArr;
var fileInfoArr = [];

/* 썸네일 클릭 시 삭제 */
function fileRemove(index) {
	console.log("index: " + index);
	fileInfoArr.splice(index, 1);

	var imgId = "#img_id_" + index;
	$(imgId).remove();
	console.log(fileInfoArr);
}

/* 썸네일 미리보기 */
function previewImage(targetObj, View_area) {
	$('#View_area').empty();
	
	var files = targetObj.files;
	fileArr = Array.prototype.slice.call(files);

	var preview = document.getElementById(View_area);
	
	if(files.length < 11) {
		
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			fileInfoArr.push(file);
			
			var imageType = /image.*/; // 이미지 파일일 경우에만 허용
			if (!file.type.match(imageType)) {
				alert('이미지 형식만 업로드 가능합니다. 다시 시도해주세요');
			} else {
				
				var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
	            if (prevImg) {
	                preview.removeChild(prevImg);
	            }
	
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
				const idx = i; // for 문에서 다 돌고 나가버려서 변수 따로 선언
				img.onclick = () => fileRemove(idx); //이미지 클릭했을때 삭제 함수
				
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

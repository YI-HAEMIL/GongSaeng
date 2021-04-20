<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<link rel="stylesheet" href="resources/myLib/placeCSS.css?ver=2.1" type="text/css">
<link rel="stylesheet" href="resources/slick/slick.css" type="text/css">
<link rel="stylesheet" href="resources/slick/slick-theme.css" type="text/css">
<link rel="stylesheet" href="resources/datepicker/datepicker.min.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove3.js"></script>
<script src="resources/slick/slick.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70479aea1165b5f91675f4fc638a746e&libraries=services"></script>
<script src="resources/datepicker/datepicker.min.js"></script>
<script src="resources/datepicker/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->

<script>
	$(document).ready(function(){
		 $('.sliderimg').slick({
			 dots: true,
			 infinite: true,
			 speed: 300,
			 slidesToShow: 2,
			 slidesToScroll: 1,
			 variableWidth : true
      	});
   	}); //ready
</script>
</head>
<body>
	<!-- 모달창 콘텐츠1(사진/장소소개/이용규칙/지도 부분) -->
	<div class="modal_content">
		<br>
		<div class="slider">
			<div class="sliderimg">
			<c:forEach var="img" items="${pimgList}" varStatus="st">
				<img src="${img.file_path}" class="imgOne">
			</c:forEach>
			</div>
		</div>
		<br>
		<span>장소 소개</span>
		<hr class="modal_hr">
		<pre style="font-size:smaller;">${ppVO.place_con}</pre>
		<br>
		<span>장소 이용 규칙</span>
		<hr class="modal_hr">
		<pre style="font-size:smaller;">${ppVO.place_rule}</pre>
		<br>
		<span>위치</span>
		<hr class="modal_hr">
		<pre style="font-size:smaller;">${ppVO.place_loc}</pre><input type="hidden" id="address" value="${ppVO.place_loc}">
		<div id="map" style="width:500px;height:400px;"></div>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			};
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var geocoder = new kakao.maps.services.Geocoder();
				geocoder.addressSearch($('#address').val(), function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});
							var infowindow = new kakao.maps.InfoWindow({
								content : '<div style="width:150px;text-align:center;padding:6px 0;font-family:AppleSDGothicNeoM00;">${ppVO.place_nm}</div>'
							});
						infowindow.open(map, marker);
						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
				}
			});
		</script>
		<br>
	</div>
	<!-- 모달창 콘텐츠2(기본 정보/예약 캘린더 부분) -->
	<div class="modal_content2">
		<span>
			<c:choose>
				<c:when test="${parea[0]eq'A'}">서울 북부</c:when>
				<c:when test="${parea[0]eq'B'}">서울 남부</c:when>
				<c:when test="${parea[0]eq'C'}">서울 서부</c:when>
				<c:when test="${parea[0]eq'D'}">서울 동부</c:when>
				<c:otherwise>수도권</c:otherwise>
			</c:choose>
			 &#183; ${parea[1]}</span><br>
		<span>${psize[0]}평 &#183; ${psize[1]}㎡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 ${ppVO.place_max}명</span><br>
		<span style="font-size: larger;"><b>${ppVO.place_nm}</b>&nbsp;&nbsp; | </span><span style="font-size:medium;">&nbsp;&nbsp;${ppVO.bizm_id}</span><br>
		<br>
		<div id="custom-cells" style="margin-bottom:20px;"></div>
		<div id="custom-cells-events"></div>
		<script>
		var eventDates = [];
		var sentences = [];

		<c:forEach var="li" items="${avoList}">
		var day = '${li.able_date}';
		eventDates.push(day);

		var starttime = '${li.able_starttime}';
		var endtime = '${li.able_endtime}';
		var txt = "대관 가능 시간 | " + starttime + " - " + endtime;

		sentences.push(txt);
		
		var bizmid = '${li.bizm_id}';
		</c:forEach>

		$picker = $('#custom-cells'),
		
		$picker.datepicker({
			language : 'ko',
			inline : true,
			onRenderCell :
			function(date, cellType) {
				var months = ['01','02','03','04','05','06','07','08','09','10','11','12']
				var myDate = date.getFullYear()+'-'+months[date.getMonth()]+'-'+((date.getDate()<10)?'0':'')+date.getDate();
				var myDay = date.getDate();
				
			    if (eventDates.indexOf(myDate) > -1) {
			    	return { 
			    		disabled: false,
			    		html: myDay+'<span class="dp-note"></span>'
			    	}
			    } else {
			    	return {
			    		disabled:true
			    	}
			    }
			},
			onSelect : function onSelect(fd, date) {
				var content = ''
				if (eventDates.indexOf(fd) > -1) {
					var selectday=fd;
					content = sentences[eventDates.indexOf(fd)];
					$('#custom-cells-events').html('<b>'+fd+'</b><br>'
							+content
							+'<br><br>'
							+'<input type="hidden" id="bid">'
							+'<input type="hidden" id="abledate">'
							+'<button id="reservf-btn">RESERV</button>')
					document.getElementById('bid').value = bizmid;
					document.getElementById('abledate').value = selectday;
				} else {
					$('#custom-cells-events').html('등록된 대관 가능 시간이 없습니다 😢');
				}
			}
		});
		$picker.data('datepicker').selectDate(new Date())
		</script>
		<script>
	
		//예약폼 열기
		$(document).on('click','#reservf-btn', function(){
			reservf();
		});
		function reservf(){
			if(isRun == true) { return; } isRun = true;
			$.ajax({
				type: 'Get',
				url: 'reservf',
				data: {
					bizm_id:$('#bid').val(),
					able_date: $('#abledate').val()
				},
				success: function(resultPage) {
					$('#resultArea').html(resultPage);
					isRun = false;
				},
				error: function() {
					alert("서버 오류 발생, 다시 시도해주세요.");
					location.reload();
				}
			});
		}
		</script>
	</div>
</body>
</html>
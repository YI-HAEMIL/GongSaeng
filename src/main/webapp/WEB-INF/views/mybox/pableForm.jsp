<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<link rel="stylesheet" href="resources/datepicker/datepicker.min.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/placeUpload.js"></script>
<script src="resources/datepicker/datepicker.min.js"></script>
<script src="resources/datepicker/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
<style>
select{
	width: 100px;
	height: 30px;
	border-style: solid;
	border-color: #e9ebf2;
	font-family:AppleSDGothicNeoM00;
}
#datepicker {
	width: 300px;
	height:32px;
}
</style>
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<br><p>장소 이용 가능 시간을 업로드하는 곳입니다.</p>
	<span>공생은 '확정 예약' 서비스를 제공합니다.<br>
	대관이 '반드시' 가능한 시간만 등록을 해주시기 바랍니다.</span>
	<br><br>
    <div>
    	<form>
    	<input type="hidden" id="place_id" value="${pVO.place_id}">
    	<input type="hidden" id="bizm_id" value="${pVO.bizm_id}">
    	<input type="text"
		       id="datepicker"
		       data-multiple-dates-separator=", "
		       data-position='bottom left'
		       placeholder="날짜를 선택해주세요(다중선택가능)"/>
		<select id="startTime">
			<option>시작 시간</option>
		</select>
		<select id="endTime" onchange="comparisonTime()">
			<option>종료 시간</option>
		</select>
		<br><br>
		<span id="able-submit">
			<input type="button" class="button" style="text-align: center;" value="UPLOAD">
		</span>&nbsp;&nbsp;
		<input type="reset"  class="button" value="RESET">
		</form>
    </div><br>
    <script>
    // datepicker jQuery 이용, 달력 출력
    $("#datepicker").datepicker({
    	language: 'ko',
    	multipleDates: true,
    	minDate: new Date(), // Now can select only dates, which goes after today
    });
    
    // option 값 넣어주기
    for (var i = 0; i < 49; i++) {
		var hour = '';
		var min = ':00';
		if ((Math.ceil(i / 2)) < 13) {
			hour = (Math.floor(i / 2));
		} else {
			hour = (Math.floor(i / 2));
		}
		hour = (Math.floor(i / 2));
		if (hour < 10) {
			hour = '0' + hour;
		}
		if (i % 2 != 0) {
			min = ':30';
		}
		$('#startTime').append('<option value='+hour+min+'>'
				+ hour + min
				+ '</option>');
		$('#endTime').append('<option value='+hour+min+'>'
				+ hour + min
				+ '</option>');
	}
    
    // 시작시간 종료시간 비교
    function comparisonTime(){
    	var startTime=$('#startTime option:selected').val().replace(":", "");
    	var endTime=$('#endTime option:selected').val().replace(":", "");
    	if(parseInt(startTime)>=parseInt(endTime)){
    		alert('종료 시간이 더 늦게 설정되어야 합니다');
    		$('#endTime').val("종료 시간").attr("selected","selected");
    	}
    	return;
    }
    </script>
	<div id="ableResult">
    </div>
</body>
</html>
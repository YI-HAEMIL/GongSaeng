<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
<link rel="stylesheet" href="resources/myLib/reservCSS.css" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/pageMove3.js"></script>
<script>
	var date = new Date();
	var usedate=$('#usedate').val();
	var reservid = 'P'+$('#pid').val()+'-'+(date.getMonth()+1)+date.getDate()
					+'-'+usedate.substr(5,2)+usedate.substr(usedate.length-2,2);
	document.getElementById('rid').value = reservid;
	document.getElementById('ridtd').innerText=reservid;
	
    // option 값 넣어주기
    if($('#sttime').val().substr(0,1)=='0'){
    	var st=$('#sttime').val().substr(1,1);
    } else {
    	var st=$('#sttime').val().substr(0,2);
    }
    if($('#edtime').val().substr(0,1)=='0'){
    	var et=$('#edtime').val().substr(1,1);
    } else {
    	var et=$('#edtime').val().substr(0,2);
    }
    console.log(st, et);
    // 숫자형으로 바꿔주기
    st*=1;
    et*=1;
    for (var i = st; i <= et; i++) {
		var hour = '';
		var min = ':00';
		
		hour = i;
		if (hour < 10) {
			hour = '0' + hour;
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
</head>
<body>
<c:if test="${msg != null}">
	<script>alert('${msg}')</script>
</c:if>
	<br><br>
	RESERVATION
	<hr width=160px><br><br>
	<div id="reservbox">
	<form>
		<table id="reservt">
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;예약 번호</td>
				<td id="ridtd">
					<input type="hidden" name="reserv_id" id="rid"
						style="border:0px; font-family:AppleSDGothicNeoM00; font-size:medium;">
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;장소 번호</td>
				<td><input type="hidden" name="place_id" id="pid" value="${aVO.place_id}">${aVO.place_id}</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;대관 날짜</td>
				<td>
					<input type="hidden" name="use_date" id="usedate" value="${aVO.able_date}">${aVO.able_date}
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;대관 시간</td>
				<td>
					<input type="hidden" id="sttime" value="${aVO.able_starttime}">
					<input type="hidden" id="edtime" value="${aVO.able_endtime}">
					<select id="startTime">
						<option>시작 시간</option>
					</select>
					<select id="endTime" onchange="comparisonTime()">
						<option>종료 시간</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;사용 인원</td>
				<td><input type="text" name="use_number" id="usenum">&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="nMessage" class="message"></span>
				</td>
			</tr>
			<tr>
				<td class="bth">&nbsp;&nbsp;&nbsp;&nbsp;사용 목적</td>
				<td><textarea name="use_purpose" id="purpose"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="pMessage" class="message"></span>
				</td>
			</tr>
		</table>
		<br>
		<button id="reserv-submit">SUBMIT</button>&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="reset">RESET</button>
	</form>
	</div>
	<br>
</body>
</html>
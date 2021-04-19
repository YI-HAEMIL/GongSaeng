<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usable Timetable</title>
<link rel="stylesheet" href="resources/myLib/mypageCSS.css"  type="text/css">
<link rel="stylesheet" href="resources/datepicker/datepicker.min.css"  type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script src="resources/gscript/placeUpload.js"></script>
<script src="resources/datepicker/datepicker.min.js"></script>
<script src="resources/datepicker/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
</head>
<body>
<c:if test="${msg!=null}">
	<script>alert('${msg}');</script>
</c:if>
	<div id="showabletime">
		<span> [ 등록 날짜/시간 확인 ]</span><br>
		<div id="custom-cells"></div>
		<div id="custom-cells-events"></div>
	</div>
	<script>
		var eventDates = [];
		var sentences = [];

		<c:forEach var="li" items="${avoList}">
		var day = '${li.able_date}';
		eventDates.push(day);

		var starttime = '${li.able_starttime}';
		var endtime = '${li.able_endtime}';
		var txt = "시작 시간: " + starttime + "<br>종료 시간: " + endtime;

		sentences.push(txt);
		</c:forEach>

		$picker = $('#custom-cells'),
		
		$picker.datepicker({
			language : 'ko',
			inline : true,
			onRenderCell :
			function(date, cellType) {
				var months = ['01','02','03','04','05','06','07','08','09','10','11','12']
				var myDate = date.getFullYear()+'-'+months[date.getMonth()]+'-'+((date.getDate()<10)?'0':'')+date.getDate();
				var myDay=date.getDate();
				
			    if (eventDates.indexOf(myDate) > -1) {
			    	return { 
			    		html: myDay+'<span class="dp-note"></span>'
			    	}
			    }
			},
			onSelect : function onSelect(fd, date) {
				var content = ''
				if (eventDates.indexOf(fd) > -1) {
					var selectday=fd;
					content = sentences[eventDates.indexOf(fd)];
					$('#custom-cells-events').html('<b>'+fd+'</b><br><br>'
							+content
							+'<br><br>'
							+'<input type="hidden" id="abledate">'
							+'<button id="adelete-submit">DELETE</button>')
					document.getElementById('abledate').value = selectday;
					console.log($('#abledate').val())
				} else {
					$('#custom-cells-events').html('');
				}
			}
		});
		$picker.data('datepicker').selectDate(new Date())
	</script>
	
	<br>
</body>
</html>
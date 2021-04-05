<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<link rel="stylesheet" href="resources/myLib/targetCSS.css?ver=1.2" type="text/css">
<script src="resources/gscript/jquery-3.2.1.min.js"></script>
<script>
var isRun=false;
$(document).on('click', '#mlogin', function() {
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'mlogin',
		data:{
			basicm_id:$('#id').val(),
			basicm_pwd:$('#password').val()
		},
		success:function(resultData){
			if(resultData.loginSuccess=='T') {
				alert(resultData.msg);
				location.reload();
				isRun=false;
			} else {
				alert(resultData.msg);
				$('#resultArea').load('mloginf');
			} 	
		},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
			$('#resultArea').load('mloginf');
		}	
	}); //ajax
});

$(document).on('click', '#bloginbtn', function() {
	bloginf();
});
function bloginf(){
	if(isRun == true) { return; } isRun = true;
	$.ajax({
		type:'Get',
		url:'bloginf',
		success:function(resultPage){
			$('#resultArea').html(resultPage);
			isRun=false;
			},
		error:function(){
			alert("서버 오류 발생, 다시 시도해주세요.");
			$('#resultArea').load('mloginf');
		}	
	}); //ajax
}
</script>
</head>
<body>
<c:if test="${msg != null }">
	<script>alert('${msg}')</script>
</c:if>
	<br><br>
	LOGIN
	<hr width=100px><br><br>
	<div id="loginbox">
        <h4>Member Login</h4>
        <span>가입시 입력하신 아이디와 비밀번호로 로그인이 가능합니다.</span><br><br>
			<table id="logint">
				<tr>
					<td>
						<input type="text" name="basicm_id" id="id" placeholder="ID"><br>
						<span id="iMessage" class="message"></span>
					</td>
					<td rowspan="2">
						<span id="mlogin"><input type="button" class="button" value="LOGIN" id="login"></span>
					</td>
				</tr>
				<tr>
					<td><input type="password" name="basicm_pwd" id="password" placeholder="PASSWORD"><br>
						<span id="pMessage" class="message"></span>
					</td>
				</tr>
			</table>				
		<br>
			<div style="display:inline-block; background-color:#f0f0f0; width:500px; height:100px;">
				<br>
				<span>시간과 돈을 들여 차근차근 꾸민 공간을<br> 다른 사람과 공유하고 새로운 추억을 쌓을 수 있는 기회.<br></span>
				<span id="bloginbtn" style="text-decoration: underline; color: blue; cursor: pointer;">비즈니스 회원 로그인</span><br>
			</div>
			<br><br>
	</div>
</body>
</html>
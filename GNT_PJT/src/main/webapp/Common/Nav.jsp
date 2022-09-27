<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style scoped>
		@import url("../Common/css/Nav.css?ver=1");
	</style>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(function() {
			
			if(localStorage.getItem('user')===null) {
				$('#login').css('display', 'block')
				$('#signup').css('display', 'block')
				$('#logout').css('display', 'none')
				$('.nav-inner #card').css('display', 'none')
				$('#admin').css('display', 'none')
				
			} else {
				$('#login').css('display', 'none')
				$('#signup').css('display', 'none')
				$('#logout').css('display', 'block')
				$('.nav-inner #card').css('display', 'block')
			}
			
			User = JSON.parse(localStorage.getItem('user'))
			if(User.isStaff=='1') {
				$('#admin').css('display', 'block')
			} else {
				$('#admin').css('display', 'none')
			}
			
			
			$('.logo').click(function() {
				location.href="../Main/Home.html"	
			})
			
			$('.nav-inner #main').click(function() {
				location.href="../Main/Main.jsp"
			})
			
			$('.nav-inner #donation').click(function() {
				location.href="../Donation/Donation.jsp"
			})
			
			$('.nav-inner #card').click(function() {
				location.href="../Card/Card.jsp"
			})
			
			$('.nav-inner #notice').click(function() {
				location.href="../Notice/Notice.jsp"
			})
			
			$('.nav-inner #event').click(function() {
				location.href="../Event/Event.jsp"
			})
		})
		
		$(function() {	
			$('#login').click(function() {
				location.href="../Main/LogIn.jsp"
			})
			
			$('#signup').click(function() {
				location.href="../Main/SignUp.jsp"
			})
			
			$('#logout').click(function() {
				localStorage.clear();
				location.href = "../Main/Main.jsp"
			})
			
			$('#admin').click(function() {
				location.href = "../Admin/admin.jsp"
			})
			
		})
		
				
	</script>
</head>

<body>
	<div class="nav row">
        <div class="nav-inner offset-1 col-4">
        	<img class="logo" src="../Common/img/logo.png">
       		<span id="login">로그인</span>
       		<span id="signup">회원가입</span>
       		<span id="logout">로그아웃</span>
       		<span id="admin">관리자페이지</span>
       	</div>
        <div class="nav-inner offset-2 col-4">
        	<span id="main">계좌</span>
       		<span id="donation">기부</span>
       		<span id="card">카드발급</span>
       		<span id="event">이벤트</span>
       		<span id="notice">공지사항</span>
       	</div>
    </div>
    
</body>
</html>
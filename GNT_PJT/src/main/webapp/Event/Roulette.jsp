<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="wheel/Winwheel.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
		<style scoped>
			@import url("css/Roulette.css?ver=1");
		</style>
		<script>
			$(window).on('load', function() {
				$('#event-roulette').addClass('loaded');
			});
			
			$(function() {
				$('body').css('height', '100%').css('background-color', '#cedbef4f')
				
				$('.start-roulette').click(function() {
					var userInfo = JSON.parse(localStorage.getItem('user'));
					startRoulette(userInfo)
				})
				
				$('.num').click(function() {
					$('#roulette').removeAttr('class').addClass("number-"+$(this).val())				
				})
				
				$('#rollRnd').click(function() {
					num = 1 + Math.round(Math.random()*9)
					$('#roulette').removeAttr('class').addClass("number-"+num)				
				})
			})
			
			
			
			function startRoulette(userInfo) {
				$.ajax({
					type: 'get',
					url: '../getRouletteWinner.do',
					data: {
						'userId': userInfo.userId,
					},
					success: function(res) {
						var randomNo = Math.random() * 4
						randomNo = Math.round(randomNo)
						if (res.message=='yes') {
							evenList = [0, 2, 4, 6, 8]
							$('#roulette').removeAttr('class').addClass("number-"+evenList[randomNo])
							setTimeout(() => {
								swal({
									title: "당첨!!",
									text: "당첨입니다! 이벤트 상품은 뭘까요?",
									icon: "success",
									button: true,
								})
								.then((val) => {
									location.href="../Event/Event.jsp"
								})	
							}, 2500);
							
						} else {
							oddList = [1, 3, 5, 7, 9]
							$('#roulette').removeAttr('class').addClass("number-"+oddList[randomNo])
							setTimeout(() => {
								swal({
									title: "아쉬워요!",
									text: "아쉽게도 선택받지 못했습니다. 내일 다시 도전해주세요!",
									icon: "error",
									button: true,
								})
								.then((val) => {
									location.href="../Event/Event.jsp"
								})	
							}, 2500);
							
						}
					},
					error: function(err) {
						console.log(err)	
					}
				})
			}

		</script>
	</head>
	
	<body>
		<div id="event-roulette">
			<div id="loader-wrapper">            
				<div id="loader"></div>
				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
			<%@ include file="../Common/Nav.jsp" %><br>
			<div class="container">
				<h2 class="title">오늘의 추첨</h2>
				<div class="dst"></div>
				<div class="ladder1"></div>
				<div class="ladder2"></div>
				<div class="ladder3"></div>
				<div class="ladder4"></div>
				<ul id="roulette">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<div>
					<img src="img/Roulette1.png" class="roulette-img1">
					<img src="img/Roulette2.png" class="roulette-img2">
					<img src="img/firework.png" class="roulette-img3">
					<img src="img/firework2.png" class="roulette-img4">
					<button class="start-roulette">실행</button>
				</div>
				
			</div>

		</div>
	</body>
</html>
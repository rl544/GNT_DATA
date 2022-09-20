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
		<style scoped>
			@import url("css/Event.css?ver=1");
		</style>
		<script>
			$(window).on('load', function() {
				$('#donation').addClass('loaded');
			});
			
			$(function() {
				$('body').css('height', '100%').css('background-color', '#cedbef4f')
				
				$('.event-card').click(function() {
					var userInfo = JSON.parse(localStorage.getItem('user'));
					if ($(this).attr('value') == '1') {
						checkQuiz(userInfo)
					} else if ($(this).attr('value') == '2') {
						checkRoulette(userInfo)
					} else {
						checkGame(userInfo)
					}
				})
				
			})
			
			function checkQuiz(userInfo) {
				$.ajax({
					type: 'get',
					url: '../checkQuizPlayed.do',
					data: {
						'userId': userInfo.userId,
					},
					success: function(res) {
						if(res.message=='yes') {
							location.href = 'Quiz.jsp'
						} else {
							swal({
								title: "퀴즈 불가!",
								text: "내일 다시 만나요!",
								icon: "info",
								button: true,
							})
						}
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
			
			function checkRoulette(userInfo) {
				$.ajax({
					type: 'get',
					url: '../checkRoulettePlayed.do',
					data: {
						'userId': userInfo.userId,
					},
					success: function(res) {
						if(res.message=='yes') {
							location.href = 'Roulette.jsp'
						} else {
							swal({
								title: "추첨 불가!",
								text: "내일 다시 만나요!",
								icon: "info",
								button: true,
							})
						}
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
			
			function checkGame(userInfo) {
				$.ajax({
					type: 'post',
					url: '../checkGamePlayed.do',
					data: {
						'userId': userInfo.userId,
					},
					success: function(res) {
						var cardInfo = JSON.parse(localStorage.getItem('Card'));
						if (cardInfo==null) {
							swal({
								title: "카드 준비!",
								text: "게임을 시작하기 전에 카드 저장을 먼저 해주세요!",
								icon: "info",
								button: true,
							})
						} else {
							if (res.message=='yes') {
								console.log(res)
								localStorage.setItem('gameInfo', JSON.stringify(res.game))
								location.href = 'Game.jsp'
							} else if (res.message=='no') {
								swal({
									title: "게임 불가!",
									text: "내일 다시 만나요!",
									icon: "info",
									button: true,
								})
							} else if (res.message=='end') {
								swal({
									title: "게임 정복!",
									text: "게임의 결말을 보고온자 돌아가라!",
									icon: "info",
									button: true,
								})
							}
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
		<div id="donation">
			<div id="loader-wrapper">            
				<div id="loader"></div>
				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
			<%@ include file="../Common/Nav.jsp" %><br>
			
			<div class="container">
				<h2 class="title">이벤트</h2>
				<div class="d-flex justify-content-around event-list">
					<div class="event-card" value="1">
						<div class="event-background">
							<div class="event-content d-flex justify-content-center align-items-center" style="flex-direction: column;">
								<!-- <img src="img/no1.png">	 -->
								<div style="width: 100%;">
									<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000; font-size: 3rem; margin-left: 1.5rem; margin-bottom: 0px;">No.1</h1>
								</div>				
								<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000; font-size: 3.5rem;">오늘의 퀴즈</h1>
							</div>
						</div>
					</div>
					<div class="event-card" value="2">
						<div class="event-background">
							<div class="event-content d-flex justify-content-center align-items-center" style="flex-direction: column;">
								<div style="width: 100%;">
									<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000; font-size: 3rem; margin-left: 1.5rem; margin-bottom: 0px;">No.2</h1>
								</div>				
								<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000; font-size: 3.5rem;">오늘의 추첨</h1>			
							</div>
						</div>		
					</div>
					<div class="event-card" value="3">
						<div class="event-background">
							<div class="event-content d-flex justify-content-center align-items-center" style="flex-direction: column;">
								<div style="width: 100%;">
									<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000; font-size: 3rem; margin-left: 1.5rem; margin-bottom: 0px;">No.3</h1>
								</div>				
								<h1 style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000; font-size: 3.5rem;">오늘의 게임</h1>					
							</div>
						</div>		
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>
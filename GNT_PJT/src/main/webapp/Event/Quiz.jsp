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
			@import url("css/Quiz.css?ver=1");
		</style>
		<script>
			$(window).on('load', function() {
				$('#quiz').addClass('loaded');
			});
			
			$(function() {
				$('body').css('height', '100%').css('background-color', '#cedbef4f');
				var userInfo = JSON.parse(localStorage.getItem('user'));
				getQuiz(userInfo)
				var result = "0"
				
				$('.answer-1').click(function() {
					$('.answer-1').css('background-color', '#dd5790').css('opacity', '1')
					$('.answer-2').css('background-color', '#ffe07d').css('opacity', '0.6')
					$('.answer-3').css('background-color', '#b3e59f').css('opacity', '0.6')
					$('.answer-4').css('background-color', '#90d8f9').css('opacity', '0.6')
					result = "1"
				})
				
				$('.answer-2').click(function() {
					$('.answer-2').css('background-color', '#ffd064').css('opacity', '1')
					$('.answer-1').css('background-color', '#df75a5').css('opacity', '0.6')
					$('.answer-3').css('background-color', '#b3e59f').css('opacity', '0.6')
					$('.answer-4').css('background-color', '#90d8f9').css('opacity', '0.6')
					result = "2"
				})
				
				$('.answer-3').click(function() {
					$('.answer-3').css('background-color', '#95d6a4').css('opacity', '1')
					$('.answer-1').css('background-color', '#df75a5').css('opacity', '0.6')
					$('.answer-2').css('background-color', '#ffe07d').css('opacity', '0.6')
					$('.answer-4').css('background-color', '#90d8f9').css('opacity', '0.6')
					result = "3"
				})
				
				$('.answer-4').click(function() {
					$('.answer-4').css('background-color', '#75cef9').css('opacity', '1')
					$('.answer-1').css('background-color', '#df75a5').css('opacity', '0.6')
					$('.answer-2').css('background-color', '#ffe07d').css('opacity', '0.6')
					$('.answer-3').css('background-color', '#b3e59f').css('opacity', '0.6')
					result = "4"
				})
				
				$('.quiz-btn').click(function() {
					if (result == "0") {
						swal({
							title: "퀴즈 에러!",
							text: "정답을 선택한 이후, 제출하기 버튼을 눌러주세요.",
							icon: "warning",
							button: true,
						})
					} else {
						$.ajax({
							type: 'get',
							url: '../submitAnswer.do',
							data: {
								'userId': userInfo.userId,
								'userAnswer': result,
							},
							success: function(res) {
								if (res.message=='no') {
									swal({
										title: "땡!",
										text: "아쉽게도 틀렸습니다. 내일 다시 도전해주세요!",
										icon: "error",
										button: true,
									})
									.then((val) => {
										location.href="../Event/Event.jsp"
									})
								} else {
									swal({
										title: "정답!!",
										text: "정답입니다! " + res.mileage + "MP가 적립되었습니다.",
										icon: "success",
										button: true,
									})
									.then((val) => {
										location.href="../Event/Event.jsp"
									})
								}
							},
							error: function(err) {
								console.log(err)
							}
						})
					}
				})
			})
			
			function getQuiz(userInfo) {
				$.ajax({
					type: 'get',
					url: '../getQuiz.do',
					data: {
						'userId': userInfo.userId,
					},
					success: function(res) {
						if (res.message=='yes') {
							Quiz = res.notices
							$('.quiz-question').text('Q. ' + Quiz.quizContent)
							$('.answer-1').text('A. ' + Quiz.select1)
							$('.answer-2').text('B. ' + Quiz.select2)
							$('.answer-3').text('C. ' + Quiz.select3)
							$('.answer-4').text('D. ' + Quiz.select4)							
						} else {
							location.href = "../Error/Error.jsp"
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
		<div id="quiz">
			<div id="loader-wrapper">            
				<div id="loader"></div>
				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
			<%@ include file="../Common/Nav.jsp" %><br>
			<div class="container">
				<div class="quiz">
					<h2 class="title">오늘의 퀴즈</h2>
					
					<div class="row">
						<div class="col-8 quiz-question">
							
						</div>
						<div class="col-4 quiz-image">
							<img src="img/quiz.png">
						</div>
					</div>	
				</div>
				
				<div class="container">
					<div class="d-flex justify-content-center my-5">
						<div class="answer answer-1"></div>
						<div class="answer answer-2"></div>
						<div class="answer answer-3"></div>
						<div class="answer answer-4"></div>
					</div>
				</div>
				<div style="width: 100%; text-align: center; margin-bottom: 3rem;">
					<button class="quiz-btn">제출하기</button>
				</div>
			</div>
		</div>
	</body>
</html>
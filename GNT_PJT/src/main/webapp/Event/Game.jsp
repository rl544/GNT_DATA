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
			@import url("css/Game.css?ver=1");
		</style>
		<script>
			$(window).on('load', function() {
				$('#game').addClass('loaded');
			});
			
			var diceValue = 0;
			var gameInfo = {};
			
			$(function() {
				$('body').css('height', '100%').css('background-color', '#cedbef4f')
				
				gameInfo = JSON.parse(localStorage.getItem('gameInfo'))
				$('.round-trip').html(gameInfo.roundTrip+' 바퀴')
				$('.game-img').css('left', gameInfo.left+'px').css('top', gameInfo.top+'px')
				if (gameInfo.roundTrip <= 5) {
					$('#part2').text('100MP')
					$('#part4').text('10원')
					$('#part6').text('200MP')
					$('#part9').text('100MP')
					$('#part12').text('10원')
					$('#part14').text('100MP')
					$('#part16').text('20원')
					$('#part20').text('200MP')
				} else {
					$('#part2').text('200MP')
					$('#part4').text('20원')
					$('#part6').text('400MP')
					$('#part9').text('200MP')
					$('#part12').text('20원')
					$('#part14').text('200MP')
					$('#part16').text('40원')
					$('#part20').text('400MP')
				}
				
				if (gameInfo.gameLocation=='0' || gameInfo.gameLocation=='7' || gameInfo.gameLocation=='11' || gameInfo.gameLocation=='18') {
					$('.side').css('background', 'linear-gradient(45deg, #6c6c6c, #c1c1c1, #ececec)')
					$('.dot').css('box-shadow', 'inset 0 0 10px rgb(65 71 80 / 50%)')
				} else if (gameInfo.gameLocation >= '1' && gameInfo.gameLocation < '7') {
					$('.side').css('background', 'linear-gradient(45deg, #dc2070, #df75a5, #d7b5c4)')
					$('.dot').css('box-shadow', 'inset 0 0 10px rgb(204 0 0 / 50%)')
				} else if (gameInfo.gameLocation >= '8' && gameInfo.gameLocation < '11') {
					$('.side').css('background', 'linear-gradient(45deg, #ffc200, #ffe07d, #ece7c6)')
					$('.dot').css('box-shadow', 'inset 0 0 10px rgb(204 152 0 / 50%)')
				} else if (gameInfo.gameLocation >= '12' && gameInfo.gameLocation < '18') {
					$('.side').css('background', 'linear-gradient(45deg, #8cdf6b, #b3e59f, #deefd8)')
					$('.dot').css('box-shadow', 'inset 0 0 10px rgb(60 204 0 / 50%)')
				} else {
					$('.side').css('background', 'linear-gradient(45deg, #52beef, #90d8f9, #c9e4f1)')
					$('.dot').css('box-shadow', 'inset 0 0 10px rgb(43 106 212 / 50%)')
				}
				
			})
			
			function moveIcon() {
				gameInfo = JSON.parse(localStorage.getItem('gameInfo'))
				userInfo = JSON.parse(localStorage.getItem('user'))
				present = gameInfo.gameLocation
				if (present >= 0 && present < 7) {
					topVal = gameInfo.top
					leftVal = gameInfo.left
					if (present+diceValue >= 0 && present+diceValue < 7) {
						$('.game-img').css('left', (leftVal+diceValue*125)+'px');
						present = present+diceValue
						doGame()
					} else if (present+diceValue >= 7 && present+diceValue < 11) {
						$('.game-img').css('left', (leftVal+(7-present)*125)+'px');
						setTimeout(() => {
							$('.game-img').css('top', (topVal+(present+diceValue-7)*100)+'px');
							present = present+diceValue
							doGame()
						}, 1000);
						
					} else if (present+diceValue >= 11 && present+diceValue < 18) {
						$('.game-img').css('left', (leftVal+(7-present)*125)+'px');
						setTimeout(() => {
							$('.game-img').css('top', (topVal+400)+'px');
						}, 1000);
						setTimeout(() => {
							$('.game-img').css('left', (leftVal-(present+diceValue-12)*125)+'px');
							present = present+diceValue
							doGame()
						}, 2000);
					}
					
				} else if (present >= 7 && present < 11) {
					topVal = $('.game-img').offset().top
					leftVal = $('.game-img').offset().left
					if (present+diceValue >= 7 && present+diceValue < 11) {
						$('.game-img').css('top', (topVal+diceValue*100)+'px');
						present = present+diceValue
						doGame()
					} else if (present+diceValue >= 11 && present+diceValue < 18) {
						$('.game-img').css('top', (topVal+(11-present)*100)+'px');
						setTimeout(() => {
							$('.game-img').css('left', (leftVal-(present+diceValue-11)*125)+'px');
							present = present+diceValue
							doGame()
						}, 1000);
					}
				} else if (present >= 11 && present < 18) {
					topVal = $('.game-img').offset().top
					leftVal = $('.game-img').offset().left
					console.log(present)
					console.log(diceValue)
					if (present+diceValue >= 11 && present+diceValue < 18) {
						$('.game-img').css('left', leftVal-diceValue*125+'px');
						present = present+diceValue
						doGame()
					} else if (present+diceValue >= 18 && present+diceValue <= 21) {
						$('.game-img').css('left', (leftVal-(18-present)*125)+'px');
						setTimeout(() => {
							$('.game-img').css('top', (topVal-(present+diceValue-18)*100)+'px');
							present = present+diceValue
							doGame()
						}, 1000);
					} else if (present+diceValue >= 22) {
						$('.game-img').css('left', (leftVal-(18-present)*125)+'px');
						setTimeout(() => {
							$('.game-img').css('top', (topVal-400)+'px');
						}, 1000);
						setTimeout(() => {
							$('.game-img').css('left', (leftVal-(18-present)*125+(present+diceValue-22)*125)+'px');
							if (present+diceValue==22) {
								present = 0
							} else if (present+diceValue==23) {
								present = 1
							}
							gameInfo.roundTrip = gameInfo.roundTrip+1
							localStorage.setItem('gameInfo', JSON.stringify(gameInfo));
							$('.round-trip').html(gameInfo.roundTrip+' 바퀴')
							doGame()
						}, 2000);
					}
				} else if (present >= 18 && present <= 21) {
					topVal = $('.game-img').offset().top
					leftVal = $('.game-img').offset().left
					if (present+diceValue >= 18 && present+diceValue <= 21) {
						$('.game-img').css('top', topVal-(diceValue*100)+'px');
						present = present+diceValue
						doGame()
					} else if (present+diceValue >= 22) {
						$('.game-img').css('top', topVal-(22-present)*100+'px');
						setTimeout(() => {
							$('.game-img').css('left', leftVal+(present+diceValue-22)*125+'px');
							gameInfo.roundTrip = gameInfo.roundTrip+1
							localStorage.setItem('gameInfo', JSON.stringify(gameInfo));
							$('.round-trip').html(gameInfo.roundTrip+' 바퀴')
							present = present+diceValue-22
							doGame()
						}, 1000);
					}
				}
			}
			
			function doGame() {
				gameInfo = JSON.parse(localStorage.getItem('gameInfo'))
				userInfo = JSON.parse(localStorage.getItem('user'))
				setTimeout(() => {
					$.ajax({
						type: 'post',
						url: '../submitGame.do',
						data: {
							'userId': userInfo.userId,
							'gameLocation': present,
							'roundTrip': gameInfo.roundTrip,
							'left': $('.game-img').offset().left,
							'top': $('.game-img').offset().top
						},
						success: function(res) {
							if (res.message=='yes') {
								if (present < gameInfo.gameLocation) {
									swal({
										title: "축 왕복!",
										text: "왕복에 성공하셨습니다!",
										icon: "success",
										button: "확인",
									})
									.then((val) => {
										if (present==11) {
											swal({
												title: "처음으로..",
												text: "아쉽지만, 처음으로 돌아갈게요ㅠ",
												icon: "info",
												button: "확인",
											})
											.then((val) => {
												location.href="Event.jsp"
											})
										} else if (present==18) {
											swal({
												title: "내일 휴가..",
												text: "아쉽지만, 내일은 휴식을 가질게요!",
												icon: "info",
												button: "확인",
											})
											.then((val) => {
												location.href="Event.jsp"
											})
										} else {
											swal({
												title: "당첨",
												text: "당첨되셨습니다.",
												icon: "success",
												button: "확인",
											})
											.then((val) => {
												location.href="Event.jsp"
											})
										}
									})
								} else {
									if (present==11) {
										swal({
											title: "처음으로..",
											text: "아쉽지만, 처음으로 돌아갈게요ㅠ",
											icon: "info",
											button: "확인",
										})
										.then((val) => {
											location.href="Event.jsp"
										})
									} else if (present==18) {
										swal({
											title: "내일 휴가..",
											text: "아쉽지만, 내일은 휴식을 가질게요!",
											icon: "info",
											button: "확인",
										})
										.then((val) => {
											location.href="Event.jsp"
										})
									} else {
										swal({
											title: "당첨",
											text: "당첨되셨습니다.",
											icon: "success",
											button: "확인",
										})
										.then((val) => {
											location.href="Event.jsp"
										})
									}
								}
								
								
							} else if (res.message=='bang') {
								if (present < gameInfo.gameLocation) {
									swal({
										title: "축 왕복!",
										text: "왕복에 성공하셨습니다!",
										icon: "success",
										button: "확인",
									})
									.then((val) => {
										swal({
											title: "꽝",
											text: "아쉽지만, 선물은 없습니다.",
											icon: "success",
											button: "확인",
										})
										.then((val) => {
											location.href="Event.jsp"											
										})
									})
								} else {
									swal({
										title: "꽝",
										text: "아쉽지만, 선물은 없습니다.",
										icon: "success",
										button: "확인",
									})
									.then((val) => {
										location.href="Event.jsp"
									})
								}
							} else if (res.message=='again') {
								$.ajax({
									type: 'get',
									url: '../checkGamePlayed.do',
									data: {
										'userId': userInfo.userId,
									},
									success: function(res) {
										var cardInfo = JSON.parse(localStorage.getItem('Card'));
										if (res.message=='yes') {
											console.log(res)
											localStorage.setItem('gameInfo', JSON.stringify(res.game))
											swal({
												title: "다시 한 번 더!",
												text: "한 번 더 돌리겠습니다!!",
												icon: "success",
												button: "확인",
											})
											.then((val) => {
												location.reload()												
											})
										}
									},
									error: function(err) {
										console.log(err)
									}
								})
								
							} else if (res.message=='no') {
								location.href = "../Error/Error.jsp"
							}
						},
						error: function(err) {
							console.log(err)
						}
					})	
				}, 1000);
			}
			
			/* Dice 관련 */
			$(function() {
				var rollTimeout;
				
				function setVal(num, val) {
				  var dices = document.querySelectorAll('.dice');
				  var dice = dices.item(num - 1);
				  if (!dice) return;
				  dice.setAttribute('data-val', val);
				}
				
				function toggleRoll() {
				  setVal(1, 0);
				}
				
				function getRand() {
				  return Math.round(Math.random() * 5 + 1);
				}
				
				function setVals() {
					diceValue = getRand()
					setVal(1, diceValue);
					setTimeout(() => {
						moveIcon()
					}, 1000);
				}
				
				function rollDice() {
				  if (rollTimeout) clearTimeout(rollTimeout);
				  toggleRoll();
				  rollTimeout = setTimeout(function() {
				    setVals();
				  }, 1000);
				}
				
				/* window.onload = rollDice; */
				
				$('.clickDice').click(rollDice);
			})
			
				
				
		</script>
	</head>
	
	<body>
		<div id="game">
			<div id="loader-wrapper">            
				<div id="loader"></div>
				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
			<%@ include file="../Common/Nav.jsp" %><br>
			<div class="container">
				<h2 class="title">오늘의 게임</h2>
				<div class="round-trip"></div>
				<div class="game-table">
					<img class="game-img" src="img/Gbangul.png">
					<div class="d-flex justify-content-center">
						<div id="part0" class="game-box top_left">도착</div>
						<div id="part1" class="game-box top">꽝</div>
						<div id="part2" class="game-box top">1MP</div>
						<div id="part3" class="game-box top">꽝</div>
						<div id="part4" class="game-box top">1원</div>
						<div id="part5" class="game-box top">꽝</div>
						<div id="part6" class="game-box top">2MP</div>
						<div id="part7" class="game-box top_right">한 번 더!</div>
					</div>
					<div class="d-flex justify-content-between" style="padding-left: 55px; padding-right: 55px;">
						<div>
							<div id="part21" class="game-box left">꽝</div>
							<div id="part20" class="game-box left">2MP</div>
							<div id="part19" class="game-box left">꽝</div>
						</div>
						<div class="clickDice">
							<div class="dice-title">클릭해서 주사위를 돌려봐요!</div>
							<div class="container d-flex justify-content-center">
							  <div class="dice dice_1">
							    <div class="cube">
							      <div class="side side_1">
							        <span class="dot dot_5"></span>
							      </div>
							      <div class="side side_2">
							        <span class="dot dot_3"></span><span class="dot dot_7"></span>
							      </div>
							      <div class="side side_3">
							        <span class="dot dot_3"></span><span class="dot dot_5"></span><span class="dot dot_7"></span>
							      </div>
							      <div class="side side_4">
							        <span class="dot dot_1"></span><span class="dot dot_3"></span><span class="dot dot_7"></span><span class="dot dot_9"></span>
							      </div>
							      <div class="side side_5">
							        <span class="dot dot_1"></span><span class="dot dot_3"></span><span class="dot dot_5"></span><span class="dot dot_7"></span><span class="dot dot_9"></span>
							      </div>
							      <div class="side side_6">
							        <span class="dot dot_1"></span><span class="dot dot_4"></span><span class="dot dot_7"></span><span class="dot dot_3"></span><span class="dot dot_6"></span><span class="dot dot_9"></span>
							      </div>
							    </div>
							  </div>
							
							  
							</div>
						</div>
						<div>
							<div id="part8" class="game-box right">꽝</div>
							<div id="part9" class="game-box right">1MP</div>
							<div id="part10" class="game-box right">꽝</div>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<div id="part18" class="game-box bottom_left">내일 휴가</div>
						<div id="part17" class="game-box bottom">꽝</div>
						<div id="part16" class="game-box bottom">1원</div>
						<div id="part15" class="game-box bottom">꽝</div>
						<div id="part14" class="game-box bottom">1MP</div>
						<div id="part13" class="game-box bottom">꽝</div>
						<div id="part12" class="game-box bottom">1원</div>
						<div id="part11" class="game-box bottom_right">처음으로</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
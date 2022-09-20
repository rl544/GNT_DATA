<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<style scoped>
		@import url("css/Card.css?ver=1");
		@import url("css/Fonts.css?ver=1");
	</style>

	<script>

		$(window).on('load', function() {
			$('#card').addClass('loaded');
		});
		
		$(function() {
		    $("#draggable3").draggable({ containment: "#containment-wrapper", scroll: false }, { stop: function () {
		        const left_position = $(this).offsetLeft;
		        const top_position = $(this).offsetTop;
		    	}
			});
		});
		
		const gradients = [ 
			'ffffff', '000000',
			'bcbcbc','999999',
			'6a6a6a',
		    'ffaaaa', 'c7004c',
		    'fa4659', 'ff0592',
		    'e1248f', 'f9fd50', 
		    'fc8a15', 'fff6a2',
		    'f9d00f', 'd39e00',
		    '26baee', '9fe8fa',
		    '303481', '226b80',
		    '3d6cb9', '00bd56',
		    '55968f', '8acbbb',
		    '22805b', '26af13',
		    '651893', '4d3664',
		    '8f71ff', 'bab5f6',
		    'a116ab'
		];
		
		const fonts = [
			'덕온공주체:국립한글박물관:DeogonPrincess',
			'한컴 울주 반구대 암각화체:울주문화재단:HancomUljuBangudae',
			'다이어리체:얼리폰트:EarlyFontDiary',
			'혀니고딕:얼리폰트:EF_hyunygothic',
			'쿠키런:데브시스터즈(주):CookieRun-Regular',
			'정신차렷체:얼리폰트:EF_WAKEUP',
			'MICE고딕:한국MICE협회X문화체육관광부:MICEGothic Bold',
			'조선100년체:조선일보:ChosunCentennial',
			'밀양영남루체:밀양시:MYYeongnamnu',
			'읏찬체:OK홀딩스대부(주):OKCHAN',
			'평창평화체:평창군:PyeongChangPeace-Bold',
			'울산중구전용서체:울산광역시중구:ulsanjunggu',
			'HBIOS-SYS:이민서:HBIOS-SYS',
			'마비옛체:㈜넥슨코리아:MabinogiClassicR',
			'길벗체 Rainbow:비온뒤무지개재단:GilbeotRainbow',
			'교보손글씨 2020 박도연:교보문고:KyoboHandwriting2020A',
			'상주경천섬체:상주시청X투게더그룹:SANGJUGyeongcheonIsland',
			'KITA:한국무역협회:-KITA-Regular',
			'레페리포인트 Oblique:레페리X윤디자인:LeferiPoint-WhiteObliqueA',
			'HS산토끼체:토끼네활자공장:HS-Regular',
			'강원교육튼튼체:강원도교육청X헤움디자인:GangwonEduPowerExtraBoldA',
			'강원교육모두체:강원도교육청X헤움디자인:GangwonEdu_OTFBoldA',
			'수트:SUNN YOUN:SUIT-Medium',
			'충북대직지체:충북대학교:CBNUJIKJI'
		]
		
		$(function() {
			$('body').css('height', '100%').css('background-color', '#bee7df29')
			
			var userInfo = JSON.parse(localStorage.getItem('user'));
			var accountInfo = JSON.parse(localStorage.getItem('account'));
			var Card = JSON.parse(localStorage.getItem('Card'))
			
			if (userInfo==null) {
				swal({
					title: "이용 불가!",
					text: "회원가입 이후 사용해주세요!",
					icon: "warning",
					button: "확인",
				}).then((val) => {
					location.href = "../Main/Main.jsp"
				})
			} else if (accountInfo==null) {
				swal({
					title: "이용 불가!",
					text: "계좌 생성 이후 사용해주세요!",
					icon: "warning",
					button: "확인",
				}).then((val) => {
					location.href = "../Main/Main.jsp"
				})
			}
			
			if (Card==null) {
				var isFront = true;
				var frontFontColor = '#ffffff';
				var backFontColor = '#ffffff';
				var frontBackgroundColor = 'white';
				var backBackgroundColor = 'white';
				var emo = '0';
				var frontFont = "";
				var backFont = "";		
				var card_content = "";
			} else {
				var isFront = true;
				var frontFontColor = Card.fontColorFront;
				var backFontColor = Card.fontColorBack;
				var frontBackgroundColor = Card.bgFront;
				var backBackgroundColor = Card.bgBack;
				var emo = Card.emoId;
				var frontFont = Card.fontFront;
				var backFont = Card.fontBack;		
				var card_content = Card.cardContent;	
			}
			
			checkCard(userInfo)
			
			$('.front-card').click(function() {
				changeFrontCard()
			})
			
			$('.back-card').click(function() {
				changeBackCard()
			})
			
			$('.font__color-black').click(function() {
				changeFontColorBlack()
			});
			
			$('.font__color-white').click(function() {
				changeFontColorWhite()
			});
			
			$('#tab3').click(function() {
				$('#card__content').focus();
			})
			
			$('#card__content').click(function() {
				$('#card__content').focus();
			})
			
			$('#backGroundColorList').on('click', '.item-gradient', function() {
				if (isFront == true) {
					$('#front').css('background-color', '#' + $(this).text())
					$('.emo').css('background-color', '#' + $(this).text())
					frontBackgroundColor = $(this).text();
				} else {
					$('#back').css('background-color', '#' + $(this).text())
					backBackgroundColor = $(this).text();
				}
			})
			
			$('#emoList').on('click', '.item-gradient', function() {
				if (isFront == true) {
					if ($(this).text() == '미스터 비') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/1.png" class="emo" style="width: 150px; height: 157px;">')
						emo = "1"
					} else if ($(this).text() == '엔젤 케이') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/2.png" class="emo" style="width: 150px; height: 157px;">')
						emo = "2"
					} else if ($(this).text() == '바우 와우') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/3.png" class="emo" style="width: 150px; height: 157px;">')
						emo = "3"
					} else if ($(this).text() == '엔젤 엔') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/4.png" class="emo" style="width: 150px; height: 157px;">')
						emo = "4"
					} else if ($(this).text() == 'G방울') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/5.png" class="emo" style="width: 150px; height: 157px;">')
						emo = "5"
					} else if ($(this).text() == '토리') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/6.png" class="emo" style="width: 150px; height: 157px;">')
						emo = "6"
					} else {
						$('#draggable3').empty();
						emo = "0"
					}
				} else {
					swal({
						title: "사용 불가!",
						text: "뒷면에서는 이모티콘을 변경할 수 없습니다.",
						icon: "warning",
						button: "확인!",
					})
				}
				$('.emo').css('background-color', '#'+frontBackgroundColor);
			})
			
			$('#FontList').on('click', '.item-gradient', function() {
				if (isFront == true) {
					$('.front .card__content').css("font-family", $(this).attr('name'));
					frontFont = $(this).attr('name')
				} else {
					$('.back .card__ccv').css("font-family", $(this).attr('name'));
					$('.back .card__owner').css("font-family", $(this).attr('name'));
					$('.back .card__expiry-date').css("font-family", $(this).attr('name'));
					$('.back .card__number').css("font-family", $(this).attr('name'));
					backFont = $(this).attr('name')
				}
			})
			
			$('.change-content').click(function() {
				$('.card__content').text($('.content-input').val())
				card_content = $('.content-input').val()
				$('.content-input').val("")
			})
			
			$('.card_save_btn').click(function() {
				saveCard(userInfo)
			})
			
			$('.card_issue_btn').click(function() {
				issueCard(userInfo)
			})
			
			$('.card_reset_btn').click(function() {
				resetCard()
			})
			
			
			var idx = 0;
			var fontIdx = 0;
			var Card = JSON.parse(localStorage.getItem('Card'));
			var userInfo = JSON.parse(localStorage.getItem('user'));
			
			
			if (userInfo.totalDonation >= 1000000) {
				new_gradients = gradients
				new_fonts = fonts
			} else if (userInfo.totalDonation >= 600000 && userInfo.totalDonation <= 1000000) {
				new_gradients = gradients.slice(0, 25)
				new_fonts = fonts.slice(0, 20)
			} else if (userInfo.totalDonation >= 300000 && userInfo.totalDonation <= 600000) {
				new_gradients = gradients.slice(0, 20)
				new_fonts = fonts.slice(0, 16)
			} else if (userInfo.totalDonation >= 100000 && userInfo.totalDonation <= 300000) {
				new_gradients = gradients.slice(0, 15)
				new_fonts = fonts.slice(0, 12)
			} else {
				new_gradients = gradients.slice(0, 10)
				new_fonts = fonts.slice(0, 8)
			}
			if (Card.cardId!=null) {
				if (Card.isUniqueColor=="1") {
					new_gradients.push('ff0000', '524e4e', '8bffff', '4ef037', 'a100ff')
				}
				
				if (Card.isUniqueFont=="1") {
					new_fonts.push('한림고딕체:한림대학교의료원:HallymGothic-Regular',
							'추사 사랑체:예산군:ChusaLove',
							'카페24 써라운드:카페24:Cafe24Ssurround',
							'원스토어 모바일POP체:(주)원스토어:ONE-Mobile-POP')
				}				
			}
			
			idx = showBackgroundAfter(idx);
			
			$('#arrow-before').click(function() {
				idx = showBackgroundBefore(idx)
			})
			
			$('#arrow-after').click(function() {
				idx = showBackgroundAfter(idx)
				if (idx==new_gradients.length) {
					idx = 0
				}
			})
			
			$('li[title=Emoticon]').click(function() {
				const emos = [ 
				    '../Card/img/1.png',
				    '../Card/img/2.png',
				    '../Card/img/3.png',
				    '../Card/img/4.png',
				    '../Card/img/5.png',
				    '../Card/img/6.png',
				];
				const emos_name = ['미스터 비', '엔젤 케이', '바우 와우', '엔젤 엔', 'G방울', '토리']
				$('#emoList').empty();
				for(var i=0; i<emos.length ;i++){
					$('#emoList').append("<li class=item-gradient><img class=tabs-emo src="+emos[i]+"><span>"+emos_name[i]+"</span></li>")
				}
				$('#emoList').append('<li class="item-gradient reset-emo"><span>임티 제거</span></li>')
				
			})
			
			$('li[title=Font]').click(function() {
				fontIdx = 0;
				changeFonts(fontIdx)
			})
			
			$('#arrow-before-font').click(function() {
				if (fontIdx==0) {
					fontIdx = new_fonts.length-4
				} else {
					fontIdx -= 4
				}
				changeFonts(fontIdx)
				
			})
			
			$('#arrow-after-font').click(function() {
				if (fontIdx==new_fonts.length-4) {
					fontIdx = 0
				} else {
					fontIdx += 4
				}
				changeFonts(fontIdx)
			})
		})
		
		function checkCard(userInfo) {
			/* 카드 조회 */
			$.ajax({
				type: 'get',
				url: '../getCard.do',
				data: {
					'userId': userInfo.userId
				},
				success: function(res) {
					console.log(res)
					if(res.message=='no') {
						swal({
							title: "발급 완료!",
							text: "이미 발급한 이력이 존재합니다. 자세한 사항은 고객센터에 문의하십시오.",
							icon: "info",
							buttons: true,
						})
						.then((val) => {
							location.href = "../Main/Main.jsp"
						})
					} else {
						if (res.card!=null) {
							Card = res.card
							localStorage.setItem('Card', JSON.stringify(Card))
							var today = new Date();
							console.log(Card)
							$('.card--front').css('background-color', '#'+Card.bgFront);
							$('.card--back').css('background-color', '#'+Card.bgBack);
							$('.card__content').text(Card.cardContent);
							
							if (Card.emoId!=0) {
								$('#draggable3').empty();
								$('#draggable3').append('<img src=img/'+Card.emoId+'.png class=emo style="width: 150px; height: 157px;">');
								$('#draggable3').css('left', Card.emoInfoLeft).css('top', Card.emoInfoTop);
							}
							$('.emo').css('background-color', '#'+Card.bgFront);
							$('.card__number').text(Card.cardId.substr(0, 4)+' '+Card.cardId.substr(4, 4)+' '+Card.cardId.substr(8, 4)+' '+Card.cardId.substr(12, 4));
							$('.card__ccv').text(Card.cvc);
							if (String(today.getMonth()).length==1) {
								$('.card__expiry-date').text(String(today.getFullYear()+2).substr(2,2)+"/0"+today.getMonth());
							} else {
								$('.card__expiry-date').text(String(today.getFullYear()+2).substr(2,2)+"/"+today.getMonth());								
							}
							$('.front .card__content').css("font-family", Card.fontFront).css('color', Card.fontColorFront);
							$('.back .card__ccv').css("font-family", Card.fontBack).css('color', Card.fontColorBack);
							$('.back .card__owner').css("font-family", Card.fontBack).css('color', Card.fontColorBack);
							$('.back .card__expiry-date').css("font-family", Card.fontBack).css('color', Card.fontColorBack);
							$('.back .card__number').css("font-family", Card.fontBack).css('color', Card.fontColorBack);
						} else {
							var today = new Date();
							if (String(today.getMonth()).length==1) {
								$('.card__expiry-date').text(String(today.getFullYear()+2).substr(2,2)+"/0"+today.getMonth());
							} else {
								$('.card__expiry-date').text(String(today.getFullYear()+2).substr(2,2)+"/"+today.getMonth());								
							}
							$('.card__ccv').text("000").css('color', 'white');
							$('.card__number').text("0000 0000 0000 0000");
							data = {}
							data.cardId = 'null';
							localStorage.setItem('Card', JSON.stringify(data))
						}
						
						$('.card__owner').text(userInfo.userEngName)
						
					}
				},
				error: function(err) {
					console.log(err)
				}
			})
		}
		
		
		function changeFrontCard() {
			$('#front').removeClass('card--front_small');
			$('#front').addClass('card--front');
			$('#back').removeClass('card--back_big');
			$('#back').addClass('card--back');
			$('.card-change-margin').css('margin-top', '0px');
			$('#change-front').removeClass('front-card').removeClass('back-card')
			$('#change-front').addClass('front-card')
			$('#change-back').removeClass('front-card').removeClass('back-card')
			$('#change-back').addClass('back-card')
			$('.card__number').css('font-size', '25px')
			console.log($('#draggable3').css('top'))			
			if (isFront == false) {
				$('.emo').css('width', '150px').css('height', '185px')
				left_position = parseInt($('#draggable3').css('left')) * 1.18
				top_position = parseInt($('#draggable3').css('top')) * 1.21
				$('#draggable3').css('left', left_position + 'px').css('top', top_position + 'px');	
			}
			isFront = true;
			if(frontFontColor=='black') {
				$('.font__color-white').removeClass('font__color-selected')
				$('.font__color-black').addClass('font__color-selected')
			} else {
				$('.font__color-black').removeClass('font__color-selected')
				$('.font__color-white').addClass('font__color-selected')
			}
		}
		
		function changeBackCard() {
			$('#front').removeClass('card--front');
			$('#front').addClass('card--front_small');
			$('#back').removeClass('card--back');
			$('#back').addClass('card--back_big');
			$('.card-change-margin').css('margin-top', '1.2rem');
			$('#change-front').removeClass('front-card').removeClass('back-card')
			$('#change-front').addClass('back-card')
			$('#change-back').removeClass('front-card').removeClass('back-card')
			$('#change-back').addClass('front-card')
			$('.card__number').css('font-size', '30px')
			if (isFront == true) {
				$('.emo').css('width', '130px').css('height', '157px')
				left_position = parseInt($('#draggable3').css('left')) * 0.82
				top_position = parseInt($('#draggable3').css('top')) * 0.68
				$('#draggable3').css('left', left_position + 'px').css('top', top_position + 'px');	
			}
			isFront = false;
			if(backFontColor=='black') {
				$('.font__color-white').removeClass('font__color-selected')
				$('.font__color-black').addClass('font__color-selected')
			} else {
				$('.font__color-black').removeClass('font__color-selected')
				$('.font__color-white').addClass('font__color-selected')
			}
		}
		
		function changeFontColorBlack() {
			if (isFront == true) {
				$('.front .card__content').css("color", "black");
				frontFontColor = 'black'
			} else {
				$('.back .card__ccv').css("color", "black");
				$('.back .card__owner').css("color", "black");
				$('.back .card__expiry-date').css("color", "black");
				$('.back .card__number').css("color", "black");
				backFontColor = 'black'
			}
			$('.font__color-white').removeClass('font__color-selected')
			$('.font__color-black').addClass('font__color-selected')
		}
		
		function changeFontColorWhite() {
			if (isFront == true) {
				$('.front .card__content').css("color", "white");
				frontFontColor = 'white'
			} else {
				$('.back .card__ccv').css("color", "white");
				$('.back .card__owner').css("color", "white");
				$('.back .card__expiry-date').css("color", "white");
				$('.back .card__number').css("color", "white");
				backFontColor = 'white'
			}
			$('.font__color-black').removeClass('font__color-selected')
			$('.font__color-white').addClass('font__color-selected')
		}
		
		
		function saveCard(userInfo) {
			var emoInfoTop = ""
				var emoInfoLeft = ""
				if (isFront == true) {
					emoInfoTop = Math.round(parseInt($('#draggable3').css('top'))*100 / 100)
					emoInfoLeft = Math.round(parseInt($('#draggable3').css('left'))*100 / 100)
				} else {
					emoInfoTop = Math.round((parseInt($('#draggable3').css('top')) * 0.68)*100 / 100)
					emoInfoLeft = Math.round((parseInt($('#draggable3').css('left')) * 0.82)*100 / 100)
				}
				$.ajax({
					type: 'post',
					url: '../saveCard.do',
					data: {
						'userId': userInfo.userId,
						'bgFront': frontBackgroundColor,
						'bgBack': backBackgroundColor,
						'emoId': emo,
						'emoInfoTop': emoInfoTop,
						'emoInfoLeft': emoInfoLeft,
						'fontFront': frontFont,
						'fontBack': backFont,
						'fontColorFront': frontFontColor,
						'fontColorBack': backFontColor,
						'cardContent': card_content
					},
					success: function(res) {
						if (res.message=='yes') {
							swal({
								title: "Good job!",
								text: "성공적으로 카드를 저장했습니다.",
								icon: "success",
								button: "확인!",
							})							
						} else {
							location.href = "../Error/Error.jsp"
						}
					},
					error: function(err) {
						console.log(err)
					}
				
				})
		}
		
		function issueCard(userInfo) {
			var emoInfoTop = ""
				var emoInfoLeft = ""
				if (isFront == true) {
					emoInfoTop = Math.round(parseInt($('#draggable3').css('top'))*100 / 100)
					emoInfoLeft = Math.round(parseInt($('#draggable3').css('left'))*100 / 100)
				} else {
					emoInfoTop = Math.round((parseInt($('#draggable3').css('top')) * 0.68)*100 / 100)
					emoInfoLeft = Math.round((parseInt($('#draggable3').css('left')) * 0.82)*100 / 100)
				}
				$.ajax({
					type: 'post',
					url: '../saveCard.do',
					data: {
						'userId': userInfo.userId,
						'bgFront': frontBackgroundColor,
						'bgBack': backBackgroundColor,
						'emoId': emo,
						'emoInfoTop': emoInfoTop,
						'emoInfoLeft': emoInfoLeft,
						'fontFront': frontFont,
						'fontBack': backFont,
						'fontColorFront': frontFontColor,
						'fontColorBack': backFontColor,
						'cardContent': card_content,
					},
					success: function(res) {
						console.log(res)
						$.ajax({
							type: 'put',
							url: '../issueCard.do',
							data: {
								'userId': userInfo.userId,
							},
							success: function(res) {
								if (res.message=='yes') {
									swal({
										title: "카드 발급 성공!",
										text: "2주 안에 자택으로 카드 배송이 완료될 것입니다.",
										icon: "success",
										button: "확인!",
									})									
								} else {
									location.href = "../Error/Error.jsp"
								}
							},
							error: function(err) {
								console.log(err)
							}
						})
					},
					error: function(err) {
						console.log(err)
					}
				
				})
		}
		
		function resetCard() {
			var today = new Date();
			if (String(today.getMonth()).length==1) {
				$('.card__expiry-date').text(String(today.getFullYear()+2).substr(2,2)+"/0"+today.getMonth());
			} else {
				$('.card__expiry-date').text(String(today.getFullYear()+2).substr(2,2)+"/"+today.getMonth());								
			}
			$('.card__ccv').text("000").css('color', 'white');
			data = {}
			data.cardId = 'null';
			localStorage.setItem('Card', JSON.stringify(data))
			$('.card--front').css('background-color', '#ffffff');
			$('.card--back').css('background-color', '#ffffff');
			$('.front .card__content').text("");
			$('.front .card__content').css("font-family", "none").css('color', '#ffffff');
			
			$('#draggable3').empty();
			$('.card__number').text("0000 0000 0000 0000");
			$('.card__ccv').text("000");
			$('.back .card__ccv').css("font-family", "none").css('color', Card.fontColorBack);
			$('.back .card__owner').css("font-family", "none").css('color', Card.fontColorBack);
			$('.back .card__expiry-date').css("font-family", "none").css('color', Card.fontColorBack);
		}
		
		
		const showBackgroundBefore = function(idx) {
			$('#backGroundColorList').empty()
			if (idx==0) {
				idx = new_gradients.length-10
			} else if (idx==5) {
				idx = new_gradients.length-5
			} else {
				idx -= 10
			}
			for(var i=idx; i<idx+5;i++){
				$('#backGroundColorList').append("<li class=item-gradient><div class=gradient style='background-color: #"+new_gradients[i]+";'></div><p class=start style=color: #"+new_gradients[i]+";>"+new_gradients[i]+"</p></li>")
			}
			return idx + 5
		};
		
		const showBackgroundAfter = function(idx) {
			$('#backGroundColorList').empty()
			for(var i=idx; i<idx+5;i++){
				$('#backGroundColorList').append("<li class=item-gradient><div class=gradient style='background-color: #"+new_gradients[i]+";'></div><p class=start style=color: #"+new_gradients[i]+";>"+new_gradients[i]+"</p></li>")
			}
			return idx+5
		};
		
		const changeFonts = function(fontIdx) {
			$('#FontList').empty();
			for(var i=fontIdx; i<fontIdx+4; i++) {
				font_list = new_fonts[i].split(':')
				var font_name = font_list[0]
				var font_company = font_list[1]
				var font_family = font_list[2] 
				$('#FontList').append("<li class=item-gradient name="+font_family+" style=font-family:"+font_family+"><div style=text-align:center;><p style=font-size:large;>"+font_name+"</p><p>"+font_company+"</p></div><div>GiveNotTake</div></li>")
			}
		};
		
	</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="card">
		<div id="loader-wrapper">            
			<div id="loader"></div>
			<div class="loader-section section-left"></div>
			<div class="loader-section section-right"></div>
		</div>
		<%@ include file="../Common/Nav.jsp" %><br>
		<div class="container">
			<div>
				<div class="d-flex justify-content-between align-items-end" style="border-bottom: 1px solid beige; margin-bottom: 2rem;">
					<h2 class="title">카드 발급</h2>
					<div class="d-flex" style="font-family: 'Katuri';">
						<div id="change-front" class="front-card">
							앞면
						</div>
						<div id="change-back"  class="back-card" style="margin-left: 2rem;">
							뒷면
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-around">
					<div class="front">
						<div id="front" class="card card--front">
							<div class="row" style="height: 100vh;">
								<div class="col-4 d-flex flex-column justify-content-between">
									<img class="card__logo--front" src="img/bnk_logo.png">
									<div class="d-flex align-items-center">
										<span>&nbsp;&lt;&lt;</span>
										<div class="ic-chip">
											<div class="chip-line"></div>
											<div class="chip-line"></div>
											<div class="chip-line"></div>
											<div class="chip-line"></div>
											<div class="chip-main"></div>
										</div>
									</div>
									<div style="margin-left: 10px; margin-bottom: 10px;">
										<span class="card__content"></span>
									</div>
								</div>
								<div class="col-8">
									<div id="containment-wrapper" style="border: none; height: 100%; padding-right: 30px;">
									  <div id="draggable3" class="draggable ui-widget-content" style="border: none; width: 40%;">
									  
									  </div>
									</div>
								</div>
							</div>
						</div>
						<h5 class="front__hover" style="color: #898989; font-weight: bold; font-family: Montserrat;"><b>앞면</b></h5>
					</div>
					<div class="back">
						<div id="back" class="card card--back">
							<div class="card__strip"></div>
							<div class="card-change-margin">
								<div class="card__signature"></div>
								<div class="card__ccv"></div>							
							</div>
							<div class="card__number"></div>
							<div class="card__expiry-date"></div>
							<div>
								<div class="card__owner">
									yudingg
									<img class="card__logo--back" src="img/bnk_logo.png">							
								</div>
							</div>
						</div>
						<h5 class="back__hover" style="color: #898989; font-weight: bold; font-family: Montserrat;"><b>뒷면</b></h5>
					</div>
				</div>
				<div class="tabs">
					<input type="radio" id="tab1" name="tab-control" checked>
					<input type="radio" id="tab2" name="tab-control">
					<input type="radio" id="tab3" name="tab-control">  
					<ul>
					    <li title="Background"><label for="tab1" role="button"><br><span>배경색</span></label></li>
					    <li title="Emoticon"><label for="tab2" role="button"><br><span>이모티콘</span></label></li>
					    <li title="Font"><label for="tab3" role="button"><br><span>폰트 적용</span></label></li>
					</ul>
				  
					<div class="slider"><div class="indicator"></div>
				</div>
				<div class="content">
				    <section>
						<h2>Background</h2>
						<div class="d-flex">
							<svg id="arrow-before" width="18px" height="17px" viewBox="0 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="fill: #4fd0b9;">
							    <g id="prev" transform="translate(8.500000, 8.500000) scale(-1, 1) translate(-8.500000, -8.500000)">
							        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <path d="M-1.48029737e-15,0.56157424 L-1.48029737e-15,16.1929159 L9.708,8.33860465 L-2.66453526e-15,0.56157424 L-1.48029737e-15,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
								</g>
							</svg>
							
							<div id="backGroundColorList" class="d-flex">
							</div>
							<svg id="arrow-after" width="18px" height="17px" viewBox="-1 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="fill: #4fd0b9;">
							    <g>
							        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <path d="M-4.58892184e-16,0.56157424 L-4.58892184e-16,16.1929159 L9.708,8.33860465 L-1.64313008e-15,0.56157424 L-4.58892184e-16,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
							    </g>
							</svg>
						</div>
			      	</section>
			        <section>
						<h2>Emoticon</h2>
						<div id="emoList" class="d-flex">
						</div>
		          	</section>
			        <section>
						<h2>Font</h2>
						<div class="row">
							<div class="col-3 d-flex justify-content-around" style="flex-direction: column">
								<div>
									<h5><b>8글자 내로 작성하시오.</b></h5>
									<div class="d-flex justify-content-between">
										<input type="text" class="content-input" maxlength='8'>
										<button class="change-content">작성</button>
									</div>
								</div>
								<div>
									<h5><b>글자색을 정하시오.</b></h5>
									<div class="d-flex">
										<button class="font__color-black" style="margin-right: 2rem;">검은색</button>
										<button class="font__color-white font__color-selected">흰색</button>
									</div>
								</div>
							</div>
							<div class="col-9 d-flex">
								<svg id="arrow-before-font" width="18px" height="17px" viewBox="0 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: visible; fill: #4fd0b9;">
								    <g id="prev" transform="translate(8.500000, 8.500000) scale(-1, 1) translate(-8.500000, -8.500000)">
								        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <path d="M-1.48029737e-15,0.56157424 L-1.48029737e-15,16.1929159 L9.708,8.33860465 L-2.66453526e-15,0.56157424 L-1.48029737e-15,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
									</g>
								</svg>
								
								<div id="FontList" class="d-flex">
								</div>
								<svg id="arrow-after-font" width="18px" height="17px" viewBox="-1 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: visible; fill: #4fd0b9;">
								    <g>
								        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <path d="M-4.58892184e-16,0.56157424 L-4.58892184e-16,16.1929159 L9.708,8.33860465 L-1.64313008e-15,0.56157424 L-4.58892184e-16,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
								    </g>
								</svg>
							</div>
						</div>
		          	</section>
					</div>
				</div>
			
			</div>
			<div class="btn-list">
				<button class="card_reset_btn">초기화</button>
				<button class="card_save_btn">저장</button>
				<button class="card_issue_btn">발급</button>
			</div>
		</div>
	</div>
</body>
</html>
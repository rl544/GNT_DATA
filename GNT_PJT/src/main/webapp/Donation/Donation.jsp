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
		@import url("css/Donation.css?ver=1");
	</style>
	<script>
		$(window).on('load', function() {
			$('#donation').addClass('loaded');
		});
		
		var page = 1
		var Donation = {}
		
		$(function() {
			
			var userInfo = JSON.parse(localStorage.getItem('user'));
			getDonationBasic()
			getRecent()
			
			$('.next-page').click(function() {
				getDonationPage()
			})
			
			$('.donation-list').on('click', '.card ', function() {
				id = $(this).attr('id')
				localStorage.setItem('DonationDetailId', id)
				location.href="DonationDetail.jsp"
			});
			
			$('.recent-items').on('click', '.recent-item img', function() {
				id = $(this).attr('id')
				localStorage.setItem('DonationDetailId', id)
				location.href="DonationDetail.jsp"
			})
			
			var delay = 500;
			$('.top-img').click(function() {
				$('html, body').stop().animate({scrollTop: 0}, delay);
			})
			
			$('#all').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'block')
				getDonationBasic()
			})
			
			$('#rec').click(function() {
				getUserDonation(userInfo)
				/* removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'block')
				getDonationBasic() */
			})
			
			$('#child').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(1)
			})
			$('#old').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(2)
			})
			$('#disabled').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(3)
			})
			$('#multiculture').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(4)
			})
			$('#global').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(5)
			})
			$('#family').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(6)
			})
			$('#animal').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(7)
			})
			$('#environ').click(function() {
				removeSelected();
				$(this).addClass('selected')
				$('.next-page').css('display', 'none')
				getDonationCategory(8)
			})
		})
		
		function removeSelected() {
			var btnList = $('.donation-btn')
			btnList.removeClass('selected')
		}
		
		function getRecent() {
			var recentList = localStorage.getItem("recentList")
			recentList = JSON.parse(recentList)
			$('.recent-items').empty()
			$.each(recentList, function(index, item) {
				title = ""
				if (item.title.length > 10) {
					title = item.title.substr(0, 10) + "..."
				} else {
					title = item.title
				}
				$('.recent-items').prepend('<div class=recent-item><img id='+item.donationId+' src='+item.imageUri+'><span>'+title+'</span></div>')
			})	
		}
		
		function getUserDonation(userInfo) {
			userId = userInfo.userId
			$.ajax({
				type: 'post',
				url: '../getDonationStatistic2.do',
				data: {
					'userId': userId
				},
				success: function(res) {
					console.log(res)
					if (res.message=='yes') {
						removeSelected();
						$('#rec').addClass('selected')
						$('.next-page').css('display', 'block')
						userData = Object()
						$.each(res, function(index, item) {
							if (index!='message') {
								userData[index] = item
							}
						})
						getDonationRec(userData)
					} else {
						swal({
							title: "이용 불가!",
							text: "기부 기록이 없어 맞춤 항목을 확인할 수 없습니다.!",
							icon: "warning",
							button: "확인",
						})
						getDonationBasic()
					}
				},
				error: function(err) {
					console.log(err)
				}
			})
		}
		
		function getDonationRec(userData) {
			data = {
				"user_id": userData.user_id,
				"donation_cnt": parseInt(userData.donation_cnt),
				"donation_amount": parseInt(userData.donation_amount),
				"category_children": parseFloat(userData.category_childern),
				"category_oldman": parseFloat(userData.category_oldman),
				"category_disabled": parseFloat(userData.category_disabled),
				"category_multiculture": parseFloat(userData.category_multiculture),
				"category_global": parseFloat(userData.category_global),
				"category_family": parseFloat(userData.category_family),
				"category_animal": parseFloat(userData.category_animal),
				"category_environment": parseFloat(userData.category_environment)
			}
			$.ajax({
				type: 'post',
				url: 'http://127.0.0.1:8970/recommend',
				data: JSON.stringify(data),
				contentType: 'application/json; charset=utf-8',
				success: function(res) {
					console.log(res)
					Donation = res
					$('.donation-list').empty();
					$.each(Donation, function(index, item) {
						donationPercent = Math.round((item.donation_amount/item.donation_limit)*100)
						backgroundColor = checkBackgroundColor(donationPercent)
						$('.donation-list').append(
							'<section class="cards col-4 mb-5">' +
								'<article class="card card--1" id='+item.donation_id+'>' +
								'<div class="card__img" style=background-image:url('+item.donation_img+')></div>' +
								'<a href="#" class="card_link">' +
									'<div class="card__img--hover" style=background-image:url('+item.donation_img+')></div>' +
								'</a>' +
								'<div class="card__info">' +
									'<h3 class="card__title">'+item.donation_title+'</h3>' +
									'<span class="card__by">' +
										'<a href="#" class="card__author" title="author">'+item.donation_organization+'</a>' +
									'</span>' +
									'<div class="container-fluid">' +
										'<div class="Loading">' +
											'<div class="Loading-after" style=width:'+donationPercent+'%;background-color:'+backgroundColor+';></div>' +
										'</div>' +
										'<span class="progress-span">'+donationPercent+'%</span>' +
							'</div></div></article></section>'
						);
					})
				},
				error: function(err) {
					console.log(err)
				}
			})
		}
		
		function getDonationBasic() {
			$.ajax({
				type: 'get',
				url: '../getDonationAsk.do',
				data: {},
				success: function(res) {
					console.log(res)
					if(res.message.message=="yes") {
						Donation = res.Donation
						$('.donation-list').empty();
						$.each(Donation, function(index, item) {
							donationPercent = Math.round((item.donationAmount/item.donationLimit)*100)
							backgroundColor = checkBackgroundColor(donationPercent)
							$('.donation-list').append(
								'<section class="cards col-4 mb-5">' +
									'<article class="card card--1" id='+item.donationId+'>' +
									'<div class="card__img" style=background-image:url('+item.imageUri+')></div>' +
									'<a href="#" class="card_link">' +
										'<div class="card__img--hover" style=background-image:url('+item.imageUri+')></div>' +
									'</a>' +
									'<div class="card__info">' +
										'<h3 class="card__title">'+item.title+'</h3>' +
										'<span class="card__by">' +
											'<a href="#" class="card__author" title="author">'+item.organization+'</a>' +
										'</span>' +
										'<div class="container-fluid">' +
											'<div class="Loading">' +
												'<div class="Loading-after" style=width:'+donationPercent+'%;background-color:'+backgroundColor+';></div>' +
											'</div>' +
											'<span class="progress-span">'+donationPercent+'%</span>' +
								'</div></div></article></section>'
							);
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
		
		function getDonationPage() {
			page += 1
			$.ajax({
				type: 'get',
				url: '../getDonationPage.do',
				data: {
					'pagenum': page,
				},
				success: function(res) {
					if (res.message.message=='yes') {
						Donation = res.Donation
						console.log(Donation)
						$.each(Donation, function(index, item) {
							donationPercent = Math.round((item.donationAmount/item.donationLimit)*100)
							backgroundColor = checkBackgroundColor(donationPercent)
							$('.donation-list').append(
								'<section class="cards col-4 mb-5">' +
									'<article class="card card--1" id='+item.donationId+'>' +
									'<div class="card__img" style=background-image:url('+item.imageUri+')></div>' +
									'<a href="#" class="card_link">' +
										'<div class="card__img--hover" style=background-image:url('+item.imageUri+')></div>' +
									'</a>' +
									'<div class="card__info">' +
										'<h3 class="card__title">'+item.title+'</h3>' +
										'<span class="card__by">' +
											'<a href="#" class="card__author" title="author">'+item.organization+'</a>' +
										'</span>' +
										'<div class="container-fluid">' +
											'<div class="Loading">' +
												'<div class="Loading-after" style=width:'+donationPercent+'%;background-color:'+backgroundColor+';></div>' +
											'</div>' +
											'<span class="progress-span">'+donationPercent+'%</span>' +
								'</div></div></article></section>'
							);
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
		
		function getDonationCategory(categoryId) {
			$.ajax({
				type: 'get',
				url: '../getCategoryPage.do',
				data: {
					'categoryId': categoryId,
				},
				success: function(res) {
					if (res.message.message=='yes') {
						Donation = res.Donation
						$('.donation-list').empty();
						$.each(Donation, function(index, item) {
							donationPercent = Math.round((item.donationAmount/item.donationLimit)*100)
							backgroundColor = checkBackgroundColor(donationPercent)
							$('.donation-list').append(
								'<section class="cards col-4 mb-5">' +
									'<article class="card card--1" id='+item.donationId+'>' +
									'<div class="card__img" style=background-image:url('+item.imageUri+')></div>' +
									'<a href="#" class="card_link">' +
										'<div class="card__img--hover" style=background-image:url('+item.imageUri+')></div>' +
									'</a>' +
									'<div class="card__info">' +
										'<h3 class="card__title">'+item.title+'</h3>' +
										'<span class="card__by">' +
											'<a href="#" class="card__author" title="author">'+item.organization+'</a>' +
										'</span>' +
										'<div class="container-fluid">' +
											'<div class="Loading">' +
												'<div class="Loading-after" style=width:'+donationPercent+'%;background-color:'+backgroundColor+';></div>' +
											'</div>' +
											'<span class="progress-span">'+donationPercent+'%</span>' +
								'</div></div></article></section>'
							);
						})
					} else {
						location.href = '../Error/Error.jsp'
					}
				},
				error: function(err) {
					console.log(err)
				}
			})
		}
		
		function checkBackgroundColor(donationPercent) {
			backgroundColor = ""
			if (donationPercent < 10) {
				backgroundColor = "rgb(247,100,33,0.1)";
			} else if (donationPercent>=10 && donationPercent<20) {
				backgroundColor = "rgb(247,115,33,0.2)";
			} else if (donationPercent>=20 && donationPercent<30) {
				backgroundColor = "rgb(247,130,33,0.3)";
			} else if (donationPercent>=30 && donationPercent<40) {
				backgroundColor = "rgb(247,145,33,0.4)";
			} else if (donationPercent>=40 && donationPercent<50) {
				backgroundColor = "rgb(247,160,33,0.5)";
			} else if (donationPercent>=50 && donationPercent<60) {
				backgroundColor = "rgb(247,185,33,0.6)";
			} else if (donationPercent>=60 && donationPercent<70) {
				backgroundColor = "rgb(247,200,33,0.7)";
			} else if (donationPercent>=70 && donationPercent<80) {
				backgroundColor = "rgb(247,215,33,0.8)";
			} else if (donationPercent>=80 && donationPercent<90) {
				backgroundColor = "rgb(247,230,33,0.9)";
			} else {
				backgroundColor = "rgb(247,245,33,1)";
			}
			return backgroundColor
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
		<div class="container" style="min-width: 1200px;">
		
			<div class="row">
				<div class="col-10 row" style="border-right: 1px solid #c4c5c4; padding-left: 3rem; padding-right: 0rem;">
					<div class="donation-category">
						<button class="donation-btn selected" id="all">전체</button>
						<button class="donation-btn" id="rec">맞춤</button>
						<button class="donation-btn" id="child">아동•청소년</button>
						<button class="donation-btn" id="old">어르신</button>
						<button class="donation-btn" id="disabled">장애인</button>
						<button class="donation-btn" id="multiculture">다문화</button>
						<button class="donation-btn" id="global">지구촌</button>
						<button class="donation-btn" id="family">가족•여성</button>
						<button class="donation-btn" id="animal">동물</button>
						<button class="donation-btn" id="environ">환경</button>
					</div>
					<div class="donation-list row">
						
					</div>
					
					<button class="next-page">더보기</button>
				</div>
				<div class="col-2">
					<div class="recent">
						<div class="recent-title">
							<img src="../Donation/img/recent.png">
						</div>
						<div class="recent-items">
						
						</div>
						<div style="text-align: center; margin-top: 1rem;">
							<img class="top-img" src="../Donation/img/top.png">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
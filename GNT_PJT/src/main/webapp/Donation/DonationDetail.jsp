<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<style scoped>
		@import url("css/DonationDetail.css?ver=1");
	</style>
	
	<script>
		$(window).on('load', function() {
			$('#donation-detail').addClass('loaded');
		});
		
		const categoryList = ['아동·청소년', '어르신', '장애인', '다문화', '지구촌', '가족·여성', '동물', '환경'];
		
		$(function() {
			getDonationDetail()
			
			$('body').css('height', '100%').css('background-color', '#fff2c61c')
			
			$('body').on('click', '.success-btn', function() {
				location.href = '../Donation/Donation.jsp'
			})
			
			$('.fingerbtn').click(function() {
				setTimeout(() => {
					swal({
						title: "금액을 숫자로만 입력하세요",
						content: "input",
						icon: "info",
						buttons: ['취소', true],
					})
					.then(name => {
						if(isNum(name) && name!=null) {
							swal({
								title: "정말로 기부하시겠습니까?",
								text: name+" MP만큼 기부하시겠습니까?",
								icon: "info",
								buttons: ["취소", "생성"],
							})
							.then((value) => {
								if (name=="") {
									swal({
										title: "에러!",
										text: "기부 금액을 입력하세요!",
										icon: "warning",
										button: "확인!",
									})
								} else {
									if (value==true) {
										userInfo = JSON.parse(localStorage.getItem('user'));
										console.log(userInfo)
										donationId = localStorage.getItem('DonationDetailId')
										console.log({
											'userId': userInfo.userId,
											'donationId': donationId,
											'donationAmount': name
										},)
										$.ajax({
											type: 'post',
											url: '../excuteDonation.do',
											data: {
												'userId': userInfo.userId,
												'donationId': donationId,
												'donationAmount': name
											},
											success: function(res) {
												if (res.message.message=='yes') {
													swal({
														title: "Good job!",
														text: "성공적으로 기부했습니다.",
														icon: "success",
														button: "확인!",
													})
													.then((value) => {
														location.href="../Donation/DonationDetail.jsp";
													})													
												} else if (res.message.message=='error') {
													location.href = "../Error/Error.jsp"
												} else {
													swal({
														title: "Fail...",
														text: "fail to donation",
														icon: "warning",
														button: "OK!"
													})
												}
											},
											error: function(err) {
												console.log(err)
											}
										})
									}
									
								}
								
							})
							
						} else {
							swal({
								title: "취소하시겠습니까?",
								text: "정말로 취소하시려면 '확인'버튼을 눌러주세요.",
								icon: "warning",
								button: "확인",
								dangerMode: true,
							})
						}
					})
				}, 3000);
			})
			
		})
		
		function isNum(val){
			return !isNaN(val)
		}
		
		
		
		function getDonationDetail() {
			donationId = localStorage.getItem('DonationDetailId')
			Donation = {}
			
			$.ajax({
				type: 'get',
				url: '../getDoantionDetail.do',
				data: {
					'donationId': donationId
				},
				success: function(res) {
					if (res.message.message=='yes') {
						Donation = res.Donation[1]
						
						donationPercent = Math.round((Donation.donationAmount/Donation.donationLimit)*100)
						backgroundColor = checkBackgroundColor(donationPercent)
						donationAmount = Donation.donationAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						donationLimit = Donation.donationLimit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						
						changeRecentItems(Donation)
						$('.donation_detail_title').empty()
						$('.donation_detail_title').html(Donation.title)
						$('.example > .block > .side').css("background-image", "url("+Donation.imageUri+")")
						$('.donation_detail_content').empty()
						if (Donation.section1!=null) {
							$('.donation_detail_content').append('<h4 class=content-title>'+Donation.section1Title+'</h4>');
							$('.donation_detail_content').append('<p class=content-content>'+Donation.section1+'</p>');
							if (Donation.section2!=null) {
								$('.donation_detail_content').append('<h4 class=content-title>'+Donation.section2Title+'</h4>');
								$('.donation_detail_content').append('<p class=content-content>'+Donation.section2+'</p>');
								if (Donation.section3!=null) {
									$('.donation_detail_content').append('<h4 class=content-title>'+Donation.section3Title+'</h4>');
									$('.donation_detail_content').append('<p class=content-content>'+Donation.section3+'</p>');
									if (Donation.section4!=null) {
										$('.donation_detail_content').append('<h4 class=content-title>'+Donation.section4Title+'</h4>');
										$('.donation_detail_content').append('<p class=content-content>'+Donation.section4+'</p>');
										if (Donation.section5!=null) {
											$('.donation_detail_content').append('<h4 class=content-title>'+Donation.section5Title+'</h4>');
											$('.donation_detail_content').append('<p class=content-content>'+Donation.section5+'</p>');
										}
									}
								}
							}
						}
						
						
						$('.donation_detail_category').empty()
						$('.donation_detail_category').html(categoryList[Donation.categoryId-1])
						$('.donation_detail_organization').empty()
						$('.donation_detail_organization').html(Donation.organization)
						$('.Loading-after').css('width', donationPercent+'%').css('background-color', backgroundColor)
						$('.progress-span').html(donationPercent+'%')
						$('.donation_detail_start').empty()
						$('.donation_detail_start').html(Donation.createTime.slice(0, 10))
						$('.donation_detail_end').empty()
						$('.donation_detail_end').html(Donation.endTime.slice(0, 10))
						$('.donation_detail_amount').empty()
						$('.donation_detail_amount').html(donationAmount+"MP")
						$('.donation_detail_limit').empty();
						$('.donation_detail_limit').html(donationLimit+"MP")
						
						if (donationPercent>=100) {
							createFirework()
							$('.donation_detail_part').empty();
							$('.donation_detail_part').html('<div class=donation_detail_success>목표 금액의 기부를 달성하였습니다!!</div>')
							$('.success').css('display', 'block').css('background-color', '#8d8787')
							$('body').css('overflow', 'hidden')
							$('.donation_detail_content').empty()
							$('.donation_detail_content').append('<h4 class=content-title>'+Donation.section1Title+'</h4>');
							$('.donation_detail_content').append('<p class=content-content>'+Donation.section1+'</p>');
							$('.success').after("<div class=donation_modal><h1>Congratulation!</h1><h3>기부 금액 달성 성공</h3><button class=success-btn>확인</button></div>")
						}
					} else {
						location.href = "../Error/Error.jsp"
					}
					
				},
				error: function(err) {
					console.log(err)
				}
			})
		}
		
		
		function changeRecentItems(Donation) {
			recentList = JSON.parse(localStorage.getItem('recentList'))
			if(recentList==null) {
				recentList = []
				recentList.push(Donation)
			} else if (recentList.length == 3) {
				if(recentList[2].donationId == Donation.donationId) {
					recentList.splice(2, 1)	
				} else if (recentList[1].donationId == Donation.donationId) {
					recentList.splice(1, 1)
				} else if (recentList[0].donationId == Donation.donationId) {
					recentList.splice(0, 1)
				} else {
					recentList.shift()
				}
				recentList.push(Donation)
			} else if (recentList.length == 2) {
				if(recentList[1].donationId == Donation.donationId) {
					recentList.splice(1, 1)	
				} else if (recentList[0].donationId == Donation.donationId) {
					recentList.splice(0, 1)
				}
				recentList.push(Donation)
			} else if (recentList.length == 1) {
				console.log(recentList[0].donationId)
				console.log(Donation.donationId)
				if (recentList[0].donationId == Donation.donationId) {
					recentList.splice(0, 1)
				}
				recentList.push(Donation)
			}
			localStorage.setItem('recentList', JSON.stringify(recentList))
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
		
		
	
		/* firework */		
		var fw_spread = 200 // how wide the particles expand
		var fw_scale = 10  // how large the particles get
		var fw_launch_rate = 333 // in milliseconds 

		function createFirework(e) {  
			var f = document.createElement('div')
			f.className = 'firework'
			f.style.width = '3px'
			f.style.height = '3px'
			f.style.position = 'absolute'
			var fx = Math.random()*100 + '%'
			f.style.left = Math.random()*33 + 33 + '%'
			f.style.top = '100%'
			var clr = 'hsl('+Math.random()*360+'deg,100%,50%)'
			// f.style.backgroundColor = clr
			f.style.transition = 'ease-out '+(Math.random()*3) + 1 + 's'

			document.body.appendChild(f)
			
			for(var i=0;i<25;i++){
				var p = document.createElement('div')
				p.className = 'particle'
				p.style.width = '100%'
				p.style.height = '100%'
				p.style.backgroundColor = clr
				p.style.position = 'absolute'
				p.style.left = '0'
				p.style.top = '0'
				p.style.transition = '.5s'    
				f.appendChild(p)
			}

			setTimeout(function(){
				f.style.top = Math.random()*50 + 5 + '%'
				f.style.left = fx
				f.ontransitionend = function() {
					var p = this.querySelectorAll('.particle')
					p.forEach(function(elm){
						var x = Math.random() < .5 ? Math.random()*fw_spread : (-1)*Math.random()*fw_spread
						var y = Math.random() < .5 ? Math.random()*fw_spread : (-1)*Math.random()*fw_spread
						elm.style.left = x + 'px'
						elm.style.top = y +'px'
						elm.style.opacity = '0'
						elm.style.transform = 'scale('+fw_scale+')'
						elm.style.borderRadius = '50%'
						elm.style.filter = 'blur(1px)'
						elm.style.zIndex = '2'
						elm.ontransitionend = function() {
							this.remove()          
						}
					})
					setTimeout(function(){
						f.remove()
					},1000)
				}
			}, 100)  
			setTimeout(createFirework, fw_launch_rate)
		}



		
	</script>
	<body>
		<div class="success">
			
		</div>
		<div id="donation-detail">
			<div id="loader-wrapper">            
				<div id="loader"></div>
				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
			<%@ include file="../Common/Nav.jsp" %><br>
			
			<div class="container">
				
				<div class="d-flex justify-content-between">
					<h3 class="donation_detail_title"></h3>
					<h3 class="donation_detail_category"></h3>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="example">
							<div class="block">
								<div class="side -main"></div>
								<div class="side -left"></div>
							</div>
						</div>
						<div class="d-flex justify-content-center donation_detail_date">
							<div class="donation_detail_start">
							
							</div>
							<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
							<div class="donation_detail_end">
							
							</div>
						</div>
						<div class="container-fluid" style="margin-bottom: 2rem;">
							<div class="Loading">
								<div class="Loading-after"></div>
							</div>
							<span class="progress-span"></span>
						</div>
						<div class="d-flex justify-content-between px-4">
							<div class="donation_detail_amount">
							
							</div>
							<div class="arrow">
				                <span></span>
				                <span></span>
				                <span></span>
				                <span></span>
				                <span></span>
				                <span></span>
							</div>
							<div class="donation_detail_limit">
							
							</div>
						</div>
						<div class="donation_detail_part">
							<div class="fingerbtn" onclick="this.classList.toggle('active')" data-toggle="modal-password" data-target="#myModal">
								<span class="text">기부하기</span>
								<svg class="fingerprint fingerprint-base" xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
							    	<g class="fingerprint-out" fill="none" stroke-width="2" stroke-linecap="round">
							      	<path class="odd" d="m 25.117139,57.142857 c 0,0 -1.968558,-7.660465 -0.643619,-13.149003 1.324939,-5.488538 4.659682,-8.994751 4.659682,-8.994751" />
							    	<path class="odd" d="m 31.925369,31.477584 c 0,0 2.153609,-2.934998 9.074971,-5.105078 6.921362,-2.17008 11.799844,-0.618718 11.799844,-0.618718" />
							    	<path class="odd" d="m 57.131213,26.814448 c 0,0 5.127709,1.731228 9.899495,7.513009 4.771786,5.781781 4.772971,12.109204 4.772971,12.109204" />
							    	<path class="odd" d="m 72.334009,50.76769 0.09597,2.298098 -0.09597,2.386485" />
							    	<path class="even" d="m 27.849282,62.75 c 0,0 1.286086,-1.279223 1.25,-4.25 -0.03609,-2.970777 -1.606117,-7.675266 -0.625,-12.75 0.981117,-5.074734 4.5,-9.5 4.5,-9.5" />
							    	<path class="even" d="m 36.224282,33.625 c 0,0 8.821171,-7.174484 19.3125,-2.8125 10.491329,4.361984 11.870558,14.952665 11.870558,14.952665" />
							    	<path class="even" d="m 68.349282,49.75 c 0,0 0.500124,3.82939 0.5625,5.8125 0.06238,1.98311 -0.1875,5.9375 -0.1875,5.9375" />
							    	<path class="odd" d="m 31.099282,65.625 c 0,0 1.764703,-4.224042 2,-7.375 0.235297,-3.150958 -1.943873,-9.276886 0.426777,-15.441942 2.370649,-6.165056 8.073223,-7.933058 8.073223,-7.933058" />
							    	<path class="odd" d="m 45.849282,33.625 c 0,0 12.805566,-1.968622 17,9.9375 4.194434,11.906122 1.125,24.0625 1.125,24.0625" />
							    	<path class="even" d="m 59.099282,70.25 c 0,0 0.870577,-2.956221 1.1875,-4.5625 0.316923,-1.606279 0.5625,-5.0625 0.5625,-5.0625" />
							    	<path class="even" d="m 60.901059,56.286612 c 0,0 0.903689,-9.415996 -3.801777,-14.849112 -3.03125,-3.5 -7.329245,-4.723939 -11.867187,-3.8125 -5.523438,1.109375 -7.570313,5.75 -7.570313,5.75" />
							    	<path class="even" d="m 34.072577,68.846248 c 0,0 2.274231,-4.165782 2.839205,-9.033748 0.443558,-3.821814 -0.49394,-5.649939 -0.714206,-8.05386 -0.220265,-2.403922 0.21421,-4.63364 0.21421,-4.63364" />
							    	<path class="odd" d="m 37.774165,70.831845 c 0,0 2.692139,-6.147592 3.223034,-11.251208 0.530895,-5.103616 -2.18372,-7.95562 -0.153491,-13.647655 2.030229,-5.692035 8.108442,-4.538898 8.108442,-4.538898" />
							    	<path class="odd" d="m 54.391174,71.715729 c 0,0 2.359472,-5.427681 2.519068,-16.175068 0.159595,-10.747388 -4.375223,-12.993087 -4.375223,-12.993087" />
							    	<path class="even" d="m 49.474282,73.625 c 0,0 3.730297,-8.451831 3.577665,-16.493718 -0.152632,-8.041887 -0.364805,-11.869326 -4.765165,-11.756282 -4.400364,0.113044 -3.875,4.875 -3.875,4.875" />
							    	<path class="even" d="m 41.132922,72.334447 c 0,0 2.49775,-5.267079 3.181981,-8.883029 0.68423,-3.61595 0.353553,-9.413359 0.353553,-9.413359" />
						    		<path class="odd" d="m 45.161782,73.75 c 0,0 1.534894,-3.679847 2.40625,-6.53125 0.871356,-2.851403 1.28125,-7.15625 1.28125,-7.15625" />
							    	<path class="odd" d="m 48.801947,56.125 c 0,0 0.234502,-1.809418 0.109835,-3.375 -0.124667,-1.565582 -0.5625,-3.1875 -0.5625,-3.1875" />
							    </g>
							</svg>
							<svg class="fingerprint fingerprint-active" xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
								<g class="fingerprint-out" fill="none" stroke-width="2" stroke-linecap="round">
							    	<path class="odd" d="m 25.117139,57.142857 c 0,0 -1.968558,-7.660465 -0.643619,-13.149003 1.324939,-5.488538 4.659682,-8.994751 4.659682,-8.994751" />
							    	<path class="odd" d="m 31.925369,31.477584 c 0,0 2.153609,-2.934998 9.074971,-5.105078 6.921362,-2.17008 11.799844,-0.618718 11.799844,-0.618718" />
							    	<path class="odd" d="m 57.131213,26.814448 c 0,0 5.127709,1.731228 9.899495,7.513009 4.771786,5.781781 4.772971,12.109204 4.772971,12.109204" />
							    	<path class="odd" d="m 72.334009,50.76769 0.09597,2.298098 -0.09597,2.386485" />
							    	<path class="even" d="m 27.849282,62.75 c 0,0 1.286086,-1.279223 1.25,-4.25 -0.03609,-2.970777 -1.606117,-7.675266 -0.625,-12.75 0.981117,-5.074734 4.5,-9.5 4.5,-9.5" />
							    	<path class="even" d="m 36.224282,33.625 c 0,0 8.821171,-7.174484 19.3125,-2.8125 10.491329,4.361984 11.870558,14.952665 11.870558,14.952665" />
							    	<path class="even" d="m 68.349282,49.75 c 0,0 0.500124,3.82939 0.5625,5.8125 0.06238,1.98311 -0.1875,5.9375 -0.1875,5.9375" />
							    	<path class="odd" d="m 31.099282,65.625 c 0,0 1.764703,-4.224042 2,-7.375 0.235297,-3.150958 -1.943873,-9.276886 0.426777,-15.441942 2.370649,-6.165056 8.073223,-7.933058 8.073223,-7.933058" />
							    	<path class="odd" d="m 45.849282,33.625 c 0,0 12.805566,-1.968622 17,9.9375 4.194434,11.906122 1.125,24.0625 1.125,24.0625" />
							    	<path class="even" d="m 59.099282,70.25 c 0,0 0.870577,-2.956221 1.1875,-4.5625 0.316923,-1.606279 0.5625,-5.0625 0.5625,-5.0625" />
							    	<path class="even" d="m 60.901059,56.286612 c 0,0 0.903689,-9.415996 -3.801777,-14.849112 -3.03125,-3.5 -7.329245,-4.723939 -11.867187,-3.8125 -5.523438,1.109375 -7.570313,5.75 -7.570313,5.75" />
							    	<path class="even" d="m 34.072577,68.846248 c 0,0 2.274231,-4.165782 2.839205,-9.033748 0.443558,-3.821814 -0.49394,-5.649939 -0.714206,-8.05386 -0.220265,-2.403922 0.21421,-4.63364 0.21421,-4.63364" />
							    	<path class="odd" d="m 37.774165,70.831845 c 0,0 2.692139,-6.147592 3.223034,-11.251208 0.530895,-5.103616 -2.18372,-7.95562 -0.153491,-13.647655 2.030229,-5.692035 8.108442,-4.538898 8.108442,-4.538898" />
							    	<path class="odd" d="m 54.391174,71.715729 c 0,0 2.359472,-5.427681 2.519068,-16.175068 0.159595,-10.747388 -4.375223,-12.993087 -4.375223,-12.993087" />
							    	<path class="even" d="m 49.474282,73.625 c 0,0 3.730297,-8.451831 3.577665,-16.493718 -0.152632,-8.041887 -0.364805,-11.869326 -4.765165,-11.756282 -4.400364,0.113044 -3.875,4.875 -3.875,4.875" />
							    	<path class="even" d="m 41.132922,72.334447 c 0,0 2.49775,-5.267079 3.181981,-8.883029 0.68423,-3.61595 0.353553,-9.413359 0.353553,-9.413359" />
							    	<path class="odd" d="m 45.161782,73.75 c 0,0 1.534894,-3.679847 2.40625,-6.53125 0.871356,-2.851403 1.28125,-7.15625 1.28125,-7.15625" />
							    	<path class="odd" d="m 48.801947,56.125 c 0,0 0.234502,-1.809418 0.109835,-3.375 -0.124667,-1.565582 -0.5625,-3.1875 -0.5625,-3.1875" />
							    </g>
							  </svg>
							  <svg class="ok" xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path d="M34.912 50.75l10.89 10.125L67 36.75" fill="none" stroke="#fff" stroke-width="6"/></svg>
							</div>
							
						</div>
					</div>
					<div class="col-6" style="max-height: 75vh; padding-left: 3rem;">
						<div class="donation_detail_organization d-flex justify-content-end align-items-center">
							
						</div>
						<div class="donation_detail_content">
						
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>


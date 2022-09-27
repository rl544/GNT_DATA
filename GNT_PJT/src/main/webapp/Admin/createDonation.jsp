<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!--     Fonts and icons     -->
		<!--     Fonts and icons     -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
		<!--   Core JS Files   -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="/resources/demos/style.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="/resources/demos/style.css">
		  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Chart JS -->
		<script src="js/chartjs.min.js"></script>
		<!--  Notifications Plugin    -->
		<script src="js/bootstrap-notify.js?ver=1"></script>
		<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
		<!-- <script src="js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>Paper Dashboard DEMO methods, don't include it in your project! -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<style scoped>
			@import url("css/createDonation.css?ver=1");
			
			.ui-datepicker-trigger {
				width: 10%;
			}
			
			input::-webkit-inner-spin-button {
			  appearance: none;
			  -moz-appearance: none;
			  -webkit-appearance: none;
			}
			
			.predict-btn {
				padding: 0.5rem 1rem;
			    border: 1px solid lightgrey;
			    border-radius: 15px;
			    color: grey;
			}

		</style>
			
		<script>
			
			$(function() {
				var category = 0;
			    var create_time = "";
			    var end_time = "";
			    var donation_limit = 0;
			    
				$( "#datepicker-start" ).datepicker({
					onSelect: function() { 
			            var date = $.datepicker.formatDate("yy-mm-dd",$("#datepicker-start").datepicker("getDate")); 
			            create_time = String(date);
			        },
					showOn: "button",
					buttonImage: "img/schedule.png",
					buttonImageOnly: true,
					
				});
				$( "#anim" ).on( "change", function() {
				    $( "#datepicker-start" ).datepicker( "option", "showAnim", $( this ).val() );
				});
				$( "#datepicker-end" ).datepicker({
					onSelect: function() { 
			            var date = $.datepicker.formatDate("yy-mm-dd",$("#datepicker-end").datepicker("getDate")); 
			            end_time = String(date);
			        },
					showOn: "button",
					buttonImage: "img/schedule.png",
					buttonImageOnly: true,
				});
				$( "#anim" ).on( "change", function() {
				    $( "#datepicker-end" ).datepicker( "option", "showAnim", $( this ).val() );
				});
				
			    $('.category_list li').click(function() {
			    	$.each($('.category_list li'), function(index, item) {
			    		$('#'+item.id).removeClass('selected')
			    	})
			    	$(this).addClass('selected')
			    	category = $(this).attr('id').substr(4, 1)
			    })
			    
			    
			    
			    $('.predict-btn').click(function() {
			    	donation_limit = $('#donation_amount').val()
			    	if (category!=0 && create_time!="" && end_time!="" && donation_limit!=0) {
			    		data = {
							'category': parseInt(category),
							'donation_limit': parseInt(donation_limit),
							'create_time': String(create_time),
							'end_time': String(end_time)
						}
			    		$.ajax({
							type: 'post',
							url: 'http://127.0.0.1:8970/predict_result',
							data: JSON.stringify(data),
							contentType: 'application/json; charset=utf-8',
							success: function(res) {
								console.log(res)
								prob0 = res.prob0
								prob1 = res.prob1
								result = res.result
								if (result==0) {
									$('.result-page').html('<h2 style=margin-bottom:0px;text-align:center;margin-top:1rem;font-weight:bold;>실패</h2>'+
											'<img src=img/bad-feedback.png style=margin-top:1rem;width:80%;margin-left:1rem;>'+
											'<div style=margin-top:2rem;>성공 확률 : '+prob1.toFixed(8)+'</div>' +
											'<div>실패 확률 : '+prob0.toFixed(8)+'</div>')
								} else {
									$('.result-page').html('<h2 style=margin-bottom:0px;text-align:center;margin-top:1rem;font-weight:bold;>성공</h2>'+
											'<img src=img/good-feedback.png style=margin-top:1rem;width:80%;margin-left:1rem;>'+
											'<div style=margin-top:2rem;>성공 확률 : '+prob1.toFixed(8)+'</div>' +
											'<div>실패 확률 : '+prob0.toFixed(8)+'</div>')
								}
							},
							error: function(err) {
								console.log(err)
							}
				    	})
			    	} else {
			    		swal({
							title: "데이터 부족!",
							text: "모든 항목을 기입해 주세요!",
							icon: "warning",
							buttons: true,
						})
			    	}
			    })
			    
			});
			
		</script>
	
	</head>
	
	<body>
		<div class="wrapper ">
		    <div class="sidebar" data-color="white" data-active-color="danger">
		      <div class="logo">
		        <div style="margin: 1rem 0.5rem; font-size: x-large; font-weight: bold;">
		        	GiveNotTake
		        </div>
		      </div>
		      <div class="sidebar-wrapper">
		        <ul class="nav">
		          <li class="active ">
		            <a href="admin.jsp">
		              <i class="nc-icon nc-bank"></i>
		              <p>기부 통계 조회</p>
		            </a>
		          </li>
		          <li>
		            <a href="createDonation.jsp">
		              <i class="nc-icon nc-diamond"></i>
		              <p>기부 항목 추가</p>
		            </a>
		          </li>
		        </ul>
		      </div>
		    </div>
		    <div class="main-panel">
		      <!-- Navbar -->
		      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
		        <div class="container-fluid">
		          <div class="navbar-wrapper">
		            <a class="navbar-brand" href="javascript:;">기부낫테이크 관리자 페이지</a>
		          </div>
		        </div>
		      </nav>
		      <!-- End Navbar -->
		      <div class="content">
		        <div class="row">
		          <div class="col-md-12">
		            <div class="card ">
		              <div class="card-header ">
						<h5 class="card-title">기부 항목 추가</h5>
						<p class="card-category">달성 목표 금액을 입력하면 예측된 값이 제공됩니다.</p>
		              </div>
		              <div class="card-body row">
		         	<div class="col-8">
						<div class="input-block">
							<label for="text" class="input-label" align="center">카테고리</label>
							<!-- <input type="text" name="title" id="cre-Donation-title" placeholder="title"> -->
							<ul class="d-flex justify-content-between category_list">
								<li id="list1">아동·청소년</li>
								<li id="list2">어르신</li>
								<li id="list3">장애인</li>
								<li id="list4">다문화</li>
								<li id="list5">글로벌</li>
								<li id="list6">가족·여성</li>
								<li id="list7">동물</li>
								<li id="list8">환경</li>
							</ul>
						</div>
						<div class="input-block d-flex justify-content-evenly" style="flex-direction: row;">
							<div>
								<label for="start" class="input-label" align="center">시작일</label>
								<input name="start" id="datepicker-start" style="margin-right: 1rem;" disabled>
							</div>
							
							<div style="margin-left: 4rem;">
								<label for="end" class="input-label" align="center">종료일</label>
								<input name="end" id="datepicker-end" style="margin-right: 1rem;" disabled>
							</div>
						</div>
						<div class="input-block">
							<label for="amount" class="input-label" align="center">목표 금액!!</label>
							<input type="number" name="amount" id="donation_amount" style="width: 75%; margin: auto;">
						</div>
		         	</div>
		              	
	              	<div class="col-3 result-page" style="height: 340px; border: 1px solid lightgrey; border-radius: 5px; margin-left: 2.5rem;">
	              		
	              	</div>
			        <div style="margin: auto;">
			        	<button class="predict-btn">확인하기</button>
			        </div>
		              <div class="card-footer ">
		                
		                <hr>
		                <div class="stats">
		                </div>
		              </div>
		            </div>
		          </div>

		        </div>
		      </div>
		    </div>
		  </div>
	</body>
</html>
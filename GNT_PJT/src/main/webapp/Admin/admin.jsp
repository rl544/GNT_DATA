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
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Chart JS -->
		<script src="js/chartjs.min.js"></script>
		<!--  Notifications Plugin    -->
		<script src="js/bootstrap-notify.js?ver=1"></script>
		<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
		<!-- <script src="js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>Paper Dashboard DEMO methods, don't include it in your project! -->
		<style scoped>
			@import url("css/admin.css?ver=1");
		</style>
		
		<!-- 색상표 -->
		<!-- 
			'#D95843',
			'#ef8157',
			'#fcc468',
			'#86E08F',
			'#4AC884',
			'#4acccd',
			'#4A83B6',
			'#A6369C'
		 -->
		 
		<script>
			// 화면 들어오자 마자
			$(document).ready(function() {
		      // Javascript method's body can be found in assets/assets-for-demo/js/demo.js
		    });
			
			$(function() {
				chart = Object
				getInfo4()
				getChart1()
				getChart2()
				getChart3()
				
				setTimeout(() => {
		      		demo.initChartsPages(chart);
			        demo.initTopPages(); // 값 불러오기
				}, 5500);
			})
			
			function getInfo4() {
				$.ajax({
					type: 'get',
					url: 'http://127.0.0.1:8970/info4',
					data: {
					},
					success: function(res) {
						$('.total-amount').text(numberWithCommas(res['total_amount'])+'원')
						$('.total-count').text(numberWithCommas(res['total_cnt'])+'회')
						$('.today-amount').text(numberWithCommas(res['today_amount'])+'원')
						$('.today-count').text(numberWithCommas(res['today_cnt'])+'회')
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
			
			function getChart1() {
				$.ajax({
					type: 'get',
					url: 'http://127.0.0.1:8970/chart1',
					data: {
					},
					success: function(res) {
						chart['chart1'] = res
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
			
			function getChart2() {
				$.ajax({
					type: 'get',
					url: 'http://127.0.0.1:8970/chart2',
					data: {
					},
					success: function(res) {
						console.log(res)
						chart['chart2'] = res
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
			
			function getChart3() {
				$.ajax({
					type: 'get',
					url: 'http://127.0.0.1:8970/chart3',
					data: {
					},
					success: function(res) {
						chart['chart3'] = res
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
			
			demo = {
					
			  
			  initChartsPages: function(chart) {
			    chartColor = "#FFFFFF";
				
			    // 카테고리별 총 기부금액(전체) -- 막대차트
			    ctx = document.getElementById('chartbar').getContext("2d");
			    data1 = []
			    data2 = []
			    data3 = []
			    data3_label = []
			    $.each(chart['chart1'], function(index, item) {
			    	data1.push(item)
			    })
			    $.each(chart['chart2'], function(index, item) {
			    	data2.push(item)
			    })
			    $.each(chart['chart3'], function(index, item) {
			    	console.log(index, item)
			    	data3_label.push(index);
			    	data3.push(item)
			    })
			    
			    myChart = new Chart(ctx, {
			    	type: 'bar',
			    	data: {
				        labels: ["아동·청소년", "어르신", "장애인", "다문화", "지구촌", "가족·여성", "동물", "환경"], // 기부 카테고리
				        datasets: [{
				          label: false,
				          //pointRadius: 0,
				          //pointHoverRadius: 0,
				          backgroundColor: [ // 색 8개 집어넣기
				            '#D95843',
				            '#ef8157',
				            '#fcc468',
				            '#86E08F',
				            '#4AC884',
				            '#4acccd',
				            '#4A83B6',
				            '#A6369C'
				          ],
				          borderWidth: 0,
				          data: data2 // 비율로 주면 된다.
				          
				        }]
				      },
				      options: {
				    	  legend: {
				    		  display: false
				    	  }
				      }
			    	
			    });
			
				// 오늘 카테고리별 기부비율  -- 원그래프
			    ctx = document.getElementById('chartEmail').getContext("2d");
				
				// config
			    myChart = new Chart(ctx, {
			      type: 'doughnut', // or doughnut or pie
			      data: {
			        labels: ["아동·청소년", "어르신", "장애인", "다문화", "지구촌", "가족·여성", "동물", "환경"], // 기부 카테고리
			        datasets: [{
			          label: '',
			          //pointRadius: 0,
			          //pointHoverRadius: 0,
			          backgroundColor: [
			  			'#D95843',
						'#ef8157',
						'#fcc468',
						'#86E08F',
						'#4AC884',
						'#4acccd',
						'#4A83B6',
						'#A6369C'
			          ],
			          //borderWidth: 0,
			          data: data1 // 비율로 주면 된다.
			        }]
			      }, // data
			
			      options: {
			
			        legend: {
			          display: false
			        },
			
			        /* pieceLabel: {
			          render: 'percentage',
			          fontColor: ['white'],
			          precision: 2
			        }, */
			
			        /* tooltips: { // 마우스를 올렸을 때 색과 값이 나타나게 하는 부분
			          enabled: false
			        }, */
			
			        scales: {
			          yAxes: [{
			
			            ticks: {
			              display: false
			            },
			            gridLines: {
			              drawBorder: false,
			              zeroLineColor: "transparent",
			              color: 'rgba(255,255,255,0.05)'
			            }
			
			          }],
			
			          xAxes: [{
			            barPercentage: 1.6,
			            gridLines: {
			              drawBorder: false,
			              color: 'rgba(255,255,255,0.1)',
			              zeroLineColor: "transparent"
			            },
			            ticks: {
			              display: false,
			            }
			          }]
			        },
			      } // option
			    });
				
			    // 최근 10일 간 기부 금액 추세 -- 줄그래프
			    var speedCanvas = document.getElementById("speedChart");
				
			    var dataFirst = {
			      data: data3,
			      fill: false,
			      borderColor: '#fbc658',
			      backgroundColor: 'transparent',
			      pointBorderColor: '#fbc658',
			      pointRadius: 4,
			      pointHoverRadius: 4,
			      pointBorderWidth: 8
			    };
			
			    var speedData = {
			      labels: data3_label, // 날짜 받기
			      datasets: [dataFirst]
			    };
			
			    var chartOptions = {
			      legend: {
			        display: false,
			        position: 'top'
			      }
			    };
			
			    var lineChart = new Chart(speedCanvas, {
			      type: 'line',
			      hover: true,
			      data: speedData,
			      options: chartOptions
			    });
			  }

			}; // demo
			
			function numberWithCommas(x) {
				  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				}
			
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
		        <!-- Top Card -->
		        <div class="row">
		          <div class="col-lg-3 col-md-6 col-sm-6">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
		                      <i class="nc-icon nc-globe text-warning"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8" style="padding-left: 0px;">
		                    <div class="numbers">
		                      <p class="card-category">총 기부금액</p>
		                      <p class="card-title total-amount"><p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">TOTAL AMOUNT
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="col-lg-3 col-md-6 col-sm-6">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
		                      <i class="nc-icon nc-money-coins text-success"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8" style="padding-left: 0px;">
		                    <div class="numbers">
		                      <p class="card-category">총 기부횟수</p>
		                      <p class="card-title total-count"><p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats stats2">
		                TOTAL COUNT
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="col-lg-3 col-md-6 col-sm-6">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
		                      <i class="nc-icon nc-vector text-danger"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8" style="padding-left: 0px;">
		                    <div class="numbers">
		                      <p class="card-category">오늘 기부금액</p>
		                      <p class="card-title today-amount">20,000,000<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats stats3">
		                TODAY AMOUNT
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="col-lg-3 col-md-6 col-sm-6">
		            <div class="card card-stats">
		              <div class="card-body ">
		                <div class="row">
		                  <div class="col-5 col-md-4">
		                    <div class="icon-big text-center icon-warning">
		                      <i class="nc-icon nc-favourite-28 text-primary"></i>
		                    </div>
		                  </div>
		                  <div class="col-7 col-md-8" style="padding-left: 0px;">
		                    <div class="numbers">
		                      <p class="card-category">오늘 기부횟수</p>
		                      <p class="card-title today-count">1,000<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats stats4">
		                TODAY COUNT
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <!-- Top Card End-->
		        <!-- Chart -->
		        <div class="row">
		          <div class="col-md-4">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">오늘 카테고리별 기부 비율</h5>
		                <p class="card-category">Today's donation rate by category</p>
		              </div>
		              <div class="card-body ">
		                <canvas id="chartEmail"></canvas>
		              </div>
		              <div class="card-footer ">
		                <div class="legend">
		                  <i class="fa fa-circle text-young pie1"></i> 아동/청소년
		                  <i class="fa fa-circle text-old pie2"></i> 어르신
		                  <i class="fa fa-circle text-disabled pie3"></i> 장애인
		                  <i class="fa fa-circle text-multi pie4"></i> 다문화
		                  <i class="fa fa-circle text-global pie5"></i> 지구촌
		                  <i class="fa fa-circle text-family pie6"></i> 가족/여성
		                  <i class="fa fa-circle text-animal pie7"></i> 동물
		                  <i class="fa fa-circle text-env pie8"></i> 환경
		                </div>
		                <hr>
		                <div class="stats">
		                </div>
		              </div>
		            </div>
		          </div>
		          
		          <div class="col-md-8">
		            <div class="card " style="height: 56vh;">
		              <div class="card-header ">
		                <h5 class="card-title">총 카테고리별 기부 금액</h5>
		                <p class="card-category">Total donations by category</p>
		              </div>
		              <div class="card-body ">
		                <canvas id=chartbar width="400" height="100"></canvas>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
		                </div>
		              </div>
		            </div>
		          </div>
		          
		          
		          <div class="col-md-12">
		            <div class="card card-chart">
		              <div class="card-header">
		                <h5 class="card-title">최근 10일 간 기부 금액 변화</h5>
		                <p class="card-category">Donation amount trend in the last 10 days</p>
		              </div>
		              <div class="card-body">
		                <canvas id="speedChart" width="400" height="100"></canvas>
		              </div>
		              <div class="card-footer">
		                <div class="chart-legend">
		                  <i class="fa fa-circle text-warning"></i> 날짜 별 기부 금액
		                </div>
		                <hr />
		                <div class="card-stats">
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
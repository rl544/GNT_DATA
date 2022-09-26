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
		    	demo.initChartsPages();
		        demo.initTopPages(); // 값 불러오기
		        // 클릭할 때마다 값 설정하기
		        // 날짜 설정할 때마다 
		    	// updateTop(); // 비동기
		    });
			
			
			demo = {
			 
				// yujin insert
					  
				initTopPages: function(){
					updateTotalAmount();
					updateTotalCount();
					updateTodayAmount();
					updateTodayCount();
				},
					  
				// yujin end
					
			  
			  initChartsPages: function() {
			    chartColor = "#FFFFFF";
				
			    // 카테고리별 총 기부금액(전체) -- 막대차트
			    ctx = document.getElementById('chartbar').getContext("2d");
			    
			    myChart = new Chart(ctx, {
			    	type: 'bar',
			    	data: {
				        labels: ["아동/청소년", "어르신", "장애인", "다문화", "지구촌", "가족/여성", "동물", "환경"], // 기부 카테고리
				        datasets: [{
				          label: '',
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
				          data: [100,50,80,39,100,50,50,78] // 비율로 주면 된다.
				        }]
				      },
				      options: {
				    	  
				      }
			    	
			    });
			    
			    
			    // 카테고리별 총 기부금액(최근 10일간) -- 
			    /* ctx = document.getElementById('chartHours').getContext("2d");
			
			    myChart = new Chart(ctx, {
			      type: 'line',
			
			      data: {
			        labels: ["09/01", "09/02", "09/03", "09/04", "09/05", "09/06", "09/07", "09/08", "09/09", "09/10"], // 날짜
			        datasets: [
			          // 
			          {
			            borderColor: "#D95843",
			            backgroundColor: "#D95843",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [300, 310, 316, 322, 330, 326, 333, 345, 338, 354]
			          },
			          {
			            borderColor: "#ef8157",
			            backgroundColor: "#ef8157",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [320, 340, 365, 360, 370, 385, 390, 384, 408, 420]
			          },
			          {
			            borderColor: "#fcc468",
			            backgroundColor: "#fcc468",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 500]
			          },
			          {
			            borderColor: "#86E08F",
			            backgroundColor: "#86E08F",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 600]
			          },
			          {
			            borderColor: "#4AC884",
			            backgroundColor: "#4AC884",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 700]
			          },
			          {
			            borderColor: "#4acccd",
			            backgroundColor: "#4acccd",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 800]
			          },
			          {
			            borderColor: "#4A83B6",
			            backgroundColor: "#4A83B6",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 484]
			          },
			          {
			            borderColor: "#A6369C",
			            backgroundColor: "#A6369C",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 484]
			          }
			          
			          
			        ]
			      }, // data
			      options: {
			        legend: {
			          display: false
			        },
			
			        tooltips: {
			          enabled: false
			        },
			
			        scales: {
			          yAxes: [{
			
			            ticks: {
			              fontColor: "#9f9f9f",
			              beginAtZero: false,
			              maxTicksLimit: 5,
			              //padding: 20
			            },
			            gridLines: {
			              drawBorder: false,
			              zeroLineColor: "#ccc",
			              color: 'rgba(255,255,255,0.05)'
			            }
			
			          }],
			
			          xAxes: [{
			            barPercentage: 1.6,
			            gridLines: {
			              drawBorder: false,
			              color: 'rgba(255,255,255,0.1)',
			              zeroLineColor: "transparent",
			              display: false,
			            },
			            ticks: {
			              padding: 20,
			              fontColor: "#9f9f9f"
			            }
			          }]
			        },
			      } // option
			    }); */
			
				// 오늘 카테고리별 기부비율  -- 원그래프
			    ctx = document.getElementById('chartEmail').getContext("2d");
				
				// config
			    myChart = new Chart(ctx, {
			      type: 'pie',
			      data: {
			        labels: [1, 2, 3, 4, 5, 6, 7, 8], // 기부 카테고리
			        datasets: [{
			          label: "Emails",
			          pointRadius: 0,
			          pointHoverRadius: 0,
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
			          borderWidth: 0,
			          data: [1.5,1,2.5,1,1,1,1,1] // 비율로 주면 된다.
			        }]
			      }, // data
			
			      options: {
			
			        legend: {
			          display: false
			        },
			
			        pieceLabel: {
			          render: 'percentage',
			          fontColor: ['white'],
			          precision: 2
			        },
			
			        tooltips: {
			          enabled: false
			        },
			
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
			      data: [500, 190, 150, 200, 300, 400, 100, 500, 250, 300],
			      fill: false,
			      borderColor: '#fbc658',
			      backgroundColor: 'transparent',
			      pointBorderColor: '#fbc658',
			      pointRadius: 4,
			      pointHoverRadius: 4,
			      pointBorderWidth: 8,
			    };
			
			    var dataSecond = {
			      data: [50.5, 230, 100, 102, 200, 270, 300, 304, 420, 450],
			      fill: false,
			      borderColor: '#51CACF',
			      backgroundColor: 'transparent',
			      pointBorderColor: '#51CACF',
			      pointRadius: 4,
			      pointHoverRadius: 4,
			      pointBorderWidth: 8
			    };
			
			    var speedData = {
			      labels: ["09/11", "09/12", "09/13", "09/14", "09/15", "09/16", "09/17", "09/18", "09/19", "09/20"], // 날짜 받기
			      datasets: [dataFirst, dataSecond]
			    };
			
			    var chartOptions = {
			      legend: {
			        display: false,
			        position: 'top'
			      }
			    };
			
			    var lineChart = new Chart(speedCanvas, {
			      type: 'line',
			      hover: false,
			      data: speedData,
			      options: chartOptions
			    });
			  }

			}; // demo
			
			function updateTotalAmount(){ // 비동기 함수

			};
			
			function updateTotalCount(){
				
			};
			
			function updateTodayAmount(){
							
			};
						
			function updateTodayCount(){
							
			};
			
			
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
		              <p>기부 관리</p>
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
		                      <p class="card-title total-amount">3,000,000<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats stats1">
		                  <i class="fa fa-refresh"></i>
		                  Update Now
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
		                      <p class="card-title total-count">1,345,852<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats stats2">
		                  <i class="fa fa-refresh"></i>
		                  Update Now
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
		                  <i class="fa fa-refresh"></i>
		                  Update Now
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
		                  <i class="fa fa-refresh"></i>
		                  Update Now
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
		                <h5 class="card-title">오늘 카테고리별 기부비율</h5>
		                <p class="card-category">Last Campaign Performance</p>
		              </div>
		              <div class="card-body ">
		                <canvas id="chartEmail"></canvas>
		              </div>
		              <div class="card-footer ">
		                <div class="legend">
		                  <i class="fa fa-circle text-primary pie1"></i> 아동/청소년
		                  <i class="fa fa-circle text-warning pie2"></i> 어르신
		                  <i class="fa fa-circle text-danger pie3"></i> 장애인
		                  <i class="fa fa-circle text-danger pie4"></i> 다문화
		                  <i class="fa fa-circle text-danger pie5"></i> 지구촌
		                  <i class="fa fa-circle text-danger pie6"></i> 가족/여성
		                  <i class="fa fa-circle text-danger pie7"></i> 동물
		                  <i class="fa fa-circle text-danger pie8"></i> 환경
		                </div>
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-calendar"></i> Number of emails sent
		                </div>
		              </div>
		            </div>
		          </div>
		          
		          <div class="col-md-8">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">카테고리별 총 기부금액(전체)</h5>
		                <p class="card-category">24 Hours performance</p>
		              </div>
		              <div class="card-body ">
		                <canvas id=chartbar width="400" height="100"></canvas>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-history"></i> Updated 3 minutes ago
		                </div>
		              </div>
		            </div>
		          </div>
		          
		         <%-- <div class="col-md-12">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">카테고리별 총 기부금액(최근10일간)</h5>
		                <p class="card-category">24 Hours performance</p>
		              </div>
		              <div class="card-body ">
		                <canvas id=chartHours width="400" height="100"></canvas>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-history"></i> Updated 3 minutes ago
		                </div>
		              </div>
		            </div>
		          </div>  --%>
		          
		          <div class="col-md-12">
		            <div class="card card-chart">
		              <div class="card-header">
		                <h5 class="card-title">최근 10일 간 기부 금액 추세</h5>
		                <p class="card-category">Line Chart with Points</p>
		              </div>
		              <div class="card-body">
		                <canvas id="speedChart" width="400" height="100"></canvas>
		              </div>
		              <div class="card-footer">
		                <div class="chart-legend">
		                  <i class="fa fa-circle text-info"></i> Tesla Model S
		                  <i class="fa fa-circle text-warning"></i> BMW 5 Series
		                </div>
		                <hr />
		                <div class="card-stats">
		                  <i class="fa fa-check"></i> Data information certified
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
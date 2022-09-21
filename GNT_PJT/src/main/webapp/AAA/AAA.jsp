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
			@import url("css/AAA.css?ver=1");
		</style>
		
		<script>
			$(document).ready(function() {
		      // Javascript method's body can be found in assets/assets-for-demo/js/demo.js
		    	demo.initChartsPages();
		    });
			
			demo = {
			  initPickColor: function() {
			    $('.pick-class-label').click(function() {
			      var new_class = $(this).attr('new-class');
			      var old_class = $('#display-buttons').attr('data-class');
			      var display_div = $('#display-buttons');
			      if (display_div.length) {
			        var display_buttons = display_div.find('.btn');
			        display_buttons.removeClass(old_class);
			        display_buttons.addClass(new_class);
			        display_div.attr('data-class', new_class);
			      }
			    });
			  },
			
			  initDocChart: function() {
			    chartColor = "#FFFFFF";
			
			    ctx = document.getElementById('chartHours').getContext("2d");
			
			    myChart = new Chart(ctx, {
			      type: 'line',
			
			      data: {
			        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"],
			        datasets: [{
			            borderColor: "#6bd098",
			            backgroundColor: "#6bd098",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [300, 310, 316, 322, 330, 326, 333, 345, 338, 354]
			          },
			          {
			            borderColor: "#f17e5d",
			            backgroundColor: "#f17e5d",
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
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 484]
			          }
			        ]
			      },
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
			      }
			    });
			
			  },
			
			  initChartsPages: function() {
			    chartColor = "#FFFFFF";
			
			    ctx = document.getElementById('chartHours').getContext("2d");
			
			    myChart = new Chart(ctx, {
			      type: 'line',
			
			      data: {
			        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"],
			        datasets: [{
			            borderColor: "#6bd098",
			            backgroundColor: "#6bd098",
			            pointRadius: 0,
			            pointHoverRadius: 0,
			            borderWidth: 3,
			            data: [300, 310, 316, 322, 330, 326, 333, 345, 338, 354]
			          },
			          {
			            borderColor: "#f17e5d",
			            backgroundColor: "#f17e5d",
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
			            data: [370, 394, 415, 409, 425, 445, 460, 450, 478, 484]
			          }
			        ]
			      },
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
			      }
			    });
			
			
			    ctx = document.getElementById('chartEmail').getContext("2d");
			
			    myChart = new Chart(ctx, {
			      type: 'pie',
			      data: {
			        labels: [1, 2, 3],
			        datasets: [{
			          label: "Emails",
			          pointRadius: 0,
			          pointHoverRadius: 0,
			          backgroundColor: [
			            '#e3e3e3',
			            '#4acccd',
			            '#fcc468',
			            '#ef8157'
			          ],
			          borderWidth: 0,
			          data: [342, 480, 530, 120]
			        }]
			      },
			
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
			      }
			    });
			
			    var speedCanvas = document.getElementById("speedChart");
			
			    var dataFirst = {
			      data: [0, 19, 15, 20, 30, 40, 40, 50, 25, 30, 50, 70],
			      fill: false,
			      borderColor: '#fbc658',
			      backgroundColor: 'transparent',
			      pointBorderColor: '#fbc658',
			      pointRadius: 4,
			      pointHoverRadius: 4,
			      pointBorderWidth: 8,
			    };
			
			    var dataSecond = {
			      data: [0, 5, 10, 12, 20, 27, 30, 34, 42, 45, 55, 63],
			      fill: false,
			      borderColor: '#51CACF',
			      backgroundColor: 'transparent',
			      pointBorderColor: '#51CACF',
			      pointRadius: 4,
			      pointHoverRadius: 4,
			      pointBorderWidth: 8
			    };
			
			    var speedData = {
			      labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
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
			  },
			
			  showNotification: function(from, align) {
			    color = 'primary';
			
			    $.notify({
			      icon: "nc-icon nc-bell-55",
			      message: "Welcome to <b>Paper Dashboard</b> - a beautiful bootstrap dashboard for every web developer."
			
			    }, {
			      type: color,
			      timer: 8000,
			      placement: {
			        from: from,
			        align: align
			      }
			    });
			  }
			
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
		            <a href="./dashboard.html">
		              <i class="nc-icon nc-bank"></i>
		              <p>Dashboard</p>
		            </a>
		          </li>
		          <li>
		            <a href="./icons.html">
		              <i class="nc-icon nc-diamond"></i>
		              <p>Create Donation</p>
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
		            <a class="navbar-brand" href="javascript:;">Paper Dashboard</a>
		          </div>
		        </div>
		      </nav>
		      <!-- End Navbar -->
		      <div class="content">
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
		                      <p class="card-category">Total Amount</p>
		                      <p class="card-title">3,000,000,000<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
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
		                      <p class="card-category">Total Count</p>
		                      <p class="card-title">1,345,852<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
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
		                      <p class="card-category">Today Amount</p>
		                      <p class="card-title">20,000,000<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
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
		                      <p class="card-category">Today Count</p>
		                      <p class="card-title">1,000<p>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-refresh"></i>
		                  Update Now
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="row">
		          <div class="col-md-4">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">Users Behavior</h5>
		                <p class="card-category">24 Hours performance</p>
		              </div>
		              <%-- <div class="card-body ">
		                <canvas id=chartHours width="400" height="100"></canvas>
		              </div> --%>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-history"></i> Updated 3 minutes ago
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-8">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">Users Behavior</h5>
		                <p class="card-category">24 Hours performance</p>
		              </div>
		              <%-- <div class="card-body ">
		                <canvas id=chartHours width="400" height="100"></canvas>
		              </div> --%>
		              <div class="card-footer ">
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-history"></i> Updated 3 minutes ago
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="row">
		          <div class="col-md-4">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">Email Statistics</h5>
		                <p class="card-category">Last Campaign Performance</p>
		              </div>
		              <%-- <div class="card-body ">
		                <canvas id="chartEmail"></canvas>
		              </div> --%>
		              <div class="card-footer ">
		                <div class="legend">
		                  <i class="fa fa-circle text-primary"></i> Opened
		                  <i class="fa fa-circle text-warning"></i> Read
		                  <i class="fa fa-circle text-danger"></i> Deleted
		                </div>
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-calendar"></i> Number of emails sent
		                </div>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-8">
		            <div class="card card-chart">
		              <div class="card-header">
		                <h5 class="card-title">NASDAQ: AAPL</h5>
		                <p class="card-category">Line Chart with Points</p>
		              </div>
		              <%-- <div class="card-body">
		                <canvas id="speedChart" width="400" height="100"></canvas>
		              </div> --%>
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
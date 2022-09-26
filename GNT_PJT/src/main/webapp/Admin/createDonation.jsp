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
			@import url("css/createDonation.css?ver=1");
		</style>
		
		<script>
			$(document).ready(function() {
				$(function() {
				    $( "#datepicker-start" ).datepicker();
				  });
				$(function() {
				    $( "#datepicker-end" ).datepicker();
				  });
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
		        <div class="row">
		          <div class="col-md-12">
		            <div class="card ">
		              <div class="card-header ">
		                <h5 class="card-title">기부 항목 추가</h5>
		                <p class="card-category">달성 목표 금액을 입력하면 예측된 값이 제공됩니다.</p>
		              </div>
		              <div class="card-body ">
			              <div class="input-block">
		                    <label for="text" class="input-label">제목</label>
		                    <input type="text" name="title" id="cre-Donation-title" placeholder="title">
		                  </div>
		                  <div class="input-block">
		                    <label for="text" class="input-label">제목</label>
		                    <input type="text" name="title" id="cre-Donation-title" placeholder="title">
		                  </div>
		         
		                <form action="#">
		                	 제목 : <input type="text" name="title"> 
		                	 <br><br>
		                	 카테고리 선택 : <select name="category">
		                		<option value="아동/창소년">아동/청소년 <!-- value 값 바꾸기 -->
		                		<option value="어르신">어르신
		                		<option value="장애인">장애인
		                		<option value="다문화">다문화
		                		<option value="지구촌">지구촌
		                		<option value="가족/여성">가족/여성
		                		<option value="동물">동물
		                		<option value="환경">환경
		                	</select>
		                	<br><br>
		                	 기부 기관 : <input type="text" name="organization"> <br><br>
		                 	 목표 금액 : <input type="number" name="amount">원 <br><br>
		                	 시작 날짜 : <input type="text" id="datepicker-start"> <br><br>
		                	 마감 날짜 : <input type="text" id="datepicker-end"> <br><br>
		                	 
		                </form>
		              </div>
		              <div class="card-footer ">
		                
		                <hr>
		                <div class="stats">
		                  <i class="fa fa-calendar"></i> Number of emails sent
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
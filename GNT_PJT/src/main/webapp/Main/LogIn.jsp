<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style scoped>
		@import url("../Common/css/Nav.css?ver=1");
		@import url("../Common/css/Modal.css?ver=1");
	</style>
	<script>
		$(function() {
			openModalin();
			
			$('.closein-button').click(function() {
				closeModalin();
				history.back()
			})
			
			$('.goToSignup').click(function() {
				location.href="../Main/SignUp.jsp"
			})
			
			$('#logIn').click(function() {
				Login()
			})

		})
		
		function openModalin() {
			$('.modalin').addClass("is-open");
			$('.modalin').css({"position": "absolute", "z-index": "1"});
			$('body').css("overflow", "hidden");
		};
	
		function closeModalin() {
			$('.modalin').removeClass("is-open");
			$('.modalin').css('position', 'fixed');
			$('body').css("overflow", "initial");
		};
		
		function Login() {
			$.ajax({
				type: 'post',
				url: '../login.do',
				data: {
					'userEmail': $('#logIn_email').val(),
					'userPassword': $('#logIn_password').val()
				},
				// 응답 부분
				success: function(res) {
					console.log(res)
					if(res.message== 'yes') {
						var userInfo = new Object();
						$.each(res.userinfo, function(index, item) {
							if (item===null) {
								
							} else {
								userInfo[index] = item;
							}
						})
						localStorage.setItem('user', JSON.stringify(userInfo));
						swal({
							title: "로그인 성공!",
							text: "로그인에 성공하셨습니다.!",
							icon: "success",
							button: "확인!",
						})
						.then((value) => {
							location.href = "Main.jsp";	
						})
						
					} else if (res.message=="no") {
						swal({
							title: "로그인 실패!",
							text: "로그인에 실패하셨습니다.!",
							icon: "warning",
							button: "확인!",
						});
					} else {
						location.href="../Error/Error.jsp"
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
		<%@ include file="../Common/Nav.jsp" %>
		<div class="modalin">
	        <div class="modalin-container">
	            <div class="modalin-left">
	                <h1 class="modalin-title">환영합니다.!</h1>
	                <p class="modalin-desc">기부를 하기 위해 로그인을 진행해주세요.</p>
	                <div class="input-block">
	                    <label for="email" class="input-label">이메일</label>
	                    <input type="email" name="email" id="logIn_email" placeholder="Email">
	                </div>
	                <div class="input-block">
	                    <label for="password" class="input-label">비밀번호</label>
	                    <input type="password" name="password" id="logIn_password" placeholder="Password">
	                </div>
	                <br><br>
	                <div class="modalin-buttons">
	                    <a href="" class="">비밀번호 찾기</a>
	                    <button class="input-buttonin" id="logIn">로그인</button>
	                </div>
	                <p class="sign-up">아직 계정이 없으신가요? <a href="#" class="goToSignup">&nbsp;회원가입하기</a></p>
	            </div>
	            <div class="modalin-right">
	                <img src="../Main/img/MrB.jpg" alt="" style="width: 80%;">
	            </div>
	            <button class="icon-button closein-button">
	                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
	                    <path d="M 25 3 C 12.86158 3 3 12.86158 3 25 C 3 37.13842 12.86158 47 25 47 C 37.13842 47 47 37.13842 47 25 C 47 12.86158 37.13842 3 25 3 z M 25 5 C 36.05754 5 45 13.94246 45 25 C 45 36.05754 36.05754 45 25 45 C 13.94246 45 5 36.05754 5 25 C 5 13.94246 13.94246 5 25 5 z M 16.990234 15.990234 A 1.0001 1.0001 0 0 0 16.292969 17.707031 L 23.585938 25 L 16.292969 32.292969 A 1.0001 1.0001 0 1 0 17.707031 33.707031 L 25 26.414062 L 32.292969 33.707031 A 1.0001 1.0001 0 1 0 33.707031 32.292969 L 26.414062 25 L 33.707031 17.707031 A 1.0001 1.0001 0 0 0 32.980469 15.990234 A 1.0001 1.0001 0 0 0 32.292969 16.292969 L 25 23.585938 L 17.707031 16.292969 A 1.0001 1.0001 0 0 0 16.990234 15.990234 z"></path>
	                </svg>
	            </button>
			</div>
	    </div>
	</body>
</html>
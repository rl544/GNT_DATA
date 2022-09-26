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
			openModalout();
			
			$('.closeout-button').click(function() {
				closeModalout();
				history.back()
			})
			
			$('.goToLogin').click(function() {
				location.href="../Main/LogIn.jsp"
			})
			
			var email_valid = false;
			var name_valid = false;
			var password_valid = false;
			var passwordConfirm_valid = false;
			var is_duplicate = false;
			
			$('.checkDuplicateEmail').click(function() {
				checkDuplicateEmail()
			})
			
			/* 회원가입 */
			$('#signUp').click(function() {
				SignUp()
			})
		})
		
		function openModalout() {
			$('.modalout').addClass("is-open");
			$('.modalout').css({"position": "absolute", "z-index": "1"});
			$('body').css("overflow", "hidden");
		};
		
		function closeModalout() {
			$('.modalout').removeClass("is-open");
			$('.modalout').css('position', 'fixed');
			$('body').css("overflow", "initial");
		};
		
		function checkDuplicateEmail() {
			var userEmail = $('#signUp_email').val() 
			$.ajax({
				type: 'get',
				url: '../validateEmail.do',
				data: {
					'userEmail': userEmail
				},
				success: function(res) {
					if (email_valid==true) {
						if(res.message=='no') {
							swal({
								title: "아이디 중복",
								text: "이미 존재하는 아이디입니다.",
								icon: "warning",
								button: "확인",
							})
						} else {
							swal({
								title: "아이디 사용 가능",
								text: "사용 가능한 아이디입니다.!!",
								icon: "success",
								button: "확인",
							})
							is_duplicate = true;
							$('.checkDuplicateEmail').css("display", "none");
						}
					} else {
						alert('이메일 양식을 올바르게 기입하시오.')
					}
					
				},
				error: function(err) {
					console.log(err)
				}
			})
		}
		
		function SignUp() {
			if(!email_valid) {
				console.log('이메일이 올바르지 않습니다.')
			} else if (!name_valid) {
				console.log('이름이 올바르지 않습니다.')
			} else if (!password_valid) {
				console.log('비밀번호가 올바르지 않습니다.')
			} else if (!passwordConfirm_valid) {
				console.log('비밀번호가 일치하지 않습니다.')
			} else if (!is_duplicate) {
				console.log('중복검사가 완료되지 않았습니다.')
			} else {
				$.ajax({
					type: 'post',
					url: '../registerUser.do',
					data: {
						'userEmail': $('#signUp_email').val(),
						'userName': $('#signUp_nickname').val(),
						'userPassword': $('#signUp_password').val()
					},
					// 응답 부분
					success: function(res) {
						console.log(res)
						if(res.message== 'yes') {
							$.ajax({
								type: 'post',
								url: '../login.do',
								data: {
									'userEmail': $('#signUp_email').val(),
									'userPassword': $('#signUp_password').val()
								},
								success: function(res) {
									console.log(res)
									if(res.message== 'yes') {
										var userInfo = new Object();
										$.each(res.userinfo, function(index, item) {
											if (item===null) {
												userInfo[index] = "0";
											} else {
												userInfo[index] = item;
											}
										})
										localStorage.setItem('user', JSON.stringify(userInfo));
										swal({
											title: "회원가입 성공!",
											text: "회원가입에 성공하셨습니다.!",
											icon: "success",
											button: "확인!",
										})
										.then((value) => {
											location.href = "Main.jsp";	
										})
									} else if (res.message=='no') {
										swal({
											title: "회원가입 실패!",
											text: "회원가입에 실패하셨습니다.!",
											icon: "warning",
											button: "확인!",
										});
									} else {
										location.href = "../Error/Error.jsp"
									}
								},
								error: function(err) {
									console.log(err)
								}
							})
						
						} else if (res.message=="no") {
							swal({
								title: "회원가입 실패!",
								text: "회원가입에 실패하셨습니다.!",
								icon: "warning",
								button: "확인!",
							});
						} else {
							location.href = "../Error/Error.jsp"
						}
					},
					error: function(err) {
						console.log(err)
					}
				})
			}
		}
		
		/* 키업 관련 함수들 모음 */
		$(function() {
			$('#signUp_email').keyup(function() {
				var emailValid = $(this).val()
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				$('.checkDuplicateEmail').css("display", "block");
				is_duplicate = false;
				if(emailValid.match(regExp) != null) {
					$('label[for=email2]').html('이메일')
					email_valid = true;
				} else {
					$('label[for=email2]').html('이메일<span style=float:right;color:red;>이메일 양식에 맞게 작성하십시오.</span>')
					email_valid = false;
				}
			})
			
			$('#signUp_nickname').keyup(function() {
				var nameValid = $(this).val()
				var regExp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
				if(nameValid.match(regExp) != null) {
					$('label[for=nickname2]').html('이름<span style=float:right;color:red;>한글로 이름을 작성하십시오.</span>')
					name_valid = false;
				} else {
					if ($(this).val().length > 10) {
						$('label[for=nickname2]').html('이름<span style=float:right;color:red;>10글자 이내로 작성하십시오.</span>')
						name_valid = false;
					} else {
						$('label[for=nickname2]').html('이름')
						name_valid = true;
					}
				}
			})
			
			$('#signUp_password').keyup(function() {
				var passwordValid = $(this).val();
				var regExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/;
				if(!regExp.test(passwordValid)) {
					$('label[for=password2]').html('비밀번호<span style=float:right;color:red;>문자, 숫자, 특수문자를 하나 이상 사용하시오.</span>')
					password_valid = false;
				} else {
					if ($(this).val().length >= 8 && $(this).val().length <= 14) {
						$('label[for=password2]').html('비밀번호')
						password_valid = true;
					} else if ($(this).val().length < 8) {
						$('label[for=password2]').html('비밀번호<span style=float:right;color:red;>8글자 이상 작성하십시오.</span>')
						password_valid = false;
					} else {
						$('label[for=password2]').html('비밀번호<span style=float:right;color:red;>14글자 이하 작성하십시오.</span>')
						password_valid = false;
					}
				}
			})
			
			$('#signUp_passwordConfirm').keyup(function() {
				if($('#signUp_password').val()==$(this).val()) {
					$('label[for=passwordConfirm2]').html('비밀번호 확인')
					passwordConfirm_valid = true;
				} else {
					$('label[for=passwordConfirm2]').html('비밀번호<span style=float:right;color:red;>비밀번호와 동일하지 않습니다.</span>')
					passwordConfirm_valid = false;
				}
			})
			
			
		})
	</script>
	</head>
	<body>
		<%@ include file="../Common/Nav.jsp" %>
		<div class="modalout">
	        <div class="modalout-container">
	            <div class="modalout-left">
	                <h1 class="modalout-title">환영합니다.!</h1>
	                <p class="modalout-desc">기부를 하기 위해 회원가입을 진행해주세요.</p>
	                <div class="input-block">
	                    <label for="email2" class="input-label" id="email2">이메일</span></label>
	                    <div class="d-flex justify-content-between">
	                    	<input type="email" name="email2" id="signUp_email" placeholder="Email">
	                    	<span class="checkDuplicateEmail">중복 검사</span>
	                    </div>
	                </div>
	                <div class="input-block">
	                    <label for="nickname2" class="input-label">이름</label>
	                    <input type="text" name="nickname2" id="signUp_nickname" placeholder="Nickname">
	                </div>
	                <div class="input-block">
	                    <label for="password2" class="input-label">비밀번호</label>
	                    <input type="password" name="password2" id="signUp_password" placeholder="Password">
	                </div>
	                <div class="input-block">
	                    <label for="passwordConfirm2" class="input-label">비밀번호 확인</label>
	                    <input type="password" name="passwordConfirm2" id="signUp_passwordConfirm" placeholder="passwordConfirm">
	                </div>
	                <div class="modalout-buttons">
	                    <button class="input-buttonout" id="signUp">회원가입</button>
	                </div>
	                <p class="sign-in">이미 계정이 있으신가요? <a href="#" class="goToLogin">&nbsp;로그인하기</a></p>
	            </div>
	            <div class="modalout-right">
	                <img src="../Main/img/MrB.jpg" alt="" style="width: 80%;">
	            </div>
	            <button class="icon-button closeout-button">
	                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
	                    <path d="M 25 3 C 12.86158 3 3 12.86158 3 25 C 3 37.13842 12.86158 47 25 47 C 37.13842 47 47 37.13842 47 25 C 47 12.86158 37.13842 3 25 3 z M 25 5 C 36.05754 5 45 13.94246 45 25 C 45 36.05754 36.05754 45 25 45 C 13.94246 45 5 36.05754 5 25 C 5 13.94246 13.94246 5 25 5 z M 16.990234 15.990234 A 1.0001 1.0001 0 0 0 16.292969 17.707031 L 23.585938 25 L 16.292969 32.292969 A 1.0001 1.0001 0 1 0 17.707031 33.707031 L 25 26.414062 L 32.292969 33.707031 A 1.0001 1.0001 0 1 0 33.707031 32.292969 L 26.414062 25 L 33.707031 17.707031 A 1.0001 1.0001 0 0 0 32.980469 15.990234 A 1.0001 1.0001 0 0 0 32.292969 16.292969 L 25 23.585938 L 17.707031 16.292969 A 1.0001 1.0001 0 0 0 16.990234 15.990234 z"></path>
	                </svg>
	            </button>
			</div>
	    </div>
	</body>
</html>
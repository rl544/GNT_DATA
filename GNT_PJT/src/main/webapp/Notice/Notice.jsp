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
		@import url("css/Notice.css?ver=1");
	</style>
	
	<script>
		$(window).on('load', function() {
			$('#notice').addClass('loaded');
		});
		
		var notices = {}
		
		var presentNoticeId = "";
		
		$(function() {
			$('body').css('height', '100%').css('background-color', '#e5e5e542')
			
			getNotices()
			
			$('.table-body').on('click', '.table-row', function() {
				if ("table-list"+$(this).children().eq(0).text()==presentNoticeId) {
					$('#notice-content').remove();
					presentNoticeId = ""
				} else {
					
					presentNoticeId = "table-list"+$(this).children().eq(0).text()
					noticeId = $(this).children().eq(0).text()
					$.ajax({
						type: 'put',
						url: '../addNoticeCount.do',
						data: {
							'noticeId': noticeId
						},
						success: function(res) {
							if (res.message =='yes') {								
								getNoticesOpenContent(noticeId)
							} else {
								location.href = "../Error/Error.jsp"
							}
						},
						error: function(err) {
							console.log(err)
						}
					})
				}
				
			})
		})
		
		function getNotices() {
			$.ajax({
				type: 'get',
				url: '../getNoticeList.do',
				data: {},
				success: function(res) {
					if (res.message=="yes") {
						notices = res.notice
						$('.table-body').empty();
						$.each(notices, function(index, item) {
							$('.table-body').append('<li class=table-row id=table-list'+item.noticeId+'><div class=col-2 data-label=noticeId align=center>'+
													item.noticeId+'</div><div class="col-6" data-label=noticeTitle>'+
													item.noticeTitle+'</div><div class=col-2 data-label=createTime align=center>'+
													item.createTime.slice(0,10)+'</div><div class=col-2 data-label=viewCnt align=center>'+item.viewCnt+'</div></li>'
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
		
		function getNoticesOpenContent(noticeId) {
			$.ajax({
				type: 'get',
				url: '../getNoticeList.do',
				data: {},
				success: function(res) {
					if (res.message=="yes") {
						notices = res.notice
						var tempNoId = "";
						$('.table-body').empty();
						$.each(notices, function(index, item) {
							$('.table-body').append('<li class=table-row id=table-list'+item.noticeId+'><div class=col-2 data-label=noticeId align=center>'+
													item.noticeId+'</div><div class="col-6" data-label=noticeTitle>'+
													item.noticeTitle+'</div><div class=col-2 data-label=createTime align=center>'+
													item.createTime.slice(0,10)+'</div><div class=col-2 data-label=viewCnt align=center>'+item.viewCnt+'</div></li>'
							);
							if (item.noticeId == noticeId) tempNoId = index;
						})
						$('#notice-content').remove();
						$("#table-list"+noticeId).after('<div class=col-12 id=notice-content style=white-space:pre>'+notices[tempNoId].noticeContent+'</div>')
					} else {
						location.href = "../Error/Error.jsp"
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
		<div id="notice">
			<div id="loader-wrapper">            
				<div id="loader"></div>
				<div class="loader-section section-left"></div>
				<div class="loader-section section-right"></div>
			</div>
		    <%@ include file="../Common/Nav.jsp" %>
		    <div class="container">
		    	<div>
		    		<h2 class="title">공지사항</h2>
		    		<ul class="responsive-table" style="margin-bottom: 5rem;">
					    <li class="table-header">
					      <div class="col col-2" align="center">공지 번호</div>
					      <div class="col col-6" align="center">공지 제목</div>
					      <div class="col col-2" align=center>생성 날짜</div>
					      <div class="col col-2" align="center">조회수</div>
					    </li>
					    <div class="table-body">
						</div>
					</ul>
		    	</div>
		    </div>
		</div>
	</body>
</html>

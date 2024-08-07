<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Tomcat 10.x JSTL -->    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
	<meta charset="UTF-8">
	<title>course</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/sportlayout.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	<link rel="icon" href="../image/Logocopy11.png">
	<style>
		main h2 {
			color: rgb(146, 99, 28);
			margin-top: 20px;
			align-items: center;
		}

		.course-intro {
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			margin-top: 20px;
		}

		.sidebar img {
			width: 100%;
			cursor: pointer;
			transition: transform 0.3s ease;

		}

		.sidebar img:hover {
			transform: scale(1.05);
		}

		.content {
			display: flex;
			flex-direction: column;
			flex: 1 1 500px;
			text-align: left;
			padding: 20px;
		}
		  .banner {
            display: flex;
			justify-content: center;
			align-items: center;
			background-color:white;
			width: 100%;
			padding: 20px;
			box-sizing: border-box;
			margin-top:120px;
		
        }
          .banner video {
          	margin-top:80px;
          	margin-botton:80px;
	        width: 100%; /* 讓影片充滿其父元素的寬度 */
	     	width: 400px; /* 最大寬度為 300px，以避免在較大螢幕上影片過大 */
	        display: block; /* 確保影片是以區塊元素顯示，並佔據其父元素的整個寬度 */
	        margin: 0 auto; /* 如果需要將影片置中，可以使用 margin:auto */
	    }
		#myModal {
			display: none;
			position: fixed;
			z-index: 1050;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgba(0, 0, 0, 0.9);
			align-items: center;
			justify-content: center;
		}

		#myModal img {
			margin: auto;
			display: block;
			max-width: 80%;
			max-height: 80%;
		}

		#myModal .close {
			position: absolute;
			top: 10px;
			right: 25px;
			color: #fff;
			font-size: 35px;
			font-weight: bold;
		}

		#myModal .close:hover,
		#myModal .close:focus {
			color: #bbb;
			text-decoration: none;
			cursor: pointer;
		}

		hr {
			border: 1px solid #afadad;
			margin: 20px 0;
		}

		h4 {
			color: darkcyan;
			font-size: 26px;
		}

		button {
			background-color: var(--c-point);
			/* 自定義背景顏色 */
			color: white;
			/* 自定義文字顏色 */
			border: none;
			/* 去除邊框 */
		}

		.rwd-select {
			flex-direction: row;
			flex-wrap: wrap;
		}

		.rwd-select select {
			width: 100%;
			margin-bottom: 10px;
		}

		.form-select {
			width: 100%;
			/* 確保下拉選單在小螢幕上佔滿寬度 */
		}
		
		

		@media (min-width : 768px) {
			.container {
				flex-direction: row;
			}

			.sidebar {
				flex: 0 1 400px;
				max-width: 600px;
				margin-right: 20px;
			}

			.content {
				display: flex;
				flex-direction: column;
				flex: 1 1 500px;
				text-align: left;
				padding: 20px;
				margin-left: 200px;
			}

			.form-select {
				width: auto;
				/* 在桌機版上自動調整寬度 */
			}
			  .banner {
            display: flex;
			justify-content: center;
			align-items: center;
			background-color:white;
			width: 100%;
			padding: 20px;
			box-sizing: border-box;
			margin-top:120px;
		
        }
          .banner video {
          	margin-top:80px;
          	margin-botton:80px;
	        width: 100%; /* 讓影片充滿其父元素的寬度 */
	     	width: 1200px; /* 最大寬度為 300px，以避免在較大螢幕上影片過大 */
	        display: block; /* 確保影片是以區塊元素顯示，並佔據其父元素的整個寬度 */
	        margin: 0 auto; /* 如果需要將影片置中，可以使用 margin:auto */
	    }
			
			
		}
	</style>
</head>

<body data-bs-spy="scroll" data-bs-target="#navbarSupportedContent" data-bs-offset="200">
    <header>
  
     <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                        <!-- 設定區域範圍 -->
                        <div class="container-xl">
                            <!-- 表現LOGO連結的區域，可以加上LOGO圖片 -->
                            <a class="navbar-brand d-flex align-items-center" href="/index">
                                <img src="../image/Logocopy.png" width="100" alt="">
                                <h1 class="m-0 ms-1">SPORTIFy</h1>
                            </a>
                            <!-- 以下是手機版才出現的按鈕，負責控制顯示導覽選單 -->
                            <!-- 注意：data-bs-target的名字必須與可收合部份的ID相同 -->
                            <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                            <!-- 以下區域是在手機版會收合的選單部份 -->
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <!-- 這是一組選單，me-auto負責margin都在右邊，ms-auto負責margin都在左邊 -->
                                <div class="navbar-nav ms-auto">
                                    <li class="nav-item"><a class="nav-link " href="/index">訊息公告</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/announcement">課程介紹</a></li>
                                    <li class="nav-item"><a class="nav-link active" href="/backgroundCourse/course">課程報名</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/myCenter">會員中心</a></li>
                                    <li class="nav-item "><a class="nav-link" href="/information">交通資訊</a></li>
									<li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
									<li class="nav-item"><a id="login-btn" class="nav-link " href="/member" onclick="showLoginForm()">登入</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/trade/userTrades"><span><img src="../image/shopping-cart111.png" height="30px" width="30px"></span></a></li>
                                </div>
                            </div>
                            <span id="user-greeting" style="display: none;"></span>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

	<main>
	<div class="col-12 banner">
    	<video autoplay loop muted playsinline>
	        <!-- 手機版影片 -->
	        <source src="../image/startTraning.mp4" type="video/mp4" media="(max-width: 767px)">
	        <!-- 桌面版影片 -->
	        <source src="../image/startTraning.mp4" type="video/mp4" media="(min-width: 768px)">
	        <!-- 如果需要支持其他格式的视频，可以添加对应的<source>标签 -->
        
    	</video>
	</div>
		<section id="course-list">
			<h2 class="text-center" style="font-size: 36px">課程報名</h2>
		</section>
		<hr>
		<div class="container course-intro">
			<div class="sidebar">
				<picture>
					<source srcset="../image/course22.1.png" media="(min-width: 769px)">
					<source srcset="../image/corse23.1.png" media="(max-width: 768px)">
					<img src="../image/course22.1.png" alt="課程表" onclick="openModal()">
				</picture>
		</div>

			<div class="content">
				<!-- 根據課程名稱選擇 -->
				<c:forEach items="${groups}" var="courses">
					<section class="group-section">
						<h4>${courses[0].name }</h4>
						<section id="course_${courses[0].groupId}" class="course-detail">
							<form id="bookingForm_${courses[0].groupId}" onsubmit="bookCourse(event, 'course_${courses[0].groupId}')" action="/trade/api/add-to-cart" method="POST">
								<input type="hidden" name="courseId" value="${courses[0].id}">
								<div class="mb-3">
									<label for="booking" class="form-label">
										${fn:replace(courses[0].startDate, '00:00:00.0', '')}
										~
										${fn:replace(courses[0].endDate, '00:00:00.0', '')}
									</label>
									<div class="rwd-select">
										<select name="booking-course" class="form-select" required>
											<option value="" selected disabled>請選擇預約課程...</option>
											<c:forEach items="${courses}" var="course">
												<option path="${course.id}" value="${course.id}">${course.name} ${course.day} ${course.time} 價格：NT$ ${course.price}/每期</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="d-flex justify-content-end">
									&nbsp;
									<button type="submit" class="submit" id="bookingBtn_${courses[0].groupId}">預約</button>
								</div>
							</form>
						</section>
						<hr>
					</section>
				</c:forEach>
			</div>
			<!-- Modal -->
			<div id="myModal">
				<span class="close" onclick="closeModal()">&times;</span> <img src="../image/course22.1.png" alt="課程表">
			</div>
		</div>
	</main>

	<footer class="w-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4 d-flex flex-column">
					<p class="footer-title" style="font-size: 26px;">SPORTIFy</p>
					<p>地址：302 新竹縣竹北市十興ＸＸ街25號</p>
					<p>電話：(03)3456700</p>
					<p>電子信箱：sportify@gmail.com</p>
					<p>營業時間：1000-2200</p>
				</div>
				<!-- <div class="link-comm">
					<a href="https://line.me/tw/"> <img src="./image/line4.png" width="50" height="auto" alt="">
					</a>
				</div>
				<div class="link-comm1">
					<a href="https://www.instagram.com/"> <img src="./image/instagram4.png" width="50" height="auto" alt=""></a>
				</div> -->
			</div>
		</div>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/js/app.js"></script>
	<script>
		if ($('.navbar-toggler').is(':hidden')) {
			$(window).on('scroll', function () {
				if ($('html').scrollTop() > $('header').innerHeight()) {
					$('header').addClass('fixed');
				}
				if ($('html').scrollTop() == 0) {
					$('header').removeClass('fixed');
				}
			});
		}

		function openModal() {
			document.getElementById('myModal').style.display = "flex";
		}

		function closeModal() {
			document.getElementById('myModal').style.display = "none";
		}

		document.querySelectorAll('[id^="bookingBtn_"]').forEach(button => {
			button.addEventListener('click', function () {
				checkLoginAndBook(this);
			});
		});

		var isLoggedIn = false;

		$(document).ready(function () {
			$.ajax({
				url: '/api/check-login',
				method: 'GET',
				success: function (response) {
					if (response.loggedIn) {
						isLoggedIn = true;
					}
				}
			});
		});

		function checkLoginAndBook(button) {
			if (!isLoggedIn) {
				Swal.fire({
					title: '請先登入',
					text: '您需要登入才能預約',
					icon: 'warning',
					confirmButtonText: '確定'
				});
			} else {
				// 用戶已登入，提交表單
				var formId = button.closest('form').id;
				document.getElementById(formId).submit();
			}
		}
		
		
	</script>
</body>

</html>
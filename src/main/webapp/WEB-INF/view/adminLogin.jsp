<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
	<meta charset="UTF-8">
	<title>Admin Login</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="../css/adminLayout.css">
	<link rel="icon" href="../image/Logocopy11.png">
	<style>
		body {
			box-sizing: border-box;
			font-family: "Noto Sans TC", sans-serif;
			align-items: center;

		}

		main h2 {
			color: rgb(146, 99, 28);
			margin-top: 200px;
		}

		.form {
			max-width: 800px;
			/* 增加最大寬度 */
			margin: 0 auto;
			/* 居中對齊 */
			padding: 20px;
			border: 1px solid #ddd;
			border-radius: 5px;
			background-color: #fff;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}

		.loginGroup {
			margin-bottom: 15px;
		}

		.loginGroup label {
			display: block;
			font-weight: bold;
			margin-bottom: 5px;
		}

		.loginGroup input {
			width: 100%;
			padding: 10px;
			font-size: 16px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}

		.btnLogIn {
			display: flex;
			justify-content: center;
			background-color: #2cbae6;
			color: white;
			padding: 10px 20px;
			font-size: 16px;
			border: none;
			border-radius: 4px;
		}

		.btnLogIn:hover {
			background-color: #28bae6;
		}

		.links {
			display: flex;
			justify-content: right;
			margin-top: 15px;
		}

		.links a {
			color: #007bff;
		}

		.links a:hover {
			text-decoration: underline;
		}

		.btnReg {
			display: flex;
			justify-content: center;
			background-color: #ea8526;
			color: white;
			padding: 10px 20px;
			font-size: 16px;
			border: none;
			border-radius: 4px;
		}

		.btnReg:hover {
			background-color: #f59235;
		}

		.no-underline {
			text-decoration: none;
		}

		footer {
			margin-top: 70px;
		}

		@media (min-width : 768px) {
			.login {
				padding: 30px;
			}

			.btnLogIn {
				font-size: 18px;
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
								<h1 class="m-0 ms-1">SPORTIFy </h1>
							</a>
							<!-- 以下是手機版才出現的按鈕，負責控制顯示導覽選單 -->
							
							</div>
							<span id="user-greeting" style="display: none;"></span>
						</div>
					</nav>
				</div>
			</div>
		</div> 
	</header>

	<body>
		<main>
			<div class="container mb-5">
				<div class="row">
					<div class="col-12">
						<h2 class="text-center" style="font-size: 36px;">管理員登入</h2>
						<!-- <span id="user-greeting"></span> -->
						<div id="login-form-container">
							<form id="login-form" class="form">
								<div class="loginGroup">
									<label>帳號
										<input type="email" id="email" name="email" placeholder="請輸入電子信箱" required="required">
									</label>
								</div>
								<div class="loginGroup">
									<label>密碼
										<input type="password" id="password" name="password" placeholder="請輸入密碼" required="required">
									</label>
								</div>
								<div class="btnLogIn">
									<button type="button" class="btn btnLogIn" id="login-submit-btn" onclick="login()">登入</button>
								</div>
								<div class="links">
									   <a href="/member" style="font-size: 16px">切換會員 </a>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			  <!-- 模态框 -->
   
		</main>

		<footer class="w-100">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-4 d-flex flex-column">
						<p class="footer-title " style="font-size: 26px;">SPORTIFy</p>
						<p>地址：302 新竹縣竹北市十興ＸＸ街25號</p>
						<p>電話：(03)3456700</p>
						<p>電子信箱：sportify@gmail.com</p>
						<p>營業時間：1000-2200</p>
					</div>
					<div class="link-comm">
						<a href="https://line.me/tw/"> <img src="../image/line4.png" width="50" height="auto" alt=""></a>
					</div>
					<div class="link-comm1">
						<a href="https://www.instagram.com/"> <img src="../image/instagram4.png" width="50" height="auto" alt=""></a>
					</div>
				</div>
			</div>
		</footer>

		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="/js/app.js"></script>
		<script>
			//header============
			//當桌機版時....那麼進行以下工作
			//當window視窗scroll捲動時
			//if判斷捲出的範圍是否大於header的高度
			//如果是，則header應該......addClass('fixed')
			//安排 .fixed得樣式設定 for CSS 提示：position
			if ($('.navbar-toggler').is(':hidden')) {
				$(window).on('scroll', function () {
					if ($('html').scrollTop() > $('header').innerHeight()) {
						// console.log('yes');
						$('header').addClass('fixed');
					}
					if ($('html').scrollTop() == 0) {
						$('header').removeClass('fixed');
					}
				});
			}
			

		</script>
	</body>

</html>
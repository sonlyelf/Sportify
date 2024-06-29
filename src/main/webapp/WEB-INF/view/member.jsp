<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- Tomcat 10.x JSTL -->    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
	<meta charset="UTF-8">
	<title>member</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="../css/sportlayout.css">
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
			display: flex;
			justify-content:between;
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
								<h1 class="m-0 ms-1">SPORTIFy</h1>
							</a>
							<!-- 以下是手機版才出現的按鈕，負責控制顯示導覽選單 -->
							<!-- 注意：data-bs-target的名字必須與可收合部份的ID相同 -->
							<button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
							<!-- 以下區域是在手機版會收合的選單部份 -->
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<!-- 這是一組選單，me-auto負責margin都在右邊，ms-auto負責margin都在左邊 -->
								<div class="navbar-nav ms-auto">
									<li class="nav-item"><a class="nav-link" href="/index">訊息公告</a></li>
									<li class="nav-item"><a class="nav-link" href="/announcement">課程介紹</a></li>
									<li class="nav-item"><a class="nav-link" href="/backgroundCourse/course">課程報名</a></li>
									<li class="nav-item"><a class="nav-link" href="/myCenter">會員中心</a></li>
									<li class="nav-item"><a class="nav-link" href="/information">交通資訊</a></li>
									<li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
									<li class="nav-item"><a id="login-btn" class="nav-link active" href="/member" onclick="showLoginForm()">登入</a></li>
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

	<body>
		 <main>
        <div class="container mb-5">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center" style="font-size: 36px;">會員登入</h2>
                    <div id="login-form-container">
                        <form id="login-form" class="form" action="/user/login" method="post">
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
    <div class="loginGroup">
        <label>驗證碼
            <input type="text" id="captcha" name="captcha" placeholder="請輸入驗證碼" required>
        </label>
        <img id="captchaImg" src="/captchaImageServlet" onclick="refreshCaptcha()" alt="驗證碼">
        <a href="javascript:void(0)" style="font-size: 16px" onclick="refreshCaptcha()">刷新驗證碼</a>
    </div>
    <div class="btnLogIn">
        <button type="submit" class="btn btnLogIn" id="login-submit-btn">登入</button>
    </div>
    <div class="links">
        <a href="/admin/login" style="font-size: 16px">切換管理員</a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal" style="font-size: 16px">/忘記密碼?</a>
    </div>
</form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mb-5">
            <div class="row">
                <div class="col-12">
                    <div class="btnReg ">
                        <a href="/register" class="no-underline">
                            <button type="submit" class="btn btnReg ">註冊會員</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 忘記密碼模態框 -->
       <div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="forgotPasswordModalLabel">忘記密碼</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="forgotPasswordForm" action="/forgetPassword" method="post">
                    <div class="mb-3">
                        <label for="forgot-password-email" class="form-label">請輸入您的電子郵件地址：</label>
                        <input type="email" class="form-control" id="forgot-password-email" placeholder="example@example.com" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="sendResetEmail()">送出</button>
            </div>
        </div>
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
                <div class="link-comm">
                    <a href="https://line.me/tw/"><img src="../image/line4.png" width="50" height="auto" alt=""></a>
                </div>
                <div class="link-comm1">
                    <a href="https://www.instagram.com/"><img src="../image/instagram4.png" width="50" height="auto" alt=""></a>
                </div>
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
       
        function refreshCaptcha() {
            var captchaImg = document.getElementById('captchaImg');
            captchaImg.src = '/captchaImageServlet?' + new Date().getTime(); // 加入时间戳来避免浏览器缓存
        }

        function sendResetEmail() {
            const email = document.getElementById('forgot-password-email').value;
            if (email) {
                // 顯示「正在處理中」的 Swal 提示
                Swal.fire({
                    title: '正在傳送中',
                    html: '請稍候...',
                    icon: 'info',
                    showConfirmButton: false,
                    allowOutsideClick: false, // 防止點擊模態框以外區域關閉
                });

                fetch('/forgetPassword', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ email: email }), // 將email作為JSON數據發送
                })
                .then(response => response.json())
                .then(data => {
                    // 收到後端響應後關閉 Swal 提示
                    Swal.close();

                    // 根據後端響應顯示相應的 Swal 提示
                    if (data.message === 'success') {
                        Swal.fire({
                            title: '郵件已發送',
                            text: '重置密碼郵件已發送到您的電子郵件地址。',
                            icon: 'success',
                            confirmButtonText: '好的'
                        }).then((result) => {
                            if (result.isConfirmed || result.isDismissed) {
                                window.location.href = '/member'; // 成功後跳轉到會員頁面
                            }
                        });
                    } else {
                        Swal.fire({
                            title: '錯誤',
                            text: '發送郵件時出現了問題。',
                            icon: 'error',
                            confirmButtonText: '好的'
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    Swal.fire({
                        title: '錯誤',
                        text: '發送郵件時出現了問題。',
                        icon: 'error',
                        confirmButtonText: '好的'
                    });
                });
            } else {
                Swal.fire({
                    title: '錯誤',
                    text: '請輸入有效的電子郵件地址。',
                    icon: 'error',
                    confirmButtonText: '好的'
                });
            }
        }
    
    </script>
</body>
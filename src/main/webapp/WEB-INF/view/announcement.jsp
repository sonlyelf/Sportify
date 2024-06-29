<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Tomcat 10.x JSTL -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
    <meta charset="UTF-8">
    <title>announcement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/sportlayout.css">
    <link rel="icon" href="../image/Logocopy11.png">
    <style>
        main h2 {
            color: rgb(146, 99, 28);
            margin-top: 200px;
        }

        .banner {
            display: flex;
			justify-content: center;
			align-items: center;
			background-color: white;
			width: 100%;
			padding: 20px;
			box-sizing: border-box;
        }

        picture {
            display: block;
            text-align: center;
            margin-top: 150px;
        }

        img {
            display: block;
            max-width: 100%;
            height: auto;
        }
	.course-intro .content {
    margin-bottom: 30px;
	}
	
	.course-table {
	    display: flex;
	    align-items: center;
	    justify-content: space-between; /* 图片和描述文字之间的间距 */
	}
	
	.course-image {
	    flex: 0 0 auto; /* 图片不随内容扩展 */
	    margin-right: 20px; /* 图片右边距 */
	    width: 300px; /* 图片宽度 */
	    height: auto; /* 图片高度 */
	}
	
	.course-description {
	    flex: 1; /* 填充剩余空间 */
	    text-align: left;
	    margin-left: 20px; /* 左边距离 */
	    font-size: 20px;
		color: #666;
	}

@media (max-width: 768px) {
    .course-intro .content {
        flex-direction: column; /* 在小屏幕上垂直排列 */
        align-items: flex-start; /* 左对齐 */
    }

    .course-intro .content .course-image {
        order: -1; /* 图片在上方 */
        margin-bottom: 10px; /* 下边距 */
        width: 100%; /* 图片宽度100% */
    }

    .course-intro .content .course-description {
        text-align: left; /* 文字左对齐 */
        margin-top: 10px; /* 上边距 */
    }

    .course-description p {
        margin-top: 10px; /* 段落上边距 */
        padding: 0 10px; /* 内边距 */
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
                        <div class="container-xl">
                            <a class="navbar-brand d-flex align-items-center" href="/index">
                                <img src="../image/Logocopy.png" width="100" alt="">
                                <h1 class="m-0 ms-1">SPORTIFy</h1>
                            </a>
                            <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <div class="navbar-nav ms-auto">
                                    <li class="nav-item"><a class="nav-link" href="/index">訊息公告</a></li>
                                    <li class="nav-item"><a class="nav-link active" href="/announcement">課程介紹</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/backgroundCourse/course">課程報名</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/myCenter">會員中心</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/information">交通資訊</a></li>
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

    <div class="col-12 banner">
        <picture>
            <source srcset="../image/ToDaybig.png" media="(max-width: 300px)">
            <source srcset="../image/ToDaybig.png" media="(min-width: 768px)">
            <img src="../image/ToDaybig.png" alt="...">
        </picture>
    </div>

<main class="mb-5">
    <div class="container mb-5 mt-3">
        <div class="row">
            <h2 class="text-center" style="font-size: 36px;">課程介紹</h2>
				<hr style="border: 1px solid #afadad;">	
            <section id="course-intro" class="course-intro">
                <c:forEach var="classInfo" items="${classInfoList}">
                    <div class="content">
                        <fieldset class="course-table">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="course-image">
                                        <img src="data:image/png;base64,${classInfo.imagePath}" alt="${classInfo.className}" style="max-width: 100%; height: auto;">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="course-description">
                                        <h3 class="course-title" style="font-size: 24px;color: darkcyan;">${classInfo.className}</h3>
                                        <p>${classInfo.classDescription}</p>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <hr style="border: 1px solid #afadad;">
                    </div>
                </c:forEach>
            </section>
        </div>
    </div>
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
    </script>
</body>

</html>
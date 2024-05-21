<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
  
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
    <meta charset="UTF-8">
    <title>course</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/sportlayout.css">
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
                <a class="navbar-brand d-flex align-items-center" href="#">
                  <img src="./image/Logocopy.png" width="100" alt="">
                  <h1 class="m-0 ms-1">SPORTIFy</h1>
                </a>
                <!-- 以下是手機版才出現的按鈕，負責控制顯示導覽選單 -->
                <!-- 注意：data-bs-target的名字必須與可收合部份的ID相同 -->
                <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse"
                  data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                  aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <!-- 以下區域是在手機版會收合的選單部份 -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <!-- 這是一組選單，me-auto負責margin都在右邊，ms-auto負責margin都在左邊 -->
                  <div class="navbar-nav ms-auto">
                    <li class="nav-item">
                      <a class="nav-link"href="./sportify.html">訊息公告</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="./announcement.html">課程介紹</a></li>
                    <li class="nav-item"><a class="nav-link active" href="./course.html">課程報名</a></li>
                    <div class="dropdown">
                      <a class="nav-link  dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          會員中心
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="memberDropdown">
                          <li><a class="dropdown-item" href="./register.html">註冊會員</a></li>
                          <li><a class="dropdown-item" href="./member.html">我的中心</a></li>
                      </ul>
                  </div>
                    <li class="nav-item "><a class="nav-link" href="./information.html">交通資訊</a></li>
                  </div>
                </div>
  
              </div>
            </nav>
          </div>
        </div>
      </div>
  
    </header>
  
  
<main>
  <section id="course-list">
    <h2>課程列表</h2>
    <ul>
        <li><a href="#yoga">瑜伽課</a></li>
        <li><a href="#boxing">拳擊課</a></li>
        <li><a href="#trx">TRX課程</a></li>
    </ul>
</section>
<section id="yoga" class="course-detail">
    <h2>瑜伽課</h2>
    <p>時間：週一、週三 10:00 - 11:00</p>
    <p>價格：NT$500/每節</p>
    <button onclick="bookCourse('瑜伽課')">預約</button>
</section>
<section id="boxing" class="course-detail">
    <h2>拳擊課</h2>
    <p>時間：週二、週四 18:00 - 19:00</p>
    <p>價格：NT$600/每節</p>
    <button onclick="bookCourse('拳擊課')">預約</button>
</section>
<section id="trx" class="course-detail">
    <h2>TRX課程</h2>
    <p>時間：週五 15:00 - 16:00</p>
    <p>價格：NT$700/每節</p>
    <button onclick="bookCourse('TRX課程')">預約</button>
</section>
</main>

<footer class="w-100">
  <div class="container">
    <div class="row">
      <div class="col-12 col-md-4 d-flex flex-column">
        <p class="footer-title " style="font-size: 26px;">SPORTIFy</p>
        <p>地址：302 新竹縣竹北市十興ＸＸ街25號</p>
        <p>電話：(03)3456700</p>
        <p>電子信箱：sportify@gmail.com</p>
        <p>營業時間：0600-2200</p>
      </div>
      <div class="link-comm">
        <a href="https://line.me/tw/" >
          <img src="./image/line4.png" width="50" height="auto" alt="">
        </a>
      </div>
      <div class="link-comm1">
        <a href="https://www.instagram.com/">
          <img src="./image/instagram4.png" width="50" height="auto" alt="">
        </a>
      </div>
    </div>
  </div>
  </div>
</footer>









<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

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

  // if ($('.navbar-toggler').is(':visible')) {
  //   $('.navbar-collapse .nav-link').on('click', function () {
  //     //原來滑動效果依舊，再執行 .ctr-collapse自動觸發click
  //     $('.ctr-collapse').trigger('click');
  //   });
  // }
  </script>
  </body>
  
</html>
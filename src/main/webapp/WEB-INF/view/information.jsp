<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <title>information</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/sportlayout.css">
  <link rel="icon" href="../image/Logocopy11.png">
</head>

<style>
  main h2 {
    color: rgb(146, 99, 28);
    margin-top: 200px;

  }

  .map-container {
    position: relative;
    width: 100%;
    padding-bottom: 56.25%;
    /* 16:9 高度比例 */
  }

  .map-responsive iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }


  @media(min-width: 768px) {
    .map-container {
      position: relative;
      width: 50%;
      margin-left: auto;
      margin-right: auto;
    }

    .map-responsive iframe {
      margin-top: 30px;
      margin-bottom: 50px;
      margin-left: auto;
      margin-right: auto;
      border-width: 15px;
      border-style: double;
      box-shadow: 0 0 5px 5px rgb(22, 22, 21, 0.5);
      color: rgb(138, 85, 15);
    }
  }


  /* main {
      margin-bottom: 250px;
      margin-left: auto;
      margin-right: auto;
    } */

  .footer-title {
    font-size: 30px;
  }


</style>

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
                    <a class="nav-link" href="/index">訊息公告</a>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="/announcement">課程介紹</a></li>
                  <li class="nav-item"><a class="nav-link" href="/course">課程報名</a></li>
                  <dix class="dropdown">
                    <a class="nav-link  dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        會員中心
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="memberDropdown">
                        <li><a class="dropdown-item" href="/register">註冊會員</a></li>
                        <li><a class="dropdown-item" href="/member">我的中心</a></li>
                    </ul>
                  </dix>
                  <li class="nav-item "><a class="nav-link active" href="/information">交通資訊</a></li>
                  <li id="logout-btn" style="display:none;"><a href="/logout">登出</a></li>
                </div>
              </div>

            </div>
          </nav>
        </div>
      </div>
    </div>

  </header>

  <main class="mb-5">

    <div class="container mb-5">
      <div class="row">
        <div class="col-12">
          <h2 class="text-center " style="font-size: 36px">我們的位置</h2>
          <div class="map-container">
            <div class="map-responsive ">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3571.254589644488!2d121.03208344730801!3d24.82589310714111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3468371e1213af7b%3A0x9e825e0ba83808a2!2zMzAy5paw56u557ij56u55YyX5biC5Y2B6IiI5LqU6KGXMjXomZ8!5e0!3m2!1szh-TW!2stw!4v1715830809295!5m2!1szh-TW!2stw"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
              </iframe>
            </div>
          </div>
        </div>
      </div>
    </div>
<div class="container mb-5">
  <div class="row">
    <div class="col-12">
      <h4>自行前往:</h4>
            <p>沿國道1號前往竹北的光明Ｘ路/120縣道。從國道1號的ＸＸ-竹北出口下交流道</p>
      <h4>大眾運輸:</h4>  
            <p>高鐵新竹站下車搭乘,快捷5:榮民ＸＸ所站至安Ｘ國小站下車,步行3分鐘</p>
      <h4>神奇之旅:</h4> 
        <p>1.跟哆拉A夢借任意門,隨時前往👍</p>
        <p>2.跟哆拉A夢借竹蜻蜓,馬上出發👍</p>          
</div>
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
          <a href="https://line.me/tw/" >
            <img src="../image/line4.png" width="50" height="auto" alt="">
          </a>
        </div>
        <div class="link-comm1">
          <a href="https://www.instagram.com/">
            <img src="../image/instagram4.png" width="50" height="auto" alt="">
          </a>
        </div>
      </div>
    </div>
    </div>
  </footer>




  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="../js/app.js"></script>
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
    <div>
        <p id="user-greeting"></p>
    </div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport"
    content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <title>index</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/sportlayout.css">


  <style>

    .carousel,
    .carousel-inner,
    .carousel-item {
      height: 100vh;
    }

    .carousel-item img {
      /* margin-top: 125px; */
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
      /*cover保持原有尺寸的比例，覆蓋容器尺寸 */

    }

  
    section h2 {
      margin-top: 50px;
    }



    .card-title {

      background-image: url(../image/cardTitle.png);
      background-size: auto;
      background-repeat: no-repeat;

    }




    .tab-content {
      min-height: 300px;
      background: linear-gradient(var(--c-assist2-01), var(--c-assist2-03) 60%);
      padding-top: 20px 0 40px;
      border-radius: 5px;

    }

    .nav-tabs {
      border-bottom: 2px solid var(--c-assist2-03);
    }

    /* =====頁籤一般狀態====== */
    .nav-tabs .nav-link {
      border: 2px solid transparent;
      margin-bottom: -2px;
      background: 0 0;
      font-family: var(--f-family-1);
      font-size: 22px;
      letter-spacing: 1px;
      color: #818181;

    }

    /* 頁籤滑入狀態 */
    .nav-tabs .nav-link:focus,
    .nav-tabs .nav-link:hover {
      color: #e27575;
      border-color: transparent;

    }

    /* 頁籤作用中狀態 */
    .nav-tabs .nav-item.show .nav-link,
    .nav-tabs .nav-link.active {
      background-color: #f3f0f5;
      color: #d9a648;
      border-color: #dee2e6 #dee2e6 #fff;
      border-bottom: none;
      /* border-bottom-color: #e1dae3; */
    }



    .tab-content img {
      cursor: pointer;
    }

    .modal img {
      width: 100%;
      /* 圖片寬度填滿容器 */
      height: auto;
      /* 自動調整高度 */
      max-width: 460px;
      /* 圖片最大寬度為460像素 */
    }

fieldset {
  margin: 1rem;
	padding: 0;
}
legend {
	
	color:  rgb(26, 123, 220);

}
label {
	float: left;
	width: 10em;
	margin-right: 1em;
}
fieldset ol {
	list-style: none;
	padding-top: 3px;
	padding-left: 2em;
	padding-bottom: 3px;
}
fieldset li {
	line-height: 24px;
	margin-top: 5px;
	margin-bottom: 5px;
}
fieldset li input.fildform{
	line-height: 24px;
	height: 24px;
	border: 1px solid #CCC;
}
fieldset .submit {
	border-style: none;
}
.btn-custom {
    background-color: var(--c-nav-10); /* 自定義背景顏色 */
    color: white; /* 自定義文字顏色 */
    border: none; /* 去除邊框 */
  }

  .btn-custom:hover {
    background-color: var(--c-nav-05); /* 自定義懸停顏色 */
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
              <a class="navbar-brand d-flex align-items-center" href="/path/index">
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
                    <a class="nav-link active"href="/path/index">訊息公告</a>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="/path/announcement">課程介紹</a></li>
                  <li class="nav-item"><a class="nav-link" href="/path/course">課程報名</a></li>
                  <div class="dropdown">
                    <a class="nav-link  dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        會員中心
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="memberDropdown">
                        <li><a class="dropdown-item" href="/path/register">註冊會員</a></li>
                        <li><a class="dropdown-item" href="/path/member">我的中心</a></li>
                    </ul>
                </div>
                  <li class="nav-item "><a class="nav-link" href="/path/information">交通資訊</a></li>
                </div>
              </div>

            </div>
          </nav>
        </div>
      </div>
    </div>

  </header>

  <main class="mb-5">

    <section id="./sportify.jsp" class="p-0">
      <div id="topSlider" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#topSlider" data-bs-slide-to="0" clagss="active" aria-current="true"
            aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#topSlider" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#topSlider" data-bs-slide-to="2" aria-label="Slide 3"></button>

        </div>
        <div class="carousel-inner">

          <div class="carousel-item active">
            <picture>
              <source media="(min-width:768px)" srcset="../image/boxing.jpg">
              <source media="(min-width:300px)" srcset="../image/pexels-andres-ayrton-6551174.jpg">
              <img src="../image/boxing.jpg" class="img-fluid" alt="...">
              <img src="../image/pexels-andres-ayrton-6551174.jpg" class="img-fluid" alt="...">
            </picture>
          </div>

          <div class="carousel-item">
            <picture>
              <source media="(min-width:768px)" srcset="../image/pexels-ketut-subiyanto-4999388.jpg">
              <source media="(min-width:300px)" srcset="../image/pexels-valeria-ushakova-603898-3094215.jpg">
              <img src="../image/pexels-ketut-subiyanto-4999388.jpg" class="img-fluid" alt="...">
              <img src="../image/pexels-valeria-ushakova-603898-3094215.jpg" class="img-fluid" alt="...">
            </picture>
          </div>
          <div class="carousel-item">
            <picture>
              <source media="(min-width:768px)" srcset="../image/Circuitraining.jpg">
              <source media="(min-width:300px)" srcset="../image/istockphoto-685722924-612x612.jpg">
              <img src="../image/Circuitraining.jpg" class="img-fluid" alt="...">
              <img src="../image/istockphoto-685722924-612x612.jpg" class="img-fluid" alt="...">
            </picture>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#topSlider" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>


        <button class="carousel-control-next" type="button" data-bs-target="#topSlider" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>


      </div>

    </section>

    <section id="sec1">
      <div class="d-md-block text-center" style="color: rgb(26, 123, 220);">
        <h2 style="font-size: 36px" id="mainContent" tabindex="2">
          訊息公告
        </h2>
      </div>

      <nav>
        <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
          <button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button" role="tab"
            aria-controls="p1" aria-selected="true">活動消息</button>
          <button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button" role="tab"
            aria-controls="p2" aria-selected="false">教室公告</button>
        </div>
      </nav>

      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="p1" role="tabpanel" aria-labelledby="p1-tab">
          <div class="container-xl">
            <div class="row">
              <div class="col-12 col-sm-6 col-md-4 p-3" data-no="1">
                <a href="#" data-bs-toggle="modal" data-bs-target="#prodModel1">
                  <p class="text-center"></p>
                  <img src="../image/newOpen.png" class="d-block mw-100 mx-auto rounded-2 mb-2" data-bs-toggle="modal"
                    data-bs-target="#prodModel1" alt="">
                </a>
              </div>


              <!-- Modal -->
              <div class="modal fade" id="prodModel1" tabindex="-1" aria-labelledby="prodModelLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="prodModelLabel">新開幕活動</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                      <img src="../image/newpost.png" alt="" width="460px" height="auto">
                      <p></p>
                      <p>🎉🎉12/32-13/15🎉🎉</p>
                      <p>試營運全館課程88折</p>
                      <p>🥳🥳加入會員再打8折！!🥳🥳</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <!-- 如果需要其他按鈕，可以在這裡添加 -->
                    </div>
                  </div>
                </div>
              </div>



              <div class="col-12 col-sm-6 col-md-4 p-3" data-no="2">
                <a href="#" data-bs-toggle="modal" data-bs-target="#prodModel2">
                  <p class="text-center"></p>
                  <img src="../image/membercard.png" class="d-block mw-100 mx-auto rounded-2 mb-2" data-bs-toggle="modal"
                    data-bs-target="#prodModel2" alt="">
                </a>
              </div>



              <!-- Modal -->
              <div class="modal fade" id="prodModel2" tabindex="-1" aria-labelledby="prodModelLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="prodModelLabel">會員獎勵</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                      <img src="../image/newMember.png" alt="" width="460px" height="auto">
                      <p></p>
                      <p>🎉 🎉 🎉 會員好康🎉 🎉 🎉 </p>
                      <p>現在加入即免會費</p>
                      <p>三堂課程免費體驗</p>
                      <p>再送兩個月會籍！</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <!-- 如果需要其他按鈕，可以在這裡添加 -->
                    </div>
                  </div>
                </div>
              </div>




              <div class="col-12 col-sm-6 col-md-4 p-3" data-no="3">
                <a href="#" data-bs-toggle="modal" data-bs-target="#prodModel3">
                  <p class="text-center"></p>
                  <img src="../image/newcom.png" class="d-block mw-100 mx-auto rounded-2 mb-2" data-bs-toggle="modal"
                    data-bs-target="#prodModel3" alt="">
                </a>
              </div>
            </div>
          </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="prodModel3" tabindex="-1" aria-labelledby="prodModelLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="prodModelLabel">比賽活動</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body text-center">
                <img src="../image/competition.png " alt="" width="460px" height="auto">
                <p></p>
                <p>🏋️‍♂️🏋️‍♂比賽活動🏋️‍♂️🏋️‍♂</p>
                <p>每個月一次比賽</p>
                <p>挑戰體脂大作戰</p>
                <p>參賽者贈送inBody乙次</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <!-- 如果需要其他按鈕，可以在這裡添加 -->
              </div>
            </div>
          </div>
        </div>




        <div class="tab-pane fade" id="p2" role="tabpanel" aria-labelledby="p2-tab">
          <div class="container-xl">
            <div class="row">
              <div class="col-12 col-sm-6 col-md-4 p-3">
                <p class="text-center"></p>
                <img
                  src="../image/classroom.png"class="d-block mw-100 mx-auto rounded-2 mb-2" data-bs-toggle="modal" data-bs-target="#prodModel4"
                  alt="">
              </div>



              <!-- Modal -->
              <div class="modal fade" id="prodModel4" tabindex="-1" aria-labelledby="prodModelLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="prodModelLabel">教室使用規定</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-left">
                      <!-- <img src="../image/newMember.png" alt="" width="460px" height="auto"> -->
                      <p></p>
                      <p style="font-size: 26px;">請參照各教室使用須知，貼心提醒以下三點：</p>
                      <p>1.上課前：請本人在教室外排隊等候，勿以物品佔位或排隊，排隊時也請留意勿影響他人運動空間，如需使用器材，請先設置好以利課程進行。</p>
                      <p>2.上課中：請勿使用手機及大聲交談，避免影響他人。</p>
                      <p>3.下課後：使用器材如有髒汙(如：瑜珈墊)，請用酒精抹布擦拭後放回原位。</p>
                      <p>4.為維持清潔安全，本教室嚴禁吸煙、喝酒、嚼食檳榔、口香糖及攜帶雨具、寵物(導
                        盲犬除外)或任何食品入場(開水、礦泉水除外)。</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <!-- 如果需要其他按鈕，可以在這裡添加 -->
                    </div>
                  </div>
                </div>
              </div>




              <div class="col-12 col-sm-6 col-md-4 p-3">
                <p class="text-center"></p>
                <img src="../image/obj.png" class="d-block mw-100 mx-auto rounded-2 mb-2"
                  data-bs-toggle="modal" data-bs-target="#prodModel5" alt="">
              </div>


              <!-- Modal -->
              <div class="modal fade" id="prodModel5" tabindex="-1" aria-labelledby="prodModelLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="prodModelLabel">器材使用規章</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-left">
                      <!-- <img src="../image/newMember.png" alt="" width="460px" height="auto"> -->
                      <p></p>
                      <p style="font-size: 26px;">對任何健身器材使用程序有所問題，請詢問教室管理人員</p>
                      <p></p>
                      <p>1.為了衛生使用後請將運動器材擦乾讓下個學員使用。</p>
                      <p>2.請避免霸佔運動器材。請盡量採取輪流使用器方式讓每個學員都有機會使用。。</p>
                      <p>3.請小心使用啞鈴等器材並請勿摔放，摔在地板後的回彈也有可能會讓您或其他學員受傷。</p>
                      <p>4.器材使用後請放置回原來位置</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <!-- 如果需要其他按鈕，可以在這裡添加 -->
                    </div>
                  </div>
                </div>
              </div>



              <div class="col-12 col-sm-6 col-md-4 p-3">
                <p class="text-center"></p>
                <img src="../image/rentRoom.png" class="d-block mw-100 mx-auto rounded-2 mb-2"
                  data-bs-toggle="modal" data-bs-target="#prodModel6" alt="">
              </div>



              <!-- Modal -->
              <div class="modal fade" id="prodModel6" tabindex="-1" aria-labelledby="prodModelLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="prodModelLabel">商業/個人租借教室</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                      <!-- <img src="../image/newMember.png" alt="" width="460px" height="auto"> -->
                      <p></p>
                      <p style="font-size: 24px;">老師團課、私人課程場地租借</p>
                      <p></p>
                      <p style="font-size: 22px;">【平日收費】</p>
                      <p>6:00-18:00 每1小時$400 。半小時$200。</p>
                      <p>18:00-21:00 1小時$600。半小時$300</p>
                      <p style="font-size: 22px;">【假日收費】</p>
                      <p>9:00-18:00低消2小時。每1小時$600。半小時$300</p>
                      <p style="font-size: 22px;">【人數限制】</p>
                      <p>最多可容納13人(含老師)。</p>
                      <p style="font-size: 22px;">【租借規範】</p>
                      <p>付訂金後可保留租借場地。</p>
                      <p>取消預約，提前一周可退費100%，提前3天退費50%(退款手續費酌收$30)，當天或前兩天臨時取消恕無退費</p>
                      <p>租借場地需明確說明活動內容、使用目的等</p>
                      
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <!-- 如果需要其他按鈕，可以在這裡添加 -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  
    <hr style="border: 1px solid #afadad">
    
    <section id="sec2">
      <div class="container-xl">
        <div class="row justify-content-center align-items-center" style="min-height: auto;">
          <div class="col-12 col-md-8 col-lg-6">
            <form action="#">
              <fieldset>
                <legend class="text-center" style="font-size: 36px;">預約參觀</legend>
                <div class="mb-3">
                  <label for="name" class="form-label">姓名：</label>
                  <input id="name" name="name" type="text" class="form-control" />
                </div>
                <div class="mb-3">
                  <label for="email" class="form-label">電子郵件地址：</label>
                  <input id="email" name="email" type="text" class="form-control" />
                </div>
                <div class="mb-3">
                  <label for="phone" class="form-label">電話：</label>
                  <input id="phone" name="phone" type="text" class="form-control" />
                </div>
                <div class="mb-3">
                  <label for="experience" class="form-label">選擇課程：</label>
                  <select name="experience" id="experience" class="form-select" required>
                    <option value="" selected disabled>請選擇體驗課程...</option>
                    <option value="1">Yoga Wheel瑜珈輪</option>
                    <option value="2">YinYoga 陰瑜珈</option>
                    <option value="3">肌力循環式訓練</option>
                    <option value="4">ZUMBA</option>
                    <option value="5">Kettlebell 壺鈴</option>
                  </select>
                </div>
                <div class="d-flex justify-content-end">
                  <button type="submit" class="btn btn-custom">送出</button>
                </div>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-12 col-md-4 d-flex flex-column">
          <p class="footer-title" style="font-size: 26px;">SPORTIFy</p>
          <p>地址：302 新竹縣竹北市十興ＸＸ街25號</p>
          <p>電話：(03)3456700</p>
          <p>電子信箱：sportify@gmail.com</p>
          <p>營業時間：0600-2200</p>
        </div>
        <div>
          <a href="https://line.me/tw/" class="link-comm">
            <img src="../image/line4.png" width="50" height="auto" alt="">
          </a>
          <a href="https://www.instagram.com/" class="link-comm1">
            <img src="../image/instagram4.png" width="50" height="auto" alt="">
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
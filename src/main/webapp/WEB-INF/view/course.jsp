<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    margin-top: 160px;
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

#myModal {
  display: none;
  position: fixed;
  z-index: 1050;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.9);
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
hr{
  border: 1px solid #afadad;
    margin: 20px 0;
}
h4{
  color:darkcyan;
  font-size: 26px;
  
}

@media (min-width: 768px) {
.container {
  flex-direction: row;
}

.sidebar {
  flex: 0 1 350px;
  max-width: 500px;
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
                            <img src="./image/Logocopy.png" width="100" alt="">
                            <h1 class="m-0 ms-1">SPORTIFy</h1>
                        </a>
                        <button class="navbar-toggler ctr-collapse" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="/index">訊息公告</a>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="/announcement">課程介紹</a></li>
                                <li class="nav-item"><a class="nav-link active" href="/course">課程報名</a></li>
                                <div class="dropdown">
                                    <a class="nav-link  dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        會員中心
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="memberDropdown">
                                        <li><a class="dropdown-item" href="/register">註冊會員</a></li>
                                        <li><a class="dropdown-item" href="/member">我的中心</a></li>
                                    </ul>
                                </div>
                                <li class="nav-item "><a class="nav-link" href="/information">交通資訊</a></li>
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
      <h2 class="text-center" style="font-size: 36px">課程報名</h2>
  </section>
  <hr>
  <div class="container course-intro">
      <div class="sidebar">
          <picture>
              <source srcset="../image/course2.1.png" media="(min-width: 769px)">
              <source srcset="../image/course.1.png" media="(max-width: 768px)">
              <img src="../image/course2.1.png" alt="課程表" onclick="openModal()">
          </picture>
      </div>
      <div class="content">
          <section id="course_id" class="course-detail">
              <h4>Yoga Wheel瑜珈輪</h4>
              <div class="mb-3">
                <label for="booking" class="form-label">2024/07/01~2024/08/31</label>
                <select name="booking-course" id="booking_course" class="form-select" required>
                  <option value="" selected disabled>請選擇預約課程...</option>
                  <option value="1">Yoga Wheel瑜珈輪 星期一 17:10-18:10</option>
                  <option value="2">Yoga Wheel瑜珈輪 星期三 17:10-18:10</option>
                  <option value="3">Yoga Wheel瑜珈輪 星期六 18:20-19:20</option>
                  <option value="4">Yoga Wheel瑜珈輪 星期日 15:00-16:00</option>
                </select>
              </div>
              <p>價格：NT$2000/每期</p>
              <div class="d-flex justify-content-end">
              <button class="submit" id="bookingBtn1" onclick="bookCourse('course-name')">預約</button>
              </div>
          </section>
          <hr>
          <section id="course_id" class="course-detail">
              <h4>${course.name}</h4>
              <div class="mb-3">
                <label for="booking" class="form-label">${course.start-date}~${course.end-date}</label>
                <select name="booking-course" id="booking_course" class="form-select" required>
                  <option value="" selected disabled>請選擇預約課程...</option>
                  <option value="1">${course.name} ${course.day} ${course.startTime}-${course.endTime} </option>
                  <option value="2">${course.name} ${course.day} ${course.startTime}-${course.endTime} </option>
                  <option value="3">${course.name} ${course.day} ${course.startTime}-${course.endTime} </option>
                  <option value="4">${course.name} ${course.day} ${course.startTime}-${course.endTime} </option>
                </select>
              </div>
              <p>價格:${course.price}/每期</p>
              <div class="d-flex justify-content-end">
               <button class="submit" id="bookingBtn2" onclick="bookCourse('course-name')">預約</button>
              </div>
              <hr>
          </section>
      </div>
  </div>
  <!-- Modal -->
  <div id="myModal">
      <span class="close" onclick="closeModal()">&times;</span>
      <img src="../image/course2.1.png" alt="課程表">
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
                <a href="https://line.me/tw/">
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
</footer>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
   
   
    document.getElementById('bookingBtn1').addEventListener('click', function() {
        checkLoginAndBook();
    });

    document.getElementById('bookingBtn2').addEventListener('click', function() {
        checkLoginAndBook();
    });

    function checkLoginAndBook() {
        var isLoggedIn = false; // 這裡應該根據實際情況設置

        if (!isLoggedIn) {
            Swal.fire({
                title: '請先登入',
                text: '您需要登入才能預約',
                icon: 'warning',
                confirmButtonText: '確定'
            });
        } else {
            // 用戶已登入，執行預約操作
            bookCourse();
        }
    }
  /*   function bookCourse() {
        // 實際預約課程的邏輯
        console.log("Booking the course...");
    } */
</script>
</body>
</html>
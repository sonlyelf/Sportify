<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
<meta charset="UTF-8">
<title>My Center</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/sportlayout.css">
<link rel="icon" href="../image/Logocopy11.png">
<style>

    
main {
    margin-top: 200px; /* 顶部间距 */
    padding: 20px; /* 可选的内边距 */
    text-align: center;
    justify-content: center;
    align-items: center;
    flex: 1;
    min-height: 80vh;
        
        }
    
   /* =====頁籤一般狀態====== */
.nav-tabs .nav-link {
    border: 2px solid transparent;
    margin-bottom: -2px;
    background: 0 0;
    font-family: var(--f-family-1);
    font-size: 20px;
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
.table-responsive {
    overflow-x: auto;
}
.btn-update {
    background-color: rgb(241, 106, 62);
    color: #fff;
    margin-top: 20px;
    margin-bottom: 10px;
    margin-right: 10px;
}
.btn-cancel{
	background-color: rgb(241, 106, 62);
    color: #fff;
}

footer{
    margin-top: 100px;
    
}

@media(min-width:768px){

.updateInfoForm{
    border-style:solid;
    border-width:1px;
    border-color: darkcyan;
}
.form-group{
    text-align: left;
    margin-left: auto;
    margin-right: auto;
    padding: 20px;
    max-width: 900px;
    
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
                        <a class="nav-link "href="/index">訊息公告</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="/announcement">課程介紹</a></li>
                    <li class="nav-item"><a class="nav-link" href="/course">課程報名</a></li>
                    <div class="dropdown">
                        <a class="nav-link active dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            會員中心
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="memberDropdown">
                            <li><a class="dropdown-item" href="/index">登出</a></li>
                            <li><a class="dropdown-item" href="/myCenter">我的中心</a></li>
                        </ul>
                    </div>
                    <li class="nav-item "><a class="nav-link" href="/information">交通資訊</a></li>
                   <li class="btn btnLogOut" id="logout-btn" style="display:none;"><a href="/logout">登出</a></li>
                    </div>
                </div>
                </div>
            </nav>
            </div>
        </div>
        </div>
    </header>
    
    
      <main>
        <section id="sec1">
            <div class="container-xl">
            <div class="d-md-block text-center col-xl-12" style="color: rgb(26, 123, 220);">
                <h2 style="font-size: 36px" id="mainContent" tabindex="2">我的中心</h2>
            </div>
            <nav>
                <div class="nav nav-tabs justify-content-center  col-12" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button" role="tab"
                        aria-controls="p1" aria-selected="true">我的課程</button>
                    <button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button" role="tab"
                        aria-controls="p2" aria-selected="false">我的訊息</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="p1" role="tabpanel" aria-labelledby="p1-tab">
                    <div class="container-xl">
                        <div class="row">
                            <div class="col-xl-12" id="1">
                                <p class="text-center" style="background-color: darkcyan; color: rgb(244, 247, 247); font-size: 24px;">SPORTIFy運動教室</p>
                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                ${course.id} ${course.name}
                                            </button>
                                        </h2>
                                        <div class="container-xl" id="p1">
                                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">日期</th>
                                                                <th scope="col">時間</th>
                                                                <th scope="col">金額</th>
                                                                
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>${course.date}</td>
                                                                <td>${course.day}</td>
                                                                <td>${course.price}</td>
                                                                
                                                            </tr>
                                                            <hr>
                                                            <tr>
                                                            	<td></td>
																<td></td>
																<td>
	                                                             <div class="d-flex justify-content-end">
	                                                            	<button type="submit" class="btn btn-cancel" id="btnCencel" onclick="bookCourse('course-id')">取消預約</button>
	                                                            </div>
	                                                            </td>
	                                                      	</tr>
                                                        </tbody>   
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="p2" role="tabpanel" aria-labelledby="p2-tab">
                    <div class="container form-container">
                        <div class="row">
                            <div class="col-12">
                                <p class="text-center" style="background-color: darkcyan; color: rgb(244, 247, 247); font-size: 24px;"">修改基本資料</p>
                                    <form class="updateInfoForm" id="updateInfoForm" method="post">
                                        <div class="form-group">
                                            <label for="name">姓名</label>
                                            <input type="text" class="form-control" id="name" name="name" required>
                                        </div>
                    
                                        <div class="form-group">
                                            <label for="email">電子信箱</label>
                                            <input type="email" class="form-control" id="email" name="email" required>
                                        </div>
                    
                                        <div class="form-group">
                                            <label for="phone">手機</label>
                                            <input type="tel" class="form-control" id="phone" name="phone" required>
                                        </div>
                            <hr style="border: darkcyan 1px solid;">
                            <div class="form-group">
                                <label for="password">密碼</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="confirm_password">確認密碼</label>
                                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-update" id="updateBtn">更新</button>
                            </div>
                                    </form>
                                </div>
                            </div>          
                    </div>
                </div>
            </div>
    
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
      </footer>


    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
 
<script>

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
 $(document).ready(function () {
    $('#name').val('name').addClass('placeholder-text');;
    $('#birthdate').val('birthdate').addClass('placeholder-text');;
    $('#phone').val('phone').addClass('placeholder-text');;
    $('#email').val('email').addClass('placeholder-text');;
    $('#password').val('password').addClass('placeholder-text');;
    $('#confirm_password').val('password').addClass('placeholder-text');;
}); 

</script>

</body>
</html>
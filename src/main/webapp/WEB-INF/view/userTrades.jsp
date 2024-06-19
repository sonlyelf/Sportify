<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
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
    <title>User Trades</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/sportlayout.css">
    <link rel="icon" href="../image/Logocopy11.png">
    
<style>

main{
	margin-top: 150px;
	margin-left: 50px;
	margin-right: 50px;

	justify-content: center;
	max-width: 1500px;
			/* 居中對齊 */ 
	/* padding: 20px; */
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-collapse: collapse;
	border-style: none;
	
h2{
	font-size: min(calc(22px +3vw), 40px ) ;
	transform: translateY(3px);  
	text-align: center;
	color:darkcyan; 

}

table thead tr{
  	border-style: none;
	text-align: center;
}

table tbody tr {
  	transform: translateY(3px);  
	text-align: center;
		
}

.btnCancel {
    background-color: red; /* 自定義背景顏色 */
    color: white; /* 自定義文字顏色 */
    border: none; /* 去除邊框 */
  }

  .btnCancel:hover {
    background-color: rgb(178, 42, 42); /* 自定義懸停顏色 */
    color: white;
  }

  .btnPay{
    background-color: rgb(23, 148, 210); /* 自定義背景顏色 */
    color: white; /* 自定義文字顏色 */
    border: none; /* 去除邊框 */
  }
  .btnPay:hover{
    background-color: rgb(32, 120, 163); /* 自定義背景顏色 */
    color: white; /* 自定義文字顏色 */
  }
 .back-button {
    display: flex;
    justify-content: center;
    margin-top: 1rem;
    margin-bottom: 2rem;
}

  @media (max-width: 768px) {
 		
            .table thead {
                display: none;
            }
            .table tbody tr {
                display: flex;
                flex-direction: column;
                margin-bottom: 1rem;
                /* Optional: Add a border to differentiate each row */
            }
            .table tbody tr td {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0.5rem;
                border-top: none;
            }
            .table tbody tr td.actions {
                display: flex;
                justify-content: center;
                text-align: center;
                width: 100%;
                margin-top: 0.5rem;
            }
            .table tbody tr td.actions form {
                display: inline-block;
                margin: 0 0.5rem;
            }
            .table tbody tr td[data-label]::before {
                content: attr(data-label);
                flex: 1;
                text-align: left;
                font-weight: bold;
                text-transform: uppercase;
            }
            .table tbody tr td[data-label="訂單編號"]::before {
                content: none; /* Hide label for 訂單編號 */
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
									<li class="nav-item"><a class="nav-link" href="/backgroundCourse/course">課程報名</a></li>
									<li class="nav-item"><a class="nav-link" href="/myCenter">會員中心</a></li>
									<li class="nav-item"><a class="nav-link" href="/information">交通資訊</a></li>
									<li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
									<li class="nav-item"><a id="login-btn" class="nav-link" href="/member" onclick="showLoginForm()">登入</a></li>	
									<li class="nav-item"><a class="nav-link active" href="/trade/userTrades"><span><img src="../image/shopping-cart111.png" height="30px" width="30px"></span></a></li>
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
    <h2>Shopping Cart</h2>
    
  <div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>訂單編號</th>
                <th>課程名稱</th>
                <th>課程日期</th>
                <th>價錢</th>
                <th>付款狀態</th>
                <th>交易狀態</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <!-- 使用 JSTL 或其他後端模板引擎來動態生成表格行 -->
            <c:forEach items="${trades}" var="trade">
                <c:if test="${trade.orderStatus ne '已完成' and trade.orderStatus ne '已取消'}">
                    <tr>
                        <td data-label="訂單編號">${trade.id}</td>
                        <td data-label="課程名稱">${trade.course.name}</td>
                        <td data-label="課程日期">${trade.course.day}</td>
                        <td data-label="價錢">${trade.course.price}</td>
                        <td data-label="付款狀態">${trade.paymentStatus}</td>
                        <td data-label="交易狀態">${trade.orderStatus}</td>
                        <td class="actions" data-label="操作">
                         	<form id="pay-cart-form-${trade.id}" action="/trade/trade/updateStatus" method="POST" style="display:inline;">
                                <input name="id" id="id" type="hidden" value="${trade.id}">
                                <input name="paymentStatus" type="hidden" value="已付款">
                                <input name="orderStatus" type="hidden" value="已完成">
                                <button type="button" class="btn btnPay" onclick="confirmPay(${trade.id})">付款</button>
                            </form>
                            <form id="cancel-cart-form-${trade.id}" action="/trade/trade/cancel/${trade.id}" method="post" style="display:inline;">
                                <input name="_method" id="_method" type="hidden" value="DELETE">
                                <button type="button" class="btn btnCancel" onclick="confirmCancel(${trade.id})">刪除</button>
                            </form>
     
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>
    <!-- 回上一頁按鈕 -->
    <div class="back-button">
       <a href="/backgroundCourse/course" class="btn btn-secondary">繼續報名</a>
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
					<p>營業時間：0600-2200</p>
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
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/js/app.js"></script>

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
	
	function confirmPay(tradeId) {
	    Swal.fire({
	        title: '確認付款',
	        text: '您確定要付款嗎？',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonText: '確定',
	        cancelButtonText: '取消'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            Swal.fire({
	                title: '正在處理中...',
	                allowOutsideClick: false,
	                showConfirmButton: false,
	                onBeforeOpen: () => {
	                    Swal.showLoading({
	                        html: '<div class="my-custom-loader">Loading...</div>',
	                        customClass: {
	                            popup: 'my-custom-loader-popup',
	                            title: 'my-custom-loader-title'
	                        }
	                    });
	                }
	            });

	            // 模拟异步操作
	            setTimeout(() => {
	                Swal.close(); // 关闭等待画面

	                Swal.fire({
	                    title: '付款完成',
	                    icon: 'success',
	                    text: '付款已完成。',
	                    confirmButtonText: '確定'
	                }).then(() => {
	                    setTimeout(() => {
	                        document.getElementById('pay-cart-form-' + tradeId).submit();
	                    }, 1000); // 2秒的延迟
	                });
	            }, 2000); // 2秒的延迟，模拟异步操作
	        }
	    });
	}
	function confirmCancel(tradeId) {
	    Swal.fire({
	        title: '確認刪除',
	        text: '您確定要刪除訂單嗎？',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonText: '確定',
	        cancelButtonText: '取消'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            Swal.fire({
	                title: '正在處理中...',
	                allowOutsideClick: false,
	                showConfirmButton: false,
	                onBeforeOpen: () => {
	                    Swal.showLoading();
	                }
	            });

	            // 模拟异步操作
	            setTimeout(() => {
	                Swal.close(); // 关闭等待画面

	                // 提示订单已删除
	                Swal.fire({
	                    title: '訂單已刪除',
	                    icon: 'success',
	                    text: '訂單已成功刪除。',
	                    confirmButtonText: '確定'
	                }).then(() => {
	                    setTimeout(() => {
	                        // 提交取消订单表单
	                        document.getElementById('cancel-cart-form-' + tradeId).submit();
	                    }, 1000); // 2秒的延迟
	                });
	            }, 2000); // 2秒的延迟，模拟异步操作
	        }
	    });
	}



	</script>
	
</body>
</html>
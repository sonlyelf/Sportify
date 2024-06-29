<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- Tomcat 10.x JSTL -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
	<meta charset="UTF-8">
	<title>My Center</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/sportlayout.css">
	<link rel="icon" href="../image/Logocopy11.png">
	<style>
		main {
			margin-top: 200px;
			/* 顶部间距 */
			padding: 20px;
			/* 可选的内边距 */
			text-align: center;
			justify-content: center;
			align-items: center;
			flex: 1;
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
		.header-text {
	    background-color: darkcyan;
	    color: rgb(244, 247, 247);
	    font-size: 24px;
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
		

		.btnCancelUpdate {
			background-color: rgb(241, 106, 62);
			color: #fff;
			margin-bottom: 12px;
		
		}
		.accordion-button-container {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
		}
	
		.course-name,
		.course-dates,
		.course-day {
		    margin-right: 10px;
		}

		footer {
			margin-top: 100px;
		}
		.updateInfoForm {
				border-style: solid;
				border-width: 1px;
				border-color: darkcyan;
			}

			.form-group {
				text-align: left;
				margin-left: auto;
				margin-right: auto;
				padding: 20px;
				max-width: 900px;
			}
			  .status {
			    display: inline-block;
			    vertical-align: top;
			    line-height: 1.5;
			    margin-right: 5px; /* 調整右邊距 */
			  }
			  .separator {
			    display: inline-block;
			    vertical-align: top;
			  }
		@media (max-width: 768px) {
		    .table thead,
		    .table tbody,
		    .table th,
		    .table td {
		        display: flex;
		        flex-wrap: wrap;
		        justify-content: space-between; /* 或者其他适当的对齐方式 */
		        width: 100%; /* 每个单元格占据整个行 */
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
									<li class="nav-item"><a class="nav-link active" href="/myCenter">會員中心</a></li>
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

	<main>
		<section id="sec1">
			<div class="container-xl">
				<div class="d-md-block text-center col-xl-12" style="color: rgb(26, 123, 220);">
					<h2 style="font-size: 36px" id="mainContent" tabindex="2">我的中心</h2>
				</div>
				<nav>
					<div class="nav nav-tabs justify-content-center  col-12" id="nav-tab" role="tablist">
						<button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button" role="tab" aria-controls="p1" aria-selected="true">我的課程</button>
						<button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button" role="tab" aria-controls="p2" aria-selected="false">我的訊息</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
<div class="tab-pane fade show active" id="p1" role="tabpanel" aria-labelledby="p1-tab">
    <div class="container-xl">
        <div class="row">
            <div class="col-xl-12" id="1">
                <p class="text-center header-text">SPORTIFy運動教室</p>
                
                <!-- 分頁按鈕 -->
                <ul class="nav nav-tabs justify-content-center  col-12" id="orderTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="completed-orders-tab" data-bs-toggle="tab" data-bs-target="#completed-orders" type="button" role="tab" aria-controls="completed-orders" aria-selected="true">已完成訂單</button>
                    </li>
                    <li class="nav-item " role="presentation">
                        <button class="nav-link" id="cancelled-orders-tab" data-bs-toggle="tab" data-bs-target="#cancelled-orders" type="button" role="tab" aria-controls="cancelled-orders" aria-selected="false">已取消訂單</button>
                    </li>
                </ul>

                <!-- 分頁內容 -->
                <div class="tab-content" id="orderTabContent">
                    <!-- 已完成訂單 -->
                    <div class="tab-pane fade show active" id="completed-orders" role="tabpanel" aria-labelledby="completed-orders-tab">
                        <div class="accordion" id="accordionCompletedOrders">
                            <c:forEach items="${userTrades}" var="trade">
                                <c:if test="${trade.orderStatus eq '已完成'}">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="heading${trade.id}">
                                            <div class="accordion-button-container">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCompleted${trade.id}" aria-expanded="true" aria-controls="collapseCompleted${trade.id}">
                                                    <span class="course-name">${trade.course.name}</span>
                                                    <span class="course-dates">${trade.course.startDate} ~ ${trade.course.endDate}</span>
                                                    <span class="course-day">${trade.course.day}</span>
                                                </button>
                                            </div>
                                        </h2>
                                        <div class="container-xl">
                                            <div id="collapseCompleted${trade.id}" class="accordion-collapse collapse show" aria-labelledby="heading${trade.id}" data-bs-parent="#accordionCompletedOrders">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">交易日期</th>
                                                                <th scope="col">金額</th>
                                                                <th class="d-none d-md-table-cell" scope="col">付款狀態</th>
                                                               	<th class="d-none d-md-table-cell" scope="col">交易狀態</th>
                                                                <th class="d-table-cell d-md-none" scope="col">狀態</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>${trade.createDate}</td>
                                                                <td>${trade.course.price}</td>
                                                               <td class="d-none d-md-table-cell">${trade.paymentStatus}</td>
                                                                <td class="d-none d-md-table-cell">${trade.orderStatus}</td>
                                                                <td class="d-table-cell d-md-none">
  																	<span class="status">${trade.paymentStatus}</span><span class="separator"> / </span><span class="status">${trade.orderStatus}</span>
																</td>

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <div class="d-flex justify-content-end">
                                                        <form id="order-form-${trade.id}" action="/trade/booking/updateStatus" method="POST" style="display:inline;">
                                                            <input name="id" id="id" type="hidden" value="${trade.id}"> <!-- 替換為實際的交易 ID -->
                                                            <input name="paymentStatus" type="hidden" value="已退款">
                                                            <input name="orderStatus" type="hidden" value="已取消">
                                                            <button type="button" class="btn btnCancelUpdate" id="btnCancelUpdate" onclick="confirmOrder(${trade.id})">取消預約</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- 已取消訂單 -->
                    <div class="tab-pane fade" id="cancelled-orders" role="tabpanel" aria-labelledby="cancelled-orders-tab">
                        <div class="accordion" id="accordionCancelledOrders">
                            <c:forEach items="${userTrades}" var="trade">
                                <c:if test="${trade.orderStatus eq '已取消'}">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="heading${trade.id}">
                                            <div class="accordion-button-container">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCancelled${trade.id}" aria-expanded="true" aria-controls="collapseCancelled${trade.id}">
                                                    <span class="course-name">${trade.course.name}</span>
                                                    <span class="course-dates">${trade.course.startDate} ~ ${trade.course.endDate}</span>
                                                    <span class="course-day">${trade.course.day}</span>
                                                </button>
                                            </div>
                                        </h2>
                                        <div class="container-xl">
                                            <div id="collapseCancelled${trade.id}" class="accordion-collapse collapse show" aria-labelledby="heading${trade.id}" data-bs-parent="#accordionCancelledOrders">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">交易日期</th>
                                                                <th scope="col">金額</th>
                                                                <th class="d-none d-md-table-cell" scope="col">付款狀態</th>
                                                                <th class="d-none d-md-table-cell" scope="col">交易狀態</th>
                                                                <th class="d-table-cell d-md-none" scope="col">狀態</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>${trade.createDate}</td>
                                                                <td>${trade.course.price}</td>
                                                                <td class="d-none d-md-table-cell">${trade.paymentStatus}</td>
                                                                <td class="d-none d-md-table-cell">${trade.orderStatus}</td>
                                                                <td class="d-table-cell d-md-none">
  																	<span class="status">${trade.paymentStatus}</span><span class="separator"> / </span><span class="status">${trade.orderStatus}</span>
																</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
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
									<p class="text-center" style="background-color: darkcyan; color: rgb(244, 247, 247); font-size: 24px;">修改基本資料</p>
									<form id="updateInfoForm" class="updateInfoForm" method="POST" action="/user/management/update">
										<input type="hidden" name="_method" value="PUT" />
										<input type="hidden" name="userId" value="${ user.id }">
										<div class="form-group">
											<label for="name">姓名</label>
											<input type="text" class="form-control" name="username" value="${ user.name }" />
										</div>
										<div class="form-group">
											<label for="email">電子信箱</label>
											<input type="email" class="form-control" value="${ user.email }" readonly="readonly" />
										</div>
										<div class="form-group">
											<label for="phone">手機</label>
											<input type="text" class="form-control" name="phone" value="${ user.phone }" />
										</div>
										<div class="d-flex justify-content-end">
											<button id="updateInfoBtn" class="btn btn-update" type="submit">更新</button>
										</div>
									</form>
									<br />
									<form id="updatePwdForm" class="updateInfoForm" action="/user/management/password" method="post">
										<input type="hidden" name="_method" value="PUT">
										<input type="hidden" name="userId" value="${ user.id }">
										<div class="form-group">
											<label for="password">密碼</label>
											<input type="password" class="form-control" name="password" value="${ user.password }" required="required" onkeyup="checkPassword()">
										</div>
										<div class="form-group">
											<label for="confirm_password">確認密碼</label>
											<input type="password" class="form-control" name="confirm_password" required="required" onkeyup="checkPassword()">
										</div>
										<div class="d-flex justify-content-end">
										<!-- 	<input name="_method" id="updateMethod" type="hidden" value="PUT"> -->
											<button type="submit" class="btn btn-update" id="updatePwdBtn">更新</button>
										</div>
									</form>
								</div>
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
	<script src="/js/app.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
			// 填充姓名
			$('#name').val('${user.name}').addClass('placeholder-text');

			// 填充邮箱
			$('#email').val('${user.email}').addClass('placeholder-text');

			// 填充手机
			$('#phone').val('${user.phone}').addClass('placeholder-text');

			// 密码字段不应该被填充
		});

		 document.getElementById('updateInfoForm').addEventListener('submit', function(event) {
	            event.preventDefault(); // 防止表單的默認提交動作
	            
	            // 顯示成功通知
	            Swal.fire({
	                icon: 'success',
	                title: '更新成功',
	                text: '用戶信息已成功更新'
	            }).then(() => {
	                // 通知顯示完畢後提交表單
	                event.target.submit();
	            });
	        });
		
		 document.getElementById('updatePwdForm').addEventListener('submit', function(event) {
	            event.preventDefault(); // 防止表單的默認提交動作
	            
	            // 顯示成功通知
	            Swal.fire({
	                icon: 'success',
	                title: '更新成功',
	                text: '用戶密碼已成功更新'
	            }).then(() => {
	                // 通知顯示完畢後提交表單
	                event.target.submit();
	            });
	        });
		 
		 function confirmOrder(tradeId) {
			    Swal.fire({
			        title: '確認取消',
			        text: '您確定要取消訂單嗎？',
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

			                // 提示订单已取消
			                Swal.fire({
			                    title: '訂單已取消',
			                    icon: 'success',
			                    text: '訂單已成功取消。',
			                    confirmButtonText: '確定'
			                }).then(() => {
			                    setTimeout(() => {
			                        // 提交取消订单表单
			                        document.getElementById('order-form-' + tradeId).submit();
			                    }, 1000); // 2秒的延迟
			                });
			            }, 2000); // 2秒的延迟，模拟异步操作
			        }
			    });
			}

		 
	</script>
</body>

</html>
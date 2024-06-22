<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- Tomcat 10.x JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>交易管理</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <!-- 自定義CSS -->
    <link rel="icon" href="../image/Logocopy11.png">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* 背景色 */
        }

        /* Sidebar styles */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            width: 250px;
            background: linear-gradient(to bottom, #3f8e92, rgba(63, 142, 146, 0.8), rgba(63, 142, 146, 0.5));
            padding-top: 20px;
            color: #fff;
            overflow-y: auto; /* 如果內容超出高度，啟用滾動條 */
            z-index: 100; /* 確保sidebar位於最上層 */
        }

        .sidebar h1 {
            text-align: center;
            margin-bottom: 10px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

        .sidebar ul li a:hover {
            background-color: #60adb6;
        }

        .sidebar ul ul {
            display: none;
            padding-left: 20px;
        }

        .sidebar ul li:hover > ul {
            display: block;
        }

        /* Content area */
        .main-content {
            margin-left: 270px; /* 留出側邊欄寬度 + 20px的間距 */
            padding: 20px;
        }

        /* 表格樣式 */
        .trades-table {
            margin-top: 30px; /* 上方外邊距 */
            background-color: #fff; /* 背景色 */
            padding: 20px; /* 內邊距 */
            border-radius: 8px; /* 圓角邊框 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
        }

        .trades-table legend {
            text-align: center; /* 標題居中 */
            font-size: 24px; /* 標題字體大小 */
            margin-bottom: 20px; /* 底部間距 */
        }

        .trades-table table {
            width: 100%; /* 表格寬度100% */
            border-collapse: collapse; /* 邊框重疊處理 */
        }

        .trades-table th, .trades-table td {
            border: 1px solid #ddd; /* 邊框 */
            padding: 10px; /* 內邊距 */
            text-align: center; /* 文字居中 */
        }

        .trades-table th {
            background-color: #f2f2f2; /* 表頭背景色 */
        }

        .trades-table tr:nth-child(even) {
            background-color: #f9f9f9; /* 偶數行背景色 */
        }

        .trades-table tr:hover {
            background-color: #f1f1f1; /* 滑鼠懸停行的背景色 */
        }

        /* 按鈕樣式 */

        .btn-secondary {
            background-color: #6c757d; /* 次要按鈕背景色 */
            color: #fff;
            margin-bottom: 10px;
            margin-left: 5px;
        }
    </style>
</head>
<body>
    <header>
	      <div class="sidebar">
		    <a class="navbar-brand d-flex align-items-center" href="/index">
		        <img src="../image/Logocopy.png" width="100" alt="">
		    </a>
		    <h1 class="m-0 ms-1">SPORTIFy</h1>
		    <ul>
		        <li class="nav-item"><a class="nav-link" href="/backgroundCourse/bkcourse">課程管理</a></li>
		        <li class="nav-item">
		            <a class="nav-link ">會員管理</a>
		            <ul>
		                <li><a href="/bkuser">會員表單</a></li>
		                <li><a href="/searchMember">搜尋會員</a></li>
		                <li><a href="/memberTransactions">會員交易紀錄</a></li>
		            </ul>
		        </li>
		        <li class="nav-item"><a class="nav-link active" href="/trade/bktrades">訂單管理</a></li>
		        <li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
		        <li class="nav-item"><a id="login-btn" class="nav-link" href="/admin/login" onclick="showLoginForm()">登入</a></li>
		    </ul>
		</div>
    </header>

<main class="main-content">
    <fieldset class="trades-table">
        <legend style="font-size: 36px; margin-bottom: 10px;">所有交易</legend>
        <div class="d-flex align-items-center">
            <!-- 導出按鈕 -->
            <form action="/ExportExcelServlet" method="post">
                <button type="submit" class="btn btn-secondary">導出Excel</button>
            </form>
            <button id="showStatisticsBtn" class="btn btn-secondary" onclick="showStatistics()">查看統計圖</button>
		</div>
        <!-- 全部交易表格 -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">訂單編號</th>
                    <th scope="col">學員編號</th>
                    <th scope="col">課程編號</th>
                    <th scope="col">創建時間</th>
                    <th scope="col">付款狀態</th>
                    <th scope="col">訂單狀態</th>
                </tr>
            </thead>
            <tbody>
                <!-- 使用JSTL遍歷數據 -->
                <c:forEach var="trade" items="${tradesAll}">
                    <tr>
                        <td>${trade.id}</td>
                        <td>${trade.userId}</td>
                        <td>${trade.courseId}</td>
                        <td>${trade.createDate}</td>
                        <td>${trade.paymentStatus}</td>
                        <td>${trade.orderStatus}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </fieldset>
    
<div class="modal" id="chartModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title">統計圖表</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <canvas id="myChart" width="400" height="400"></canvas>
            </div>
        </div>
    </div>
</div>
</main>

<!-- 外部腳本 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 引入 Google Charts 库 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>



let myChart = null; // 声明全局变量用于存储 Chart 實例

function showStatistics() {
    fetch('/trade/getStatistics')
        .then(response => response.json())
        .then(data => {
            const courseNames = data.courseNames; // 從後端獲取的課程名稱數據
            const enrollmentCounts = data.enrollmentCounts; // 從後端獲取的報名數據

            // 每次點擊前先清除舊的 Chart 實例
            if (myChart) {
                myChart.destroy();
            }

            // 渲染新的統計圖
            renderChart(courseNames, enrollmentCounts);

            // 顯示彈跳視窗
            var myModal = new bootstrap.Modal(document.getElementById('chartModal'));
            myModal.show();
        })
        .catch(error => {
            console.error('Error fetching statistics:', error);
            // 在此處理錯誤情況
        });
}

function renderChart(courseNames, enrollmentCounts) {
    var ctx = document.getElementById('myChart').getContext('2d');
    
    // 創建新的統計圖
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: courseNames, // 使用從後端獲取的課程名稱作為標籤
            datasets: [{
                label: '報名人數',
                data: enrollmentCounts, // 使用從後端獲取的報名數據
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}
</script>
</body>
</html>
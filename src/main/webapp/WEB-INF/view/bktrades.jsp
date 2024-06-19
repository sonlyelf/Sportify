<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- Tomcat 10.x JSTL -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPORTIFy - 交易管理</title>
    <!-- 外部样式表 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/adminLayout.css">
    <style>
        /* 自定义样式 */
        /* 主内容区域 */
.main-content {
    /* margin-top: 150px; 调整顶部间距 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    padding: 20px;
}

/* 创建交易表单 */
.createTrade-form {
    width: 100%;
    max-width: 600px;
    margin-bottom: 20px;
    margin-top: 20px; 
    margin-left: 60px ;/* 调整表单顶部间距 */ 
    padding: 30px; /* 调整表单与表格之间的间距 */
}

.createTrade-form fieldset {
    padding: 0;
    margin: 0;
}

.createTrade-form .pure-control-group {
    margin-bottom: 20px; /* 调整每个输入框组之间的间距 */
}

.createTrade-form .pure-control-group input {
    width: 100%;
    padding: 10px;
    font-size: 16px;
}

.createTrade-form .pure-controls {
    margin-top: 20px; /* 调整提交按钮与输入框之间的间距 */
}

.createTrade-form .pure-controls button {
    padding: 10px 20px;
    font-size: 18px;
}

/* 全部交易表格 */
.trades-table {
    margin-top: 20px;
    width: 100%;
    max-width: 800px; /* 调整表格的最大宽度 */
}

.trades-table legend {
    font-size: 20px;
    margin-bottom: 10px;
}

.trades-table table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
    border-collapse: collapse;
}

.trades-table th,
.trades-table td {
    padding: 8px; /* 调整单元格内边距 */
    text-align: center; /* 文本居中 */
    vertical-align: middle; /* 垂直居中 */
    font-size: 14px; /* 调整字体大小 */
    border: 1px solid #dee2e6;
}

.trades-table th {
    text-align: center;
    font-weight: bold;
    background-color: #f8f9fa;
    padding: 10px; /* 保持表头单元格内边距较大 */
}

.trades-table .table-buttons {
    display: flex;
    justify-content: space-between; 
    align-items: center;
    margin-bottom: 10px;
}

.trades-table .table-buttons button {
    padding: 8px 12px; /* 调整按钮的内边距 */
    font-size: 14px; /* 调整按钮的字体大小 */
    white-space: nowrap; /* 防止按钮文本换行 */
    min-width: auto; 
    margin-right: 10px;
}
   </style>
</head>

<body>
    <header>
        <!-- 侧边栏和导航栏 -->
        <div class="sidebar">
            <a class="navbar-brand d-flex align-items-center" href="/index">
                <img src="../image/Logocopy.png" width="100" alt="">
            </a>
            <h1 class="m-0 ms-1">SPORTIFy</h1>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link " href="/backgroundCourse/bkcourse">課程管理</a></li>
                <li class="nav-item"><a class="nav-link" href="/bkuser">會員管理</a></li>
                <li class="nav-item"><a class="nav-link active" href="/bktrades">訂單管理</a></li>
                <li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
                <li class="nav-item"><a id="login-btn" class="nav-link " href="/adminLogin" onclick="showLoginForm()">登入</a></li>
            </ul>
        </div>
    </header>

    <main class="main-content">
        <h1 style="text-align: center; font-size: 36px;">交易管理</h1>
 <!-- 创建新交易表单 -->
 <div class="createTrade-form">
    <h3 style=" font-size: 24px;">交易管理</h3>
    <form action="/?" method="post">
        <fieldset>
            <div class="pure-control-group">
                <label for="tradeId">訂單編號:</label>
                <input type="text" id="tradeId" name="tradeId" required />
            </div>
            <div class="pure-control-group">
                <label for="userId">學員編號:</label>
                <input type="text" id="userId" name="userId" required />
            </div>
            <div class="pure-control-group">
                <label for="courseId">課程編號:</label>
                <input type="text" id="courseId" name="courseId" required />
            </div>
            <div class="pure-control-group">
                <label for="coursePrice">付款狀態:</label>
                <input type="text" id="coursePrice" name="coursePrice" required />
            </div>
            <div class="pure-control-group">
                <label for="check">交易狀態:</label>
                <input type="text" id="check" name="check" required />
            </div>
            <div class="pure-controls">
                <button type="submit" class="btn btn-primary">創建交易</button>
            </div>
        </fieldset>
    </form>
</div>
        <!-- 按钮组 -->
        <div class="trades-table">
            <div class="table-buttons">
                <legend>所有交易</legend>
                <div class="d-flex align-items-center">
                    <button id="exportToExcelBtn" class="btn btn-secondary"onclick="exportToExcel()">導出Excel</button>
                    <button id="showStatisticsBtn" class="btn btn-secondary"onclick="showStatistics()">查看統計圖</button>
                </div>
            </div>
            <!-- 全部交易表格 -->
            <table>
                <thead>
                    <tr>
                        <th>訂單編號</th>
                        <th>學員編號</th>
                        <th>課程編號</th>
                        <th>創建時間</th>
                        <th>付款狀態</th>
                        <th>訂單狀態</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 这里使用JSTL遍历数据 -->
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
        </div>

    </main>

    <!-- 外部脚本 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        function exportToExcel() {
            // 实现导出Excel的逻辑
            console.log('Export to Excel clicked.');
        }

        function showStatistics() {
            // 实现显示统计图的逻辑
            console.log('Show statistics clicked.');
        }
    </script>
</body>

</html>
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
        <title>課程管理</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
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
/* 表單樣式 */
.course-form {
    max-width: 600px; /* 最大寬度 */
    margin: 20px auto; /* 居中並添加外邊距 */
    background-color: #fff; /* 背景色 */
    padding: 20px; /* 內邊距 */
    border-radius: 8px; /* 圓角邊框 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
}

.course-form legend {
    text-align: center; /* 標題居中 */
    font-size: 24px; /* 標題字體大小 */
    margin-bottom: 20px; /* 底部間距 */
}

.course-form .pure-control-group {
    margin-bottom: 20px; /* 控制組之間的間距 */
}

.course-form label {
    font-weight: bold; /* 標籤文字加粗 */
}

.course-form input[type="text"],
.course-form input[type="number"],
.course-form select {
    width: 100%; /* 輸入框和下拉框寬度100% */
    padding: 8px; /* 內邊距 */
    border: 1px solid #ccc; /* 邊框 */
    border-radius: 4px; /* 圓角邊框 */
    box-sizing: border-box; /* 盒模型 */
    font-size: 14px; /* 字體大小 */
}

.course-form button[type="submit"] {
    background-color: #5498a0; /* 提交按鈕背景色 */
    color: #fff; /* 文字顏色 */
    padding: 10px 20px; /* 內邊距 */
    border: none; /* 去除邊框 */
    border-radius: 4px; /* 圓角邊框 */
    cursor: pointer; /* 鼠標指示 */
    font-size: 16px; /* 字體大小 */
}

.course-form button[type="submit"]:hover {
    background-color: #61afb7;/* 滑鼠懸停時的背景色 */
}

/* 表格樣式 */
.course-table {
    margin-top: 30px; /* 上方外邊距 */
    background-color: #fff; /* 背景色 */
    padding: 20px; /* 內邊距 */
    border-radius: 8px; /* 圓角邊框 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
}

.course-table legend {
    text-align: center; /* 標題居中 */
    font-size: 24px; /* 標題字體大小 */
    margin-bottom: 20px; /* 底部間距 */
}

.course-table table {
    width: 100%; /* 表格寬度100% */
    border-collapse: collapse; /* 邊框重疊處理 */
}

.course-table th, .course-table td {
    border: 1px solid #ddd; /* 邊框 */
    padding: 10px; /* 內邊距 */
    text-align: center; /* 文字居中 */
}

.course-table th {
    background-color: #f2f2f2; /* 表頭背景色 */
}

.course-table tr:nth-child(even) {
    background-color: #f9f9f9; /* 偶數行背景色 */
}

.course-table tr:hover {
    background-color: #f1f1f1; /* 滑鼠懸停行的背景色 */
}
.main-content-container {
    margin-left: 270px; /* 留出側邊欄寬度 + 20px的間距 */
    padding: 20px;
}
/* Bootstrap Overrides */
.btnUPDATE {
    background-color: #285780; /* 修改按鈕背景色 */
    color: #fff;
}

.btnDELETE {
    background-color: #dc3545; /* 刪除按鈕背景色 */
    color: #fff;
}

.btn-secondary {
    background-color: #6c757d; /* 次要按鈕背景色 */
    color: #fff;
}




/* Content area */
    

</style>
<body>
<header>
    <div class="sidebar">
        <a class="navbar-brand d-flex align-items-center" href="/index">
            <img src="../image/Logocopy.png" width="100" alt="">
        </a>
        <h1 class="m-0 ms-1">SPORTIFy</h1>
        <ul>
            <li class="nav-item"><a class="nav-link active" href="/backgroundCourse/bkcourse">課程管理</a></li>
            <li class="nav-item"><a class="nav-link">會員管理</a>
                <ul>
                    <li><a href="/bkuser">會員表單</a></li>
                    <li><a href="/searchMember">搜尋會員</a></li>
                    <li><a href="./member-transactions.html">會員交易紀錄</a></li>
                </ul>
            </li>
            <li class="nav-item"><a class="nav-link" href="/trade/bktrades">訂單管理</a></li>
            <li class="nav-item"><a id="login-btn" class="nav-link " >登入</a></li>
            <li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
        </ul>
    </div>
</header>
<main>
    <div class="main-content-container" >
        <div class="container main-content">
            <form action="/backgroundCourse" method="post" class="pure-form pure-form-aligned course-form">
                <input name="_method" id="_method" type="hidden" value="${method}">
                <input name="id" id="id" type="hidden" value="${course.id}">
                <fieldset>
                    <legend style="text-align: center; font-size: 36px;">課程表單</legend>
                    <div class="pure-control-group">
                        <label for="name">名稱:</label>
                        <input name="name" id="name" value="${course.name}" required="required" class="form-control" />
                    </div>
                    <div class="pure-control-group">
                        <label for="startDate">開始日期:</label>
                        <fmt:formatDate value="${course.startDate}" pattern="yyyy-MM-dd" var="startDate" />
                        <input name="startDate" id="startDate" type="date" value="${startDate}" required class="form-control" />
                    </div>
                    <div class="pure-control-group">
                        <label for="endDate">結束日期:</label>
                        <fmt:formatDate value="${course.endDate}" pattern="yyyy-MM-dd" var="endDate" />
                        <input name="endDate" id="endDate" type="date" value="${endDate}" required class="form-control" />
                    </div>
                    <div class="pure-control-group">
                        <label for="time">時間:</label>
                        <select name="time" id="time" value="${course.time}" required class="form-select">
                            <option>請選擇時間</option>
                            <option value="10:00-11:00">10:00-11:00</option>
                            <option value="15:00-16:00">15:00-16:00</option>
                            <option value="17:10-18:10">17:10-18:10</option>
                            <option value="18:20-19:20">18:20-19:20</option>
                            <option value="19:20-20:20">19:20-20:20</option>
                            <option value="20:30-21:30">20:30-21:30</option>
                        </select>
                    </div>
                    <div class="pure-control-group">
                        <label for="day">星期:</label>
                        <select name="day" id="day" value="${course.day}" required class="form-select">
                            <option>請選擇上課日</option>
                            <option value="星期一">星期一</option>
                            <option value="星期二">星期二</option>
                            <option value="星期三">星期三</option>
                            <option value="星期四">星期四</option>
                            <option value="星期五">星期五</option>
                            <option value="星期六">星期六</option>
                            <option value="星期日">星期日</option>
                        </select>
                    </div>
                    <div class="pure-control-group">
                        <label for="price">價格:</label>
                        <input name="price" id="price" type="number" value="${course.price}" required class="form-control" />
                    </div>
                    <div class="pure-control-group">
                        <label for="groupId">群組 ID:</label>
                        <input name="groupId" id="groupId" type="text" value="${course.groupId}" required class="form-control" />
                    </div>
                    <div class="pure-controls">
                        <button type="submit" class="btn btn-primary">${method eq 'PUT' ? '修改' : '新增'}</button>
                    </div>
                </fieldset>
            </form>

            <button id="exportCoursesBtn" class="btn btn-secondary mt-3">導出課程資料為 Excel</button>

            <fieldset class="course-table mt-5" >
                <legend style=" font-size: 36px;">課程列表</legend>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Day</th>
                        <th>Time</th>
                        <th>Price</th>
                        <th>Group</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="courses" items="${courses}">
                        <tr>
                            <td>${courses.id}</td>
                            <td>${courses.name}</td>
                            <td><fmt:formatDate value="${courses.startDate}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate value="${courses.endDate}" pattern="yyyy-MM-dd" /></td>
                            <td>${courses.day}</td>
                            <td>${courses.time}</td>
                            <td>${courses.price}</td>
                            <td>${courses.groupId}</td>
                            <td>
                                <form action="/backgroundCourse/update/${courses.id}" method="post" style="display:inline;">
                                    <input name="_method"id="_method" type="hidden" value="PUT">
                                    <button type="submit" class="btn btnUPDATE ">修改</button>
                                </form>
                                <form action="/backgroundCourse/delete/${courses.id}" method="post" style="display:inline;">
                                    <input name="_method" id="_method" type="hidden" value="DELETE">
                                    <button type="submit" class="btn btnDELETE">刪除</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </fieldset>

          
        </div>
    </div>
</main>

<!-- 外部脚本 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<!-- 这里可以添加您的自定义脚本 -->
<script>

   
</script>
</body>
</body>
</html>
</html>
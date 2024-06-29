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
    <title>課程資訊</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
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
        .main-content-container {
            margin-left: 270px; /* 留出側邊欄寬度 + 20px的間距 */
            padding: 20px;
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

        /* 新增表單樣式 */
        .add-form {
            margin-top: 30px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .add-form legend {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .add-form label {
            display: block;
            margin-bottom: 10px;
        }

        .add-form input[type="text"], .add-form textarea, .add-form input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .add-form textarea {
            height: 150px;
            resize: vertical;
        }

        .add-form button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-form button:hover {
            background-color: #0056b3;
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
        <li class="nav-item">
        <a class="nav-link">課程管理</a>
        <ul>
            <li ><a href="/backgroundCourse/bkcourse">課程表單</a></li>
             <li ><a href="/classInfo/bkClassInfo">課程資訊</a></li>     
        </ul>
          </li>
           
            <li class="nav-item">
                <a class="nav-link">會員管理</a>
                <ul>
                    <li><a href="/bkuser">會員表單</a></li>
                    <li><a href="/searchMember">搜尋會員</a></li>
                    <li><a href="/memberTransactions">會員交易紀錄</a></li>
                </ul>
            </li>
            <li class="nav-item"><a class="nav-link" href="/trade/bktrades">訂單管理</a></li>
            <li class="nav-item"><a id="logout-btn" class="nav-link" href="/admin/login" style="display:none;" onclick="logout()">登出</a></li>
            <li class="nav-item"><a id="login-btn" class="nav-link" href="/admin/login" onclick="showLoginForm()">登入</a></li>
        </ul>
    </div>
</header>
<main>
    <div class="main-content-container">
        <div class="container main-content">
        
         <!-- 新增課程信息表單 -->
            <fieldset class="add-form">
                <legend style="text-align: center; font-size: 36px;">課程資訊</legend>
                <form id="classInfoForm" action="/classInfo/addClass" method="POST" enctype="multipart/form-data">
                    <label for="className">課程名稱：</label>
                    <input type="text" id="className" name="className" required><br>
                    <label for="classDescription">課程描述：</label><br>
                    <textarea id="classDescription" name="classDescription" rows="4" cols="50" required></textarea><br>
                    <label for="imagePath">課程圖片：</label>
                    <input type="file" id="imagePath" name="file" accept="image/*" required><br><br>
                    <button type="submit">新增</button>
                </form>
            </fieldset>
            <!-- 顯示消息 -->
            <c:if test="${not empty message}">
                <div>${message}</div>
            </c:if>

            <!-- 顯示所有課程信息 -->
            <fieldset class="course-table">
                <legend>課程列表</legend>
                <table border="1">
                    <tr>
                        <th>課程名稱</th>
                        <th>課程描述</th>
                        <th>圖片</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="classInfo" items="${classInfoList}">
                        <tr>
                            <td>${classInfo.className}</td>
                            <td>${classInfo.classDescription}</td>
                            <td>
                                <img src="data:image/png;base64,${classInfo.imagePath}" alt="${classInfo.className}" style="width: 300px; height: auto;">
                            </td>
                            <td>
                               
                                <!-- 刪除表單 -->
                                <form action="/classInfo/deleteClass/${classInfo.classId}" method="post">
                                    <input type="hidden" name="_method" value="delete">
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

 <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
   <script src="/js/admin.js"></script>
<script>
    // 如果需要，可以在這裡添加客戶端JavaScript代碼
</script>
</body>
</html>
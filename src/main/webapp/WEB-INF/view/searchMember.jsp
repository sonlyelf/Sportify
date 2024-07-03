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
    <title>搜尋會員</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
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

        .sidebar .dropdown-toggle::after {
            display: none; /* 移除下拉菜單的箭頭 */
        }

        .sidebar .dropdown-menu {
            background-color: #3f8e92; /* 下拉菜單背景色 */
        }

        .sidebar .dropdown-menu .dropdown-item {
            color: #fff;
        }

        /* Content area */
        .main-content {
            margin-left: 270px; /* 留出側邊欄寬度 + 20px的間距 */
            padding: 20px;
        }

        /* 搜尋表單 */
        .search-form {
            max-width: 600px; /* 最大寬度 */
            margin: 20px auto; /* 居中並添加外邊距 */
            background-color: #fff; /* 背景色 */
            padding: 20px; /* 內邊距 */
            border-radius: 8px; /* 圓角邊框 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
        }

        .search-form legend {
            text-align: center; /* 標題居中 */
            font-size: 24px; /* 標題字體大小 */
            margin-bottom: 20px; /* 底部間距 */
        }

        .search-form .pure-control-group {
            margin-bottom: 20px; /* 控制組之間的間距 */
        }

        .search-form label {
            font-weight: bold; /* 標籤文字加粗 */
        }

        .search-form input[type="text"],
        .search-form input[type="email"] {
            width: 100%; /* 輸入框寬度100% */
            padding: 8px; /* 內邊距 */
            border: 1px solid #ccc; /* 邊框 */
            border-radius: 4px; /* 圓角邊框 */
            box-sizing: border-box; /* 盒模型 */
            font-size: 14px; /* 字體大小 */
        }

        .search-form .pure-controls {
            text-align: center; /* 控制按鈕位置居中 */
        }

        /* 搜尋結果表格 */
        .user-search-table {
            margin-top: 30px; /* 上方外邊距 */
            background-color: #fff; /* 背景色 */
            padding: 20px; /* 內邊距 */
            border-radius: 8px; /* 圓角邊框 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
        }

        .user-search-table legend {
            text-align: center; /* 標題居中 */
            font-size: 24px; /* 標題字體大小 */
            margin-bottom: 20px; /* 底部間距 */
        }

        /* 調整表格寬度 */
        .user-search-table table {
            width: 100%; /* 表格寬度100% */
            min-width: 800px; /* 最小寬度 */
            border-collapse: collapse; /* 邊框重疊處理 */
        }

        .user-search-table th, .user-search-table td {
            border: 1px solid #ddd; /* 邊框 */
            padding: 10px; /* 內邊距 */
            text-align: center; /* 文字居中 */
        }

        .user-search-table th {
            background-color: #f2f2f2; /* 表頭背景色 */
        }

        .user-search-table tr:nth-child(even) {
            background-color: #f9f9f9; /* 偶數行背景色 */
        }

        .user-search-table tr:hover {
            background-color: #f1f1f1; /* 滑鼠懸停行的背景色 */
        }
        .btnSerch{
            background-color: #5498a0; /* 修改按鈕背景色 */
            color: #fff;
            display: flex;
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

    <!-- 搜尋會員 -->
     <main class="main-content">
        <div class="tab-content" id="userTabsContent">
            <div class="tab-pane fade show active" id="searchUser" role="tabpanel" aria-labelledby="searchUser-tab">
                <!-- 搜索表单 -->
                <form action="/searchUser" method="get" class="search-form">
                    <fieldset>
                        <legend style="font-size: 36px;">搜尋會員</legend>
                        <div class="pure-control-group">
                            <label for="searchName">姓名:</label>
                            <input name="name" id="name" type="text" class="form-control"
                                value="${ param.name }" />
                        </div>
                        <div class="pure-control-group">
                            <label for="searchEmail">電子郵件:</label>
                            <input name="email" id="email" type="email" class="form-control"
                                value="${ param.email }" />
                        </div>
                        <div class="pure-controls">
                            <button type="submit" class="btn btnSerch">搜尋</button>
                        </div>
                    </fieldset>
                </form>

                <!-- 搜索结果表格 -->
                <fieldset class="user-search-table">
                    <legend>搜尋結果</legend>
                    <table class="table table-bordered" id="searchResultsTable">
                        <thead>
                            <tr>
                                <th>會員編號</th>
                                <th>姓名</th>
                                <th>生日</th>
                                <th>電話</th>
                                <th>電子郵件</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 使用JSTL标签渲染搜索结果 -->
                            <c:choose>
                                <c:when test="${not empty user}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.name}</td>
                                        <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" />
                                        </td>
                                        <td>${user.phone}</td>
                                        <td>${user.email}</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" style="text-align: center;">搜尋結果不存在</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
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
    
 
    </script>
</body>

</html>
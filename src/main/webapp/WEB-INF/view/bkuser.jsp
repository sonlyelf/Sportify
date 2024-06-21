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
    <title>會員管理</title>
    <!-- Bootstrap CSS -->
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
        .main-content {
            margin-left: 270px; /* 留出側邊欄寬度 + 20px的間距 */
            padding: 20px;
        }

        /* 表單樣式 */
        .user-form {
            max-width: 600px; /* 最大寬度 */
            margin: 20px auto; /* 居中並添加外邊距 */
            background-color: #fff; /* 背景色 */
            padding: 20px; /* 內邊距 */
            border-radius: 8px; /* 圓角邊框 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
        }

        .user-form legend {
            text-align: center; /* 標題居中 */
            font-size: 24px; /* 標題字體大小 */
            margin-bottom: 20px; /* 底部間距 */
        }

        .user-form .form-group {
            margin-bottom: 20px; /* 控制組之間的間距 */
        }

        .user-form label {
            font-weight: bold; /* 標籤文字加粗 */
        }

        .user-form input[type="text"],
        .user-form input[type="email"],
        .user-form input[type="password"],
        .user-form input[type="date"],
        .user-form input[type="tel"],
        .user-form select {
            width: 100%; /* 輸入框和下拉框寬度100% */
            padding: 8px; /* 內邊距 */
            border: 1px solid #ccc; /* 邊框 */
            border-radius: 4px; /* 圓角邊框 */
            box-sizing: border-box; /* 盒模型 */
            font-size: 14px; /* 字體大小 */
        }

        .user-form button[type="submit"] {
            background-color: #5498a0;/* 提交按鈕背景色 */
            color: #fff; /* 文字顏色 */
            padding: 10px 20px; /* 內邊距 */
            border: none; /* 去除邊框 */
            border-radius: 4px; /* 圓角邊框 */
            cursor: pointer; /* 鼠標指示 */
            font-size: 16px; /* 字體大小 */
        }

        .user-form button[type="submit"]:hover {
            background-color: #61afb7;/* 滑鼠懸停時的背景色 */
        }

        /* 表格樣式 */
        .user-table {
            margin-top: 30px; /* 上方外邊距 */
            background-color: #fff; /* 背景色 */
            padding: 20px; /* 內邊距 */
            border-radius: 8px; /* 圓角邊框 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 邊框陰影 */
        }

        .user-table legend {
            text-align: center; /* 標題居中 */
            font-size: 24px; /* 標題字體大小 */
            margin-bottom: 20px; /* 底部間距 */
        }

        /* 調整表格寬度 */
        .user-table table {
            width: 100%; /* 表格寬度100% */
            min-width: 800px; /* 最小寬度 */
            border-collapse: collapse; /* 邊框重疊處理 */
        }

        .user-table th, .user-table td {
            border: 1px solid #ddd; /* 邊框 */
            padding: 10px; /* 內邊距 */
            text-align: center; /* 文字居中 */
        }

        .user-table th {
            background-color: #f2f2f2; /* 表頭背景色 */
        }

        .user-table tr:nth-child(even) {
            background-color: #f9f9f9; /* 偶數行背景色 */
        }

        .user-table tr:hover {
            background-color: #f1f1f1; /* 滑鼠懸停行的背景色 */
        }

        /* Bootstrap Overrides */
        .btn-update {
            background-color: #285780; /* 修改按鈕背景色 */
            color: #fff;
        }

        .btn-danger {
            background-color: #dc3545; /* 刪除按鈕背景色 */
            color: #fff;
        }

        .btn-secondary {
            background-color: #6c757d; /* 次要按鈕背景色 */
            color: #fff;
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
                <li class="nav-item"><a class="nav-link " href="/backgroundCourse/bkcourse">課程管理</a></li>
                <li class="nav-item"><a class="nav-link active"">會員管理</a>
                    <ul>
                        <li><a href="/bkuser" >會員表單</a></li>
                        <li><a href="/searchMember">搜尋會員</a></li>
                        <li><a href="/memberTransactions">會員交易紀錄</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="/trade/bktrades">訂單管理</a></li>
                <li class="nav-item"><a id="login-btn" class="nav-link " >登入</a></li>
                <li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
            </ul>
        </div>
    </header>

    <main class="main-content">
        <div class="tab-content" id="userTabsContent">
            <!-- 會員表單 -->
            <div class="tab-pane fade show active" id="userForm" role="tabpanel" aria-labelledby="userForm-tab">
                <form action="/bkuser" method="post" class="user-form">
                    <input name="_method" id="_method" type="hidden" value="${ method }">
                    <input name="id" id="id" type="hidden" value="${ user.id }">
                    <fieldset>
                        <legend style="text-align: center; font-size: 36px;">會員表單</legend>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input name="name" id="name" value="${ user.name }" required="required"
                                class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="birthday">BirthDay:</label>
                            <input name="birthday" id="birthday" type="date" value="${ birthday }" required
                                class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input name="phone" id="phone" value="${ user.phone }" required class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input name="email" id="email" type="email" value="${ user.email }"
                                required="required" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input name="password" id="password" type="password" value="${ user.password }"
                                required="required" class="form-control" />
                        </div>
                        <div class="form-group">
                            <button type="submit"
                                class="btn btn-primary">${ method eq 'PUT' ? '修改' : '新增' }</button>
                        </div>
                    </fieldset>
                </form>
                <button id="exportAllUsersBtn" class="btn btn-secondary btn-Allmembers">導出所有會員資料為 Excel</button>

                <!-- 所有會員資料表格 -->
                <fieldset class="user-table">
                    <legend>所有會員資料</legend>
                    <table class="table table-bordered" id="allUsersTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>BirthDay</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="users" items="${users}">
                                <tr>
                                    <td>${users.id}</td>
                                    <td>${users.name}</td>
                                    <td><fmt:formatDate value="${users.birthday}" pattern="yyyy-MM-dd" /></td>
                                    <td>${users.phone}</td>
                                    <td>${users.email}</td>
                                    <td>
                                        <form action="/bkuser/userUpdate/${users.id}" method="post"
                                            style="display:inline;">
                                            <input name="_method" id="_method" type="hidden" value="PUT">
                                            <button type="submit" class="btn btn-update btn-sm">修改</button>
                                        </form>
                                        <form action="/bkuser/deleteUser/${users.id}" method="post"
                                            style="display:inline;">
                                            <input name="_method" id="_method" type="hidden" value="DELETE">
                                            <button type="submit" class="btn btn-danger btn-sm">刪除</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
    </main>

    <!-- jQuery and Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
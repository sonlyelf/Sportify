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
    <title>bkUser</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="../css/adminLayout.css">
    <link rel="icon" href="../image/Logocopy11.png">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <style>
        

       .main-content {
            margin-top: 50px; /* 调整顶部间距*/
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }    

        /* 共用的表单样式 */
        .user-form, .trans-form {
            width: 100%;
            max-width: 600px; /* 调整表单的最大宽度 */
            padding: 30px;
        }
        .search-form{
            width: 100%;
            max-width: 600px; /* 调整表单的最大宽度 */
            padding: 30px;
            margin-left: 90px;
        }

        .user-form fieldset, .search-form fieldset, .trans-form fieldset {
            /* border: none; */
            padding: 0;
            margin: 0;
        }

        /* 输入框组样式 */
        .user-form .pure-control-group, .search-form .pure-control-group, .trans-form .pure-control-group {
            margin-bottom: 20px; /* 调整每个输入框组之间的间距 */
        }

        .user-form .pure-control-group input, .search-form .pure-control-group input, .trans-form .pure-control-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        /* 提交按钮样式 */
        .user-form .pure-controls, .search-form .pure-controls, .trans-form .pure-controls {
            margin-top: 20px; /* 调整提交按钮与输入框之间的间距 */
        }

        .user-form .pure-controls button, .search-form .pure-controls button, .trans-form .pure-controls button {
            padding: 10px 20px;
            font-size: 18px;
        }
        /* 共用的表格样式 */
        .user-table {
            margin-top: 20px; /* 调整顶部间距 */
            border: none;
            padding: 0;
            width: 100%;
            max-width: 900px; /* 调整表格的最大宽度 */
            margin-right: 240px; /* 调整表格的右边距 */
        }
        .userSerch-table{
            margin-top: 20px; /* 调整顶部间距 */
            border: none;
            padding: 0;
            width: 100%;
            max-width: 900px; /* 调整表格的最大宽度 */
            margin-left: 110px;
        }
        .transaction-table{
            margin-top: 20px; /* 调整顶部间距 */
            border: none;
            padding: 0;
            width: 100%;
            max-width: 900px; /* 调整表格的最大宽度 */
            margin-left: 20px;

        }

        /* 表格标题样式 */
        .user-table legend, .userSerch-table legend, .transaction-table legend {
            font-size: 20px;
            margin-bottom: 10px;
        }

        /* 表格样式 */
        .user-table table, .userSerch-table table, .transaction-table table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 1rem;
            background-color: transparent;
            border-collapse: collapse;
        }

        .user-table th, .userSerch-table th, .transaction-table th,
        .user-table td, .userSerch-table td, .transaction-table td {
            padding: 8px; /* 调整单元格内边距 */
            text-align: center; /* 文本居中 */
            vertical-align: middle; /* 垂直居中 */
            font-size: 14px; /* 调整字体大小 */
            border: 1px solid #dee2e6;
        }

        .user-table th, .userSerch-table th, .transaction-table th {
            text-align: center;
            font-weight: bold;
            background-color: #f8f9fa;
            padding: 10px; /* 保持表头单元格内边距较大 */
        }
        .btn-Allmembers{
            margin-left: 650px;
            margin-bottom: -80px;
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
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="/backgroundCourse/bkcourse">課程管理</a></li>
                <li class="nav-item"><a class="nav-link active" href="/bkuser">會員管理</a></li>
                <li class="nav-item"><a class="nav-link" href="/bktrades">訂單管理</a></li>
                <li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
                <li class="nav-item"><a id="login-btn" class="nav-link" href="/adminLogin" onclick="showLoginForm()">登入</a></li>
            </ul>
        </div>
    </header>

    <div class="container main-content">
        <ul class="nav nav-tabs" id="userTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="userForm-tab" data-bs-toggle="tab" data-bs-target="#userForm" type="button" role="tab" aria-controls="userForm" aria-selected="true">會員表單</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="searchUser-tab" data-bs-toggle="tab" data-bs-target="#searchUser" type="button" role="tab" aria-controls="searchUser" aria-selected="false">搜尋會員</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="userTransactions-tab" data-bs-toggle="tab" data-bs-target="#userTransactions" type="button" role="tab" aria-controls="userTransactions" aria-selected="false">交易紀錄</button>
            </li>
        </ul>

        <div class="tab-content" id="userTabsContent">
            <div class="tab-pane fade show active" id="userForm" role="tabpanel" aria-labelledby="userForm-tab">
                    <form action="/bkuser" method="post" class="pure-form pure-form-aligned user-form">
                        <input name="_method" id="_method" type="hidden" value="${ method }">
                        <input name="id" id="id" type="hidden" value="${ user.id }">
                        <fieldset>
                            <div class="pure-control-group">
                                <label for="name">Name:</label>
                                <input name="name" id="name" value="${ user.name }" required="required" />
                            </div>
                            <div class="pure-control-group">
                                <label for="birthday">BirthDay:</label>
                                <input name="birthday" id="birthday" type="date" value="${ birthday }" required />
                            </div>
                            <div class="pure-control-group">
                                <label for="phone">Phone:</label>
                                <input name="phone" id="phone" value="${ phone }" required />
                            </div>
                            <div class="pure-control-group">
                                <label for="email">Email:</label>
                                <input name="email" id="email" type="email" value="${ user.email }" required="required" />
                            </div>
                            <div class="pure-control-group">
                                <label for="password">Password:</label>
                                <input name="password" id="password" type="password" value="${ user.password }" required="required" />
                            </div>
                            <div class="pure-controls">
                                <button type="submit" class="btn btn-primary">${ method eq 'PUT' ? '修改' : '新增' }</button>
                            </div>
                        </fieldset>
                    </form>
                    <button id="exportAllUsersBtn" class="btn btn-secondary btn-Allmembers">導出所有會員資料為 Excel</button>    

                <!-- 所有会员数据表格 -->
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
                                        <form action="/bkuser/userUpdate/${users.id}" method="post" style="display:inline;">
                                            <input name="_method" id="_method" type="hidden" value="PUT">
                                            <button type="submit" class="btn btn-primary btn-sm">修改</button>
                                        </form>
                                        <form action="/bkuser/deleteUser/${users.id}" method="post" style="display:inline;">
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


            <div class="tab-pane fade " id="searchUser" role="tabpanel" aria-labelledby="searchUser-tab">
                <form action="/bkuser/search" method="get" class="pure-form search-form">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="searchName">Name:</label>
                            <input name="searchName" id="searchName" type="text" class="form-control" />
                        </div>
                        <div class="pure-control-group">
                            <label for="searchEmail">Email:</label>
                            <input name="searchEmail" id="searchEmail" type="email" class="form-control" />
                        </div>
                        <div class="pure-controls">
                            <button type="submit" class="btn btn-primary">搜尋</button>
                        </div>
                    </fieldset>
                </form>
                <!-- 搜尋結果表格 -->
            <fieldset class="userSerch-table">
            <legend>搜尋結果</legend>
            <table class="table table-bordered" id="searchResultsTable">
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
                    <c:forEach class="searchResults" var="searchResults" items="${searchResults}">
                        <tr>
                            <td>${searchResults.id}</td>
                            <td>${searchResults.name}</td>
                            <td><fmt:formatDate value="${searchResults.birthday}" pattern="yyyy-MM-dd" /></td>
                            <td>${searchResults.phone}</td>
                            <td>${searchResults.email}</td>
                          
                            <td>
                                <form action="/bkuser/userUpdate/${searchResults.id}" method="post" style="display:inline;">
                                    <input name="_method" id="_method" type="hidden" value="PUT">
                                    <button type="submit" class="btn btn-primary btn-sm">修改</button>
                                </form>
                                <form action="/bkuser/deleteUser/${searchResults.id}" method="post" style="display:inline;">
                                    <input name="_method" id="_method" type="hidden" value="DELETE">
                                    <button type="submit" class="btn btn-danger btn-sm">刪除</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button id="exportSearchResultsBtn" class="btn btn-secondary">導出為 Excel</button>
        </fieldset>
            </div>

            <div class="tab-pane fade" id="userTransactions" role="tabpanel" aria-labelledby="userTransactions-tab">
                <form action="/bkuser/transactions" method="get" class="pure-form trans-form">
                    <fieldset>
                        <div class="pure-control-group">
                            <label for="transactionName">Name:</label>
                            <input name="transactionName" id="transactionName" type="text" class="form-control" />
                        </div>
                        <div class="pure-control-group">
                            <label for="transactionEmail">Email:</label>
                            <input name="transactionEmail" id="transactionEmail" type="email" class="form-control" />
                        </div>
                        <div class="pure-controls">
                            <button type="submit" class="btn btn-primary">搜尋</button>
                        </div>
                    </fieldset>
                </form>
                <!-- 交易紀錄表格 -->
                <fieldset class="transaction-table">
                    <legend>交易紀錄</legend>
                    <table class="table table-bordered" id="transactionResultsTable">
                        <thead>
                            <tr>
                                <th>交易ID</th>
                                <th>會員ID</th>
                                <th>交易日期</th>
                                <th>交易金額</th>
                                <th>交易狀態</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="transactions" items="${transactions}">
                                <tr>
                                    <td>${transactions.transactionId}</td>
                                    <td>${transactions.userId}</td>
                                    <td><fmt:formatDate value="${transactions.date}" pattern="yyyy-MM-dd" /></td>
                                    <td>${transactions.amount}</td>
                                    <td>${transactions.status}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <button id="exportTransactionResultsBtn" class="btn btn-secondary">導出為 Excel</button>
                </fieldset>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
     
    </script>
</body>

</html>
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
    <title>bkCourse</title>
    <!-- 外部样式表 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="../css/adminLayout.css">
    <style>
        /* 内部样式 */
        .main-content {
            /* margin-top: px; 调整顶部间距 */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 20px;
        }


        .course-table th,
        .course-table td {
            padding: 8px; /* 调整单元格内边距 */
            text-align: center; /* 文本居中 */
            vertical-align: middle; /* 垂直居中 */
            font-size: 14px; /* 调整字体大小 */
            border: 1px solid #dee2e6;
        }
        .course-table th{  
            text-align: center;
            font-weight: bold;
            background-color: #f8f9fa;
            padding: 10px; /* 保持表头单元格内边距较大 */

        }
      
        .course-table{
            width: 100%;
            max-width: 1000px;
            margin-left: 250px;
          
        }

        .chart-container{
            max-width: 800px;
            margin-right: 100px;
            margin-left: -100px;
           /*  margin: 50px auto 20px; 调整课程列表的上外边距 */
        }


        .chart-container {
            margin-top: 50px;
        }

        .main-content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
             margin-left: 100px; /*保证内容区域不被侧边栏遮挡  */
            width: calc(100% - 240px); /* 动态计算内容区域宽度 */
            padding: 50px 0;
        }

        .course-form {
            width: 100%;
            max-width: 600px;
            margin-bottom: 20px;
            margin-top: 20px;
            margin-left: 100px /* 调整表单顶部间距 */;
            padding: 30px;
                }

        #exportCoursesBtn {
            position: absolute;
            margin-bottom: -380px;
            margin-left: 800px;
        }
    </style>
    <!-- 外部脚本 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
    <header>
        <div class="sidebar">
            <a class="navbar-brand d-flex align-items-center" href="/index">
                <img src="../image/Logocopy.png" width="100" alt="">
            </a>
            <h1 class="m-0 ms-1">SPORTIFy</h1>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link active" href="/backgroundCourse/bkcourse">課程管理</a></li>
                <li class="nav-item"><a class="nav-link" href="/bkuser">會員管理</a></li>
                <li class="nav-item"><a class="nav-link" href="/bktrades">訂單管理</a></li>
                <li class="nav-item"><a id="logout-btn" class="nav-link" href="#" style="display:none;" onclick="logout()">登出</a></li>
                <li class="nav-item"><a id="login-btn" class="nav-link " href="/adminLogin" onclick="showLoginForm()">登入</a></li>
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
                    <legend style="text-align: center; font-size: 36px;">課程列表</legend>
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
                                        <button type="submit" class="pure-button pure-button-primary">修改</button>
                                    </form>
                                    <form action="/backgroundCourse/delete/${courses.id}" method="post" style="display:inline;">
                                        <input name="_method" id="_method" type="hidden" value="DELETE">
                                        <button type="submit" class="pure-button pure-button-primary">刪除</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </fieldset>

                <div class="chart-container mt-5">
                    <canvas id="coursesChart"></canvas>
                </div>
            </div>
        </div>
    </main>

    <!-- 外部脚本 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 这里可以添加您的自定义脚本 -->
    <script>
        // 在这里添加您的 JavaScript 代码
    </script>
</body>

</html>
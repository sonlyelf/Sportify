<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- Tomcat 10.x JSTL -->    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" />
    <title>User 資料維護</title>
</head>

<body style="padding:15px">
    <h1>User 資料維護</h1>
    <hr />
    <table border="0">
        <tr>
            <!-- Course 表單 -->
            <td valign="top">
                <%@ include file="user_form.jspf" %>
            </td>
        </tr>
        <tr>
            <!-- Course 列表 -->
            <td colspan="2" valign="top">
                <%@ include file="user_list.jspf" %>
            </td>
        </tr>
    </table>
</body>

</html>
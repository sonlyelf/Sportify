<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- Tomcat 10.x JSTL -->    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
<meta charset="UTF-8">
<title>My Trades</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/sportlayout.css">
<link rel="icon" href="../image/Logocopy11.png">
</head>
<<body>
    <h1>交易管理</h1>
    
    <h2>所有交易</h2>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
    <table border="1">
        <thead>
            <tr>
                <th>訂單 ID</th>
                <th>用戶 ID</th>
                <th>課程 ID</th>
                <th>創建時間</th>
                <th>價格</th>
                <th>狀態</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="trade" items="${trades}">
                <tr>
                    <td>${trade.id}</td>
                    <td>${trade.userId}</td>
                    <td>${trade.courseId}</td>
                    <td>${trade.createDate}</td>
                    <td>${trade.coursePrice}</td>
                    <td>${trade.check}</td>
                    <td>
                        <form action="/trades/${trade.id}" method="get">
                            <button type="submit">查看</button>
                        </form>
                        <form action="/trades/${trade.id}" method="post">
                            <input type="hidden" name="_method" value="put"/>
                            <button type="submit">更新</button>
                        </form>
                        <form action="/trades/cancel" method="post">
                            <input type="hidden" name="id" value="${trade.id}"/>
                            <button type="submit">取消</button>
                        </form>
                        <form action="/trades/updatePaymentStatus" method="post">
                            <input type="hidden" name="_method" value="put"/>
                            <input type="hidden" name="id" value="${trade.id}"/>
                            <input type="text" name="paymentStatus" placeholder="更新支付狀態"/>
                            <button type="submit">更新支付狀態</button>
                        </form>
                        <form action="/trades/updateOrderStatus" method="post">
                            <input type="hidden" name="_method" value="put"/>
                            <input type="hidden" name="id" value="${trade.id}"/>
                            <input type="text" name="orderStatus" placeholder="更新訂單狀態"/>
                            <button type="submit">更新訂單狀態</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <h2>創建新交易</h2>
    <form action="/trades" method="post">
        <label for="userId">用戶 ID:</label>
        <input type="text" id="userId" name="userId" required/><br/>

        <label for="courseId">課程 ID:</label>
        <input type="text" id="courseId" name="courseId" required/><br/>

        <label for="coursePrice">價格:</label>
        <input type="text" id="coursePrice" name="coursePrice" required/><br/>

        <label for="check">狀態:</label>
        <input type="text" id="check" name="check" required/><br/>

        <button type="submit">創建交易</button>
    </form>
    
    <c:if test="${not empty trade}">
        <h2>交易詳情</h2>
        <table border="1">
            <tr>
                <th>訂單 ID</th>
                <td>${trade.id}</td>
            </tr>
            <tr>
                <th>用戶 ID</th>
                <td>${trade.userId}</td>
            </tr>
            <tr>
                <th>課程 ID</th>
                <td>${trade.courseId}</td>
            </tr>
            <tr>
                <th>創建時間</th>
                <td>${trade.createDate}</td>
            </tr>
            <tr>
                <th>價格</th>
                <td>${trade.coursePrice}</td>
            </tr>
            <tr>
                <th>付款狀態</th>
                <td>${trade.paymentStatus}</td>
            </tr>
            <tr>
                <th>訂單狀態</th>
                <td>${trade.orderStatus}</td>
            </tr>
        </table>
    </c:if>
</body>
</html>
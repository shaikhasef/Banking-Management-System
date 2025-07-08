<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Welcome, ${sessionScope.loggedInUser}!</h2>

    <h3>Your Transaction History:</h3>
    <table border="1">
        <tr>
            <th>Sender</th>
            <th>Receiver</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        <c:forEach var="transaction" items="${sessionScope.transactions}">
            <tr>
                <td>${Transaction.sender}</td>
                <td>${Transaction.receiver}</td>
                <td>${Transaction.amount}</td>
                <td>${Transaction.transactionDate}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>

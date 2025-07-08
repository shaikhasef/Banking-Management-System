<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Money Transfer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .container {
            width: 300px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px gray;
            margin: auto;
        }
        input, button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        button {
            background: green;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background: darkgreen;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Transfer Money</h2>
        <form action="transfer" method="post">
        
            <input type="text" name="receiverUsername" placeholder="Receiver's Username" required>
            <input type="number" name="amount" placeholder="Amount" required>
            <input type="password" name="password" placeholder="your Password" required>
            <button type="submit">Send Money</button>
        </form>
        <p style="color: red;">${message}</p>
    </div>
</body>
</html>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .form-container {
            background: white;
            margin-top:10px;
            padding: 100px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background: blue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: darkblue;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Login</h1>
        <form action="processForm" method="post">
            <input type="text" placeholder="Username" name="asef" required>
            <input type="password" placeholder="Password" name="shaikh" required>
            <button type="submit">Submit</button><br>
            <a href="<%=request.getContextPath() %>/regi">Create New Account</a>
            <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
            </c:if>
        </form>
    </div>
</body>
</html>

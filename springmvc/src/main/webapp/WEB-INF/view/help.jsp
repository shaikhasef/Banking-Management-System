<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #cce0ff;
            text-align: center;
            display: flex;
            padding-top: 70px;
        }
        .container {
            align-items: end;
            width: 50%;
            background: white;
            padding: 20px;
            margin-top: 10px;
            margin-right: 10px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }
        .container h2 {
            color: #333;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            margin: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: gray;
        }
        .logo {
            width: 80px;
        }
        .imgr{
            display: flex;
            margin: 10px;
            width: 40%;
        }
    </style>
</head>
<body>
    <div class="imgr">
<img alt="bank image" src="<c:url value="/Content/images/bankimg.webp"/>">

    </div>
    <div class="container">
    <div class logo><i class="fa-solid fa-building-columns"></i></div>
        <h2>WELCOME TO THE BANK</h2>
        <h3>REGISTER</h3>
        <form action="registerUser" method="post">
            <input type="text" placeholder="Full Name" name="name" required><br>
           
            <input type="text" placeholder="User Name" name="username"  required><br>
            <input type="password" placeholder="Password" name="password" required><br>
            
            <a href="<%=request.getContextPath() %>/home">Already Have Account</a><br>
            
            <button class="btn" type="submit">SIGN UP</button>
            <button class="btn" type="reset">RESET</button>
        </form>
    </div>

</body>
</html>

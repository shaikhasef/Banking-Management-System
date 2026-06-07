<%@page import="com.bms.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Check Balance</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    width:100%;
    min-height:100vh;
    background:#EFE3CA;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
}

.container{
    width:100%;
    max-width:500px;
    background:#8ACBD0;
    border-radius:30px;
    padding:40px 30px;
    text-align:center;
    box-shadow:0px 5px 20px rgba(0,0,0,0.2);
}

/* ---------- TOP ---------- */

.top h1{
    color:#170C79;
    font-size:42px;
    margin-bottom:15px;
}

.top p{
    color:#170C79;
    font-size:18px;
    line-height:30px;
    margin-bottom:40px;
}

/* ---------- BALANCE CARD ---------- */

.balance-card{
    background:#170C79;
    color:white;
    border-radius:25px;
    padding:35px 20px;
}

.balance-card h2{
    font-size:24px;
    margin-bottom:20px;
    font-weight:normal;
}

.balance{
    font-size:50px;
    font-weight:bold;
    color:#EFE3CA;
}

/* ---------- BUTTON ---------- */

.btn{
    display:inline-block;
    margin-top:35px;
    width:100%;
    height:58px;
    line-height:58px;
    background:#170C79;
    color:white;
    text-decoration:none;
    border-radius:18px;
    font-size:19px;
    transition:0.3s;
}

.btn:hover{
    background:#56B6C6;
}

/* ---------- MOBILE ---------- */

@media(max-width:600px){

    .container{
        padding:35px 22px;
    }

    .top h1{
        font-size:34px;
    }

    .top p{
        font-size:15px;
        line-height:24px;
        margin-bottom:30px;
    }

    .balance-card{
        padding:30px 15px;
    }

    .balance-card h2{
        font-size:20px;
    }

    .balance{
        font-size:40px;
    }

    .btn{
        height:54px;
        line-height:54px;
        font-size:17px;
    }

}

</style>
</head>

<body>

<div class="container">

    <div class="top">

        <h1>Account Balance</h1>

        <p>
            Your PIN has been verified successfully.
        </p>

    </div>

    <!-- BALANCE -->

    <div class="balance-card">

        <h2>Available Balance</h2>

        <div class="balance">
            ₹ <%= request.getAttribute("balance") %>
        </div>

    </div>

    <!-- BUTTON -->
	<% User user = (User)session.getAttribute("user"); %>
    <a href="login/<%=user.getName() %>/<%=user.getPass() %>" class="btn">
        Back to Home
    </a>

</div>

</body>
</html>
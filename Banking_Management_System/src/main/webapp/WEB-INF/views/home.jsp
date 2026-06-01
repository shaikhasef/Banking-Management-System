<%@page import="com.bms.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bank Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#EFE3CA;
}

.container{
    width:100%;
    min-height:100vh;
    background:#8ACBD0;
}

/* ---------- TOP SECTION ---------- */

.top-section{
    width:100%;
    background:#170C79;
    color:white;
    padding:25px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    flex-wrap:wrap;
    gap:20px;
}

.user-info h1{
    font-size:38px;
    margin-bottom:8px;
}

.user-info p{
    font-size:18px;
}

.profile{
    width:85px;
    height:85px;
    border-radius:50%;
    overflow:hidden;
    border:3px solid white;
    background:white;
}

.profile img{
    width:100%;
    height:100%;
    object-fit:cover;
}

/* ---------- DASHBOARD ---------- */

.dashboard{
    width:100%;
    padding:50px 40px;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:35px;
}

.card{
    height:220px;
    background:#EFE3CA;
    border-radius:25px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    cursor:pointer;
    transition:0.3s;
    color:#170C79;
    box-shadow:0px 5px 15px rgba(0,0,0,0.15);
}

.card:hover{
    transform:translateY(-10px);
    background:#56B6C6;
    color:white;
}

.icon{
    font-size:50px;
    margin-bottom:20px;
}

.card h2{
    font-size:24px;
}

/* ---------- BUTTON ---------- */

.bottom{
    padding:0 40px 40px;
}

.logout{
    width:100%;
    height:60px;
    border:none;
    border-radius:20px;
    background:#170C79;
    color:white;
    font-size:22px;
    cursor:pointer;
    transition:0.3s;
}

.logout:hover{
    background:#56B6C6;
}

/* ---------- MOBILE ---------- */

@media(max-width:700px){

    .top-section{
        padding:20px;
        flex-direction:column;
        text-align:center;
    }

    .user-info h1{
        font-size:30px;
    }

    .dashboard{
        padding:25px 20px;
        gap:20px;
    }

    .card{
        height:170px;
    }

    .icon{
        font-size:40px;
    }

    .card h2{
        font-size:20px;
    }

    .bottom{
        padding:0 20px 25px;
    }

}

</style>
</head>

<body>

<div class="container">
<% User user=(User)session.getAttribute("user"); %>

    <div class="top-section">

        <div class="user-info">
            <h1>Hello, <%=user.getName() %> 👋</h1>
            <p>Welcome Back</p>
        </div>

        <div class="profile">
            <img src="image/<%=user.getId() %>" alt="">
        </div>

    </div>

    <div class="dashboard">

        <a href="pin" style="text-decoration: none;"><div class="card">
            <div class="icon">💰</div>
            <h2>Balance</h2>
        </div></a>

        <div class="card">
            <div class="icon">📜</div>
            <h2>History</h2>
        </div>

        <div class="card">
            <div class="icon">💸</div>
            <h2>Transfer</h2>
        </div>

        <div class="card">
            <div class="icon">🏦</div>
            <h2>Deposit</h2>
        </div>

    </div>

    <div class="bottom">
        <button class="logout">Logout</button>
    </div>

</div>

</body>
</html>
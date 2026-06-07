<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.bms.entities.User"%>

<%
List<User> users = (List<User>)request.getAttribute("users");
User currentUser = (User)session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    min-height:100vh;
    background:#EFE3CA;
    padding:20px;
}

.container{
    width:100%;
    max-width:800px;
    margin:auto;
}

.heading{
    text-align:center;
    color:#170C79;
    margin-bottom:30px;
    font-size:42px;
}

.users{
    display:flex;
    flex-direction:column;
    gap:15px;
}

.user-card{
    background:#8ACBD0;
    border-radius:20px;
    padding:20px;
    display:flex;
    align-items:center;
    gap:20px;
    cursor:pointer;
    transition:0.3s;
}

.user-card:hover{
    transform:scale(1.02);
}

.user-card img{
    width:70px;
    height:70px;
    border-radius:50%;
    object-fit:cover;
    border:2px solid #170C79;
}

.user-info h3{
    color:#170C79;
    font-size:22px;
}

.user-info p{
    color:#444;
    margin-top:5px;
}

@media(max-width:600px){

    .heading{
        font-size:32px;
    }

    .user-card{
        padding:15px;
    }

    .user-card img{
        width:60px;
        height:60px;
    }

    .user-info h3{
        font-size:18px;
    }

}

</style>

</head>
<body>

<div class="container">

    <h1 class="heading">Transfer Money</h1>

    <div class="users">

        <%
        for(User u : users){

            if(u.getId() != currentUser.getId()){
        %>

        <div class="user-card"
             onclick="window.location.href='transfer-user?id=<%=u.getId()%>'">

            <img src="image/<%=u.getId()%>" alt="Profile">

            <div class="user-info">
                <h3><%=u.getName()%></h3>
            </div>

        </div>

        <%
            }
        }
        %>

    </div>

</div>

</body>
</html>
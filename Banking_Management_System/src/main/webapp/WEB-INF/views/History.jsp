<%@page import="java.util.Map"%>
<%@page import="com.bms.service.BankServiceImpl"%>
<%@page import="com.bms.service.BankService"%>
<%@page import="com.bms.entities.Transaction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.bms.entities.User"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Transaction History</title>

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
    display:flex;
    min-height:100vh;
}

.left-panel{
    width:260px;
    background:#8ACBD0;
    padding:30px 20px;
    text-align:center;
    border-right:5px solid #170C79;
}

.profile{
    width:120px;
    height:120px;
    border-radius:50%;
    border:4px solid #170C79;
    object-fit:cover;
}

.username{
    margin-top:20px;
    color:#170C79;
    font-size:24px;
    font-weight:bold;
}

.home-btn{
    display:inline-block;
    margin-top:25px;
    text-decoration:none;
    background:#170C79;
    color:white;
    padding:12px 25px;
    border-radius:12px;
    transition:.3s;
}

.home-btn:hover{
    background:#56B6C6;
}

.right-panel{
    flex:1;
    padding:20px;
}

.heading{
    color:#170C79;
    margin-bottom:20px;
    font-size:35px;
}

.card{
    background:white;
    border-radius:15px;
    padding:20px;
    margin-bottom:15px;
    box-shadow:0px 3px 10px rgba(0,0,0,.15);
    position:relative;
}

.card-top{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.amount-send{
    color:red;
    font-size:28px;
    font-weight:bold;
}

.amount-receive{
    color:green;
    font-size:28px;
    font-weight:bold;
}

.datetime{
    color:#333;
    font-size:18px;
}

.msg{
    margin-top:15px;
    font-size:24px;
    color:#222;
}

.trans-id{
    margin-top:10px;
    color:#666;
    font-size:20px;
}

.arrow{
    position:absolute;
    right:20px;
    bottom:15px;
    font-size:40px;
    font-weight:bold;
}

.up{
    color:red;
}

.down{
    color:green;
}

/* MOBILE */

/* MOBILE */

@media(max-width:1024px){

    .left-panel{
        display:none !important;
    }

    .container{
        display:block;
    }

    .right-panel{
        width:100%;
        padding:15px;
    }

    .heading{
        text-align:center;
        font-size:30px;
    }

    .card-top{
        flex-direction:column;
        align-items:flex-start;
        gap:5px;
    }

    .amount-send,
    .amount-receive{
        font-size:24px;
    }

    .msg{
        font-size:20px;
    }

    .trans-id{
        font-size:16px;
    }

    .datetime{
        font-size:15px;
    }

    .arrow{
        font-size:30px;
    }
}
</style>

</head>
<body>

<%
User user=(User)session.getAttribute("user");
List<Transaction> histroy = (List<Transaction>)request.getAttribute("history");
Map<Integer,String> names = (Map<Integer,String>)request.getAttribute("names");
%>

<div class="container">

    <div class="left-panel">

        <img src="image/<%=user.getId()%>" class="profile">

        <div class="username">
            <%=user.getName()%>
        </div>

        <a href="home" class="home-btn">
            🏠 Home
        </a>

    </div>

    <div class="right-panel">

        <h1 class="heading">
            Transaction History
        </h1>

        <!-- SENT TRANSACTION -->
	<% 
	if(names!=null){
	for(Transaction t : histroy) {
		if(user.getId()==t.getSenderAccount()){
	
	%>
        <div class="card">

            <div class="card-top">

                <div class="amount-send">
                     ₹ <%=t.getAmount() %>
                </div>

                <div class="datetime">
                    <%=t.getLtime() %> &nbsp;&nbsp; <%=t.getLdate() %>
                </div>

            </div>

            <div class="msg">
                Transfer to <%=names.get(t.getReceiverAccount()) %>
            </div>

            <div class="trans-id">
                ID : <%=t.getTid() %>
            </div>

            <div class="arrow up">
                ↑
            </div>

        </div>

        <!-- RECEIVED TRANSACTION -->
 <%}else{ %>
        <div class="card">

            <div class="card-top">

                <div class="amount-receive">
                    ₹ <%=t.getAmount() %>
                </div>

                <div class="datetime">
                    <%=t.getLtime() %> &nbsp;&nbsp; <%=t.getLdate() %>
                </div>

            </div>

            <div class="msg">
                Received from <%=names.get(t.getSenderAccount()) %>
            </div>

            <div class="trans-id">
                ID : <%=t.getTid() %>
            </div>

            <div class="arrow down">
                ↓
            </div>

        </div>
        <%}} }%>

    </div>

</div>

</body>
</html>
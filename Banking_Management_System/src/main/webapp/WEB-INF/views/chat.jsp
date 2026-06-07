<%@page import="java.util.List"%>
<%@page import="com.bms.entities.User"%>
<%@page import="com.bms.entities.Transaction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money</title>
<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #EFE3CA;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

.chat-box {
    width: 100%;
    max-width: 460px;
    border-radius: 16px;
    border: 2px solid #170C79;
    overflow: hidden;
}

.header {
    background: #170C79;
    padding: 14px 20px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.avatar {
    width: 44px;
    height: 44px;
    border-radius: 50%;
    background: #8ACBD0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 500;
    font-size: 15px;
    color: #170C79;
    overflow: hidden;
}

.avatar img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.receiver-name {
    color: #fff;
    font-size: 17px;
    font-weight: 500;
}

.messages {
    background: #EFE3CA;
    padding: 18px 20px;
    display: flex;
    flex-direction: column;
    gap: 10px;
    min-height: 400px;
    max-height: 400px;
    overflow-y: auto;
}

.msg {
    max-width: 70%;
    padding: 9px 13px;
    border-radius: 16px;
    font-size: 14px;
    line-height: 1.5;
}

.msg.received {
    background: #fff;
    color: #170C79;
    align-self: flex-start;
    border-bottom-left-radius: 4px;
}

.msg.sent {
    background: #170C79;
    color: #fff;
    align-self: flex-end;
    border-bottom-right-radius: 4px;
}


.bottom {
    background: #fff;
    padding: 12px 20px;
    display: flex;
    align-items: center;
    gap: 8px;
    border-top: 1px solid #8ACBD0;
}

.bottom input {
    flex: 1;
    height: 40px;
    border: 1.5px solid #8ACBD0;
    border-radius: 20px;
    padding: 0 14px;
    font-size: 14px;
    outline: none;
    color: #170C79;
    background: #EFE3CA;
}

.bottom input:focus {
    border-color: #170C79;
}

.bottom button {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #170C79;
    border: none;
    cursor: pointer;
    color: #fff;
    font-size: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background 0.2s;
}

.bottom button:hover {
    background: #2a1db0;
}

@media (max-width: 500px) {
    body {
        padding: 0;
        align-items: flex-start;
    }
    .chat-box {
        border-radius: 0;
        border: none;
        max-width: 100%;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .messages {
        flex: 1;
        max-height: none;
    }
}

</style>
</head>
<body>

<div class="chat-box">
<%
User user = (User)request.getAttribute("user");
%>

    <div class="header">
        <div class="avatar">
            <img src="image/<%=user.getId() %>" alt="">
        </div>
        <div class="receiver-name"><%=user.getName() %></div>
    </div>
	<% List<Transaction> transaction = (List<Transaction>)request.getAttribute("chat");
	
	%>
    <div class="messages" id="messages">
	<%
	for(Transaction t : transaction){
		
		if(t.getSenderAccount()==user.getId()){
	%>
        <div class="msg received">
            ₹<%=t.getAmount() %>
        </div>
<%}else{ %>
        <div class="msg sent">
          ₹<%=t.getAmount() %>
        </div>

        
<% }} %>
    </div>
<form action="moneySent" method="get">
    <div class="bottom">
    	
        <input type="number" placeholder="Enter amount (₹)" min="1" name="money"/>
        <input type="hidden" value="<%=user.getId()%>" name="Rid">
        <button>&#9658;</button>
       
    </div>
     </form>

</div>

<script>
    const messages = document.getElementById("messages");
    messages.scrollTop = messages.scrollHeight;
</script>

</body>
</html>
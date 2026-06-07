<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transfer Money</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#EFE3CA;
    min-height:100vh;
}

.container{
    width:100%;
    min-height:100vh;
    display:flex;
    flex-direction:column;
}

/* HEADER */

.header{
    background:#170C79;
    color:white;
    padding:15px 20px;
    display:flex;
    align-items:center;
    gap:15px;
}

.header img{
    width:55px;
    height:55px;
    border-radius:50%;
    object-fit:cover;
    border:2px solid #EFE3CA;
}

.receiver-name{
    font-size:22px;
    font-weight:bold;
}

/* BODY */

.chat-body{
    flex:1;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
}

/* TRANSFER CARD */

.transfer-card{
    width:100%;
    max-width:450px;
    background:#8ACBD0;
    padding:25px;
    border-radius:25px;
    box-shadow:0px 5px 15px rgba(0,0,0,0.2);
}

.transfer-card h2{
    text-align:center;
    color:#170C79;
    margin-bottom:25px;
}

.input-group{
    margin-bottom:20px;
}

.input-group label{
    display:block;
    margin-bottom:8px;
    color:#170C79;
    font-weight:bold;
}

.input-group input{
    width:100%;
    height:50px;
    border:none;
    border-radius:12px;
    padding:0 15px;
    font-size:16px;
    outline:none;
}

.transfer-btn{
    width:100%;
    height:55px;
    border:none;
    border-radius:15px;
    background:#170C79;
    color:white;
    font-size:18px;
    cursor:pointer;
}

.transfer-btn:hover{
    opacity:.9;
}

/* MOBILE */

@media(max-width:600px){

    .receiver-name{
        font-size:18px;
    }

    .header img{
        width:50px;
        height:50px;
    }

    .transfer-card{
        padding:20px;
    }

}

</style>
</head>
<body>

<div class="container">

    <!-- RECEIVER INFO -->

    <div class="header">

        <img src="image/${receiver.id}" alt="Profile">

        <div class="receiver-name">
            ${receiver.name}
        </div>

    </div>

    <!-- TRANSFER FORM -->

    <div class="chat-body">

        <form action="transfer-money" method="post" class="transfer-card">

            <h2>Send Money</h2>

            <input type="hidden"
                   name="receiverId"
                   value="${receiver.id}">

            <div class="input-group">
                <label>Amount</label>
                <input type="number"
                       name="amount"
                       placeholder="Enter Amount"
                       required>
            </div>

            <div class="input-group">
                <label>PIN</label>
                <input type="password"
                       name="pin"
                       placeholder="Enter PIN"
                       required>
            </div>

            <button class="transfer-btn">
                Transfer
            </button>

        </form>

    </div>

</div>

</body>
</html>
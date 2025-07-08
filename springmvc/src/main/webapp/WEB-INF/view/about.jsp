<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Overview</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .logout-button {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background: red;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .account-info {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .balance {
            font-size: 24px;
            font-weight: bold;
            color: green;
        }
        .history {
            width: 40%;
            background: #e9e9e9;
            padding: 15px;
            border-radius: 10px;
            max-height: 300px;
            overflow-y: auto;
        }
        .transfer-button {
            display: block;
            width: 100%;
            margin-top: 15px;
            padding: 10px;
            background: blue;
            color: white;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
        }
        #balance{
        text-align:center;
        align-item:center;
        justify-content:center;
        font-size:30px;
        }
        .company{
        top: 20px;
        
        }
        
    </style>
</head>
<body>

    <div class="container">
    <h1 class="comapy"><i class="fa-solid fa-building-columns"></i> BANKING MANAGEMENT SYSTEM</h1>
        <a href="<%= request.getContextPath() %>/home"><button class="logout-button">Logout</button></a>
        <h2>Welcome, <span id="username">${name}</span></h2>
        <div class="account-info">
            <p class="balance">Total Balance:<br><br><br>
             <span id="balance"><i class="fa-solid fa-indian-rupee-sign"></i>${balance}</span>
             </p>
             
            <div class="history">
                <h3>Transaction History</h3>
                 <a href="dashboard">Go to Dashboard</a>
                <a href="<%=request.getContextPath() %>/showTransferPage"><button class="transfer-button">Transfer</button></a>
            </div>
        </div>
    </div>
</body>
</html>

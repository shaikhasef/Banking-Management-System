<!DOCTYPE html>
<%@page import="com.bms.entities.User"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Enter PIN</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	width: 100%;
	min-height: 100vh;
	background: #EFE3CA;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.container {
	width: 100%;
	max-width: 450px;
	background: #8ACBD0;
	padding: 40px 30px;
	border-radius: 30px;
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
}

.top {
	text-align: center;
	margin-bottom: 35px;
}

.top h1 {
	color: #170C79;
	font-size: 40px;
	margin-bottom: 10px;
}

.top p {
	color: #170C79;
	font-size: 17px;
	line-height: 28px;
}

/* ---------- FORM ---------- */
.input-group {
	margin-bottom: 25px;
}

.input-group label {
	display: block;
	margin-bottom: 10px;
	color: #170C79;
	font-size: 18px;
	font-weight: bold;
}

.input-group input {
	width: 100%;
	height: 60px;
	border: none;
	border-radius: 18px;
	padding: 0 18px;
	font-size: 22px;
	text-align: center;
	letter-spacing: 8px;
	outline: none;
}

/* ---------- BUTTON ---------- */
.verify-btn {
	width: 100%;
	height: 60px;
	border: none;
	border-radius: 18px;
	background: #170C79;
	color: white;
	font-size: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.verify-btn:hover {
	background: #56B6C6;
}

/* ---------- ERROR MESSAGE ---------- */
.error-msg {
	background: #ffd6d6;
	color: red;
	padding: 12px;
	border-radius: 12px;
	text-align: center;
	margin-bottom: 20px;
	font-size: 15px;
}

/* ---------- MOBILE ---------- */
@media ( max-width :600px) {
	.container {
		padding: 35px 22px;
	}
	.top h1 {
		font-size: 32px;
	}
	.top p {
		font-size: 15px;
		line-height: 24px;
	}
	.input-group input {
		height: 55px;
		font-size: 20px;
	}
	.verify-btn {
		height: 55px;
		font-size: 18px;
	}
}
</style>
</head>

<body>

	<div class="container">

		<div class="top">

			<h1>Enter PIN</h1>

			<p>Please enter your secure PIN for authentication.</p>

		</div>

		<!-- ERROR MESSAGE -->


		<%
		String s = (String)request.getAttribute("msg");
		if (s != null) {
		%>

		<div class="error-msg">Invalid PIN</div>
		<%
		}
		%>


		<form action="verify-pin" method="post">

			<div class="input-group">

				<label style="text-align: center;">4 Digit PIN</label> <input
					type="password" maxlength="4" placeholder="****" name="pin">

			</div>

			<input type="submit" class="verify-btn" value="Verify">



		</form>

	</div>

</body>
</html>
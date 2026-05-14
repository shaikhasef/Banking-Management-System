<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register User</title>

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
}

.container {
	width: 100%;
	min-height: 100vh;
	display: flex;
	background: #8ACBD0;
}

/* ---------- LEFT SECTION ---------- */
.left {
	width: 45%;
	background: #170C79;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 60px;
	text-align: center;
}

.left h1 {
	font-size: 60px;
	margin-bottom: 25px;
}

.left p {
	font-size: 22px;
	line-height: 38px;
	max-width: 450px;
}

/* ---------- RIGHT SECTION ---------- */
.right {
	width: 55%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
}

.form-box {
	width: 100%;
	max-width: 500px;
}

.form-box h2 {
	text-align: center;
	color: #170C79;
	margin-bottom: 35px;
	font-size: 42px;
}

.input-group {
	margin-bottom: 24px;
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
	height: 58px;
	border: none;
	border-radius: 16px;
	padding: 0 18px;
	font-size: 17px;
	outline: none;
}

.input-group input[type="file"] {
	padding: 15px;
	background: white;
}

.register-btn {
	width: 100%;
	height: 60px;
	border: none;
	border-radius: 18px;
	background: #170C79;
	color: white;
	font-size: 21px;
	cursor: pointer;
	transition: 0.3s;
	margin-top: 10px;
}

.register-btn:hover {
	background: #56B6C6;
}

.login-text {
	margin-top: 22px;
	text-align: center;
	color: #170C79;
	font-size: 17px;
}

.login-text a {
	color: #170C79;
	text-decoration: none;
	font-weight: bold;
}

/* ---------- MOBILE RESPONSIVE ---------- */
@media ( max-width :900px) {
	.container {
		flex-direction: column;
	}
	.left {
		width: 100%;
		min-height: 280px;
		padding: 40px 20px;
	}
	.right {
		width: 100%;
		padding: 35px 20px;
	}
	.left h1 {
		font-size: 42px;
	}
	.left p {
		font-size: 18px;
		line-height: 30px;
	}
	.form-box h2 {
		font-size: 34px;
	}
}
</style>
</head>

<body>

	<div class="container">

		<!-- LEFT SECTION -->

		<div class="left">

			<h1>BSM Bank</h1>

			<p>Secure and simple banking management system for handling
				users, balances, transactions, and banking operations efficiently.</p>

		</div>

		<!-- RIGHT SECTION -->

		<div class="right">

			<div class="form-box">

				<h2>Register User</h2>

				<form action="register" method="post" enctype="multipart/form-data">

					<div class="input-group">
						<label>Profile Image</label> <input type="file" name="file">
					</div>

					<div class="input-group">
						<label>Full Name</label> <input type="text"
							placeholder="Enter full name" name="name" id="name"
							onkeyup="validateName()">

						<p id="msg"></p>
					</div>

					<div class="input-group">
						<label>Password</label> <input type="password"
							placeholder="Enter password" name="pass">
					</div>

					<div class="input-group">
						<label>PIN</label> <input type="password"
							placeholder="Enter 4 digit pin" name="pin">
					</div>

					<div class="input-group">
						<label>Initial Balance</label> <input type="number"
							placeholder="₹2000" disabled="disabled">
					</div>

					<input class="register-btn" type="submit" value="Register"
						id="registerBtn">


				</form>

				<div class="login-text">
					Already have account? <a href="#">Login</a>
				</div>

			</div>

		</div>

	</div>
	<script>

    let names = [];

</script>

	<%
	List<String> list = (List<String>) request.getAttribute("names");

	for (String s : list) {
	%>

	<script>

	names.push("<%=s%>");
	
	</script>

	<%
	}
	%>

	<script>
		console.log(names);

		function validateName() {

			let username = document.getElementById("name").value;
			let msg = document.getElementById("msg");
			let btn = document.getElementById("registerBtn");

			if (names.includes(username)) {

				msg.innerHTML = "Username already exists";
				msg.style.color = "red";

				btn.disabled = true;
				btn.style.opacity = "0.5";
				btn.style.cursor = "not-allowed";

			} else {

				msg.innerHTML = "Username available";
				msg.style.color = "green";

				btn.disabled = false;
				btn.style.opacity = "1";
				btn.style.cursor = "pointer";

			}

		}
	</script>
</body>
</html>
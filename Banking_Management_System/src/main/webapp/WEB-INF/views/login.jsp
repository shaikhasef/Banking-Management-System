<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BSM Bank Login</title>

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
	height: 100vh;
	display: flex;
}

/* ---------- RIGHT SECTION ---------- */
.right {
	width: 100%;
	background: #8ACBD0;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
	height: 100vh; /* ADD THIS */
}

.login-box {
	width: 100%;
	max-width: 450px;
	background: #EFE3CA;
	padding: 45px;
	border-radius: 30px;
	box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.15);
}

.login-box h2 {
	text-align: center;
	color: #170C79;
	font-size: 40px;
	margin-bottom: 35px;
}

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
	height: 58px;
	border: none;
	border-radius: 16px;
	padding: 0 18px;
	font-size: 17px;
	outline: none;
}

.login-btn {
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

.login-btn:hover {
	background: #56B6C6;
}

.bottom-text {
	margin-top: 25px;
	text-align: center;
	color: #170C79;
	font-size: 17px;
}

.bottom-text a {
	color: #170C79;
	text-decoration: none;
	font-weight: bold;
}
.error-msg{
    background:#ffdddd;
    color:red;
    padding:12px;
    border-radius:10px;
    text-align:center;
    margin-bottom:20px;
    font-size:15px;
}

/* ---------- MOBILE RESPONSIVE ---------- */
@media ( max-width :900px) {
	.container {
		flex-direction: column;
		height: auto;
		min-height: 100vh;
	}
	.left {
		width: 100%;
		min-height: 300px;
		padding: 40px 20px;
	}
	.right {
		width: 100%;
		flex: 1;
		min-height: 100vh;
		padding: 40px 20px;
		justify-content: center;
		align-items: center;
	}
	.left h1 {
		font-size: 45px;
	}
	.left p {
		font-size: 18px;
		line-height: 30px;
	}
	.login-box {
		padding: 35px 25px;
	}
	.login-box h2 {
		font-size: 32px;
	}
	
}
</style>
</head>

<body>

	<div class="container">

		<!-- RIGHT SECTION -->

		<div class="right">

			<div class="login-box">

				<h2>Login</h2>

				<form action="login" method="post">

					<div class="input-group">
						<label>User ID</label> <input type="text"
							placeholder="Enter user Name" name="name">
					</div>

					<div class="input-group">
						<label>Password</label> <input type="password"
							placeholder="Enter password" name="pass">
					</div>
					
					<button class="login-btn">Login</button>
					<%if(request.getAttribute("msg")!=null) {%>
					<p class="error-msg"><%=request.getAttribute("msg") %></p>
					<%} %>

				</form>

				<div class="bottom-text">
					Don't have account? <a href="register">Register</a>
				</div>

			</div>

		</div>

	</div>

</body>
</html>
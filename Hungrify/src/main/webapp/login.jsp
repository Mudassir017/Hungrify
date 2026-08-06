<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.List,com.hungrify.model.Restaurant,com.hungrify.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet" href="css/hungrify-base.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/auth.css" />
</head>
<body>


	<%
	User user = (User) session.getAttribute("user");
	%>
	<!-- NAVBAR -->

	<%@ include file="common/short-nav.jsp" %>

	<main class="auth-page">

		<div class="container">

			<section class="auth-container">

				<aside class="auth-brand">

					<div class="auth-brand-content">

						<span class="badge"> Welcome to Hungrify </span>

						<h1 class="auth-title">
							Delicious food, <br> delivered fast.
						</h1>

						<p class="auth-description">Order from your favourite
							restaurants with fast delivery, secure payments and an amazing
							food experience.</p>

												

							<div class="auth-illustration">

								<img src="images/auth/login-mascot.png"
									alt="Hungrify Delivery Mascot">

							</div>

					</div>

				</aside>

				<section class="auth-content">

					<div class="auth-card card">

						<div class="auth-header">

							<h2 class="h2">Welcome Back 👋</h2>

							<p>Sign in to continue ordering your favourite meals.</p>

						</div>

						<%
						String error = (String) request.getAttribute("error");

						if (error != null) {
						%>

						<div style="color: red;" class="error-message">
							<%=error%>
						</div>

						<%
						}
						%>

						<form action="login" method="post" class="auth-form" novalidate>

							<div class="input-group">

								<label for="email" class="input-label"> Email Address </label>

								<div class="input-wrapper">

									<i class="fa-solid fa-envelope input-icon"></i> <input
										type="email" id="email" name="email" class="input"
										placeholder="Enter your email" autocomplete="email" required>

								</div>

								<small class="error-text hidden"> Please enter a valid
									email. </small>
							</div>

							<div class="input-group">

								<label for="password" class="input-label"> Password </label>

								<div class="input-wrapper">

									<i class="fa-solid fa-lock input-icon"></i> <input
										type="password" id="password" name="password" class="input"
										placeholder="Enter your password"
										autocomplete="current-password" required>

									<button type="button" class="password-toggle"
										aria-label="Show Password">

										<i class="fa-solid fa-eye"></i>

									</button>

								</div>

								<small class="error-text hidden"> Password is required.

								</small>

							</div>

							<div class="form-options">

								<label class="remember-me"> <input type="checkbox"
									name="rememberMe" value="true"> <span>Remember
										Me</span>

								</label> <a href="forgot-password.jsp" class="forgot-password">

									Forgot Password? </a>

							</div>

							<button type="submit" class="btn btn-primary login-btn">

								<span>Login</span> <i class="fa-solid fa-arrow-right"></i>

							</button>



						</form>

						<div class="divider">

							<span>OR CONTINUE WITH</span>

						</div>

						<div class="social-login">

							<button type="button" class="social-btn">

								<img src="images/icons/google.svg" alt="Google"> <span>Google</span>

							</button>

							<button type="button" class="social-btn">

								<i class="fa-brands fa-apple"></i> <span>Apple</span>

							</button>

						</div>

						<div class="auth-footer">
							<p>
								Don't have an account? <a href="register"> Sign Up </a>
							</p>
						</div>

					</div>

				</section>

			</section>

		</div>

	</main>

	<script src="js/auth.js"></script>
</body>
</html>
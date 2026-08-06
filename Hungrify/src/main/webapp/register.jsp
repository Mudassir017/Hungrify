<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.List,com.hungrify.model.Restaurant,com.hungrify.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | Hungrify</title>

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

	<header class="header" id="header">
		<nav class="navbar">
			<div class="container">
				<a href="#home" class="logo" aria-label="Hungrify Home"> <img
					src="images/logo/hungrify-logo-icon.png" alt="Hungrify logo"
					height="40" width="40" /> <span class="brand-name"> <span
						class="brand-dark">Hungr</span><span class="brand-orange">ify</span>
				</span>
				</a>

				<!-- Navigation Menu -->
				<ul class="nav-menu" id="nav-menu">
					<li class="nav-item"><a href="#home" class="nav-link active">Home</a>
					</li>
					<li class="nav-item"><a href="#restaurants" class="nav-link">Restaurants</a>
					</li>
					<li class="nav-item"><a href="#features" class="nav-link">About</a>
					</li>
					<li class="nav-item"><a href="#promo" class="nav-link">Offers</a>
					</li>
					<li class="nav-item"><a href="#footer" class="nav-link">Contact</a>
					</li>
				</ul>

				<div class="nav-actions">

					<button class="theme-toggle" id="theme-toggle" type="button"
						aria-label="Switch to dark theme" aria-pressed="false">
						<svg class="sun-icon" xmlns="http://www.w3.org/2000/svg"
							width="20" height="20" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round">
              <circle cx="12" cy="12" r="4" />
              <path d="M12 2v2" />
              <path d="M12 20v2" />
              <path d="m4.93 4.93 1.41 1.41" />
              <path d="m17.66 17.66 1.41 1.41" />
              <path d="M2 12h2" />
              <path d="M20 12h2" />
              <path d="m6.34 17.66-1.41 1.41" />
              <path d="m19.07 4.93-1.41 1.41" />
            </svg>
						<svg class="moon-icon" xmlns="http://www.w3.org/2000/svg"
							width="20" height="20" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2" stroke-linecap="round"
							stroke-linejoin="round">
              <path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z" />
            </svg>
					</button>



					<%
					if (user == null) {
					%>

					<a href="login.jsp" class="btn btn-outline"> Sign In </a> <a
						href="register.jsp" class="btn btn-primary"> Sign Up </a>

					<%
					} else {
					%>

					<div class="user-menu">

						<button type="button" id="userMenuBtn" class="user-btn">

							<i class="fa-solid fa-circle-user"></i> <span><%=user.getFirstName()%></span>

							<i class="fa-solid fa-chevron-down"></i>

						</button>

						<div class="dropdown-menu" id="dropdownMenu">

							<a href="profile"> <i class="fa-solid fa-user"></i> My
								Profile

							</a> <a href="orders"> <i class="fa-solid fa-box"></i> My Orders

							</a> <a href="address"> <i class="fa-solid fa-location-dot"></i>

								My Addresses

							</a> <a href="wishlist"> <i class="fa-solid fa-heart"></i>

								Wishlist

							</a> <a href="logout"> <i class="fa-solid fa-right-from-bracket"></i>

								Logout

							</a>

						</div>

					</div>

					<%
					}
					%>

				</div>

				<!-- Hamburger Menu -->
				<button class="hamburger" type="button"
					aria-label="Open navigation menu" aria-expanded="false"
					aria-controls="nav-menu">
					<span></span> <span></span> <span></span>
				</button>
			</div>
		</nav>
	</header>

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

						<div class="trust-list">

							<div class="trust-card">

								<div class="trust-icon">
									<i class="fa-solid fa-bolt"></i>
								</div>

								<div class="trust-info">
									<h4>Fast Delivery</h4>
									<p>Delivered in 30 minutes.</p>
								</div>

							</div>

							<div class="trust-card">

								<div class="trust-icon">
									<i class="fa-solid fa-shield-halved"></i>
								</div>

								<div class="trust-info">
									<h4>Secure Payment</h4>
									<p>100% safe online payments.</p>
								</div>

							</div>

							<div class="trust-card">

								<div class="trust-icon">
									<i class="fa-solid fa-utensils"></i>
								</div>

								<div class="trust-info">
									<h4>Fresh Food</h4>
									<p>Prepared by trusted restaurants.</p>
								</div>

							</div>

							<div class="auth-illustration">

								<img src="images/auth/login-mascot.png"
									alt="Hungrify Delivery Mascot">

							</div>

						</div>

					</div>

				</aside>

				<section class="auth-content">

					<div class="auth-card card">

						<div class="auth-header">

							<h2 class="h2">Create Your Account 🚀</h2>

							<p>Join Hungrify and start your delicious journey today.</p>

						</div>

						<div class="alert alert-success hidden">Registration
							successful.</div>

						<div class="alert alert-error hidden">Something went wrong.

						</div>

						<form action="register" method="post" class="auth-form" novalidate>

    <!-- Full Name -->
    <div class="input-group">

        <label for="name" class="input-label">Full Name</label>

        <div class="input-wrapper">

            <i class="fa-solid fa-user input-icon"></i>

            <input
                type="text"
                id="name"
                name="name"
                class="input"
                placeholder="Enter your full name"
                required>

        </div>

        <small class="error-text hidden"></small>

    </div>

    <!-- Email -->
    <div class="input-group">

        <label for="email" class="input-label">Email Address</label>

        <div class="input-wrapper">

            <i class="fa-solid fa-envelope input-icon"></i>

            <input
                type="email"
                id="email"
                name="email"
                class="input"
                placeholder="Enter your email"
                autocomplete="email"
                required>

        </div>

        <small class="error-text hidden"></small>

    </div>

    <!-- Password -->
    <div class="input-group">

        <label for="password" class="input-label">Password</label>

        <div class="input-wrapper">

            <i class="fa-solid fa-lock input-icon"></i>

            <input
                type="password"
                id="password"
                name="password"
                class="input"
                placeholder="Create a password"
                autocomplete="new-password"
                required>

            <button
                type="button"
                class="input-action password-toggle">

                <i class="fa-solid fa-eye"></i>

            </button>

        </div>

        <small class="error-text hidden"></small>

    </div>

    <!-- Confirm Password -->
    <div class="input-group">

        <label for="confirmPassword" class="input-label">
            Confirm Password
        </label>

        <div class="input-wrapper">

            <i class="fa-solid fa-lock input-icon"></i>

            <input
                type="password"
                id="confirmPassword"
                name="confirmPassword"
                class="input"
                placeholder="Confirm your password"
                autocomplete="new-password"
                required>

            <button
                type="button"
                class="input-action confirm-password-toggle">

                <i class="fa-solid fa-eye"></i>

            </button>

        </div>

        <small class="error-text hidden"></small>

    </div>

    <!-- Address -->
    <div class="input-group">

        <label for="address" class="input-label">Address</label>

        <div class="input-wrapper">

            <i class="fa-solid fa-location-dot input-icon"></i>

            <input
                type="text"
                id="address"
                name="address"
                class="input"
                placeholder="Enter your delivery address"
                required>

        </div>

        <small class="error-text hidden"></small>

    </div>

    <!-- Role -->
    <div class="input-group">

        <label for="role" class="input-label">Role</label>

        <div class="input-wrapper">

            <i class="fa-solid fa-user-tag input-icon"></i>

            <select
                id="role"
                name="role"
                class="input"
                required>

                <option value="">Select Role</option>
                <option value="customer">Customer</option>
                <option value="restaurant_owner">Restaurant Owner</option>
                <option value="delivery_partner">Delivery Partner</option>

            </select>

        </div>

        <small class="error-text hidden"></small>

    </div>

    <!-- Terms -->
    <div class="form-options">

        <label class="remember-me">

            <input
                type="checkbox"
                name="terms"
                required>

            <span>
                I agree to the
                <a href="#">Terms & Conditions</a>
                &
                <a href="#">Privacy Policy</a>
            </span>

        </label>

    </div>

    <button type="submit" class="btn btn-primary login-btn">

        <span>Create Account</span>

        <i class="fa-solid fa-user-plus"></i>

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
								Already have an account? <a href="login.jsp"> Sign In </a>
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
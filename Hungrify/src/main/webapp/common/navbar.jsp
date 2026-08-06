<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.hungrify.model.User" %>
    
    <%
User loggedInUser = (User) session.getAttribute("user");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
</head>
<body>



	<header class="header" id="header">
      <nav class="navbar">
        <div class="container">
          <a href="#home" class="logo" aria-label="Hungrify Home">
 			<img
    				src="images/logo/hungrify-logo-icon.png"
    				alt="Hungrify logo"
    				height="40"
    				width="40"
  			/>
  			<span class="brand-name">
    				<span class="brand-dark">Hungr</span><span class="brand-orange">ify</span>
  			</span>
		</a>

          <!-- Navigation Menu -->
          <ul class="nav-menu" id="nav-menu">
            <li class="nav-item">
              <a href="#home" class="nav-link active">Home</a>
            </li>
            <li class="nav-item">
              <a href="#restaurants" class="nav-link">Restaurants</a>
            </li>
            <li class="nav-item">
              <a href="#features" class="nav-link">About</a>
            </li>
            <li class="nav-item">
              <a href="#promo" class="nav-link">Offers</a>
            </li>
            <li class="nav-item">
              <a href="#footer" class="nav-link">Contact</a>
            </li>
          </ul>

          <div class="nav-actions">
          
          <button
            class="theme-toggle"
            id="theme-toggle"
            type="button"
            aria-label="Switch to dark theme"
            aria-pressed="false"
          >
            <svg
              class="sun-icon"
              xmlns="http://www.w3.org/2000/svg"
              width="20"
              height="20"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
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
            <svg
              class="moon-icon"
              xmlns="http://www.w3.org/2000/svg"
              width="20"
              height="20"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z" />
            </svg>
          </button>
          
          

					<%
					
					
					if(loggedInUser == null) {
					%>

					<a href="login.jsp" class="btn btn-outline"> Sign In </a> <a
						href="register.jsp" class="btn btn-primary"> Sign Up </a>

					<%
					} else {
					%>

	<div class="user-menu">

    <button type="button"
            id="userMenuBtn"
            class="user-btn">

        <i class="fa-solid fa-circle-user"></i>

        <span><%= loggedInUser.getFirstName() %></span>

        <i class="fa-solid fa-chevron-down"></i>

    </button>

    <div class="dropdown-menu"
         id="dropdownMenu">

        <a href="profile">

            <i class="fa-solid fa-user"></i>

            My Profile

        </a>

        <a href="myOrders">

            <i class="fa-solid fa-box"></i>

            My Orders

        </a>

        <a href="address">

            <i class="fa-solid fa-location-dot"></i>

            My Addresses

        </a>

        <a href="wishlist">

            <i class="fa-solid fa-heart"></i>

            Wishlist

        </a>

        <a href="logout">

    <i class="fa-solid fa-right-from-bracket"></i>

    Logout

</a>

    </div>

</div>

<%
}
%>
            
          </div>

          <!-- Hamburger Menu -->
          <button
            class="hamburger"
            type="button"
            aria-label="Open navigation menu"
            aria-expanded="false"
            aria-controls="nav-menu"
          >
            <span></span>
            <span></span>
            <span></span>
          </button>
        </div>
      </nav>
    </header>
</body>
</html>
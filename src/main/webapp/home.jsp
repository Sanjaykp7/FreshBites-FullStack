<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreshBites | Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
	/* Color Theme */
:root {
    --color1: #819A91; /* Sage Green - Used for button background, branding highlight */
    --color2: #A7C1A8;
    --color3: #D1D8BE;
    --color4: #EEEFE0; /* Cream/Off-white - Used for body background */
    --dark: #333; /* Dark text for primary elements */
}

/* RESET */  
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
	text-decoration: none;
}

body {
	background: var(--color4);
}

/* ---------- NAVBAR ---------- */
.cart-navbar {
    height: 70px;
    width: 100%;
    background: var(--color1);
    position: sticky;
    top: 0;
    z-index: 100;
    display: flex;
    justify-content: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.15);
}

/* Ensure consistent alignment for inner content across the page (Navbar, Hero, Cards) */
.nav-inner {
    width: 100%;
    max-width: 1200px; /* Max width for content */
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* Brand Logo/Text Styling */
.nav-left {
    display: flex;
    align-items: center; 
}

.brand-link-inline {
    display: flex;
    align-items: center;
    gap: 5px;
    text-decoration: none;
    line-height: 1;
}

.nav-logo-icon {
    font-size: 28px;
    color: var(--dark); 
}

.brand-name-inline {
    font-size: 24px;
    font-weight: 700;
    color: var(--dark); 
}

.brand-highlight-inline {
    font-size: 24px;
    font-weight: 700;
    color: white; /* Sage Green */
}


.nav-right {
    display: flex;
    align-items: center;
    gap: 18px;
}

.nav-icon {
    font-size: 24px;
    color: white;
}

.secure-text {
    font-size: 20px;
    font-weight: 600;
    color: white; /* Contrast on dark navbar */
    margin-left: 20px;
    padding-left: 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.5);
}

.cart-link-icon {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 18px; /* Base font size for text */
    color: white;
    font-weight: 600;
    transition: color 0.2s;
}

.cart-link-icon:hover {
    color: var(--dark);
}

.cart-link-icon i {
    font-size: 24px; /* Maintain icon size */
}

/* ---------- HERO SECTION ---------- */
.hero {
    background: var(--color2);
    padding: 50px 20px;
    text-align: center;
    display: flex;
    justify-content: center;
}

.hero-content {
    width: 100%;
    max-width: 1200px;
}

.hero h1 {
    font-size: 36px;
    font-weight: 700;
    color: var(--dark);
}

.hero p {
    font-size: 18px;
    margin-top: 8px;
    color: var(--dark);
}

.search-box {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.search-box input {
    width: 350px;
    padding: 12px;
    border: none;
    outline: none;
    border-radius: 8px 0 0 8px;
}

.search-box button {
    padding: 12px 20px;
    border: none;
    background: var(--color1);
    color: white;
    border-radius: 0 8px 8px 0;
    cursor: pointer;
    font-size: 16px;
}

/* ---------- SECTION TITLE ---------- */
.section-title-container {
    display: flex;
    justify-content: center;
    padding: 0 20px;
    margin-top: 25px;
}
.section-title {
    width: 100%;
    max-width: 1200px;
    font-size: 26px;
    font-weight: bold;
    color: var(--dark);
    text-align: center;
    margin: 0;
}


/* ---------- CARDS ---------- */
/* FIX: This wrapper now handles centering and overall padding */
.card-container-outer {
    width: 100%;
    display: flex;
    justify-content: center;
    padding: 20px;
}

.card-container {
    width: 100%;
    max-width: 1100px;            /* FIX: prevents zoom-out breaking */
    margin: 0 auto;

    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); 
    gap: 20px;

    align-items: stretch;         /* FIX: all cards equal height */
}

.card {
    width: 100%;
    background: #fff;
    border-radius: 14px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    cursor: pointer;

    min-height: 100%;             /* FIX: prevent zoom compression */
    transition: .2s;
}

.card:hover {
	transform: scale(1.03);
}

.card img {
	width: 100%;
	height: 180px;
	object-fit: cover;
}

.card-content {
	padding: 14px;
	background-color: var(--color3);
}

.title {
	font-size: 18px;
	font-weight: 900;
	margin-bottom: 4px;
	color: black;
}

.cuisine {
	font-size: 18px;
	color: #444;
	margin-bottom: 10px;
}

.rating-row {
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	margin-bottom: 10px;
	flex-wrap: wrap;
}

.rating {
	background: #48c479;
	color: white;
	padding: 3px 8px;
	border-radius: 6px;
	font-weight: bold;
	margin-bottom: 6px;
}

.time, .price {
	color: #555;
	margin-bottom: 6px;
	font-size: 16px;
	font-weight: 550;
}

.offer {
	font-size: 14px;
	color: #e46d47;
	font-weight: bold;
}

/* ---------- FOOTER ---------- */
.footer {
    background: var(--color1);
    padding: 20px;
    text-align: center;
    color: white;
    margin-top: 40px;
}

/* ---------- MOBILE ---------- */
@media (max-width: 600px) {
    .hero h1 {
        font-size: 28px;
    }

    .search-box input {
        width: 220px;
    }
    
    /* Adjust padding on mobile to save space */
    .card-container-outer {
        padding: 10px; /* Reduced outer padding for small screens */
    }
    .nav-inner, .section-title-container {
        padding: 0 10px;
    }
}
	
</style>


</head>

<body>

<!-- NAVBAR -->
<nav class="cart-navbar">
    <div class="nav-inner">

        <div class="nav-left">
            <a href="home" class="brand-link-inline">
                <!-- Icon -->
                <i class="fa-solid fa-utensils nav-logo-icon"></i>
                
                <!-- Text: FreshBites -->
                <span class="brand-name-inline">
                    Fresh<span class="brand-highlight-inline">Bites</span>
                </span>
            </a>
            <span class="secure-text">Restaurants</span>
        </div>

	    <%
        		Object user = session.getAttribute("user");
        		boolean isLoggedIn = (user != null);
        %>
        
        <div class="nav-right">
         <!-- NEW: Cart Icon and Text -->
         <a href="cart.jsp" class="cart-link-icon">
                <i class="fa-solid fa-shopping-cart"></i>
                <span class="cart-text">Cart</span>
            </a>
        
            <a href="#" class="nav-icon"><i class="fa-solid fa-circle-question"></i></a>
            <!-- Profile click → login.jsp -->
            <% if(!isLoggedIn) {%>
            <a href="Login.jsp" class="nav-icon"><i class="fa-solid fa-user"></i></a>
            <%} else{%>
            <a href="Profile.jsp" class="nav-icon"><i class="fa-solid fa-user"></i></a>
            <%} %>
        </div>

    </div>
</nav>


<!-- HERO SECTION -->
<section class="hero">
    <div class="hero-content">
        <h1>Discover the best food & drinks in your city</h1>
        <p>Explore restaurants, cafes, and cuisines near you</p>

        <div class="search-box">
            <input type="text" placeholder="Search for restaurant or cuisine...">
            <button>Search</button>
        </div>
    </div>
</section>


<!-- POPULAR RESTAURANTS -->
<!-- NEW WRAPPER: Ensures H2 title aligns with the card container below -->
<div class="section-title-container">
    <h2 class="section-title">Popular Restaurants</h2>
</div>


<!-- RESTAURANT CARDS -->
<!-- NEW WRAPPER: Centers the card-container block -->
<div class="card-container-outer">
    <div class="card-container">

<%
List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");

for (Restaurant r : restaurants) {
%>

<div class="card">
	<a href="menu?restaurantId=<%=r.getRestaruantId()%>">

	<img src="<%=r.getImage()%>" alt="Restaurant">

	<div class="card-content">
		<div class="title"><%=r.getName()%></div>

		<div class="cuisine">• <%=r.getCuisine()%></div>

		<div class="rating-row">
			<div class="rating"><%=r.getRatings()%> ★</div>
			<div class="time"><%=r.getDeliveryTime()%></div>
			<div class="price"><%=r.getCity() %></div>
		</div>

		<div class="offer">GET UPTO 20% OFF</div>
	</div>

	</a>
</div>

<% } %>

    </div>
</div>

<!-- FOOTER -->
<footer class="footer">
    <p>© 2025 FreshBites — All Rights Reserved.</p>
</footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FreshBites | Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* Color Theme (Consistent with home.jsp) */
:root {
	--color1: #819A91; /* Sage Green - Navbar, highlights */
	--color2: #A7C1A8; /* Light Green - Menu section background */
	--color3: #D1D8BE; /* Beige/Card content background */
	--color4: #EEEFE0; /* Cream/Off-white - Body background */
	--dark: #333; /* Dark text for primary elements */
	--accent-red: #e46d47; /* Offer/CTA color */
	--rating-green: #48c479;
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

/* --- Global Alignment Container --- */
.page-content-wrapper {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
	min-height: calc(100vh - 70px); /* Height minus navbar height */
}

.content-inner {
	width: 100%;
	max-width: 1200px; /* Aligns with navbar/home.jsp content width */
}

/* ---------- NAVBAR (Copied from home.jsp) ---------- */
.cart-navbar {
	height: 70px;
	width: 100%;
	background: var(--color1);
	position: sticky;
	top: 0;
	z-index: 100;
	display: flex;
	justify-content: center;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
}

.nav-inner {
	width: 100%;
	max-width: 1200px;
	padding: 0 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

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

.secure-text {
    font-size: 20px;
    font-weight: 600;
    color: white; /* Contrast on dark navbar */
    margin-left: 20px;
    padding-left: 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.5);
}

.brand-name-inline {
	font-size: 24px;
	font-weight: 700;
	color: var(--dark);
}

.brand-highlight-inline {
	font-size: 24px;
	font-weight: 700;
	color:white; /* Sage Green */
}

.nav-right {
	display: flex;
	align-items: center;
	gap: 18px;
}

.nav-icon {
	font-size: 24px;
	color: white;
    /* Ensure only icons are styled by default */
}

/* Styling for the Cart link which includes text and icon */
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

/* ---------- END NAVBAR ---------- */

/* ---------- RESTAURANT HEADER ---------- */
.restaurant-header {
	width: 100%;
	padding: 30px 0;
	text-align: center;
}

.restaurant-name {
	font-size: 40px;
	font-weight: 800;
	color: var(--dark);
	margin-bottom: 15px;
}

/* MODIFICATION 1: Limit width and center the welcome message section */
.menu-info-section {
	background: var(--color2);
	padding: 20px;
	border-radius: 12px;
	margin-bottom: 30px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	max-width: 800px; /* Set max width for the info box */
	margin-left: auto;
	margin-right: auto;
}

.menu-info-section p {
	font-size: 18px;
	color: var(--dark);
	line-height: 1.5;
}

/* ---------- MENU CARDS (Revised Styling) ---------- */
.parent {
    /* MODIFICATION 2: Set max-width for the item card wrapper and center it */
    max-width: 768px; /* Optimal width for readability on large screens */
    margin: 0 auto 20px auto; /* Center the card wrapper and add bottom margin */
}

.item-card {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	background: #fff;
	border-radius: 14px;
	overflow: hidden;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
	padding: 15px;
	transition: transform 0.3s;
	border: 1px solid var(--color3);
}

.item-card:hover {
	transform: translateY(-2px);
}

.item-info {
	flex-grow: 1;
	padding-right: 15px;
}

.item-name {
	font-size: 22px;
	font-weight: bold;
	color: var(--dark);
	margin-bottom: 5px;
}

.price {
	font-size: 18px;
	font-weight: 600;
	color: var(--accent-red);
	margin-bottom: 5px;
}

.rating {
	font-size: 16px;
	color: var(--dark);
	margin-bottom: 10px;
}

.rating span {
	font-weight: bold;
	color: var(--rating-green);
}

.description {
	font-size: 14px;
	color: #666;
	line-height: 1.4;
}

.item-image-box {
	position: relative;
	flex-shrink: 0;
	width: 120px;
	height: 120px;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.item-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.add-btn {
	position: absolute;
	bottom: 5px;
	left: 50%;
	transform: translateX(-50%);
	background: white;
	color: #16a34a;
	border: none;
	padding: 5px 15px;
	border-radius: 6px;
	cursor: pointer;
	font-weight: bold;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	transition: background 0.2s;
}

.add-btn:hover {
	background: #16a34a;
	color: white;
}

/* Mobile adjustments */
@media ( max-width : 600px) {
	.nav-inner {
		padding: 0 10px;
	}
	.restaurant-name {
		font-size: 32px;
	}
	/* Ensure content expands to full width on small screens */
	.menu-info-section {
		max-width: 100%; 
	}
	.parent {
		max-width: 100%; 
		margin-left: 0;
		margin-right: 0;
	}
	.item-card {
		flex-direction: column;
		align-items: stretch;
	}
	.item-image-box {
		width: 100%;
		height: 180px;
		margin-top: 15px;
	}
	.item-info {
		padding-right: 0;
	}
	.add-btn {
		bottom: 10px;
		right: 10px;
		left: auto;
		transform: none;
		padding: 8px 20px;
	}
    /* Hide the 'Cart' text on very small screens if necessary, though it looks good visible */
    /* .cart-text { display: none; } */
}
</style>


</head>

<body>

	<nav class="cart-navbar">
		<div class="nav-inner">

			<div class="nav-left">
				<a href="home" class="brand-link-inline"> <i
					class="fa-solid fa-utensils nav-logo-icon"></i> <span class="brand-name-inline"> Fresh<span
						class="brand-highlight-inline">Bites</span>
				</span>
				</a>
				<span class="secure-text">Menu List</span>
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


	<div class="page-content-wrapper">
		<div class="content-inner">

			<header class="restaurant-header">
				<h1 class="restaurant-name"><%=request.getAttribute("restaurantName") != null ? request.getAttribute("restaurantName") : "Delicious Diner"%></h1>
			</header>

			<section class="menu-info-section">
				<p>Welcome to our menu! Every dish is prepared with the freshest
					ingredients and culinary passion. Browse our curated selection
					below, featuring local favorites and Chef's specials. Click 'ADD'
					to start building your perfect meal.</p>
			</section>

			<%
			List<Menu> menus = (List<Menu>) request.getAttribute("menus");
            if (menus != null) { // Add a null check for safety
                for (Menu m : menus) {
			%>
			<div class="parent">
				<div class="item-card">
					<div class="item-info">
						<div class="item-name"><%=m.getItemName()%></div>

						<div class="price">
							Price: ₹<%=m.getPrice()%></div>

						<div class="rating">
							⭐ <span><%=m.getRatings()%></span>
						</div>

						<div class="description"><%=m.getDescription()%></div>
					</div>
					<div class="item-image-box">
						<img src="<%=m.getImage()%>" alt="<%=m.getItemName()%>" class="item-image">
						
						<form action="cart" method="post">
							<input type="hidden" name="restaurantId" value="<%=request.getParameter("restaurantId")%>"> 
							<input type="hidden" name="itemId" value="<%=m.getMenuId()%>">
							<input type="hidden" name="quantity" value="1"> 
							<input type="hidden" name="action" value="addToCart">
							<button class="add-btn">ADD</button>
						</form>
					</div>
				</div>
			</div>


			<%
			    }
            } else {
            %>
            <div class="parent" style="text-align: center; padding: 50px; color: var(--dark);">
                <p style="font-size: 20px;">Menu items are currently unavailable. Please check back later!</p>
            </div>
            <%
            }
			%>
		</div>
	</div>

</body>
</html>
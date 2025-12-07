<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User" %>
<%-- 
    Assumption: A Customer object (or similar map/bean) is available in the request or session.
    We will use placeholder values for demonstration.
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FreshBites | My Profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
/* Color Theme from https://colorhunt.co/palette/819a91a7c1a8d1d8beeeefe0 */
:root {
	--color1: #819A91; /* Sage Green - Navbar, accents, primary buttons */
	--color2: #A7C1A8; /* Light Green - Card Header background */
	--color3: #D1D8BE; /* Beige - Field background/borders */
	--color4: #EEEFE0; /* Cream/Off-white - Body background */
	--dark: #333; /* Dark text for primary elements */
}

/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', Arial, sans-serif;
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
	padding: 40px 20px;
	min-height: calc(100vh - 70px); 
}

/* ---------- NAVBAR (Consistent Style) ---------- */
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

.brand-name-inline {
	font-size: 24px;
	font-weight: 700;
	color: var(--dark);
}

.brand-highlight-inline {
	font-size: 24px;
	font-weight: 700;
	color:white; /* Contrast color on the navbar */
}

.nav-right {
	display: flex;
	align-items: center;
	gap: 18px;
}

.nav-icon {
	font-size: 24px;
	color: white;
	transition: color 0.2s;
}
.nav-icon:hover {
	color: var(--dark);
}
/* ---------- END NAVBAR ---------- */


/* ---------- PROFILE CARD STYLES ---------- */
.profile-card {
	width: 100%;
	max-width: 600px; /* Professional, centered look */
	background: white;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	padding-bottom: 30px;
}

.card-header {
	background: var(--color2);
	padding: 30px 20px 80px; /* Extra padding for floating image */
	text-align: center;
	position: relative;
}

.profile-picture-container {
	position: absolute;
	bottom: -70px; /* Positioned to overlap header and body */
	left: 50%;
	transform: translateX(-50%);
	width: 140px;
	height: 140px;
	border-radius: 50%;
	border: 6px solid white; /* White border for emphasis */
	overflow: hidden;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	background-color: var(--color3);
}

.profile-picture {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Placeholder icon in case image URL is empty/broken */
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 60px;
	color: var(--color1);
}

.card-body {
	padding: 90px 30px 20px; /* Top padding matches bottom of image */
	text-align: center;
}

.profile-name {
	font-size: 28px;
	font-weight: 700;
	color: var(--dark);
	margin-bottom: 5px;
}

.profile-id {
	font-size: 14px;
	color: #666;
	margin-bottom: 30px;
}

.info-grid {
	display: grid;
	grid-template-columns: 1fr; /* Default single column */
	gap: 20px;
	text-align: left;
	margin-top: 20px;
}

.info-item {
	padding: 15px;
	background: var(--color4);
	border: 1px solid var(--color3);
	border-radius: 10px;
	transition: box-shadow 0.3s;
}
.info-item:hover {
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.info-label {
	font-size: 13px;
	color: var(--color1);
	font-weight: 600;
	margin-bottom: 5px;
}

.info-value {
	font-size: 16px;
	color: var(--dark);
	word-wrap: break-word; /* Ensure long addresses wrap */
}

/* Responsiveness: Two columns on desktop/tablet */
@media (min-width: 500px) {
	.info-grid {
		grid-template-columns: 1fr 1fr;
	}
	/* Address field takes full width in a two-column layout */
	.info-grid .info-item:last-child { 
		grid-column: 1 / -1; 
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
					<i class="fa-solid fa-utensils nav-logo-icon"></i> 
					<span class="brand-name-inline"> Fresh<span class="brand-highlight-inline">Bites</span></span>
				</a>
				<p style="color: black; font-weight:600; margin-left: 18px; font-size: 16px">MY ACCOUNT</p>
			</div>

			<div class="nav-right">
				<a href="#" class="nav-icon"><i class="fa-solid fa-circle-question"></i></a>
				<a href="Login.jsp" class="nav-icon"><i class="fa-solid fa-user"></i></a>
			</div>

		</div>
	</nav>


	<div class="page-content-wrapper">
		<div class="profile-card">

			<!-- HEADER & PROFILE PICTURE -->
			<div class="card-header">
				<!-- Empty header for visual space -->
			</div>

			<div class="profile-picture-container">
				<%-- Use a conditional for the profile image source --%>
				<%-- String profileImageUrl = customer.getProfilePictureUrl(); --%>
				<% String profileImageUrl = null; // Placeholder for logic %>

				<% if (profileImageUrl != null && !profileImageUrl.isEmpty()) { %>
					<img src="<%= profileImageUrl %>" alt="Profile Picture" class="profile-picture">
				<% } else { %>
					<img class="profile-picture" src="https://images.pexels.com/photos/264905/pexels-photo-264905.jpeg" >
				<% } %>
			</div>
			
			<%
			User user = (User) session.getAttribute("user");			
			%>
			
			<!-- BODY: USER INFORMATION -->
			<div class="card-body">
				<%-- Placeholder data for demonstration --%>
				<% 
					int customerId = user.getUserId();
					String name = user.getName();
					String email = user.getEmail();
					String phone = user.getPhone();
					String address = user.getAddress()+", India";
				%>
			
				<div class="profile-name"><%= name %></div>
				<div class="profile-id">Customer ID: <%= customerId %></div>
				
				<div class="info-grid">
					
					<div class="info-item">
						<div class="info-label">Email Address</div>
						<div class="info-value"><%= email %></div>
					</div>
					
					<div class="info-item">
						<div class="info-label">Phone Number</div>
						<div class="info-value"><%= phone %></div>
					</div>
					
					<div class="info-item">
						<div class="info-label">Shipping Address</div>
						<div class="info-value"><%= address %></div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>

</body>
</html>
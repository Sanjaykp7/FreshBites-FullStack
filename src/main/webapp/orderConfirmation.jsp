<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.model.Menu"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Confirmed!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>

/* Color Theme from https://colorhunt.co/palette/819a91a7c1a8d1d8beeeefe0 */
:root {
	--color1: #819A91; /* Sage Green - Navbar, accents */
	--color2: #A7C1A8; /* Light Green */
	--color3: #D1D8BE; /* Beige */
	--color4: #EEEFE0; /* Cream/Off-white - Body background */
	--dark: #333; /* Dark text for primary elements */
    --accent-green: #28a745; /* Success Green */
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
    width: 100%;
    margin: 0;
    padding: 0;
    background: var(--color4); 
    overflow-x: hidden; /* Prevent horizontal scroll */
}

/* ---------- NAVBAR (Consistent Style) ---------- */
.cart-navbar {
    height: 70px;
    width: 100%;
    background: var(--color1); 
    box-shadow: 0 2px 10px rgba(0,0,0,0.15); 
    position: sticky;
    top: 0;
    z-index: 100;
    display: flex;
    justify-content: center;
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
	color:white;
}

.secure-text {
    font-size: 20px;
    font-weight: 600;
    color: white; 
    margin-left: 20px;
    padding-left: 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.5);
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 18px;
}

.nav-icon {
    font-size: 24px;
    color: white; 
    text-decoration: none;
    transition: color 0.2s;
}

.nav-icon:hover {
    color: var(--dark);
}


/* ----- Responsive Navbar ------ */
@media (max-width: 600px) {
    .secure-text {
        display: none; /* Hide secure text on mobile to save space */
    }

    .brand-name-inline, .brand-highlight-inline {
        font-size: 20px;
    }
    
    .nav-logo-icon {
        font-size: 24px;
    }

    .nav-icon {
        font-size: 20px;
    }
}

/* ================== FULLSCREEN VIDEO & CONTENT ================== */

.video-container {
    position: fixed;
    top: 70px; /* Start below the navbar */
    left: 0;
    width: 100%;
    height: calc(100vh - 70px); /* Fill remaining viewport height */
    overflow: hidden;
    z-index: 10;
}

.confirmation-video {
    position: absolute;
    top: 50%;
    left: 50%;
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
    z-index: 1;
    transform: translate(-50%, -50%);
    object-fit: cover; /* Ensures video covers the entire container */
    filter: brightness(0.6) blur(1px); /* Darken and slightly blur the video */
}

.content-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 20; /* Above the video */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 20px;
    color: white;
}

.success-icon {
    font-size: 80px;
    color: var(--accent-green);
    margin-bottom: 20px;
    text-shadow: 0 0 15px rgba(0, 0, 0, 0.7);
}

.confirmation-title {
    font-size: 4em;
    font-weight: 800;
    margin-bottom: 10px;
    text-shadow: 0 4px 10px rgba(0, 0, 0, 0.8);
}

.confirmation-message {
    font-size: 1.5em;
    font-weight: 300;
    margin-bottom: 30px;
    max-width: 600px;
    text-shadow: 0 2px 5px rgba(0, 0, 0, 0.7);
}

.home-btn {
    padding: 15px 30px;
    background: var(--accent-green); 
    font-size: 1.2em;
    font-weight: bold;
    color: white;
    border-radius: 8px;
    transition: background 0.3s, transform 0.1s;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    border: 2px solid white;
}

.home-btn:hover {
    background: #218838;
    transform: scale(1.05);
}

/* Smaller screen adjustments */
@media (max-width: 768px) {
    .confirmation-title {
        font-size: 3em;
    }
    .confirmation-message {
        font-size: 1.2em;
    }
    .success-icon {
        font-size: 60px;
    }
}
</style>
</head>
<body>

<!-- ================= NAVBAR ================= -->
<nav class="cart-navbar">
    <div class="nav-inner">

        <!-- LEFT (Brand Logo + Secure Text) -->
        <div class="nav-left">
            <a href="home.jsp" class="brand-link-inline"> 
                <i class="fa-solid fa-utensils nav-logo-icon"></i> 
                <span class="brand-name-inline"> Fresh<span class="brand-highlight-inline">Bites</span></span>
            </a>
            <span class="secure-text">Order Confirmed!</span>
        </div>

        <!-- RIGHT -->
        <div class="nav-right">
            <a href="#" class="nav-icon"><i class="fa-solid fa-circle-question"></i></a>
            <a href="#" class="nav-icon"><i class="fa-solid fa-user"></i></a>
        </div>

    </div>
</nav>

<!-- ================= FULLSCREEN VIDEO BACKGROUND ================= -->
<div class="video-container">
    <%-- 
        *** IMPORTANT: Replace 'path/to/your/video.mp4' with the actual path to your video file. ***
        Attributes 'autoplay', 'loop', and 'muted' are necessary for the video to play automatically in most browsers.
    --%>
    <video class="confirmation-video" autoplay loop muted playsinline>
        <source src="path/to/your/video.mp4" type="video/mp4">
        <!-- Fallback message if video cannot be played -->
        Your browser does not support the video tag.
    </video>

    <!-- ================= CONTENT OVERLAY ================= -->
    <div class="content-overlay">
        <i class="fa-regular fa-circle-check success-icon"></i>
        <h1 class="confirmation-title">Order Confirmed!</h1>
        <p class="confirmation-message">Thank you for your order. We are preparing your delicious meal and it will be delivered soon!</p>
        
        <a href="home" class="home-btn">
            Continue Shopping
        </a>
    </div>
</div>

</body>
</html>
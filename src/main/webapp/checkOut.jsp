<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.model.Menu"%>
<%@ page import="com.tap.model.Cart,com.tap.model.CartItem"%>

    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>

/* Color Theme from https://colorhunt.co/palette/819a91a7c1a8d1d8beeeefe0 */
:root {
	--color1: #819A91; /* Sage Green - Navbar, accents, primary buttons */
	--color2: #A7C1A8; /* Light Green - Checkout highlight */
	--color3: #D1D8BE; /* Beige - Field background/borders */
	--color4: #EEEFE0; /* Cream/Off-white - Body background */
	--dark: #333; /* Dark text for primary elements */
    --accent-green: #28a745; /* Proceed button green */
}

/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
	text-decoration: none;
}

/* PAGE */
body {
    display: block !important;
    width: 100%;
    margin: 0;
    padding: 0;
    background: var(--color4); /* Use theme color */
    font-family: Arial, sans-serif;
}

/* ---------- NAVBAR (Updated to Theme) ---------- */
.cart-navbar {
    height: 70px; /* Increased height for better visibility */
    width: 100%;
    background: var(--color1); /* Use theme color */
    box-shadow: 0 2px 10px rgba(0,0,0,0.15); /* Stronger shadow */
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

/* LEFT SIDE - FreshBites Branding */
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
	color:white; /* Contrast color */
}

.secure-text {
    font-size: 20px;
    font-weight: 600;
    color: white; /* Contrast on dark navbar */
    margin-left: 20px;
    padding-left: 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.5);
}

/* RIGHT SIDE */
.nav-right {
    display: flex;
    align-items: center;
    gap: 18px;
}

.nav-icon {
    font-size: 24px;
    color: white; /* Contrast on dark navbar */
    text-decoration: none;
    transition: color 0.2s;
}

.nav-icon:hover {
    color: var(--dark);
}


/* ----- Responsive Navbar ------ */
@media (max-width: 600px) {
    .secure-text {
        font-size: 16px;
        margin-left: 10px;
        padding-left: 10px;
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









/* WRAPPER */
.checkout-container {
    width: 95%;
    max-width: 800px; /* Reduced max-width for better focus */
    margin: 40px auto;
}

/* CARD */
.card {
    background: #fff;
    padding: 25px;
    margin-bottom: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    border-top: 5px solid var(--color2); /* Light green accent on top */
}

/* TITLES */
.card h2 {
    margin: 0 0 15px;
    font-size: 24px;
    font-weight: 700;
    color: var(--dark);
    border-bottom: 1px solid var(--color3);
    padding-bottom: 10px;
}

/* TEXTAREA */
.address-box {
    width: 100%;
    height: 140px;
    padding: 15px;
    border-radius: 8px;
    border: 2px solid var(--color3);
    resize: vertical; /* Allow only vertical resize */
    font-size: 16px;
    transition: border-color 0.3s;
}

.address-box:focus {
    border-color: var(--color1);
    outline: none;
    box-shadow: 0 0 0 3px rgba(129, 154, 145, 0.2);
}

/* PAYMENT OPTIONS */
.payment-option {
    display: flex;
    align-items: center;
    padding: 15px;
    border-radius: 10px;
    border: 2px solid var(--color3);
    margin-bottom: 15px;
    cursor: pointer;
    background: var(--color4); /* Lighter background for options */
    transition: all 0.2s;
}

.payment-option:hover {
    background: #fcfcfc;
    border-color: var(--color1);
}

.payment-option input {
    margin-right: 15px;
    transform: scale(1.2);
    accent-color: var(--color1); /* Change radio button color */
}

/* PROCEED BUTTON */
.proceed-btn {
    width: 100%;
    padding: 18px;
    background: var(--accent-green); /* Keep standard success green for CTA */
    font-size: 20px;
    font-weight: bold;
    border: none;
    border-radius: 10px;
    color: white;
    cursor: pointer;
    margin-top: 20px;
    transition: background 0.2s, transform 0.1s;
    box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
}

.proceed-btn:hover {
    background: #218838;
    transform: translateY(-1px);
}

/* RESPONSIVE */
@media (max-width: 600px) {
    .card {
        padding: 18px;
    }
    .card h2 {
        font-size: 22px;
    }
    .payment-option {
        padding: 12px;
    }
    .proceed-btn {
        padding: 16px;
        font-size: 18px;
    }
}

</style>
</head>
<body>

<!-- ================= CART NAVBAR ================= -->
<nav class="cart-navbar">
    <div class="nav-inner">

        <!-- LEFT (Brand Logo + Secure Text) -->
        <div class="nav-left">
            <a href="home" class="brand-link-inline"> 
                <i class="fa-solid fa-utensils nav-logo-icon"></i> 
                <span class="brand-name-inline"> Fresh<span class="brand-highlight-inline">Bites</span></span>
            </a>
            <span class="secure-text">Secure Checkout</span>
        </div>
        
         <%
        		Object user = session.getAttribute("user");
        		boolean isLoggedIn = (user != null);
        %>

        <!-- RIGHT -->
       <div class="nav-right">
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










<!-- FORM STARTS -->
<form action="CheckoutServlet" method="post">

<div class="checkout-container">

    <!-- DELIVERY ADDRESS CARD -->
    <div class="card">
        <h2><i class="fa-solid fa-map-location-dot"></i> Delivery Address</h2>
        <textarea class="address-box" name="address" placeholder="Enter your full delivery address" required></textarea>
    </div>

    <!-- PAYMENT METHODS CARD -->
    <div class="card">
        <h2><i class="fa-solid fa-credit-card"></i> Payment Methods</h2>

        <label class="payment-option">
            <input type="radio" name="paymentMethod" value="UPI" required>
            <i class="fa-solid fa-mobile-screen-button"></i> UPI / Net Banking
        </label>

        <label class="payment-option">
            <input type="radio" name="paymentMethod" value="COD">
            <i class="fa-solid fa-money-bill-transfer"></i> Cash on Delivery (COD)
        </label>

        <label class="payment-option">
            <input type="radio" name="paymentMethod" value="CARD">
            <i class="fa-solid fa-credit-card"></i> Credit / Debit Card
        </label>
        
        <label class="payment-option">
            <input type="radio" name="paymentMethod" value="WALLET">
            <i class="fa-solid fa-wallet"></i> Digital Wallet
        </label>

    </div>
	
	<%
    Integer subtotal = (Integer) session.getAttribute("totalAmount");
    if(subtotal == null) subtotal = 0;

    int deliveryFee = 40;  // You can make this dynamic later
    int totalPayable = subtotal + deliveryFee;
%>
	
    <!-- PLACEHOLDER FOR ORDER SUMMARY/TOTALS -->
    <div class="card">
        <h2><i class="fa-solid fa-receipt"></i> Order Summary</h2>
        <p style="display: flex; justify-content: space-between; margin-bottom: 8px;"><span>Subtotal:</span> <strong>₹<%=subtotal%></strong></p>
        <p style="display: flex; justify-content: space-between; margin-bottom: 8px;"><span>Delivery Fee:</span> <strong>₹40.00</strong></p>
        <p style="display: flex; justify-content: space-between; font-size: 1.2em; border-top: 1px dashed var(--color3); padding-top: 10px;"><span>**Total Payable:**</span> <strong>₹<%=totalPayable%></strong></p>
    </div>

    <!-- PROCEED BUTTON -->
    <input  class="proceed-btn" type="submit" value="Confirm Your Order">

</div>

</form>
<!-- FORM ENDS -->

</body>
</html>
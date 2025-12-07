<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="java.util.Map" %>

<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.dao.MenuDAO" %>
<%@ page import="com.tap.daoimplementation.MenuDAOImplimentaion" %>
<%@ page import="com.tap.daoimplementation.RestaurantDAOImplimentation" %>
<%@ page import="com.tap.model.Restaurant" %>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<!-- Removed redundant 'cartStyle.css' reference -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


<style>
/* Color Theme (Consistent with home.jsp and menu.jsp) */
:root {
	--color1: #819A91; /* Sage Green - Navbar, highlights, primary buttons */
	--color2: #A7C1A8; /* Light Green */
	--color3: #D1D8BE; /* Beige/Card content background */
	--color4: #EEEFE0; /* Cream/Off-white - Body background */
	--dark: #333; /* Dark text for primary elements */
	--accent-red: #e46d47; /* Remove button, highlights */
	--rating-green: #48c479; /* Success/Qty Plus button */
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
    display: block !important;
    width: 100%;
    margin: 0;
    padding: 0;
    background: var(--color4); /* Applied theme background color */
    font-family: Arial, sans-serif;
}

/* ---------- NAVBAR (Updated to FreshBites Style) ---------- */
.cart-navbar {
    height: 70px; /* Increased height to match home.jsp */
    width: 100%;
    background: var(--color1); /* Sage Green background */
    position: sticky;
    top: 0;
    z-index: 100;
    display: flex;
    justify-content: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.15);
}

.secure-text {
    font-size: 20px;
    font-weight: 600;
    color: white; /* Contrast on dark navbar */
    margin-left: 20px;
    padding-left: 20px;
    border-left: 1px solid rgba(255, 255, 255, 0.5);
}

.nav-inner {
    width: 100%;
    max-width: 1200px;
    padding: 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* LEFT SIDE (FreshBites Branding) */
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
    color: White; /* Sage Green - Note: This is overridden by parent's color1 background but kept for consistency if navbar color changes */
}

/* RIGHT SIDE */
.nav-right {
    display: flex;
    align-items: center;
    gap: 18px;
}

.nav-icon {
    font-size: 24px;
    color: white; /* Icons in white for contrast on color1 background */
    text-decoration: none;
    cursor: pointer;
}
/* ---------- END NAVBAR ---------- */


/* ===== CART WRAPPER ===== */
.cart-wrapper {
    width: 90%;
    max-width: 850px; /* Adjusted max width to 850px for a smaller appearance */
    margin: 40px auto;
    background: #fff;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.12);
}

/* TITLE */
.cart-title {
    text-align: center;
    font-size: 32px; /* Slightly larger title */
    margin-bottom: 25px;
    font-weight: bold;
    color: var(--dark);
}

/* TABLE */
.cart-table {
    width: 100%;
    border-collapse: collapse;
}

.cart-table th {
    background: var(--color2); /* Themed table header */
    color: var(--dark);
    padding: 15px;
    font-size: 16px;
    text-align: left;
}

.cart-table td {
    padding: 15px;
    border-bottom: 1px solid var(--color3); /* Themed border */
    vertical-align: middle;
}

/* IMAGE */
.cart-img {
    width: 70px;
    height: 70px;
    object-fit: cover;
    border-radius: 8px;
}

/* QUANTITY BUTTONS */
.qty-btn {
    width: 32px;
    height: 32px;
    border: none;
    font-size: 20px;
    border-radius: 5px;
    cursor: pointer;
    color: white;
    transition: background 0.2s;
}

.qty-minus {
    background: var(--accent-red); /* Themed red for removal/decrease */
}
.qty-minus:hover {
    background: #c54924; 
}

.qty-plus {
    background: var(--rating-green); /* Themed green for addition/increase */
}
.qty-plus:hover {
    background: #399155; 
}

.qty-value {
    margin: 0 10px;
    font-size: 18px;
    font-weight: bold;
    color: var(--dark);
}

/* REMOVE BUTTON */
.remove-btn {
    background: var(--accent-red);
    border: none;
    color: white;
    padding: 8px 16px;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
    transition: background 0.2s;
}
.remove-btn:hover {
    background: #c54924;
}

/* TOTAL + BUTTONS SECTION */
.total-section {
    margin-top: 30px;
    padding-top: 15px;
    border-top: 2px solid var(--color3);
    text-align: right;
    font-size: 24px;
    font-weight: bold;
    color: var(--dark);
}

.button-row {
    margin-top: 20px;
    text-align: right;
}

.checkout-btn, .add-btn-secondary {
    padding: 12px 20px;
    color: white;
    border: none;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    font-weight: bold;
    transition: background 0.2s;
    text-decoration: none; /* important for <a> tag */
    display: inline-block; /* important for <a> tag */
}

.checkout-btn {
    background: var(--rating-green); /* Primary action in success green */
    margin-right: 10px;
}
.checkout-btn:hover {
    background: #399155;
}

.add-btn-secondary {
    background: var(--color1); /* Secondary action in theme color */
}
.add-btn-secondary:hover {
    background: #6a8077;
}


/* ----- Responsive ------ */
@media (max-width: 768px) {
    .cart-wrapper {
        max-width: 100%; /* Ensure full width on small screens */
        margin: 20px auto;
        padding: 15px;
    }
    
    .cart-title {
        font-size: 26px;
    }
    
    .cart-table {
        /* Hide headers and change table to stack rows on smaller screens */
        border: 0;
    }

    .cart-table thead {
        display: none;
    }

    .cart-table, .cart-table tbody, .cart-table tr, .cart-table td {
        display: block;
        width: 100%;
    }

    .cart-table tr {
        margin-bottom: 15px;
        border: 1px solid var(--color3);
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    
    .cart-table td {
        text-align: right;
        padding-left: 50%;
        position: relative;
        border-bottom: 1px dotted #ccc;
    }
    
    .cart-table td:before {
        content: attr(data-label);
        position: absolute;
        left: 0;
        width: 50%;
        padding-left: 10px;
        font-weight: bold;
        text-align: left;
        color: var(--dark);
    }
    
    .cart-table td:last-child {
        border-bottom: 0;
    }

    .button-row {
        text-align: center;
    }
    
    .checkout-btn, .add-btn-secondary {
        width: 100%;
        margin-bottom: 10px;
    }
}
</style>
</head>

<body>

<!-- ================= CART NAVBAR (FreshBites Style) ================= -->
<nav class="cart-navbar">
    <div class="nav-inner">

        <!-- LEFT (FreshBites Branding) -->
        <div class="nav-left">
            <a href="home" class="brand-link-inline">
                <!-- Icon -->
                <i class="fa-solid fa-utensils nav-logo-icon"></i>
                
                <!-- Text: FreshBites -->
                <span class="brand-name-inline">
                    Fresh<span class="brand-highlight-inline">Bites</span>
                </span>
            </a>
            <span class="secure-text">Cart</span>
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







<div class="cart-wrapper">

    <div class="cart-title">Your Cart</div>

    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getCartItems().isEmpty()) {
    %>
        <h2 style="text-align: center; color: var(--dark);">Your cart is empty.</h2>
    </div>
</body>
</html>
<%
return;
}

 int totalPrice = 0;
%>

<table class="cart-table">
    <thead>
        <tr>
            <th>Image</th>
            <th>Item</th>
            <th>Price (₹)</th>
            <th>Quantity</th>
            <th>Subtotal (₹)</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

<%
for (Map.Entry<Integer, CartItem> entry : cart.getCartItems().entrySet()) {

    CartItem item = entry.getValue();
    int itemTotal = item.getPrice() * item.getQuantity();
    totalPrice += itemTotal;
    
    session.setAttribute("totalAmount", totalPrice);

    MenuDAOImplimentaion menuDao = new MenuDAOImplimentaion();
    Menu menuItem = menuDao.getMenu(item.getItemId());
%>

<tr>
    <td data-label="Image"><img src="<%=menuItem.getImage()%>" alt="<%=item.getName()%>" class="cart-img"></td>

    <td data-label="Item"><%=item.getName()%></td>

    <td data-label="Price (₹)"><%=item.getPrice()%></td>

    <td data-label="Quantity">
        <form action="cart" method="post" style="display: inline;">
            <input type="hidden" name="restaurantId" value="<%=session.getAttribute("restaurantId")%>">
             <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
            <input type="hidden" name="quantity" value="<%=item.getQuantity() - 1%>">
            <input type="hidden" name="action" value="updateCart">
            <button class="qty-btn qty-minus">-</button>
        </form>

        <span class="qty-value"><%=item.getQuantity()%></span>

        <form action="cart" method="post" style="display: inline;">
            <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
            <input type="hidden" name="quantity" value="<%=item.getQuantity() + 1%>">
            <input type="hidden" name="restaurantId" value="<%=session.getAttribute("restaurantId")%>"> 
            <input type="hidden" name="action" value="updateCart">
            <button class="qty-btn qty-plus">+</button>
        </form>        
    </td>

    <td data-label="Subtotal (₹)"><%=itemTotal%></td>

    <td data-label="Action">
        <form action="cart" method="post">
            <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
            <input type="hidden" name="restaurantId" value="<%=session.getAttribute("restaurantId")%>"> 
            <input type="hidden" name="action" value="removeFromCart">
            <button class="remove-btn">Remove</button>
        </form>
    </td>
</tr>

<%
}
%>
    </tbody>

</table>

<div class="total-section">
    Total: ₹ <%=totalPrice%>
</div>

<div class="button-row">

	<a href="checkOut.jsp" class="checkout-btn">
		Proceed to Checkout	
	</a>
	
	<a href="menu?restaurantId=<%= session.getAttribute("restaurantId") %>" class="add-btn-secondary">
    	Add More Items
	</a>
	
	
</div>

</div>

</body>
</html>
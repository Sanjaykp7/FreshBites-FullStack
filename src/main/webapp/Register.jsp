<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Applying the specific Color Hunt palette: 
           https://colorhunt.co/palette/819a91a7c1a8d1d8beeeefe0 
        */
        .bg-theme-cream { background-color: #eeefe0; }
        .bg-theme-pale { background-color: #d1d8be; }
        .bg-theme-light-green { background-color: #a7c1a8; }
        .bg-theme-sage { background-color: #819a91; }
        .text-theme-sage { color: #819a91; }
        .border-theme-sage { border-color: #819a91; }
        
        .btn-primary {
            background-color: #819a91;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #6d857d; /* Slightly darker version of #819a91 for hover */
        }
        
        /* Glassmorphism effect for the card */
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        /* Style for the select element to match the input fields */
        select.form-select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='%236B7280'%3E%3Cpath fill-rule='evenodd' d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z' clip-rule='evenodd'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem; /* Make space for the arrow */
        }
    </style>
</head>
<body class="h-screen w-full relative overflow-hidden flex items-center justify-center">

    <!-- Background Video with Overlay -->
    <div class="absolute inset-0 z-0">
        <video autoplay muted loop playsinline class="w-full h-full object-cover">
            <source src="https://www.pexels.com/download/video/5861677/" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <!-- Dark overlay to make the registration card pop -->
        <div class="absolute inset-0 bg-black/40"></div>
    </div>

    <!-- Registration Card -->
    <!-- Added max-h-screen and overflow-y-auto for better mobile handling with many fields -->
    <div class="glass-card z-10 w-full max-w-md p-8 rounded-xl shadow-2xl m-4 relative border-t-4 border-[#819a91] max-h-[90vh] overflow-y-auto">
        
        <!-- Logo Section -->
        <div class="text-center mb-6">
            <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-theme-cream mb-4 text-theme-sage shadow-sm">
                <!-- Dummy Logo Icon -->
                <i class="fas fa-utensils text-3xl"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 tracking-tight">
                Fresh<span class="text-theme-sage">Bites</span>
            </h1>
            <p class="text-gray-500 text-sm mt-1">Join us today! Create your account.</p>
        </div>

        <!-- Registration Form -->
        <!-- For JSP: Update action to your servlet URL, e.g., action="RegisterServlet" -->
        <form action="UserRegister" method="POST" class="space-y-4">
            
            <!-- A. Name Field -->
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-user text-gray-400"></i>
                    </div>
                    <input type="text" 
                           id="name" 
                           name="name" 
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                           placeholder="Sanjay kp"
                           required>
                </div>
            </div>
            
            <!-- B. Email Field -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-envelope text-gray-400"></i>
                    </div>
                    <input type="email" 
                           id="email" 
                           name="email" 
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                           placeholder="you@example.com"
                           required>
                </div>
            </div>

            <!-- C. Password Field -->
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-lock text-gray-400"></i>
                    </div>
                    <input type="password" 
                           id="password" 
                           name="password" 
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                           placeholder="Strong password"
                           required>
                </div>
            </div>
            
            <!-- D. Phone Field -->
            <div>
                <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-phone text-gray-400"></i>
                    </div>
                    <input type="tel" 
                           id="phone" 
                           name="phone" 
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                           placeholder="(+91) 999-999-9999"
                           required>
                </div>
            </div>

            <!-- E. Address Field -->
            <div>
                <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-map-marker-alt text-gray-400"></i>
                    </div>
                    <input type="text" 
                           id="address" 
                           name="address" 
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                           placeholder="123 Main St, City, Zip"
                           required>
                </div>
            </div>

            <!-- F. Role Field (Dropdown) -->
            <div>
                <label for="role" class="block text-sm font-medium text-gray-700 mb-1">Role</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none z-10">
                        <i class="fas fa-briefcase text-gray-400"></i>
                    </div>
                    <select id="role" 
                            name="role" 
                            class="form-select block w-full pl-10 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                            required>
                        <option value="" disabled selected>Select your role</option>
                        <option value="customer">Customer</option>
                        <option value="vendor">Vendor</option>
                        <option value="driver">Driver/Delivery</option>
                    </select>
                </div>
            </div>

            <!-- Registration Button -->
            <button type="submit" 
                    class="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-bold text-white btn-primary focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#819a91] uppercase tracking-wider mt-6">
                Register
            </button>

        </form>

        <!-- Footer / Login Link -->
        <div class="mt-6 text-center">
            <p class="text-sm text-gray-600">
                Already have an account? 
                <a href="Login.jsp" class="font-bold text-[#819a91] hover:text-[#6d857d] transition-colors">
                    Login here
                </a>
            </p>
        </div>
    </div>

</body>
</html>
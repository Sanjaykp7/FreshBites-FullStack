<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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
    </style>
</head>
<body class="h-screen w-full relative overflow-hidden flex items-center justify-center">

    <!-- Background Video with Overlay -->
    <div class="absolute inset-0 z-0">
        <video autoplay muted loop playsinline class="w-full h-full object-cover">
            <source src="https://www.pexels.com/download/video/5703358/" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <!-- Dark overlay to make the login card pop -->
        <div class="absolute inset-0 bg-black/40"></div>
    </div>

    <!-- Login Card -->
    <div class="glass-card z-10 w-full max-w-md p-8 rounded-xl shadow-2xl m-4 relative border-t-4 border-[#819a91]">
        
        <!-- Logo Section -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-theme-cream mb-4 text-theme-sage shadow-sm">
                <!-- Dummy Logo Icon -->
                <i class="fas fa-utensils text-3xl"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 tracking-tight">
                Fresh<span class="text-theme-sage">Bites</span>
            </h1>
            <p class="text-gray-500 text-sm mt-1">Welcome back! Please login.</p>
        </div>

        <!-- Login Form -->
        <!-- For JSP: Update action to your servlet URL, e.g., action="LoginServlet" -->
        <form action="loginPage" method="POST" class="space-y-6">
            
            <!-- Username/Email Field -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i class="fas fa-user text-gray-400"></i>
                    </div>
                    <input type="text" 
                           id="email" 
                           name="email" 
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg bg-[#eeefe0] text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-[#819a91] focus:border-transparent transition duration-200" 
                           placeholder="Enter your email"
                           required>
                </div>
            </div>

            <!-- Password Field -->
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
                           placeholder="Enter your password"
                           required>
                </div>
                <div class="flex justify-end mt-1">
                    <a href="#" class="text-xs text-[#819a91] hover:text-[#6d857d] font-medium">Forgot Password?</a>
                </div>
            </div>

            <!-- Login Button -->
            <button type="submit" 
                    class="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-bold text-white btn-primary focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-[#819a91] uppercase tracking-wider">
                Login
            </button>

        </form>

        <!-- Footer / Register Link -->
        <div class="mt-8 text-center">
            <p class="text-sm text-gray-600">
                Don't have an account? 
                <a href="Register.jsp" class="font-bold text-[#819a91] hover:text-[#6d857d] transition-colors">
                    Register here
                </a>
            </p>
        </div>
    </div>

</body>
</html>
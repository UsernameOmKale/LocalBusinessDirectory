<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!-- Include SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-image: url("https://media.istockphoto.com/id/1202205418/photo/find-the-shortest-path-between-points-a-and-b.jpg?s=612x612&w=0&k=20&c=_0PSqcLbxAHx8eb_vFzDuKpKtlvZmxj1XbwZ61iwE0s=");
            background-size: cover;
            background-position: center;
            color: white;
        }
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            z-index: 1000;
            transition: background-color 0.8s;
        }
        header:hover {
            background-color: rgba(0, 0, 0, 0.9);
        }
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .nav-links {
            list-style: none;
            display: flex;
            gap: 10px;
        }
        .nav-links a {
            text-decoration: none;
            color: white;
            font-size: 1rem;
            padding: 10px 15px;
            border: 2px solid transparent;
            border-radius: 5px;
            transition: all 0.8s;
        }
        .nav-links a:hover {
            color: #ff9800;
            background-color: white;
            border-color: #ff9800;
            border: 2px solid #ff9800;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.8);
            min-width: 150px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
        }
        .dropdown-content a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .dropdown-content a:last-child {
            border-bottom: none;
        }
        .dropdown-content a:hover {
            background-color: rgba(255, 152, 0, 0.8);
            color: white;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .login-form {
            max-width: 350px; /* Reduced width */
            margin: 120px auto;
            padding: 30px;
            border-radius: 15px;
            background-color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            height: 400px;
        }
        .form-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-size: 1.2rem;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input {
            width: 90%;
            padding: 12px;
            font-size: 1rem;
            border: 2px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }
        .form-group input:focus {
            border-color: #4CAF50;
            outline: none;
        }
        .form-group button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(to right, #87ceeb, #1e3a8a);
            color: white;
            border: none;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background: linear-gradient(to left, #87ceeb, #1e3a8a);
        }
        .form-group p {
            text-align: center;
            color: #555;
        }
        .form-group p a {
            color: #4CAF50;
            text-decoration: none;
        }
        .form-group p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
                <h2>Local Business Directory</h2>
            </div>
            <ul class="nav-links">
                <li><a href="index">Home</a></li>
                <li><a href="UserSignUp">User Sign Up</a></li>
                <li><a href="UserSignIn">User Sign In</a></li>
                <li class="dropdown">
                    <a>Admin</a>
                    <div class="dropdown-content">
                        <a href="AdminSignUp">Sign Up</a>
                        <a href="AdminSignIn">Sign In</a>
                    </div>
                </li>
            </ul>
        </nav>
    </header>

    <div class="login-form">
        <h2 class="form-title">Forgot User Password</h2>
        <form action="FindUserAccount" method="GET">
            <!-- Username Input -->
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required="required" />
            </div>
            
            <!-- Email Input -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required="required"/>
            </div>

            <!-- Mobile Number Input -->
            <div class="form-group">
                <label for="mobile">Mobile No. </label>
                <input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number" required="required" />
            </div>

            <!-- Find Account Button -->
            <div class="form-group">
                <button type="submit">Find Account</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.0/dist/sweetalert2.min.js"></script>
<script>
    // Check if ${error} is not null or empty
    var errorMessage = "${error}";
    if (errorMessage && errorMessage.trim() !== "") {
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: errorMessage,
            confirmButtonText: 'OK'
        });
    }
</script>
    
</body>
</html>

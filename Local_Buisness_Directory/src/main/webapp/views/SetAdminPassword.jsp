<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-image: url("https://media.istockphoto.com/id/1202205418/photo/find-the-shortest-path-between-points-a-and-b.jpg?s=612x612&w=0&k=20&c=_0PSqcLbxAHx8eb_vFzDuKpKtlvZmxj1XbwZ61iwE0s="); /* Set background image */
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
        .registration-form {
            max-width: 350px; /* Reduced width */
            margin: 120px auto 20px;
            padding: 15px;
            border-radius: 10px;
            background-color: white; /* Semi-transparent background */
            backdrop-filter: blur(10px); /* Blur effect on the background */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            height: auto;
        }
        .form-title {
            text-align: center;
            font-size: 1.8rem; /* Smaller font size */
            margin-bottom: 15px;
            color: black;
        }
        .form-group {
            margin-bottom: 5px; /* Reduced margin */
        }
        .form-group label {
            font-size: 1rem; /* Smaller font size */
            display: block;
            margin-bottom: 5px;
            color: black;
        }
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 6px; /* Reduced padding */
            font-size: 0.9rem; /* Smaller font size */
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
            height: 80px; /* Reduced height */
        }
        .form-group input[type="radio"] {
            width: auto;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background: linear-gradient(to right, #87ceeb, #1e3a8a);
            color: white;
            border: none;
            font-size: 1rem; /* Slightly smaller font size */
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background: linear-gradient(to left, #87ceeb, #1e3a8a);
        }
        .form-group input[readonly] {
            background-color: #f0f0f0;
            cursor: not-allowed;
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

    <div class="registration-form">
        <h2 class="form-title">Set New Admin Password</h2>
        <form id="registrationForm" action="SetAdminNewPassword?aid=${Admin_model.aid}" onsubmit="return validateForm()" method="post">
            <div class="form-group">
                <label for="userId">Admin ID</label>
                <input type="text" id="userId" name="userId" value="${Admin_model.aid}" readonly>
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" value="${Admin_model.name}" readonly>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" value="${Admin_model.email}" readonly>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input type="text" id="mobile" name="mobile" value="${Admin_model.mobile}" readonly>
            </div>

            <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" id="password" name="password" required>
                <span id="passwordError" style="color: red;"></span>
            </div>

            <div class="form-group">
                <button type="submit">Forgot Password</button>
            </div>
        </form>
    </div>

   <script>
    // If sucmsg is not null, display the SweetAlert message
    var sucmsg = "${sucmsg}";
    if (sucmsg && sucmsg.trim() !== "") {
        Swal.fire({
            icon: 'success',
            title: 'Password Reset Successfully',
            text: sucmsg,
            confirmButtonText: 'OK'
        });
    }

    function validateForm() {
        var password = document.getElementById("password").value;
        var passwordError = document.getElementById("passwordError");

        // Check if password is at least 6 characters long
        if (password.length < 6) {
            passwordError.textContent = "Password must be at least 6 characters long.";
            return false; // Prevent form submission
        } else {
            passwordError.textContent = ""; // Clear any previous error messages
        }

        // Optionally, show a confirmation SweetAlert before submitting
        Swal.fire({
            icon: 'question',
            title: 'Are you sure?',
            text: 'Do you want to reset your password?',
            showCancelButton: true,
            confirmButtonText: 'Yes, reset it!',
            cancelButtonText: 'No, cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                // Allow form submission if the user confirms
                document.getElementById("registrationForm").submit();
            }
        });

        return false; // Prevent immediate form submission
    }
</script>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
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
            font-size: 2rem; /* Smaller font size */
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
            color: black; /* Set label color to black */
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
            height: 35px; /* Reduced height */
        }
        .form-group input[type="radio"] {
            width: auto;
            color: black;
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
        
        .payment-section {
            margin-bottom: 20px;
            text-align: center;
        }
        .payment-section input {
            padding: 6px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .payment-section button {
            padding: 10px;
            background: linear-gradient(to right, #87ceeb, #1e3a8a);
            color: white;
            border: none;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .payment-section button:hover {
            background: linear-gradient(to left, #87ceeb, #1e3a8a);
        }

        /* Initially hide the Register button */
        #registerButton {
            display: none;
        }

        /* Update radio button labels to be black */
        .form-group label[for="male"], .form-group label[for="female"] {
            color: black; /* Change label color to black */
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
        <h2 class="form-title">Admin Registration</h2>
        <form id="adminRegistrationForm" onsubmit="return validateAdminForm()" action="AdminSaveData" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" required></textarea>
            </div>

            <div class="form-group">
                <label for="city">City</label>
                <select id="city" name="city" required>
                    <option>Select</option>
                    <option value="Amravati">Amravati</option>
                    <option value="Achalpur">Achalpur</option>
                    <option value="Chandur Bazar">Chandur Bazar</option>
                    <option value="Morshi">Morshi</option>
                    <option value="Warud">Warud</option>
                    <option value="Dhamangaon">Dhamangaon</option>
                    <option value="Melghat">Melghat</option>
                </select>
            </div>

            <div class="form-group">
                <label for="businessName">Business Name</label>
                <select id="businessName" name="businessName" required>
                    <option value="Other">Select</option>
                    <option value="Plumber">Plumber</option>
                    <option value="Electrician">Electrician</option>
                    <option value="Carpenter">Carpenter</option>
                    <option value="Painter">Painter</option>
                    <option value="Mechanic">Mechanic</option>
                    <option value="AC Repair">AC Repair</option>
                    <option value="Cleaner">Cleaner</option>
                     <option value="Other">Other</option>
                </select>
            </div>
            
             <div class="form-group">
                <label for="otherBusiness">Other Business Name</label>
                <input type="text" id="otherusiness" name="otherBusiness" value="NA" required>
            </div>

            <div class="form-group">
                <label for="gender">Gender</label>
                <div style="color: black">
                    <input type="radio" id="male" name="gender" value="Male" required> Male
                    <input type="radio" id="female" name="gender" value="Female" required> Female
                </div>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <!-- Payment section -->
            <div class="payment-section">
                <label for="paymentAmount">Payment Amount: ₹</label>
                <input type="number" id="paymentAmount" name="paymentAmount" value="2000" readonly>
                <br>
                <button type="button" id="payNowBtn" onclick="onPayNowClick()">Pay Now</button>
            </div>

            <!-- Register button hidden initially -->
            <div class="form-group">
                <button type="submit" id="registerButton">Register</button>
            </div>
        </form>
    </div>

<script>
    // Handle Pay Now button click
    function onPayNowClick() {
        // Validate the form before proceeding
        if (!validateAdminForm()) {
            return; // Prevent further action if form is invalid
        }

        // Hide the Pay Now button
        document.getElementById('payNowBtn').style.display = 'none';
        
        // Show the Register button
        document.getElementById('registerButton').style.display = 'block';

        // Show a success message with SweetAlert for Payment
        Swal.fire({
            icon: 'success',
            title: 'Payment Successful!',
            text: 'You can now proceed with the registration.',
            confirmButtonText: 'OK',
            allowOutsideClick: false,  // Prevent clicking outside to close the alert
            allowEscapeKey: false     // Disable closing the alert with escape key
        });
    }

    // Validation function for the form
    function validateAdminForm() {
        var errors = [];
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var mobile = document.getElementById("mobile").value;
        var address = document.getElementById("address").value;
        var city = document.getElementById("city").value;
        var businessName = document.getElementById("businessName").value;
        var gender = document.querySelector('input[name="gender"]:checked');
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        // Collect errors
        if (name == "") errors.push("Full Name is required.");
        if (email == "") errors.push("Email Address is required.");
        if (mobile == "") errors.push("Mobile Number is required.");
        if (address == "") errors.push("Address is required.");
        if (businessName == "") errors.push("Business Name is required.");
        if (!gender) errors.push("Gender is required.");
        if (username == "") errors.push("Username is required.");
        if (password == "") errors.push("Password is required.");

        // Validate email format
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (email && !emailPattern.test(email)) errors.push("Please enter a valid email address.");

        // Validate mobile number format
        var mobilePattern = /^[0-9]{10}$/;
        if (mobile && !mobilePattern.test(mobile)) errors.push("Please enter a valid 10-digit mobile number.");

        // Validate password length
        if (password && password.length < 6) errors.push("Password must be at least 6 characters long.");

        // If there are any errors, show them at once
        if (errors.length > 0) {
            alert(errors.join("\n"));
            return false; // Prevent further action if form is invalid
        }

        // If validation passes, allow payment to proceed
        return true;
    }

 // Handle Register button click (when the user clicks the Register button after the payment is done)
    document.getElementById("registerButton").addEventListener("click", async function(event) {
        // Prevent form submission initially
        event.preventDefault();

        // Show success message before submitting the form
        const result = await Swal.fire({
            icon: 'success',
            title: 'Registration Successful!',
            text: 'Your admin account has been created successfully.',
            confirmButtonText: 'OK',
            allowOutsideClick: false,  // Prevent clicking outside to close the alert
            allowEscapeKey: false     // Disable closing the alert with escape key
        });

        // Wait for the "OK" button to be clicked before submitting the form
        if (result.isConfirmed) {
            // Submit the form after user clicks "OK"
            document.getElementById("adminRegistrationForm").submit();
        }
    });
</script>
</body>
</html>

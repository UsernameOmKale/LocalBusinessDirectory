<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            background-image: url('https://memberpress.com/wp-content/uploads/2023/12/MP-How-to-Create-a-Business-Directory-1024x576.jpg'); /* Add your background image here */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        /* Header */
        header {
            background-color: rgba(51, 51, 51, 0.8); /* semi-transparent background */
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between; /* Align username to the left and nav to the right */
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
        }

        header .username {
            font-size: 1.2rem;
            font-weight: normal;
        }

        header nav {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        header nav a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s, transform 0.3s;
        }

        header nav a:hover {
            background-color: #575757;
            transform: scale(1.1); /* Add scale effect on hover */
        }

        /* Main Content */
        .main-content {
            margin-top: 100px; /* Adjust for fixed header */
            padding: 20px;
            text-align: center;
            color: white;
            z-index: 10;
        }

        .main-content h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4); /* Add text shadow for better visibility */
        }

        /* Form Container */
        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            width: 60%;
            margin: 0 auto;
            text-align: left;
        }

        .form-container label {
            font-size: 1.1rem;
            margin-bottom: 10px;
            display: block;
            color: #333;
        }

        .form-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .go-back-button {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s, transform 0.3s;
            margin-top: 20px;
        }

        .go-back-button:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div class="username">Welcome, ${User_model.name}</div> <!-- Username placed here -->
        <nav>
            <a href="UserHome?id=${User_model.id}">Home</a>
            <a href="UserProfile?id=${User_model.id}">My Profile</a>
            <a href="GetAllAdminData?id=${User_model.id}">Business Directory</a>
            <a href="StoredList?id=${User_model.id}">Stored Details</a>
            <a href="LogOut" style="background-color: #e74c3c;">Logout</a>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Information Of ${Admin_model.name}</h1> <!-- Heading changed to include business name -->

        <!-- Form -->
        <div class="form-container">
            <form>
                <label for="id">ID</label>
                <input type="text" id="aid" value="${Admin_model.aid}" readonly="readonly" required>

                <label for="businessname">Business Name</label>
                <input type="text" id="businessname" value="${Admin_model.businessName}" readonly="readonly" required>
                
                 <label for="otherBusiness">Other Business Name</label>
                <input type="text" id="otherBusiness" value="${Admin_model.otherBusiness}" readonly="readonly" required>

                <label for="name">Name</label>
                <input type="text" id="name" value="${Admin_model.name}" readonly="readonly" required>

                <label for="email">Email</label>
                <input type="email" id="email" value="${Admin_model.email}" readonly="readonly" required>

                <label for="mobile">Mobile</label>
                <input type="text" id="mobile" value="${Admin_model.mobile}" readonly="readonly" required>

                <label for="city">City</label>
                <input type="text" id="city" value="${Admin_model.city}" readonly="readonly" required>

                <label for="address">Address</label>
                <input type="text" id="address" value="${Admin_model.address}" readonly="readonly" required>
            </form>
        </div>

        <!-- Go Back Button -->
        <a href="StoredList?id=${User_model.id}"><button class="go-back-button">Go Back</button></a>
    </div>

</body>
</html>

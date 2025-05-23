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

        /* New Content Layout */
        .section-new {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px;
            margin-top: 100px;
            flex-wrap: wrap;
            padding: 20px;
        }

        .section-new .card {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            flex: 1;
            max-width: 45%;
            text-align: left;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .section-new .card:hover {
            transform: translateY(-10px); /* Hover effect to lift the card */
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
        }

        .section-new .card h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #333;
        }

        .section-new .card p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 15px;
        }

        .section-new .card button {
            background-color: #e74c3c;
            border-radius: 5px;
            padding: 12px 20px;
            color: white;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s, transform 0.3s;
        }

        .section-new .card button:hover {
            background-color: #c0392b;
            transform: scale(1.05); /* Button hover effect */
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
        <h1>Welcome  ${User_model.name} on Your Dashboard</h1>

        <div class="section-new">
            <div class="card">
                <h3>Your Profile</h3>
                <p> your personal information profile details.</p>
                <a href="UserProfile?id=${User_model.id}"><button>View Profile</button></a>
            </div>
            <div class="card">
                <h3>Business Directory</h3>
                <p>Explore businesses in your area, their offerings, and contact details.</p>
                <a href="GetAllAdminData?id=${User_model.id}"><button>View Directory</button></a>
            </div>
        </div>
    </div>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
            background-image: url('https://memberpress.com/wp-content/uploads/2023/12/MP-How-to-Create-a-Business-Directory-1024x576.jpg');
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
            justify-content: space-between;
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
            margin-top: 100px;
            padding: 20px;
            text-align: center;
            color: white;
            z-index: 10;
        }

        .main-content h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
        }

        /* Dashboard Overview Cards */
        .dashboard-cards {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            flex: 1;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-10px); /* Hover effect to lift the card */
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
        }

        .card h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #333;
        }

        .card p {
            font-size: 1.2rem;
            color: #555;
        }

        .card button {
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .card button:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        /* Notifications */
        .notifications {
            margin-top: 30px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: 0 auto;
            text-align: left;
        }

        .notification-item {
            margin-bottom: 15px;
        }

        .notification-item h4 {
            font-size: 1.1rem;
            color: #333;
        }

        .notification-item p {
            font-size: 1rem;
            color: #555;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div class="username">Welcome, ADMIN ${Admin_model.name}</div>
        <nav>
            <a href="AdminHome?aid=${Admin_model.aid}">Dashboard</a>
            <a href="SearchAndResponse?aid=${Admin_model.aid}">Search & Response</a>
            <a href="AdminProfile?aid=${Admin_model.aid}">Profile</a>
            <a href="AdminLeads?aid=${Admin_model.aid}">Leads</a>
            <a href="LogOut2" style="background-color: #e74c3c;">Logout</a>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="main-content">
        <h1>View Your Searches And Responses</h1>

        <!-- Dashboard Overview -->
        <div class="dashboard-cards">
            <div class="card">
                <h3>Total Existing Leads</h3>
                <p id="total-searches">${search_count}</p> <!-- Dynamically set the number of searches -->
            </div>
            <div class="card">
                <h3>Total Responses</h3>
                <p id="total-responses">${response_count}</p> <!-- Dynamically set the number of responses -->
            </div>
        </div>
    </div>

</body>
</html>

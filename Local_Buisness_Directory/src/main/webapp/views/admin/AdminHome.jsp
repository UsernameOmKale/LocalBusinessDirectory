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

        /* Static Information Section */
        .static-info {
            margin-top: 30px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            margin: 0 auto;
            text-align: left;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        /* 3D Hover Effect */
        .static-info:hover {
            transform: translateY(-10px) rotateY(10deg); /* 3D effect */
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
        }

        .static-info h3 {
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: #333;
        }

        .static-info p {
            font-size: 1.2rem;
            color: #555;
            line-height: 1.6;
        }

        .static-info ul {
            margin-top: 15px;
            list-style-type: disc;
            padding-left: 20px;
              
        }

        .static-info ul li {
            margin-bottom: 10px;
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
        <h1>Admin ${Admin_model.name}, welcome to your Dashboard</h1>

        <!-- Static Information about Local Business Directory -->
       <div class="static-info">
    <h3>Welcome to the Admin Panel</h3>
    <p>As the Admin, you manage the directory, approve business listings, and ensure everything is up-to-date.</p>

    <p>Key responsibilities:</p>
    <ul>
        <li>Approve Business Listings</li>
        <li>Manage Leads and Responses</li>
        <li>Ensure Accurate Business Information</li>
    </ul>
</div>

    </div>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>

    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
            background-color: rgba(51, 51, 51, 0.8);
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
            transform: scale(1.1);
        }

        /* Profile Content */
        .profile-content {
            margin-top: 100px;
            padding: 20px;
            color: white;
        }

        .profile-content h1 {
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-align: center;
        }

        /* Profile Layout */
        .profile-layout {
            display: flex;
            justify-content: space-between;
            gap: 30px;
            flex-wrap: wrap;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .profile-layout .column {
            flex: 1;
            min-width: 250px;
            display: flex;
            flex-direction: column;
        }

        .profile-layout .column label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: black;
        }

        .profile-layout .column input {
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .button-container button {
            width: 200px;
            height: 50px;
            background-color: #3498db;
            color: white;
            border-radius: 8px;
            border: none;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
        }

        .button-container button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div class="username">Welcome, ${User_model.name}</div>
        <nav>
            <a href="UserHome?id=${User_model.id}">Home</a>
            <a href="UserProfile?id=${User_model.id}">My Profile</a>
            <a href="GetAllAdminData?id=${User_model.id}">Business Directory</a>
            <a href="StoredList?id=${User_model.id}">Stored Details</a>
            <a href="LogOut" style="background-color: #e74c3c;">Logout</a>
        </nav>
    </header>

    <!-- Profile Content -->
    <div class="profile-content">
        <h1>User Profile</h1>

        <!-- Profile Layout (2-column format) -->
        <form action="UpdateUserProfile?id=${User_model.id}" method="POST">
            <div class="profile-layout">
                <!-- Left Column -->
                <div class="column">
                    <label for="user-id">User ID:</label>
                    <input type="text" id="user-id" name="id" value="${User_model.id}" disabled>

                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${User_model.name}">

                    <label for="mobile-no">Mobile No:</label>
                    <input type="text" id="mobile-no" name="mobile" value="${User_model.mobile}">

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${User_model.email}">
                </div>

                <!-- Right Column -->
                <div class="column">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${User_model.address}">

                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" value="${User_model.gender}">

                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${User_model.username}">

                    <label for="password">Password:</label>
                    <input type="text" id="password" name="password" value="${User_model.password}">
                </div>
            </div>
    <br>        
            <!-- Button Container -->
            <div class="button-container">
                <button type="submit">Update</button>
            </div>
        </form>

        <!-- Success message -->
        ${sucmsg}
    </div>

    <!-- SweetAlert JavaScript -->
    <script>
        window.onload = function() {
            var successMessage = "${sucmsg}".trim();
            if (successMessage !== "") {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: successMessage,
                    confirmButtonText: 'OK'
                });
            }
        };
    </script>

</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
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

        .profile-layout .column p {
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .profile-layout .column input,
        .profile-layout .column select {
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .profile-layout .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .profile-layout .button-container button {
            padding: 12px 25px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .profile-layout .button-container button:hover {
            background-color: #c0392b;
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

    /* Hover effect */
    .button-container button:hover {
        background-color: blue; 
    }
    </style>

    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

    <!-- Profile Content -->
    <div class="profile-content">
        <h1>Admin Profile</h1>

        <!-- Form action updated to handle POST request -->
        <form action="UpdateAdminProfile?${Admin_model.aid}" method="post"> <!-- Ensure this is the correct URL for your controller -->

        <!-- Profile Layout (2-column format) -->
        <div class="profile-layout">
            <!-- Left Column -->
            <div class="column">
                <label for="aid">Admin ID:</label>
                <input type="text" id="aid" name="aid" value="${Admin_model.aid}" readonly>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${Admin_model.name}">

                <label for="mobile">Mobile No:</label>
                <input type="text" id="mobile" name="mobile" value="${Admin_model.mobile}">

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${Admin_model.email}">
                
                <label for="gender">Gender:</label>
                <input type="text" id="gender" name="gender" value="${Admin_model.gender}">
                
            </div>

            <!-- Right Column -->
            <div class="column">
                <label for="city">City:</label>
                <select id="city" name="city" required>
                    <option value="">Select</option>
                    <option value="Amravati" ${Admin_model.city == "Amravati" ? 'selected' : ''}>Amravati</option>
                    <option value="Achalpur" ${Admin_model.city == "Achalpur" ? 'selected' : ''}>Achalpur</option>
                    <option value="Chandur Bazar" ${Admin_model.city == "Chandur Bazar" ? 'selected' : ''}>Chandur Bazar</option>
                    <option value="Morshi" ${Admin_model.city == "Morshi" ? 'selected' : ''}>Morshi</option>
                    <option value="Warud" ${Admin_model.city == "Warud" ? 'selected' : ''}>Warud</option>
                    <option value="Dhamangaon" ${Admin_model.city == "Dhamangaon" ? 'selected' : ''}>Dhamangaon</option>
                    <option value="Melghat" ${Admin_model.city == "Melghat" ? 'selected' : ''}>Melghat</option>
                </select>

                <label for="businessName">Business Name:</label>
                <select id="businessName" name="businessName" required>
                    <option value="Other">Select</option>
                    <option value="Plumber" ${Admin_model.businessName == "Plumber" ? 'selected' : ''}>Plumber</option>
                    <option value="Electrician" ${Admin_model.businessName == "Electrician" ? 'selected' : ''}>Electrician</option>
                    <option value="Carpenter" ${Admin_model.businessName == "Carpenter" ? 'selected' : ''}>Carpenter</option>
                    <option value="Painter" ${Admin_model.businessName == "Painter" ? 'selected' : ''}>Painter</option>
                    <option value="Mechanic" ${Admin_model.businessName == "Mechanic" ? 'selected' : ''}>Mechanic</option>
                    <option value="AC Repair" ${Admin_model.businessName == "AC Repair" ? 'selected' : ''}>AC Repair</option>
                    <option value="Cleaner" ${Admin_model.businessName == "Cleaner" ? 'selected' : ''}>Cleaner</option>
                    <option value="Other" ${Admin_model.businessName == "Other" ? 'selected' : ''}>Other</option>
                </select>
                
                 <label for="otherBusiness">Other Business:</label>
                <input type="text" id="otherBusiness" name="otherBusiness" value="${Admin_model.otherBusiness}">
                

                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="${Admin_model.address}">

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${Admin_model.username}">

                <label for="password">Password:</label>
                <input type="text" id="password" name="password" value="${Admin_model.password}">
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

    <script>
        // Check if the success message exists
        const successMessage = "${sucmsg}";
        if (successMessage) {
            // Show SweetAlert with the success message
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: successMessage,
                confirmButtonText: 'OK'
            });
        }
    </script>

</body>
</html>
<%@ page import="com.example.Local_Buisness_Directory.Entity.LikeEntity" %>
<%@ page import="java.util.List" %>
<!-- Include SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
            height: 500px;
            overflow-y: auto; /* Corrected this line */
        }


        .main-content h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
        }

        /* Notifications */
        .notifications {
            margin-top: 20px;
            padding: 8px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            margin: 0 auto;
            text-align: left;
        }

        .notification-item {
            margin-bottom: 3px;
            display: flex;
            justify-content: space-between; /* Align the columns with space between */
            align-items: flex-start; /* Align items to the top */
        }

        .notification-item h4 {
            font-size: 1.2rem;
            color: #333;
        }

        .notification-item p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 10px;
        }

        .notification-item .details {
            display: flex;
            gap: 40px;
            justify-content: flex-start;
            flex: 2;
        }

        .notification-item .details .column {
            display: flex;
            flex-direction: column;
        }

        /* Left and Middle Columns */
        .notification-item .details .column p {
            text-align: left;
        }

        .notification-item .buttons {
            display: flex;
            flex-direction: column; /* Stack buttons in a column */
            gap: 4px;
            align-items: flex; /* Align buttons to the right */
            margin-right: 40px;
        }

        .notification-item button {
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 3px 8px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .notification-item button:hover {
            background-color: #2980b9;
        }

        .notification-item button.delete {
            background-color: #e74c3c;
        }

        .notification-item button.delete:hover {
            background-color: #c0392b;
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
    <%
        // Get the list from the request attribute
        List<LikeEntity> LikeList = (List<LikeEntity>) request.getAttribute("LikeList");
        
        // Check if the list is not null and has data
        if (LikeList != null && !LikeList.isEmpty()) {  // Initialize serial number
            for (LikeEntity List : LikeList) {
    %>
    <!-- Notifications -->
    <div class="notifications">
        <div class="notification-item">
        
            <!-- Left and Middle Columns (User ID, Name, Email in left and Mobile, Address, Gender in middle) -->
            <div class="details">
                <div class="column">
                    <p><strong>User ID:</strong><%= List.getUser().getId() %></p>
                    <p><strong>Name:</strong> <%= List.getUser().getName() %></p>
                    <p><strong>Email:</strong> <%= List.getUser().getEmail() %></p>
                </div>

                <div class="column">
                    <p><strong>Mobile No:</strong><%= List.getUser().getMobile() %></p>
                    <p><strong>Address:</strong><%= List.getUser().getAddress() %></p>
                    <p><strong>Gender:</strong><%= List.getUser().getGender() %></p>
                </div>
            </div>

            <!-- Buttons Column (Response, Delete, View aligned to the right) -->
            <div class="buttons">
                <a href="response?aid=<%= List.getAdmin().getAid()%>&id=<%= List.getUser().getId()%>"><button class="response">Response</button></a>
                <a href="DeleteLike?likeId=<%= List.getLikeId()%>&aid=<%= List.getAdmin().getAid()%>"><button class="delete">Remove</button></a>
            </div>
            <div class="column">
                <p><strong><%= List.getUser().getName() %></strong></p>
                <p>Liked your Posted Business...!!</p>
            </div>
        </div>
    </div>
    <br>
    <% 
            }
        } else {
    %>
        <tr>
            <td colspan="6">No data available.</td>
        </tr>
    <% 
        }
    %>
                
    </div>
${ResponseExist}
${ResponseSaved}
    <!-- SweetAlert Script -->
    <%
    String ResponseExist = (String) request.getAttribute("reponseExist");
    String ResponseSaved = (String) request.getAttribute("responseSave");

        // Check if ResponseExist is not null, and show SweetAlert
        if (ResponseExist != null) {
    %>
        <script>
            Swal.fire({
                icon: 'warning',
                title: 'You have already responded to this customer',
                showConfirmButton: true,
                timer: 5000
            });
        </script>
    <%
        }
        // Check if ResponseSaved is not null, and show SweetAlert
        if (ResponseSaved != null) {
    %>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Your response has been submitted successfully',
                showConfirmButton: true,
                timer: 5000
            });
        </script>
    <%
        }
    %>

</body>
</html>

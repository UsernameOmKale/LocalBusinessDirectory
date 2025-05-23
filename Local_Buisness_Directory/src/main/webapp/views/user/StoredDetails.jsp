<%@ page import="com.example.Local_Buisness_Directory.Entity.AdminUserMappingEntity" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <!-- SweetAlert2 CDN -->
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

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
        }

        table th {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            background-color: #333;
            color: white;
        }

        table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: black;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Table Scroll */
        .table-container {
            max-height: 350px;
            overflow-y: auto;
        }

        /* Button styling */
        .btn {
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            margin-right: 10px;
        }

        .btn-like {
            background-color: #3498db;
            color: white;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        /* Disabled Button Styling */
        .btn-like.disabled {
            background-color: #bdc3c7;
            cursor: not-allowed;
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

    <!-- Main Content -->
    <div class="main-content">
        <h1>Stored Business Directory Details</h1>

        <!-- Table Section with Scrollable Container -->
        <div class="table-container">
            <table id="business-table">
                <thead>
                    <tr>
                        <th>SRNO</th>
                        <th>Business Name</th>
                        <th>Other Business</th>
                        <th>Mobile No</th>
                        <th>City</th>
                        <th>Address</th>
                        <th>Action</th> <!-- New Action Column -->
                    </tr>
                </thead>
                <tbody>
					    <% 
					        // Get the list from the request attribute
					        List<AdminUserMappingEntity> storedAdminList = (List<AdminUserMappingEntity>) request.getAttribute("StoredList");
					        
					        // Check if the list is not null and has data
					        if (storedAdminList != null && !storedAdminList.isEmpty()) {
					            int srno = 1;  // Initialize serial number
					            for (AdminUserMappingEntity admin : storedAdminList) {
					    %>
					  <tr>
							    <!-- Serial number -->
							    <td><%= srno++ %></td>
							
							    <!-- Admin Name with null check -->
							    <td><%= admin.getAdmin() != null ? admin.getAdmin().getBusinessName() : "" %></td>
							    
							    <td><%= admin.getAdmin() != null ? admin.getAdmin().getOtherBusiness() : "" %></td>
							
							    <!-- Admin Mobile with null check -->
							    <td><%= admin.getAdmin() != null ? admin.getAdmin().getMobile() : "" %></td>
							
							    <!-- Admin City with null check -->
							    <td><%= admin.getAdmin() != null ? admin.getAdmin().getCity() : "" %></td>
							
							    <!-- Admin Address with null check -->
							    <td><%= admin.getAdmin() != null ? admin.getAdmin().getAddress() : "" %></td>
							
							    <!-- Action Buttons (View and Delete) -->
							    <td>
							        <a href="viewDetails2?aid=<%= admin.getAdmin().getAid() %>&id=<%= admin.getUser().getId() %>"class="btn btn-like">View</a>
							        <!-- Delete Button -->
							        <a href="DeleteStore?mappingId=<%= admin.getMappingId() %>&id=<%= admin.getUser().getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this business Record ?')">Remove</a>
							    </td>
					 </tr>

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
             </tbody>

            </table>
        </div>
    </div>
</body>
</html>

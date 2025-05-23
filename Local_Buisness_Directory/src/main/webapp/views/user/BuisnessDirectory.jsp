<%@ page import="com.example.Local_Buisness_Directory.Entity.AdminEntity" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Business Directory</title>
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

        /* Search Section */
        .search-section {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .search-section select,
        .search-section input {
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 150px;
        }

        .search-section button {
            padding: 10px 20px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }

        .search-section button:hover {
            background-color: #c0392b;
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
        <h1>Business Directory</h1>

        <!-- Search Section -->
        <div class="search-section">
            <!-- City Dropdown -->
            <div class="form-group">
                <label for="city">City</label>
                <select id="city" name="city" required>
                    <option value="">Select</option>
                    <option value="Amravati">Amravati</option>
                    <option value="Achalpur">Achalpur</option>
                    <option value="Chandur Bazar">Chandur Bazar</option>
                    <option value="Morshi">Morshi</option>
                    <option value="Warud">Warud</option>
                    <option value="Dhamangaon">Dhamangaon</option>
                    <option value="Melghat">Melghat</option>
                </select>
            </div>

            <!-- Business Name Dropdown -->
            <div class="form-group">
                <label for="businessName">Business Name</label>
                <select id="businessName" name="businessName" required>
                    <option value="">Select</option>
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
                <label for="otherBusiness">Other Business</label>
                <input type="text" id="otherBusiness" name="otherBusiness" placeholder="Search by Other">
            </div>

            <!-- Address Input Field -->
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Search by Address">
            </div>

            <!-- Search Button -->
            <button onclick="searchTable()">Search</button>
        </div>

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
                        List<AdminEntity> adminList = (List<AdminEntity>) request.getAttribute("Admin_model"); 
                        if (adminList != null) {
                            int srno = 1;
                            for (AdminEntity admin : adminList) {
                    %>
                    <tr>
                        <td><%= srno++ %></td>
                        <td><%= admin.getBusinessName() %></td>
                        <td><%= admin.getOtherBusiness() %></td>
                        <td><%= admin.getMobile() %></td>
                        <td><%= admin.getCity() %></td>
                        <td><%= admin.getAddress() %></td>
                        <td>
                            <a href="viewBusinessDetails?aid=<%= admin.getAid() %>&id=${User_model.id}" class="btn btn-like">View</a> <!-- View Button as a Link -->
                            <a href="like?aid=<%= admin.getAid() %>&id=${User_model.id}"><button class="btn btn-like">Like</button></a>
                            <a href="store?aid=<%= admin.getAid() %>&id=${User_model.id}" class="btn btn-like">Store</a> 
                        </td>
                    </tr>
                    <% 
                            }
                        }
                    %>
                    <!-- No data message row -->
                    <tr id="no-data-message" style="display: none;">
                        <td colspan="7" style="text-align: center; color: red;">Data not found</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Display SweetAlert if dataExist is not null -->
    <%
        String dataExist = (String) request.getAttribute("dataExist");
        if (dataExist != null && !dataExist.isEmpty()) {
    %>
        <script>
            Swal.fire({
                title: 'Oops!',
                text: 'This data is already stored in your stored list.',
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        </script>
    <%
        }
    %>

    <!-- Display SweetAlert if dataSave is not null -->
    <%
        String StoreSave = (String) request.getAttribute("dataSaved");
        if (StoreSave != null && !StoreSave.isEmpty()) {
    %>
        <script>
            Swal.fire({
                title: 'Success',
                text: 'This Contact stored in your stored list.',
                icon: 'success',
                confirmButtonText: 'OK'
            });
        </script>
    <%
        }
    %>

    <!-- Display SweetAlert if likeDataExist is not null -->
    <%
        String likeDataExist = (String) request.getAttribute("likeDataExist");
        if (likeDataExist != null && !likeDataExist.isEmpty()) {
    %>
        <script>
            Swal.fire({
                title: 'Oops!',
                text: 'You already liked this post.',
                icon: 'warning',
                confirmButtonText: 'OK'
            });
        </script>
    <%
        }
    %>

    <!-- Display SweetAlert if dataSaved is not null -->
    <%
        String dataSaved = (String) request.getAttribute("likeSave");
        if (dataSaved != null && !dataSaved.isEmpty()) {
    %>
        <script>
            Swal.fire({
                title: 'Success',
                text: 'You liked this post.',
                icon: 'success',
                confirmButtonText: 'OK'
            });
        </script>
    <%
        }
    %>

    <!-- JavaScript for Table Search -->
    <script>
    function searchTable() {
        let businessName = document.getElementById("businessName").value.toLowerCase();
        let city = document.getElementById("city").value.toLowerCase();
        let otherBusiness = document.getElementById("otherBusiness").value.toLowerCase();
        let address = document.getElementById("address").value.toLowerCase();
        let table = document.getElementById("business-table");
        let rows = table.getElementsByTagName("tr");
        let noDataMessage = document.getElementById("no-data-message");
        let isDataFound = false;

        for (let i = 1; i < rows.length; i++) { // Start from i=1 to skip the header row
            let cells = rows[i].getElementsByTagName("td");
            
            let businessCell = cells[1].textContent.toLowerCase();
            let otherBusinessCell = cells[2].textContent.toLowerCase(); // Other Business column
            let cityCell = cells[4].textContent.toLowerCase();    // City column
            let addressCell = cells[5].textContent.toLowerCase(); // Address column

            let isBusinessMatch = (businessName === "" || businessCell.includes(businessName));
            let isOtherBusinessMatch = (otherBusiness === "" || otherBusinessCell.includes(otherBusiness));
            let isCityMatch = (city === "" || cityCell.includes(city));
            let isAddressMatch = (address === "" || addressCell.includes(address));

            if (isBusinessMatch && isOtherBusinessMatch && isCityMatch && isAddressMatch) {
                rows[i].style.display = "";
                isDataFound = true;
            } else {
                rows[i].style.display = "none";
            }
        }

        // Display "Data not found" message if no data matches
        if (!isDataFound) {
            noDataMessage.style.display = "table-row"; 
        } else {
            noDataMessage.style.display = "none"; 
        }
    }
    </script>

</body>
</html>

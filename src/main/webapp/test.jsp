<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Leave Form</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            /* Light background */
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Header Styling */
        .header {
            display: flex;
            justify-content: space-around;
            align-items: center;
            background-color: #6a0dad;
            /* Purple */
            color: #ffffff;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            /* Ensures the header is on top */
        }

        .header a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
            padding: 8px 15px;
            transition: background-color 0.3s ease;
        }

        .header a:hover {
            background-color: #32cd32;
            /* Green */
            border-radius: 4px;
        }

        /* Page Content Container */
        .content {
            margin-top: 80px;
            /* Space for the fixed header */
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        /* Form Container */
        .form-container {
            background-color: #ffffff;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        /* Form Styling */
        .leave-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .leave-form label {
            text-align: left;
            font-weight: bold;
            color: #6a0dad;
        }

        .leave-form input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 2px solid #6a0dad;
            border-radius: 4px;
            transition: border-color 0.3s ease;
        }

        .leave-form input[type="text"]:focus {
            border-color: #32cd32;
            /* Green */
            outline: none;
        }

        .leave-form input[type="submit"] {
            background-color: #6a0dad;
            color: #ffffff;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .leave-form input[type="submit"]:hover {
            background-color: #32cd32;
            /* Green */
        }

        /* Table Styling */
        .table-container {
            width: 100%;
            max-width: 800px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        /* Message Styling */
        .message {
            margin-top: 20px;
            font-size: 14px;
            color: #333333;
        }

        /* Responsive Design */
        @media (max-width: 600px) {

            .form-container,
            .table-container {
                width: 90%;
                padding: 15px;
            }
        }
    </style>
</head>

<body>
    <!-- Header -->
    <div class="header">
        <a href="admindashboard.jsp">Home</a>
        <a href="applyleave">Assign Leave</a>
        <a href="manage_leave.html">Manage Leave</a>
        <a href="user_profile.html">User Profile</a>
        <a href="logout.html" class="logout-btn">Logout</a>
    </div>

    <!-- Page Content -->
    <div class="content">
        <!-- Form Section -->
        <div class="form-container">
            <form action="add_leave" method="post" class="leave-form">
                <label for="leave_name">Leave Name:</label>
                <input type="text" id="leave_name" name="leave_name" required />
                <input type="submit" value="Submit" />
            </form>
            <div class="message">${SMS}</div>
        </div>

        <!-- Table Section -->
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="leave" items="${leave_master}">
                        <tr>
                            <td>${leave.leave_id}</td>
                            <td>${leave.leave_name}</td>
                            <td>
                                <form method="post" action="/manageleave">
                                    <input type="hidden" name="leave_id" value="${leave.leave_id}" />
                                    <input type="submit" name="btn" value="Edit" class="edit-btn">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Update Form Section -->
        <form method="post" action="updateleave" class="form-container">
            <label for="leave_name">Type:</label>
            <input type="text" name="leave_name" value="${leave_master[0].leave_name}" />
            <input type="hidden" name="leave_id" value="${leave_master[0].leave_id}" />
            <input type="submit" name="btn" value="Update" />
        </form>

        <!-- Additional Message -->
        <div class="message">${sms}</div>
    </div>
</body>

</html>
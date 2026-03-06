<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Leave</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@400;700&display=swap">
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Sofia', sans-serif;
            line-height: 1.6;
            color: #000000;
            background-color: #f9f9f9;
            padding-top: 60px; /* Add padding to account for fixed header */
        }

        /* Header Styles */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background-color: #000000;
            color: #fff;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000; /* Ensure the header stays on top */
        }

        .header .nav {
            display: flex;
            justify-content: center; /* Center the nav items */
            flex-grow: 1; /* Allow the nav to take available space */
        }

        .header .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px; /* Adjust spacing */
            font-size: 16px;
        }

        .header .nav a:hover {
            color: #ccc;
        }

        .logout-btn {
            background-color: #ff0202;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #000000;
        }

        /* Form Container Styles */
        .apply-leave-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .apply-leave-container h2 {
            margin-bottom: 20px;
            color: #000000;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group select,
        .form-group input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .apply-button {
            background-color: #000000;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        .apply-button:hover {
            background-color: #444;
        }

        /* Message Styles */
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            text-align: center;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header .nav {
                flex-direction: column;
                align-items: center;
            }

            .header .nav a {
                margin: 10px 0; /* Adjust margin for vertical layout */
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="nav">
            <a href="/admindashboard">Home</a>
            <a href="/addleave">Add Leave</a>
            <a href="/leaveshow">Manage Leave</a>
        </div>
        <a href="/admindashboard" class="logout-btn">Go Back</a>
    </div>

    <div class="apply-leave-container">
        <h2>Leave Assign</h2>
        <form action="faculty_assign_leave" method="post" onsubmit="return chk()">
            <!-- Faculty Dropdown -->
            <div class="form-group">
                <label for="faculty">Select Faculty:</label>
                <select id="name" name="name">
                    <c:forEach var="faculty" items="${faculty}">
                        <option value="${faculty.email}">${faculty.name}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Leave Type Dropdown -->
            <div class="form-group">
                <label for="leaveType">Select Leave Type:</label>
                <select id="leaveType" name="leave_id">
                    <c:forEach var="leave" items="${leaveMaster}">
                        <option value="${leave.leave_id}">${leave.leave_name}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Number of Leave Days Input -->
            <div class="form-group">
                <label for="leaveDays">Number of Days:</label>
                <input type="number" id="leaveDays" name="old_no_of_leave" min="1" max="30" required>
            </div>

            <!-- Apply Button -->
            <div class="form-group">
                <input type="submit" value="ASSIGN" id="btn" class="apply-button"/>
            </div>
        </form>
    </div>

    <div class="message">${msg}</div>
</body>
</html>

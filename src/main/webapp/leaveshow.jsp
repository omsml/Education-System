<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Leave</title>
    <!-- Font Links -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap">
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Sofia', sans-serif; /* Sofia font for body */
            line-height: 1.6;
            color: #000000;
            background-color: #f9f9f9;
        }

        /* Header Styles */
        .header {
            background-color: #000000;
            color: #fff;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }

        .header .nav {
            display: flex;
            justify-content: center; /* Center the nav items */
            flex-grow: 1; /* Allow the nav to take available space */
        }

        .header .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px; /* Adjusted margin for spacing */
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
            border-radius: 4px;
        }

        .logout-btn:hover {
            background-color: #000000;
        }

        /* Table Styles */
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 60px; /* Adjusted margin to account for fixed header */
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px; /* Increased padding for better readability */
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
            font-family: 'Roboto', sans-serif; /* Roboto font for table headers */
            font-weight: 700; /* Bold Roboto font */
            font-size: 18px; /* Increased font size for headers */
        }

        td {
            background-color: #fff;
            font-size: 16px; /* Adjusted font size for table data */
        }

        /* Form Styles */
        form {
            display: inline-block;
        }

        input[type="submit"] {
            background-color: #ff0000;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #444;
        }

        /* Message Styles */
        .message {
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            text-align: center;
            border-radius: 4px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: center;
            }

            .header .nav {
                flex-direction: column;
                align-items: center;
                margin-bottom: 10px;
            }

            .header .nav a {
                margin: 10px 0; /* Adjust margin for vertical layout */
            }

            table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="nav">
            <a href="/admindashboard">Home</a>
            <a href="/addleave">Add Leave</a>
            <a href="/leave_assign">Assign Leave</a>
        </div>
        <a href="/admindashboard" class="logout-btn">Go Back</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>TYPE</th>
            <th>Action</th>
        </tr>
        <c:forEach var="leave" items="${leave_master}">
            <tr>
                <td>${leave.leave_id}</td>
                <td>${leave.leave_name}</td>
                <td>
                    <form method="post" action="/manageleave">
                        <input type="hidden" name="leave_id" value="${leave.leave_id}" />
                        <input type="submit" name="btn" value="Delete" />
                        <input type="submit" name="btn" value="Edit">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="message">${sms}</div>
</body>
</html>

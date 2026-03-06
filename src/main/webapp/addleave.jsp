<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Leave Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@400;700&display=swap">
    <style>
        body {
            font-family: 'Sofia', sans-serif; /* Elegant font */
            margin: 0;
            padding: 0;
            background-color: #f0f4f8; /* Soft light gray background */
            color: #333; /* Dark gray text for readability */
        }

        .header {
            background-color: #000000; /* Black background for header */
            color: #ffffff; /* White text color */
            display: flex;
            justify-content: space-between; /* Space between logo and links */
            align-items: center;
            padding: 1em 2em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            border-bottom: 1px solid #333; /* Slightly lighter border for separation */
        }

        .header .nav {
            display: flex;
            gap: 1em;
            justify-content: center; /* Center navigation links */
            flex: 1; /* Allow nav to grow and take available space */
        }

        .header a {
            color: #ffffff; /* White text color for links */
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .header a:hover {
            background-color: #333; /* Dark gray background on hover */
            color: #ffffff; /* White text color on hover */
        }

        .logout-btn {
            background-color: #dc3545; /* Gentle red background for logout */
            color: #ffffff; /* White text color */
            border: 2px solid #dc3545; /* Border matching the background */
            padding: 0.5em 1em;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .logout-btn:hover {
            background-color: #ffffff; /* White background on hover */
            color: #dc3545; /* Red text color on hover */
        }

        .content {
            padding: 2em;
            max-width: 600px;
            margin: 0 auto;
        }

        .form-container {
            background: #ffffff; /* White background for the form container */
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            padding: 2em;
            margin-top: 1em;
        }

        .leave-form {
            display: flex;
            flex-direction: column;
            gap: 1em;
        }

        .leave-form label {
            font-weight: 700; /* Bold label text */
        }

        .leave-form input[type="text"] {
            padding: 0.5em;
            border: 1px solid #ddd; /* Light gray border */
            border-radius: 4px;
            width: 100%;
        }

        .leave-form input[type="submit"] {
            background-color: #007bff; /* Gentle blue background */
            color: #ffffff; /* White text color */
            border: none;
            padding: 0.7em;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .leave-form input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue background on hover */
        }

        .sms-message {
            margin-top: 1em;
            padding: 1em;
            border-radius: 4px;
            background-color: #e9ecef; /* Light gray background */
            color: #333; /* Dark gray text */
        }
    </style>
</head>

<body>
    <!-- Header -->
    <div class="header">
        <div class="nav">
            <a href="/admindashboard">Home</a>
            <a href="/leaveshow">Manage Leave</a>
            <a href="/leave_assign">Assign Leave</a>
            
        </div>
        <a href="/admindashboard" class="logout-btn">Go Back</a>
    </div>

    <!-- Page Content -->
    <div class="content">
        <div class="form-container">
            <form action="add_leave" method="post" class="leave-form">
                <label for="leave_name">Leave Name:</label>
                <input type="text" id="leave_name" name="leave_name" required />
                <input type="submit" value="Submit" />
            </form>
            <div class="sms-message">${SMS}</div>
        </div>
    </div>
</body>

</html>

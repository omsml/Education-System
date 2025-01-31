<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@400;700&display=swap">
    <style>
        body {
            font-family: 'Sofia', sans-serif; /* Gentle, elegant font */
            margin: 0;
            padding: 0;
            background-color: #f0f4f8; /* Soft light gray background */
            color: #333; /* Dark gray text for readability */
        }

        .header {
            background-color: #000000; /* Black background for header */
            color: #ffffff; /* White text color */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1em 2em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            border-bottom: 1px solid #333; /* Slightly lighter border for separation */
        }

        .logo {
            font-size: 1.8em;
            font-weight: 700; /* Bold for emphasis */
        }

        .nav {
            display: flex;
            gap: 1em;
        }

        .nav-link {
            color: #ffffff; /* White text color for nav links */
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        .nav-link:hover {
            background-color: #333; /* Dark gray background on hover */
            color: #ffffff; /* White text color on hover */
        }

        .logout-btn {
            background-color: #dc3545; /* Gentle red background for logout */
            color: #ffffff; /* White text color */
            text-decoration: none;
            padding: 0.5em 1em;
            border-radius: 4px;
            border: 2px solid #dc3545; /* Border matching the background */
            transition: background-color 0.3s, color 0.3s;
        }

        .logout-btn:hover {
            background-color: #ffffff; /* White background on hover */
            color: #dc3545; /* Red text color on hover */
        }

        .content {
            padding: 2em;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        

        h1 {
            font-size: 2em;
            margin-bottom: 0.5em;
        }

        p {
            font-size: 1.1em;
        }
    </style>
</head>

<body>
    <header class="header">
        <div class="logo">Admin Panel</div>
        <nav class="nav">
            <a href="admindashboard" class="nav-link">Home</a>

            <a href="add_faq" class="nav-link">Add FAQ</a>

            <a href="addleave" class="nav-link">Add Leave</a>
            <a href="leave_assign" class="nav-link">Assign Leave</a>
            <a href="leaveshow" class="nav-link">Manage Leave</a>
            
            <a href="leave_assign_view" class="nav-link">Leave Assigned Details</a>
            <a href="users" class="nav-link">User Details</a>

            <a href="leave_acess" class="nav-link">Grant Acess</a>
        </nav>
        <a href="/home" class="logout-btn">Logout</a>
    </header>

    <main class="content">
        <h1>Welcome to the Admin Panel</h1>
        <p>Select an option from the menu to get started.</p>
    </main>

    
</body>

</html>

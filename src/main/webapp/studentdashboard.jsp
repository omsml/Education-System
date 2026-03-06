<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <!-- Font Links -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
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
            margin-top: 60px; /* Adjust margin-top to accommodate fixed header */
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
            transition: color 0.3s ease;
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
            text-decoration: none;
        }

        .logout-btn:hover {
            background-color: #000000;
        }

        /* Main Content Styles */
        .content {
            padding: 20px;
            margin-top: 60px; /* Offset the content from the fixed header */
        }

        .section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .section h2 {
            margin-bottom: 10px;
            font-family: 'Roboto', sans-serif; /* Roboto font for headings */
            font-weight: 700; /* Bold Roboto font */
        }

        .section p {
            font-size: 16px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo"><h2>Student Panel</h2></div>
        <div class="nav">
            <a href="/">Home</a>
            <a href="/exam">Exam</a>
            <a href="/">Result</a>
            <a href="/">Profile</a>
        </div>
        <a href="/home" class="logout-btn">Log Out</a>
    </div>

    <div class="content">
        <!-- Example Section: view login user -->
        <div class="section">
            <h2>Welcome</h2>
            <p><% String email=(String)session.getAttribute("email"); %>
                <% String name=(String)session.getAttribute("name"); %>
                <%=name %></p>
            <!-- Add more content or functionality here -->
        </div>
    </div>
</body>
</html>

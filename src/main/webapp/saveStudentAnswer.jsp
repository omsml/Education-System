<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header styling */
        header {
            background: #e9ecf0cb; /* Bootstrap blue */
            color: #ffffff;
            padding: 15px;
            text-align: center;
            font-size: 1.5rem;
        }

        /* Main content styling */
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .message-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            transform-style: preserve-3d;
            animation: float 3s ease-in-out infinite;
        }

        .message-container h1 {
            color: #4CAF50;
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }

        .message-container p {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 30px;
        }

        .icon {
            font-size: 5rem;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background: #e0e7ed; /* Bootstrap blue */
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: background 0.3s, transform 0.3s;
        }

        a:hover {
            background: #0056b3; /* Darker blue on hover */
            transform: scale(1.05);
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }
    </style>
</head>
<body>
    <!-- Header included from studentheader.jsp -->
    <header>
        <!-- Content from studentheader.jsp will be included here -->
    </header>

    <!-- Main content area -->
    <div class="main-content">
        <div class="message-container">
            <div class="icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1>Success!</h1>
            <p>Your answer has been saved successfully.</p>
            <a href="/exam">Go Back</a>
        </div>
    </div>
</body>
</html>
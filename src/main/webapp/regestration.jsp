<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Sofia:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Sofia', sans-serif;
            margin: 0;
            padding: 0;
            background: #1c1c1c;
            color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        header {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .header-container {
            background: rgba(0, 0, 0, 0.7);
            border-radius: 8px;
            padding: 10px 20px;
        }

        .home-button {
            text-decoration: none;
            color: #f5f5f5;
            font-weight: bold;
            font-size: 1.2em;
        }

        .register-container {
            background: #333;
            border-radius: 10px;
            padding: 20px;
            width: 350px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        }

        h2 {
            margin-top: 0;
            color: #00ffff; /* Aqua color */
            text-align: center;
            font-size: 2em;
            font-weight: 700;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #f5f5f5;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #444;
            color: #f5f5f5;
        }

        .radio-group {
            display: flex;
            
        }

        .radio-group label {
            display: flex;
            align-items: center;
        }

        button.register-button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #00ffff; /* Aqua color */
            color: #333;
            font-size: 1em;
            cursor: pointer;
            transition: background 0.3s;
        }

        button.register-button:hover {
            background: #00cccc; /* Darker aqua color */
        }

        .sms-message {
            color: #ff6666;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="header-container">
            <a href="/home" class="home-button">Home</a>
        </div>
    </header>

    <!-- Register Container -->
    <div class="register-container">
        <h2>Register</h2>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="tel" id="mobile" name="mobile" required>
            </div>
            <div class="form-group">
                <label>Role:</label>
                <div class="radio-group">
                    <label for="student">
                        <input type="radio" id="student" name="role" value="student" required> Student
                    </label>
                    <label for="faculty">
                        <input type="radio" id="faculty" name="role" value="faculty" required> Faculty
                    </label>
                </div>
            </div>
            <button type="submit" class="register-button">Register</button>
            <div class="sms-message">${sms}</div>
        </form>
    </div>
</body>
</html>

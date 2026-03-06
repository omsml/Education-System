<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@300;400;700&family=Roboto:wght@300;400;700&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #58B09C;
            color: #333;
        }

        .header {
            background-color: #000000;
            color: #fff;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            /* Removed fixed positioning */
        }

        .header .nav {
            display: flex;
            justify-content: left; /* Center the nav items */
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

        .header .btn {
            background-color: #ff0202;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
        }

        .header .btn:hover {
            background-color: #000000;
        }

        h1 {
            font-family: 'Sofia', sans-serif;
            color: #444;
            text-align: center;
            margin-top: 20px; /* Adjusted for spacing from the header */
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        label {
            font-family: 'Roboto', sans-serif; /* Consistent with body text */
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        textarea {
            font-family: 'Roboto', sans-serif; /* Consistent with body text */
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        input[type="submit"] {
            font-family: 'Roboto', sans-serif; /* Consistent with body text */
            background-color: red;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: darkred;
        }

        .sms-message {
            text-align: center;
            font-family: 'Sofia', sans-serif; /* For a special touch */
            color: green;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div><h2>Add Question</h2></div>
        <div class="nav">
            <a href="/managequestion">Manage Questions</a>
        </div>
        <a href="/facultydashboard" class="btn">Go Back</a>
    </div>

    <h1>Add a New Question</h1>
    <form action="add_question" method="post">
        <label for="question">Question:</label><br>
        <textarea id="question" name="question" rows="4" cols="50" required></textarea><br><br>

        <label for="option1">Option 1:</label><br>
        <textarea id="option1" name="option1" rows="2" cols="50" required></textarea><br><br>

        <label for="option2">Option 2:</label><br>
        <textarea id="option2" name="option2" rows="2" cols="50" required></textarea><br><br>

        <label for="option3">Option 3:</label><br>
        <textarea id="option3" name="option3" rows="2" cols="50" required></textarea><br><br>

        <label for="option4">Option 4:</label><br>
        <textarea id="option4" name="option4" rows="2" cols="50" required></textarea><br><br>

        <label>Select the correct answer:</label><br>
        <input type="radio" id="answer1" name="answer" value="option1" required>
        <label for="answer1">Option 1</label><br>

        <input type="radio" id="answer2" name="answer" value="option2">
        <label for="answer2">Option 2</label><br>

        <input type="radio" id="answer3" name="answer" value="option3">
        <label for="answer3">Option 3</label><br>

        <input type="radio" id="answer4" name="answer" value="option4">
        <label for="answer4">Option 4</label><br><br>

        <input type="submit" value="Submit">
    </form>
    <div class="sms-message">${sms}</div>
</body>
</html>

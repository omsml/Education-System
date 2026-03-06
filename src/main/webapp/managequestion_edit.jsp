<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Question</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sofia:wght@300;400;700&family=Roboto:wght@300;400;700&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        .header {
            background-color: #000000;
            color: #fff;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h2 {
            font-family: 'Sofia', sans-serif;
            margin: 0;
        }

        .header .nav {
            display: flex;
            justify-content: left;
            flex-grow: 1;
        }

        .header .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
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

        form {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: calc(100% - 22px); /* Adjust width to fit padding */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: red;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            font-family: 'Roboto', sans-serif;
        }

        input[type="submit"]:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="header">
        <div><h2>Edit Question</h2></div>
        <div class="nav">
            <a href="/addquestion">Add Question</a>
        </div>
        <a href="/managequestion" class="btn">Go Back</a>
    </div>

    <form method="post" action="/manage_question_update">
        <label for="question">Question:</label>
        <input type="text" id="question" name="question" value="${question_master[0].question}" />
        
        <label for="option1">Option1:</label>
        <input type="text" id="option1" name="option1" value="${question_master[0].option1}" />
        
        <label for="option2">Option2:</label>
        <input type="text" id="option2" name="option2" value="${question_master[0].option2}" />
        
        <label for="option3">Option3:</label>
        <input type="text" id="option3" name="option3" value="${question_master[0].option3}" />
        
        <label for="option4">Option4:</label>
        <input type="text" id="option4" name="option4" value="${question_master[0].option4}" />
        
        <label for="answer">Answer:</label>
        <input type="text" id="answer" name="answer" value="${question_master[0].answer}" />
        
        <input type="hidden" name="sl_no" value="${question_master[0].sl_no}" />
        
        <input type="submit" value="Update" />
    </form>
</body>
</html>

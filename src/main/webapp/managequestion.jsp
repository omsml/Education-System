<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Question</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
            font-family: 'Roboto', sans-serif;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold; /* Bold text for table headers */
        }

        .message {
            text-align: center;
            font-family: 'Sofia', sans-serif;
            color: green;
            margin: 20px 0;
        }

        form input[type="submit"] {
            background-color: red;
            color: #fff;
            border: none;
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            font-family: 'Roboto', sans-serif;
            margin-right: 5px;
        }

        form input[type="submit"]:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
    <div><h2>Manage Question</h2></div>
    <div class="nav">
        <a href="/addquestion">Add Question</a>
    </div>
    <a href="/facultydashboard" class="btn">Go Back</a>
</div>

<table>
    <tr>
        <th>SL_NO</th>
        <th>Question</th>
        <th>Option1</th>
        <th>Option2</th>
        <th>Option3</th>
        <th>Option4</th>
        <th>Answer</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="question" items="${question_master}">
        <tr>
            <td>${question.sl_no}</td>
            <td>${question.question}</td>
            <td>${question.option1}</td>
            <td>${question.option2}</td>
            <td>${question.option3}</td>
            <td>${question.option4}</td>
            <td>${question.answer}</td>
            <td>
                <form method="post" action="/manage_question">
                    <input type="hidden" name="sl_no" value="${question.sl_no}" />
                    <input type="submit" name="btn" value="Delete" />
                    <input type="submit" name="btn" value="Edit" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="message">${sms}</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Display the username from the session -->
<% String name = (String) session.getAttribute("name"); %>
<span class="me-2" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4); font-size: 1.2rem;">
    
</span>

<style>
    /* Global Styles */
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Arial', sans-serif;
        line-height: 1.6;
        color: #333;
        background-color: #f0f4f8;
        margin: 0;
        padding: 60px 0 0;
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

    .header .logo h2 {
        margin: 0;
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

    .logout-btn {
        background-color: #ff4444;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .logout-btn:hover {
        background-color: #c00;
    }

    /* Form Styles */
    form {
        background: #fff;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        padding: 20px;
        border-radius: 10px;
        width: 70%;
        margin: 30px auto;
        animation: form-appear 0.8s ease;
    }

    .question-box {
        background-color: #f9f9f9;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    .timer {
        font-size: 1rem;
        font-weight: bold;
        color: #ff4444;
        text-align: right;
        margin-bottom: 10px;
    }

    label {
        font-size: 1.3rem;
        font-weight: bold;
        margin-bottom: 10px;
        display: block;
    }

    hr {
        border: 0;
        height: 2px;
        background: #ccc;
        margin: 15px 0;
    }

    /* Radio button styling */
    input[type="radio"] {
        margin-right: 10px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="radio"]:hover {
        transform: scale(1.1);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    /* Button Styles */
    input[type="submit"] {
        padding: 10px 20px;
        font-size: 1.2rem;
        background-color: #007bff;
        border: none;
        color: #fff;
        border-radius: 5px;
        cursor: pointer;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        transform: translateY(-2px) scale(1.05);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
    }

    /* Keyframes for the form appearing */
    @keyframes form-appear {
        from {
            transform: scale(0.9);
            opacity: 0;
        }
        to {
            transform: scale(1);
            opacity: 1;
        }
    }
</style>

<div class="header">
    <div class="logo"><h2>Result Panel</h2></div>
    <div class="nav">
        <a href="/studentdashboard">Home</a><%= name %>
    </div>
    <a href="/studentdashboard" class="logout-btn">Go Back</a>
</div>

<div id="message" style="color: red; font-size: 1.5rem; text-align: center;"></div>

<form method="post" action="/SaveStudentAnswer" onsubmit="return confirmSubmission();">
    <c:forEach var="question" items="${question_master}">
        <div class="question-box">
            <div class="timer">Time Left: 60 seconds</div>
            <label>Qn: ${question.question}</label> 
            <hr /> 

            <!-- <input type="radio" name="q${question.sl_no}" value="1" /> ${question.option1}<br />
            <input type="radio" name="q${question.sl_no}" value="2" /> ${question.option2}<br />
            <input type="radio" name="q${question.sl_no}" value="3" /> ${question.option3}<br />
            <input type="radio" name="q${question.sl_no}" value="4" /> ${question.option4}<br />  -->
            <input type="radio" name="ansArray[${question.sl_no}]" value="1">${question.option1}<br />
            <input type="radio" name="ansArray[${question.sl_no}]" value="2">${question.option2}<br />
            <input type="radio" name="ansArray[${question.sl_no}]" value="3">${question.option3}<br />
            <input type="radio" name="ansArray[${question.sl_no}]" value="4">${question.option4}<br />
            <br />
        </div>
    </c:forEach>
    
    <input type="submit" name="action" value="Submit Answer" />
</form>

<script>
    // Function to initialize timers for each question
    function startQuestionTimers() {
        const questionElements = document.querySelectorAll('.question-box');
        
        questionElements.forEach((box) => {
            let timeLeft = 60; // 60 seconds for each question
            const timerElement = box.querySelector('.timer');

            const timer = setInterval(function() {
                if (timeLeft <= 0) {
                    clearInterval(timer);
                    timerElement.textContent = "Time's up!";
                    // Optionally disable inputs for this question
                    box.querySelectorAll('input[type="radio"]').forEach(input => input.disabled = true);
                } else {
                    timerElement.textContent = "Time Left: " + timeLeft + " seconds";
                    timeLeft--;
                }
            }, 1000);
        });
    }

    // Call the function to start timers when the page loads
    document.addEventListener('DOMContentLoaded', startQuestionTimers);

    function confirmSubmission() {
        return confirm("Are you sure you want to submit your answers?");
    }
</script>

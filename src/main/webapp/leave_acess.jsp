<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    .nav {
        display: flex;
    }
    .nav a {
        color: white;
        margin-right: 15px;
        text-decoration: none;
    }
    .logout-btn {
        background-color: red;
        color: white;
        padding: 5px 10px;
        text-decoration: none;
        margin-left: auto; /* Push the button to the right */
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }
    .message {
        margin-top: 20px;
        font-weight: bold;
    }
    .action-btn {
        background-color: red; /* Button background color */
        color: white; /* Button text color */
        border: none; /* Remove default border */
        padding: 5px 10px; /* Button padding */
        cursor: pointer; /* Pointer cursor on hover */
        margin-right: 5px; /* Space between buttons */
    }
</style>

<div class="header">
    <div class="nav">
        <a href="/admindashboard">Home</a>
        <a href="/addleave">Add Leave</a>
        <a href="/leaveshow">Manage Leave</a>
        <a href="/leave_assign">Assign Leave</a>
    </div>
    <a href="/admindashboard" class="logout-btn">Go Back</a>
</div>

<table>
    <tr>
        <th>SLNO</th>
        <th>EMAIL</th>
        <th>LEAVE ID</th>
        <th>NO Of LEAVE</th>
        <th>APPLY LEAVE</th>
        <th>ACTION</th>
    </tr>
    <c:forEach var="assign" items="${leave_apply}">
        <tr>
            <td>${assign.slno}</td>
            <td>${assign.name}</td>
            <td>${assign.leave_id}</td>
            <td>${assign.no_of_leave}</td>
            <td>${assign.apply_date}</td>
            <td>${assign.status}</td>
            <td>
                <form method="post" action="acessleave">
                    <input type="hidden" name="slno" value="${assign.slno}" />
                    <input type="submit" class="action-btn" name="btn" value="Access" />
                    <input type="submit" class="action-btn" name="btn" value="Denied" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="message">${sms}</div>

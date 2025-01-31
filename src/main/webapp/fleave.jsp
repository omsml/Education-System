<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/styles.css"> <!-- Add your CSS file -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0; /* Light background for contrast */
        }
        form {
            background-color: #f9f9f9;
            padding: 15px; /* Reduced padding */
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
            width: 300px; /* Fixed width for the form */
            text-align: left; /* Align text to the left */
        }
        form:hover {
            transform: scale(1.02);
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px; /* Reduced padding for input fields */
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, select:focus {
            border-color: #66afe9;
            outline: none;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
            border-radius: 4px;
            width: 100%; /* Full width for submit button */
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<form method="post" action="save" onsubmit="return chk()">
    <label for="leaveid">Leave:</label>
    <select name="leave_id" id="leaveid">
        <c:forEach var="leave" items="${leave_master}">
            <option value="${leave.leave_id}">${leave.leave_name}</option>
        </c:forEach>
    </select>
    
    <label for="no_of_leave">No. of leave:</label>
    <input type="text" name="no_of_leave" id="no_of_leave" required />
    
    <input type="text" id="old_no_of_leave" readonly />
    
    <input type="submit" value="Apply" id="btn" />
</form>
${msg}

<script type="text/javascript">
    $(document).ready(function() {
        $("#leaveid").change(function() {
            var leaveid = $(this).val();
            $.ajax({
                url: "noofleave",
                type: "POST",
                dataType: "JSON",
                data: { lid: leaveid },
                success: function(res) {
                    $("#old_no_of_leave").val(res[0].no_of_leave);
                }
            });
        });
    });

    function chk() {
        var no_of_leave = parseInt(document.getElementById("no_of_leave").value);
        var old_no_of_leave = parseInt(document.getElementById("old_no_of_leave").value);

        if (no_of_leave <= old_no_of_leave) {
            return true;
        } else {
            alert("Leave not allowed. The requested leave exceeds available balance.");
            return false; // Corrected typo here
        }
    }
</script>

</body>
</html>

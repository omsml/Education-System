<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <style>
    /* Add some basic styling to the form */
    form {
      width: 50%;
      /* adjust the width to your liking */
      margin: 40px auto;
      /* center the form */
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* Style the input fields */
    input[type="text"],
    input[type="hidden"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
    }

    /* Style the submit button */
    input[type="submit"] {
      background-color: #4CAF50;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    /* Add some space between the fields */
    br {
      margin-bottom: 10px;
    }
  </style>

  <form method="post" action="updateleave">
    <label for="leave_name">TYPE:</label>
    <input type="text" name="leave_name" value="${leave_master[0].leave_name}" />
    <input type="hidden" name="leave_id" value="${leave_master[0].leave_id}" />
    <br>
    <input type="submit" name="btn" value="Update" />
  </form>

  <p> ${leave_master[0].leave_id} </p>
  hello
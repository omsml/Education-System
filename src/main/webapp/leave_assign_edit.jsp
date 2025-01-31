<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form method="post" action="leave_assign_update">
    <label for="name">NAME:</label>
    <input type="text" name="name" value="${leave_faculty_assign[0].name}"/>
    <br>
    <label for="leave_id">LEAVE ID:</label>
    <input type="text" name="leave_id" value="${leave_faculty_assign[0].leave_id}"/>
    <br>
    <label for="no_of_leave">NO OF LEAVE:</label>
    <input type="text" name="no_of_leave" value="${leave_faculty_assign[0].no_of_leave}"/>
    <input type="hidden" name="sl_no" value="${leave_faculty_assign[0].sl_no}"/>
    <br>
    <input type="submit" name="btn" value="Update"/>
  </form>


  
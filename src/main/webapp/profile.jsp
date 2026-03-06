<%@ page import="java.util.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header">
    <div class="logo">Admin Panel</div>
    <nav class="nav">
        <a href="admindashboard" class="nav-link">Home</a>
        <a href="addleave" class="nav-link">Add Leave</a>
        <a href="leave_assign" class="nav-link">Assign Leave</a>
        <a href="leaveshow" class="nav-link">Manage Leave</a>
        <a href="leave_assign_view" class="nav-link">Leave Assigned Details</a>
        <a href="users" class="nav-link">User Details</a>
        
    </nav>
    <a href="/admindashboard" class="logout-btn">Go Back</a>
</header>
<form method="post" action="upload" enctype="multipart/form-data">
    <c:choose>
        <c:when test="${not empty userprofile and not empty userprofile[0].photo}">

            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(userprofile[0].photo)}"
            width ="100"
            height="100" /></br>
        </c:when>

        <c:otherwise>
            ${userprofile[0].role}
            <img
            src="data:image/jpeg;base64,${'defaultImageBase64'}"
            width="100"
            height="100" /></br>

        </c:otherwise>
    </c:choose>

    photo : <input type ="file" name="f" /></br>


    <input type="submit" name="btn" value="update"/>
</form>
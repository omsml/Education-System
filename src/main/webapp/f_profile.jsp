<%@ page import="java.util.* "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="header">
    <div class="logo"><h2>Faculty Pannel</h2></div>
    <div class="nav">
        <a href="/#">View Students</a>
        <a href="/addquestion">Add Questions</a>
        <a href="/managequestion">Manage Questions</a>
        <a href="/f_profile.jsp">Profile</a>
        <a href="applyleave">Apply Leave</a>
    </div>
    <a href="/facultydashboard" class="logout-btn">Go Back</a>
</div>
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
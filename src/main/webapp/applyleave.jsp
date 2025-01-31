<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

Leave Name:
<select name="leave_id">
    <c:forEach var="leave" items="${leave_master}">
        <option value ="${leave.leave_id}">
            ${leave.leave_name}
        </option>
    </c:forEach>
</select>   
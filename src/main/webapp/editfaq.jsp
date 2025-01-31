<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="viewfaq" items="${view_faq}">
    <form method="post" action="updatefaq">
        Slno : <input type="text" name="slno" value="${viewfaq.slno}" readonly/>
        <br />
        Question : <input type="text" name="question" value="${viewfaq.question}" />
        <br />
        Answer : <input type="text" name="answer" value="${viewfaq.answer}" />
        <br />
        <input type="submit" name="btn" value="update" />
        
    </form>
</c:forEach>

<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
    <div class="container">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">Slno</th>
                    <th scope="col">Question</th>
                    <th scope="col">Answer</th>
                    <th scope="col">Action</th>

                </tr>
            </thead>

            <tbody>
                <c:forEach var="viewf" items="${view_faq}">
                    <tr>
                        <td>${viewf.slno}</td>
                        <td>${viewf.question}</td>
                        <td>${viewf.answer}</td>
                        <td>
                            <form method="post" action="managefaq">
                                <input type="hidden" name="slno" value="${viewf.slno}" readonly/>
                                <button type="submit" name="btn" class="btn btn-danger" value="delete">Delete</button>
                                <button type="submit" name="btn" class="btn btn-primary" value="edit">Edit</button>

                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
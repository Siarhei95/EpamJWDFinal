<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>
    <title><fmt:message key="title.reviews" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>

<div class="container-fluid">
    <h1><fmt:message key="text.reviews.reviews" bundle="${var}"/></h1>

    <div class="row justify-content-md-center">
        <div class="col col-lg-10">

            <form name="reviewListShow" method="POST" action="${pageContext.request.contextPath}/controller">
                <input type="hidden" name="command" value="show_review_list"/>

                <table class="table table-hover">
                    <caption><fmt:message key="text.reviews.reviews" bundle="${var}"/></caption>
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col"><fmt:message key="text.reviews.name" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="text.reviews.text" bundle="${var}"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.review}" var="review">
                        <tr>
                            <td>${review.userName}</td>
                            <td>${review.message}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>


<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
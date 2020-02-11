<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>
    <title><fmt:message key="title.reg" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>

</head>
<body>
<c:import url="/jsp/util/header.jsp"/>

<div class="container-fluid">
    <h1><fmt:message key="text.reg.rev" bundle="${var}"/></h1>

    <div class="row justify-content-md-center">
        <div class="col col-lg-5">
            <form name="reviewReg" method="POST" action="${pageContext.request.contextPath}/controller">
                <input type="hidden" name="command" value="registration_review"/>

                <div class="row form-group">
                    <div class="col">
                        <input type="number" class="form-control"
                               placeholder="<fmt:message key="text.reg.rev.id" bundle="${var}"/>" name="id"/>
                    </div>
                    <div class="col">
                        <input type="text" class="form-control"
                               placeholder="<fmt:message key="text.reg.rev.message" bundle="${var}"/>" name="message"/>
                    </div>
                </div>


                <c:if test="${not empty errorLoginPassMessage}">
                    <div class="alert alert-danger" role="alert">
                            ${errorLoginPassMessage}
                    </div>
                </c:if>

                <div class="text-center">
                    <button type="submit" class="btn btn-outline-dark">
                        <fmt:message key="title.reg.rev" bundle="${var}"/></button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
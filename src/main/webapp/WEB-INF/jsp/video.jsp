<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>
    <title><fmt:message key="title.trainerlist" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>

<!-- соотношение 16:9 -->
<div class="embed-responsive embed-responsive-16by9">
    <iframe class="embed-responsive-item"  src="https://www.youtube.com/embed/eqAIzxk8pH0" frameborder="0" allowfullscreen></iframe>
</div>

<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
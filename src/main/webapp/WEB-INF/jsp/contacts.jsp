<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>
    <title><fmt:message key="title.contacts" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>
</body>
</html>

<html>
<body>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row-fluid">
        <div class="span8">
            <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.uk/maps?f=q&source=s_q&hl=en&geocode=&q=praspiekt+Niezalie%C5%BEnasci+100&aq=t&ie=UTF8&hq=&hnear=praspiekt+Niezalie%C5%BEnasci+100,+Minsk&t=m&z=14&ll=53.9280737,27.6282121&output=embed"></iframe>
        </div>

        <div class="span4">
            <h2><fmt:message key="text.contacts.contacts" bundle="${var}"/></h2>
            <address>
                <strong><fmt:message key="text.header.fitnesscenter" bundle="${var}"/></strong>
                <br><fmt:message key="text.contacts.address" bundle="${var}"/>
                <br><br>
                <br><fmt:message key="text.contacts.email" bundle="${var}"/>
                <br><br>
                <abbr title="Tel."></abbr> +375 999 99 99
            </address>
        </div>
    </div>
</div>

<a href="${pageContext.request.contextPath}/jsp/util/header.jsp">
    <br><br>
    <fmt:message key="bt.main.return" bundle="${var}"/></a>

<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>


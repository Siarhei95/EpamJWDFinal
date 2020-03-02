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

<%--<div class="container-fluid">--%>
<%--    <h1><fmt:message key="text.contacts.contacts" bundle="${var}"/></h1>--%>

<%--    <div class="row justify-content-md-center">--%>
<%--        <div class="col col-lg-5">--%>

<%--            <div class="form-group">--%>
<%--                <p><fmt:message key="text.contacts.address" bundle="${var}"/></p>--%>
<%--                <p><fmt:message key="text.contacts.email" bundle="${var}"/></p>--%>
<%--            </div>--%>

<%--            <form action="${pageContext.request.contextPath}/mailServlet" method="POST">--%>

<%--                <div class="form-group">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-3">--%>
<%--                            <label for="idSendTo1"><fmt:message key="text.contacts.sendto" bundle="${var}"/></label>--%>
<%--                        </div>--%>
<%--                        <div class="col">--%>
<%--                            <input type="text" class="form-control" id="idSendTo1" name="to"--%>
<%--                                   value="fitness.center.epam@gmail.com" required--%>
<%--                                   pattern="^([a-z0-9_.-]+)@([a-z0-9_.-]+)\.([a-z]{2,5})$"/>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-3">--%>
<%--                            <label for="idSubject1"><fmt:message key="text.contacts.subject" bundle="${var}"/></label>--%>
<%--                        </div>--%>
<%--                        <div class="col">--%>
<%--                            <input type="text" class="form-control" id="idSubject1" name="subject" value="" required/>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="idTextarea1"><fmt:message key="text.contacts.messagetext" bundle="${var}"/></label>--%>
<%--                    <textarea type="text" name="body" rows="5" class="form-control" id="idTextarea1"></textarea>--%>
<%--                </div>--%>

<%--                <c:if test="${not empty sessionScope.mailSentSuccessfully}">--%>
<%--                    <div class="alert alert-success" role="alert">--%>
<%--                            ${sessionScope.mailSentSuccessfully}--%>
<%--                    </div>--%>
<%--                </c:if>--%>

<%--                <div class="text-center">--%>
<%--                    <button type="submit" class="btn btn-outline-dark">--%>
<%--                        <fmt:message key="text.contacts.send.message" bundle="${ var }"/></button>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
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


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<%@ taglib prefix="ctg" uri="customtags" %>


<nav class="navbar navbar-expand-lg navbar-dark flex-column flex-md-row bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/main.jsp">
        <fmt:message key="text.header.fitnesscenter" bundle="${var}"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/controller?command=show_trainer_list">
                    <fmt:message key="text.header.trainerlist" bundle="${var}"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/gallery.jsp"><fmt:message
                        key="text.header.gallery" bundle="${var}"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/video.jsp"><fmt:message
                        key="text.header.hall" bundle="${var}"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/controller?command=show_review_list">
                    <fmt:message key="text.header.myreviews" bundle="${var}"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/food.jsp"><fmt:message
                        key="title.food" bundle="${var}"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/jsp/contacts.jsp"><fmt:message
                        key="text.header.contacts" bundle="${var}"/></a>
            </li>

            <li class="nav-item">
                <c:choose>
                    <c:when test="${sessionScope.user.role=='client'}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/jsp/client/client_cabinet.jsp">
                            <fmt:message key="text.header.mycabinet" bundle="${var}"/></a>
                    </c:when>
                    <c:when test="${sessionScope.user.role=='trainer'}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/jsp/trainer/trainer_cabinet.jsp">
                            <fmt:message key="text.header.mycabinet" bundle="${var}"/></a>
                    </c:when>
                    <c:when test="${sessionScope.user.role=='admin'}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/jsp/admin/admin_cabinet.jsp">
                            <fmt:message key="text.header.mycabinet" bundle="${var}"/></a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/jsp/login.jsp">
                            <fmt:message key="text.header.login" bundle="${var}"/></a>
                    </c:otherwise>
                </c:choose>
            </li>

            <c:if test="${not empty sessionScope.user}">
                <%--                <ctg:role user="${sessionScope.user}"/>--%>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/controller?command=logout">
                        <fmt:message key="text.header.logout" bundle="${var}"/></a>
                </li>
            </c:if>
        </ul>
        <div class="dropdown ml-md-auto">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <input type="image"
                       src="${pageContext.request.contextPath}/png/global.png"
                       height="35" width="35">
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#"><div class="mx-2">
                    <form name="localeForm" method="POST" action="${pageContext.request.contextPath}/controller">
                        <input type="hidden" name="page_path" value="${pageContext.request.requestURL}"/>
                        <input type="hidden" name="command" value="locale"/>
                        <input type="hidden" name="new_locale" value="ru_RU"/>
                        <input type="image"
                               src="${pageContext.request.contextPath}/png/rus.png"
                               height="30" width="40"
                               alt="<fmt:message key="button.locale.language.ru" bundle="${var}"/>">
                    </form>
                </div></a>
                <a class="dropdown-item" href="#"><div class="mx-2">
                    <form name="localeForm" method="POST" action="${pageContext.request.contextPath}/controller">
                        <input type="hidden" name="page_path" value="${pageContext.request.requestURL}"/>
                        <input type="hidden" name="command" value="locale"/>
                        <input type="hidden" name="new_locale" value="be_BY"/>
                        <input type="image"
                               src="${pageContext.request.contextPath}/png/bel.png"
                               height="30" width="40"
                               alt="<fmt:message key="button.locale.language.be" bundle="${var}"/>">
                    </form>
                </div></a>
                <a class="dropdown-item" href="#"><div class="mx-2">
                    <form name="localeForm" method="POST" action="${pageContext.request.contextPath}/controller">
                        <input type="hidden" name="page_path" value="${pageContext.request.requestURL}"/>
                        <input type="hidden" name="command" value="locale"/>
                        <input type="hidden" name="new_locale" value="en_US"/>
                        <input type="image"
                               src="${pageContext.request.contextPath}/png/usa.png"
                               height="30" width="40"
                               alt="<fmt:message key="button.locale.language.us" bundle="${var}"/>">
                    </form>
                </div></a>
                <a class="dropdown-item" href="#"><div class="mx-2">
                    <form name="localeForm" method="POST" action="${pageContext.request.contextPath}/controller">
                        <input type="hidden" name="page_path" value="${pageContext.request.requestURL}"/>
                        <input type="hidden" name="command" value="locale"/>
                        <input type="hidden" name="new_locale" value="de_DE"/>
                        <input type="image"
                               src="${pageContext.request.contextPath}/png/deu.png"
                               height="30" width="40"
                               alt="<fmt:message key="button.locale.language.de" bundle="${var}"/>">
                    </form>
                </div></a>
            </div>
        </div>
    </div>
</nav>
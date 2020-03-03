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

    <p><fmt:message key="table.client.text.help.leave.review" bundle="${var}"/></p>

    <div class="row justify-content-md-center">
        <div class="col col-lg-5">
            <form name="reviewReg" method="POST" action="${pageContext.request.contextPath}/controller">
                <input type="hidden" name="command" value="registration_review"/>

<%--                <form action="#" class="form"--%>
<%--                      onsubmit="document.querySelector('.info.container').textContent = 'Успешно отправлено.';"--%>
<%--                      target="formFrame">--%>
<%--                    <iframe name="formFrame" style="display:none;"></iframe>--%>

                <div class="row form-group">
                    <div class="col">
                        <label>
                            <input type="number" class="form-control"
                                   placeholder="<fmt:message key="text.reg.rev.id" bundle="${var}"/>" name="id"/>
                            <small id="passwordHelpBlock1" class="form-text text-muted">
                                <fmt:message key="text.reg.id_help" bundle="${var}"/>
                            </small>
                        </label>
                    </div>
                    <div class="col">
                        <label>
<%--                            <input type="text" class="form-control"--%>
<%--                                   placeholder="<fmt:message key="text.reg.rev.message" bundle="${var}"/>" name="message"/>--%>
                                <input type="text" class="form-control"
                                       placeholder="<fmt:message key="text.reg.rev.message" bundle="${var}"/>" name="message"
                                        value=""
                                        id="idMessage1" required maxlength="280"
                                        pattern="^([A-Z].{2,200}|[a-z].{2,200})|([А-Я].{2,200}|[а-я].{2,200})$"/>
                                        <small id="passwordHelpBlock" class="form-text text-muted">
                                        <fmt:message key="text.reg.message_help" bundle="${var}"/>
                                        </small>
                        </label>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="idTextarea1"><fmt:message key="text.contacts.messagetext" bundle="${var}"/>"</label>--%>
<%--                        <textarea type="text" name="message" rows="5" class="form-control" id="idTextarea1"></textarea>--%>
<%--                        placeholder="<fmt:message key="text.reg.rev.message" bundle="${var}"/>" name="message"--%>
<%--                        value=""&ndash;%&gt;--%>
<%--                        id="idMessage1" required maxlength="280"--%>
<%--                        pattern="^([A-Z].{2,200}|[a-z].{2,200})|([А-Я].{2,200}|[а-я].{2,200})$"/>--%>
<%--                        <small id="passwordHelpBlock" class="form-text text-muted">--%>
<%--                            <fmt:message key="text.reg.passwordhelp" bundle="${var}"/>--%>
<%--                        </small>--%>
<%--                    </div>--%>
                </div>


                <c:if test="${not empty errorLoginPassMessage}">
                    <div class="alert alert-danger" role="alert">
                            ${errorLoginPassMessage}
                    </div>
                </c:if>

<%--                        <div class="'.info.container">--%>
<%--                    <button class="btn btn-primary" type="submit"><fmt:message key="bt.reg.rev.add" bundle="${var}"/></button>--%>
<%--                        </div>--%>

                <div class="text-center">
                    <button type="submit" class="btn btn-outline-dark">
                        <fmt:message key="bt.reg.rev.add" bundle="${var}"/></button>
                </div>
            </form>
            </form>
        </div>
    </div>
</div>


<a href="${pageContext.request.contextPath}/jsp/trainer_list.jsp">
    <fmt:message key="href.trainer.list.for.review" bundle="${var}"/></a>

<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
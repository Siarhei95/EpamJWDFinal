<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>
    <title><fmt:message key="title.clientcabinet" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>

<div class="container-fluid">
    <h1><fmt:message key="text.clientcabinet.cabinet" bundle="${var}"/></h1>

    <div class="row justify-content-md-center">
        <div class="col col-lg-10">

            <div class="form-group">
                <div class="row">
                    <div class="col-2">
                        <p class="font-weight-bolder"><fmt:message key="text.clientcabinet.name" bundle="${var}"/></p>
                    </div>
                    <div class="col-3">
                        <p>${client.name}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <p class="font-weight-bolder"><fmt:message key="text.clientcabinet.surname"
                                                                   bundle="${var}"/></p>
                    </div>
                    <div class="col-3">
                        <p>${client.surname}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <p class="font-weight-bolder"><fmt:message key="text.clientcabinet.gender" bundle="${var}"/></p>
                    </div>
                    <div class="col-3">
                        <p>${client.gender}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <p class="font-weight-bolder"><fmt:message key="text.clientcabinet.yearold"
                                                                   bundle="${var}"/></p>
                    </div>
                    <div class="col-3">
                        <p>${client.yearOld}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <p class="font-weight-bolder"><fmt:message key="text.clientcabinet.email" bundle="${var}"/></p>
                    </div>
                    <div class="col-3">
                        <p>${client.email}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-2">
                        <p class="font-weight-bolder"><fmt:message key="text.clientcabinet.discount"
                                                                   bundle="${var}"/></p>
                    </div>
                    <div class="col-3">
                        <p>${client.discount}</p>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="btn btn-success">
                    <a href="${pageContext.request.contextPath}/jsp/client/order.jsp">
                        <fmt:message key="href.clientcabinet.makeorder" bundle="${var}"/></a>
                </div>

                <div class="btn btn-warning">
                    <a href="${pageContext.request.contextPath}/jsp/client/update_profile.jsp">
                        <fmt:message key="href.clientcabinet.updateprofile" bundle="${var}"/></a>
                </div>

                <div class="btn btn-danger">
                    <div class="col-3">
                        <a href="${pageContext.request.contextPath}/jsp/registration_review.jsp">
                            <fmt:message key="text.reg.rev" bundle="${var}"/></a>
                    </div>
                </div>

                <div class="btn btn-primary">
                    <div class="col-3">
                        <a href="${pageContext.request.contextPath}/jsp/food.jsp">
                            <fmt:message key="title.food" bundle="${var}"/></a>
                    </div>
                </div>
            </div>

            <form name="clientCabinet" method="POST" action="${pageContext.request.contextPath}/controller">
                <input type="hidden" name="command" value="client_cabinet"/>

                <table class="table table-hover">
                    <caption><fmt:message key="text.client.orderlist" bundle="${var}"/></caption>
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col"><fmt:message key="table.client.select" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="table.client.typeofworkout" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="table.client.numberofworkout" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="table.client.idtrainer" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="table.client.equipment" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="table.client.description" bundle="${var}"/></th>
                        <th scope="col"><fmt:message key="table.client.ispaid" bundle="${var}"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sessionScope.orders}" var="order">
                        <tr>
                            <td><input type="radio" name="select_order" value="${order.id}" id="id_order"/></td>
                            <td>${order.typeOfWorkout}</td>
                            <td>${order.numberOfWorkout}</td>
                            <td>${order.idTrainer}</td>
                            <td>${order.equipment}</td>
                            <td>${order.description}</td>
                            <td>${order.paid}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <c:if test="${not empty selectOrderRadio}">
                    <div class="alert alert-warning" role="alert">
                            ${selectOrderRadio}
                    </div>
                </c:if>

                <c:if test="${not empty orderCannotBeDeleted}">
                    <div class="alert alert-danger" role="alert">
                            ${orderCannotBeDeleted}
                    </div>
                </c:if>


                <center><div class="text-center btn btn-outline-success">
                     <a href="${pageContext.request.contextPath}/controller?command=order_payment">
                        <fmt:message key="table.client.button.gotopay" bundle="${var}"/></a>
                </div><br><br><div>
                <button type="submit" class="btn btn-outline-danger" name="refuse">
                        <fmt:message key="table.client.button.refuse" bundle="${var}"/></button>
                </div></center>

            </form>
        </div>
    </div>

</div>
<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
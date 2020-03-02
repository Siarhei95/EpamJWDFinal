<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>

    <style type="text/css">

        #foo:after {
            content: '';
            background: url(https://avatars.mds.yandex.net/get-pdb/33827/bb04ed46-2785-4cae-a9ad-fb667a7e6309/s1200);
            background-size: cover;
            width: 100%; height: 100%;
            position: absolute;
            animation: fadeBg 5s ease 0s infinite alternate;
        }

        #foo {
            background: url(https://99px.ru/sstorage/53/2015/07/tmb_137540_9520.jpg);
            background-size: cover;
            width: 100%; height: 100%;
            position: absolute;
        }

        @keyframes fadeBg {
            0%, 20% { opacity: 1; }
            100% { opacity: 0; }
        }
    </style>

    <title><fmt:message key="title.login" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>
<%--<h1><fmt:message key="text.main.fitnesscenter" bundle="${var}"/></h1>--%>
<div id="foo"></div>
<div class="container-fluid">

    <div class="row justify-content-md-center">
        <div class="col col-lg-10">

            <p></p>
            <p><fmt:message key="text.main.description1" bundle="${var}"/>
                <fmt:message key="text.main.description2" bundle="${var}"/></p>
            <p><fmt:message key="text.main.description3" bundle="${var}"/></p>

            <h3><fmt:message key="text.main.advantages" bundle="${var}"/></h3>
            <ul>
                <li><fmt:message key="adv1" bundle="${var}"/></li>
                <li><fmt:message key="adv2" bundle="${var}"/></li>
                <li><fmt:message key="adv3" bundle="${var}"/></li>
                <li><fmt:message key="adv4" bundle="${var}"/></li>
                <li><fmt:message key="adv5" bundle="${var}"/></li>
                <li><fmt:message key="adv6" bundle="${var}"/></li>
                <li><fmt:message key="adv7" bundle="${var}"/></li>
                <li><fmt:message key="adv8" bundle="${var}"/></li>
            </ul>
        </div>
    </div>
</div>




<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>

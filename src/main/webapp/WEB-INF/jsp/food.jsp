<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html>
<head>

    <style type="text/css">

        #foo {
            width: 1366px;
            height: 350px;
            background: url(https://novotelokinawanaha.com/wp-content/uploads/sites/154/2019/10/20191017_ava01-1200x400.jpg);
            background-size: cover;
            position: relative;
        }

        #foo:after {
            content: '';
            background: url(https://cdn.shopify.com/s/files/1/1315/7085/articles/mealprep_1200x630.jpg?v=1561745749);
            background-size: cover;
            width: 100%; height: 100%;
            position: absolute;
            animation: fadeBg 8s ease 0s infinite alternate;
        }

        @keyframes fadeBg {
            0%, 20% { opacity: 1; }
            100% { opacity: 0; }
        }

    </style>

    <title><fmt:message key="title.food" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>
<div id="foo"></div>
<div class="container">
    <h1 class="post-title-ps1"><fmt:message key="text.header.food" bundle="${var}"/></h1></div>

<div class="container-fluid">

    <div class="row justify-content-md-center">
        <div class="col col-lg-10">

            <p></p>
            <p><fmt:message key="text.advice.information" bundle="${var}"/></p
            <h1 class="post-title-ps1"><fmt:message key="text.helper.food" bundle="${var}"/></h1>
            <p></p>
            <p><fmt:message key="text.advice.information1" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information2" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information3" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information4" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information5" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information6" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information7" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information8" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information9" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information10" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information11" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information12" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information13" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information14" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information15" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information16" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information17" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information18" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information19" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information20" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information21" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information22" bundle="${var}"/></p>
            <p></p>
            <p><fmt:message key="text.advice.information23" bundle="${var}"/></p>
        </div>
    </div>
</div>

<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
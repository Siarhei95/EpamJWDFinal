<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}" scope="session"/>
<fmt:setBundle basename="messages" var="var"/>
<html lang="en" class="no-js">
<head>
    <title><fmt:message key="title.contacts" bundle="${var}"/></title>
    <c:import url="/jsp/util/head_link.jsp"/>
</head>
<body>
<c:import url="/jsp/util/header.jsp"/>
</body>

<!DOCTYPE html>
<head>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><fmt:message key="text.header.gallery" bundle="${var}"/></title>
    <link rel="stylesheet" type="text/css" href="../css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.3.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/demo.css" />
    <link rel="stylesheet" type="text/css" href="../css/gallery.css" />
    <!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="../js/TweenMax.min.js"></script>
    <script src="../js/jquery.min.js"></script>
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="filters hidden">
    <defs>
        <filter id="blur">
            <feGaussianBlur in="SourceGraphic" stdDeviation="0,0" />
        </filter>
    </defs>
</svg>
<div class="container">
    <header class="header">
        <h1><fmt:message key="text.gallery.welcome" bundle="${var}"/></h1>
    </header>
    <div class="content">
        <div class="gallery">
            <ul class="gallery-pictures">
                <li class="gallery-picture">
                    <img src="../png/img/11.jpg" alt="img01">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/22.jpg" alt="img02">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/33.jpg" alt="img03">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/44.jpg" alt="img04">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/55.jpg" alt="img05">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/66.jpg" alt="img06">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/77.jpg" alt="img07">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/88.jpg" alt="img08">
                </li>
                <li class="gallery-picture">
                    <img src="../png/img/99.jpg" alt="img09">
                </li>
            </ul>
            <div class="gallery-pagination">
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
                <button class="gallery-pagination-dot"></button>
            </div>
        </div>
        <p class="iin"><fmt:message key="text.gallery.slideshow" bundle="${var}"/></p>
    </div>
</div>
<script src="../js/gallery.js"></script>
<c:import url="/jsp/util/footer.jsp"/>
</body>
</html>
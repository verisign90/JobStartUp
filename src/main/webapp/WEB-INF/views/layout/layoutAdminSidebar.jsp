<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/layout/fontstyle.css">

    <link rel="stylesheet" href="/css/layout/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/layout/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="/css/layout/style.css">

    <title>Sidebar #1</title>
</head>

<body>
<aside class="sidebar">
    <div class="toggle">
        <a href="#" class="burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
            <span></span>
        </a>
    </div>
    <div class="side-inner">

        <c:set var="userName" value='<sec:authentication property="name" />'/>
        <div class="logo-wrap">
            <div class="logo">
                <span><sec:authentication property="name" /></span>
            </div>
            <span class="logo-text"><sec:authentication property="name" /></span>
        </div>

        <div class="nav-menu">
            <ul>
                <%--                <li class="accordion">
                                    <a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false"
                                       aria-controls="collapseOne" class="collapsible">
                                        <span class="icon-home mr-3"></span>Feed
                                    </a>
                                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne">
                                        <div>
                                            <ul>
                                                <li><a href="#">News</a></li>
                                                <li><a href="#">Sport</a></li>
                                                <li><a href="#">Health</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li class="accordion">
                                    <a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
                                       aria-controls="collapseTwo" class="collapsible">
                                        <span class="icon-search2 mr-3"></span>Explore
                                    </a>

                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingOne">
                                        <div>
                                            <ul>
                                                <li><a href="#">Interior</a></li>
                                                <li><a href="#">Food</a></li>
                                                <li><a href="#">Travel</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                --%>

                <li class="active"><a class="side_a" href="${pageContext.request.contextPath}/admin/dashboard"><span
                        class="icon-pie-chart mr-3"></span>Dashboard</a></li>
                <li><a class="side_a" href="${pageContext.request.contextPath}/notice/list"><span
                        class="icon-notifications_none mr-3"></span>Notice</a></li>
                <li><a class="side_a" href="${pageContext.request.contextPath}/jobfair/list"><span
                        class="icon-format_list_bulleted mr-3"></span>JobFair</a></li>
                <li><a class="side_a" href="${pageContext.request.contextPath}/jobfair/companylist"><span
                        class="icon-business_center mr-3"></span>Entry</a></li>
                <li><a href="#"><span class="icon-check mr-3"></span>Apply</a></li>
            </ul>
        </div>
    </div>

</aside>

<script src="/js/layout/jquery-3.3.1.min.js"></script>
<script src="/js/layout/popper.min.js"></script>
<script src="/js/layout/bootstrap.min.js"></script>
<script src="/js/layout/main.js"></script>
</body>
</html>
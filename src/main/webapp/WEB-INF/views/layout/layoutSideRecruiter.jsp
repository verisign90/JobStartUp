<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<!doctype html>
<html lang="ko">
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
        <c:set var="userName">
            <sec:authentication property="name"/>
        </c:set>
        <div class="logo-wrap">
            <div class="logo">
                <span>${fn:substring(userName, 0, 1)}</span>
            </div>
            <span class="logo-text">${userName}</span>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a class="side_a" href="${cPath}/recruiter/myPage?company_no=${recruiterMyPageDTO.company_no}"><span
                        class="icon-pie-chart mr-3"></span>MY 홈</a></li>
                <li class="accordion">
                    <a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false"
                       aria-controls="collapseOne" class="collapsible">
                        <span class="icon-home mr-3"></span>MY 취업박람회
                    </a>
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne">
                        <div>
                            <ul>
                                <li><a href="#">박람회 목록</a></li>
                                <li><a href="#">박람회 신청</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="accordion">
                    <a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
                       aria-controls="collapseTwo" class="collapsible">
                        <span class="icon-home mr-3"></span>MY 채용공고
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingOne">
                        <div>
                            <ul>
                                <li><a href="#">채용공고 목록</a></li>
                                <li><a href="#">채용공고 신청</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="accordion">
                    <a href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false"
                       aria-controls="collapseThree" class="collapsible">
                        <span class="icon-home mr-3"></span>MY 채용관리
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingOne">
                        <div>
                            <ul>
                                <li><a href="#">지원자 목록</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="accordion">
                    <a href="#" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false"
                       aria-controls="collapseFour" class="collapsible">
                        <span class="icon-home mr-3"></span>MY 질의관리
                    </a>
                    <div id="collapseFour" class="collapse" aria-labelledby="headingOne">
                        <div>
                            <ul>
                                <li><a href="#">질의 목록</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</aside>
<script src="/js/layout/jquery-3.3.1.min.js"></script>
<script src="/js/layout/popper.min.js"></script>
<script src="/js/layout/bootstrap.min.js"></script>
<script src="/js/layout/main.js"></script>
<script>
    $(document).ready(function () {
        var currentPath = window.location.pathname;
        $(".side_a").each(function () {
            var linkPath = $(this).attr('href');
            if (currentPath === linkPath) {
                $(this).parent('li').addClass('active');
            } else {
                $(this).parent('li').removeClass('active');
            }
        });
    });
</script>
</body>
</html>
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
                <li><a class="side_a" href="${cPath}/seeker/mypageHome"><span
                        class="icon-home mr-3"></span>MY 홈</a></li>

                <li class="accordion">
                    <a href="${cPath}/seeker/resumeList" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false"
                       aria-controls="collapseOne" class="collapsible">
                        <span class="icon-th-list mr-3"></span>이력서
                    </a>
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne">
                        <div>
                            <ul>
                                <li><a href="${cPath}/seeker/resumeWrite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon-pencil mr-3"></span>이력서 작성</a></li>
                                <li><a href="${cPath}/seeker/resumeList">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon-settings_applications mr-3"></span>이력서 관리</a></li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li><a class="side_a" href="${cPath}/seeker/bookmarkList"><span
                        class="icon-bookmark mr-3"></span>스크랩 / 관심기업</a></li>

                <li><a class="side_a" href="${cPath}/seeker/applyStatus"><span
                        class="icon-notifications_none mr-3"></span>입사지원 현황</a></li>

                <li><a class="side_a" href="${cPath}/seeker/interviewStatus"><span
                        class="icon-schedule mr-3"></span>면접 현황</a></li>

                <li class="accordion">
                    <a href="${cPath}/seeker/memberCheck" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
                       aria-controls="collapseTwo" class="collapsible">
                        <span class="icon-person mr-3"></span>회원정보 관리
                    </a>

                    <div id="collapseTwo" class="collapse" aria-labelledby="headingOne">
                        <div>
                            <ul>
                                <li><a href="${cPath}/seeker/userInfoUpdate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon-edit mr-3"></span>개인정보 수정</a></li>
                                <li><a href="${cPath}/seeker/userPWUpdate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon-system_update mr-3"></span>비밀번호 변경</a></li>
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/sidebar.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
</head>
<body>
<div id="menu">
    <div class="hamburger">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>
    <div class="menu-inner">
        <ul class="side_menu">
            <li class="side_item">
                <div>
                    <a class="side_a" href="${pageContext.request.contextPath}/admin/dashboard">
                        대쉬보드
                    </a>
                </div>
            </li>
            <li class="side_item">
                <div class="aside_item">
                    <a class="side_a" href="${pageContext.request.contextPath}/notice/list">
                        공지 글 목록
                    </a>
                </div>
            </li>
            <li class="side_item">
                <div class="aside_item">
                    <a class="side_a" href="${pageContext.request.contextPath}/admin/jobfairlist">
                        박람회 목록
                    </a>
                </div>
            </li>
            <li class="side_item">
                <div class="aside_item">
                    <a class="side_a" href="${pageContext.request.contextPath}/admin/jobfair/companylist">
                        참여 업체 목록
                    </a>
                </div>
            </li>
            <li class="side_item">
                <div>
                    <a>
                        참여 업체 승인
                    </a>
                </div>
            </li>
            <li class="side_item">공고 목록</li>
        </ul>
    </div>


    <svg version="1.1" id="blob" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <path id="blob-path" d="M60,500H0V0h60c0,0,20,172,20,250S60,900,60,500z"/>
    </svg>
</div>
</body>
</html>
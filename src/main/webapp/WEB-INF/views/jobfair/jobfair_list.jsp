<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>JobFairList</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/chart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/board.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>
    <nav>
        <div>
            menu1
        </div>
        <div>
            menu2
        </div>
        <div>
            menu3
        </div>
        <div>
            menu4
        </div>
        <div>
            menu5
        </div>
    </nav>
    <div id="sign_button">
        <div class="sign_button_inner">
            <button>SignIn</button>
        </div>
        <div class="sign_button_inner">
            <button>SignUp</button>
        </div>
    </div>
</header>
<main>
    <aside>
        <ul>
            <li>
                대쉬보드
            </li>
            <li>
                공지글 목록
            </li>
            <li>
                박람회 목록
            </li>
            <li>
                참여 업체 목록
            </li>
            <li>
                공고 목록
            </li>
            <li>
                유료 서비스 관리
            </li>
        </ul>
    </aside>
    <article>
        <ul>
            <li class="jobfair_list">
                <div class="board_no">
                    No
                </div>
                <div class="board_title">
                    Title
                </div>
                <div class="board_date">
                    Date
                </div>
            </li>
            <c:forEach var="jobFair" items="${jobFair}">
                <hr/>
                <li class="jobfair_list">
                    <div class="board_no">${jobFair.JOBFAIR_NO}</div>
                    <div class="board_title">
                        <a href="${pageContext.request.contextPath}/admin/jobfairdetail/${jobFair.JOBFAIR_NO}">
                            <div>${jobFair.JOBFAIR_TITLE}</div>
                        </a>
                    </div>
                    <div class="board_date">${jobFair.JOBFAIR_SDATE} - ${jobFair.JOBFAIR_EDATE}</div>
                </li>
            </c:forEach>
        </ul>
    </article>
</main>
<footer>
    footer
</footer>
</body>
</html>

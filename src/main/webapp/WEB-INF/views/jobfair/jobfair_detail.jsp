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
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        대쉬보드
                    </a>
                </div>
            </li>
            <li>
                공지글 목록
            </li>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/jobfairlist">
                        박람회 목록
                    </a>
                </div>
            </li>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/jobfair/companylist">
                        참여 업체 목록
                    </a>
                </div>
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
        <div class="jobfair_info">
            <div>
                <img class="img_jobfair" src=""
                     onerror="this.src='${pageContext.request.contextPath}/img/jobfair.png'"/>
            </div>
            <div class="jobfair_info_inner">
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        title
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_TITLE}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        date
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_SDATE} - ${jobFair.JOBFAIR_EDATE}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        place
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_PLACE}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        target
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_TARGET}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        host
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_HOST}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        site
                    </div>
                    <div class="jobfair_value">
                        <a href="${jobFair.JOBFAIR_SITE}">
                            ${jobFair.JOBFAIR_SITE}
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="jobfair_content">
            ${jobFair.JOBFAIR_CONTENT}
        </div>
        <div id="registering_jobfair">
            <a href="${pageContext.request.contextPath}/admin/jobfair/delete?jobFairNo=${jobFair.JOBFAIR_NO}"
               class="button-link">
                삭제하기
            </a>
        </div>
        <div>
            <ul>
                참여 업체 목록
                <c:forEach var="entryCompany" items="${entryCompany}">
                    <hr/>
                    <li class="jobfair_list">
                        <div class="board_no">${entryCompany.COMPANY_NAME}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </article>
</main>
<footer>
    footer
</footer>
</body>
</html>

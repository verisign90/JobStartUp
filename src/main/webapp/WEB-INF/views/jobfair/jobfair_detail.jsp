<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>JobFairList</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/chart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/board.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<%@ include file="../layout/layoutNav.jsp" %>
<div id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<%@ include file="../layout/layoutSideAdmin.jsp" %>
<main>
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
            <div>
                <a href="${pageContext.request.contextPath}/admin/jobfair/edit?jobFairNo=${jobFair.JOBFAIR_NO}"
                   class="button-link">
                    수정하기
                </a>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/admin/jobfair/delete?jobFairNo=${jobFair.JOBFAIR_NO}"
                   class="button-link">
                    삭제하기
                </a>
            </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
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
<%@include file="../layout/layoutFooter.jsp" %>
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script src="/css/template/assets/js/side.js"></script>
</body>
</html>

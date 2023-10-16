<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
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
        <ul style="padding-left: 8px; margin-left: 10px;">
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
        <div id="registering_jobfair">
            <a href="${pageContext.request.contextPath}/admin/jobfair/write" class="button-link">
                등록하기
            </a>
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

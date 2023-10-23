<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Company List</title>
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
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<main>
    <article style="margin: 0 100px">
        <ul style="padding-left: 8px; margin-left: 10px;">
            <li class="jobfair_list">
                <div class="board_no">
                    번호
                </div>
                <div class="board_company">
                    참가 기업
                </div>
                <div class="board_job_fair">
                    박람회
                </div>
            </li>
            <script>
            </script>
            <c:forEach var="company" items="${company}">
                <hr/>
                <li class="jobfair_list">
                    <div class="board_no">${company.JOBFAIRENTRY_NO}</div>
                    <div class="board_company">
                        <!--<a href="${pageContext.request.contextPath}/admin/jobfairdetail/${company.COMPANY_NO}">-->
                        <div>${company.COMPANY_NAME}</div>
                        <!--</a>-->
                    </div>
                    <div class="board_job_fair">${company.JOBFAIR_TITLE}</div>
                </li>
            </c:forEach>
        </ul>
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

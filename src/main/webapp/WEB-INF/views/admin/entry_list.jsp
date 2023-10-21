<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>EntryList</title>
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
    <article>
        <ul style="padding-left: 8px; margin-left: 8px;">
            <li class="jobfair_list">
                <div class="board_no">
                    No
                </div>
                <div class="board_title">
                    JFNO
                </div>
                <div class="board_date">
                    CNO
                </div>
            </li>
            <c:forEach var="company" items="${entryCompanyList}">
                <hr/>
                <li class="jobfair_list">
                    <div class="board_no">${company.JOBFAIRENTRY_NO}</div>
                    <div class="board_title">
                        <a href="${pageContext.request.contextPath}/jobfair/detail/${company.JOBFAIR_NO}">
                            <div>${company.JOBFAIR_NO}</div>
                        </a>
                    </div>
                    <div class="board_date">${company.COMPANY_NO}</div>
                    <div id="registering_jobfair">
                        <a href="${pageContext.request.contextPath}/admin/entry/apply?jobFairEntryNo=${company.JOBFAIRENTRY_NO}" class="button-link">
                            등록하기
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="${pageContext.request.contextPath}/jobfair/list?page=${currentPage - 1}">이전</a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="pageNum">
                <c:choose>
                    <c:when test="${pageNum == currentPage}">
                        <span class="current">${pageNum}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/jobfair/list?page=${pageNum}">${pageNum}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="${pageContext.request.contextPath}/jobfair/list?page=${currentPage + 1}">다음</a>
            </c:if>
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

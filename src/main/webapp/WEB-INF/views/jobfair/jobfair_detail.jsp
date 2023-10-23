<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<div id="memberNo" data-member-no="${sessionScope.memberNo}"></div>
<div id="companyNo" data-company-no="${sessionScope.companyNo}"></div>
<%@ include file="../layout/layoutNav.jsp" %>
<div id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<main>
    <article style="margin: 200px 250px 50px;">
        <div class="jobfair_info">
            <div>
                <img class="img_jobfair" src=""
                     onerror="this.src='${pageContext.request.contextPath}/img/jobfair.png'"/>
            </div>
            <div class="jobfair_info_inner">
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        제목
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_TITLE}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        일시
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_SDATE} - ${jobFair.JOBFAIR_EDATE}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        장소
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_PLACE}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        타겟
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_TARGET}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        주관
                    </div>
                    <div class="jobfair_value">
                        ${jobFair.JOBFAIR_HOST}
                    </div>
                </div>
                <div class="jobfair_info_block">
                    <div class="jobfair_key">
                        사이트
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
            <c:if test="${sessionScope.role == 3}">
                <div>
                    <a href="${pageContext.request.contextPath}/jobfair/delete?jobFairNo=${jobFair.JOBFAIR_NO}"
                       class="button-link">
                        삭제
                    </a>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div>
                    <a href="${pageContext.request.contextPath}/jobfair/write/edit?jobFairNo=${jobFair.JOBFAIR_NO}"
                       class="button-link">
                        수정
                    </a>
                </div>
            </c:if>
            <c:if test="${sessionScope.role == 2 or sessionScope.role == 4}">
                <div>
                    <a href="${pageContext.request.contextPath}/jobfair/entry/form?jobFairNo=${jobFair.JOBFAIR_NO}">
                        참가 신청
                    </a>
                </div>
            </c:if>
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
<script>
    function jobFairEntry() {
        console.log("entry");
        const data = new URLSearchParams();
        const JFNO = '${jobfair_no}'
        var memberNo = document.getElementById("memberNo").getAttribute("data-member-no");
        var companyNo = document.getElementById("companyNo").getAttribute("data-company-no");
        const loggedInUserId = '<sec:authentication property="name" />';
        data.append('jobFairNo', JFNO);
        data.append('memberNo', memberNo);
        data.append('companyNo', companyNo);

        fetch('/jobfair/entry', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: data
        })
            .then(response => response.text())
            .then(text => {
                console.log(text);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>
</body>
</html>

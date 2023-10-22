<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/status.css" type="text/css"/>
    <title>JOB START UP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<header>
    <%@ include file="../../layout/layoutNav.jsp" %>
    <div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
        </div>
    </div>
</header>
<%@ include file="../../layout/layoutSideSeeker.jsp" %>
<main>
    <div class="wrap">
        <h3 class="resume_title mb-3">면접일정 조회</h3>

        <div class="tab-content bg-transparent">
            <div id="note-full-container" class="note-has-grid row">
                <div class="col-md-4 single-note-item all-category" style="">
                    <c:if test="${todayList != null}">
                        <div class="container d-flex">
                            <c:forEach items="${todayList}" var="todayInterview">
                            <c:forEach items="${todayInterview.companyDTOList}" var="company">
                                <div class="card card-body mx-2">
                                    <span class="side-stick"></span>
                                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">${company.company_name} <i class="point fa fa-circle ml-1 font-10"></i></h5>
                                    <p class="note-date font-12 text-muted">
                                        <fmt:formatDate value="${todayInterview.interview_date}" pattern="yyyy/MM/dd" var="formattedDate" />
                                        ${formattedDate}
                                    </p>
                                    <div class="note-content">
                                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">${member.member_name}님의 합격을 응원합니다 !</p>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div class="ml-auto">
                                            <div class="category-selector btn-group">
                                                <a class="nav-link dropdown-toggle category-dropdown label-group p-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">
                                                    <div class="category">
                                                        <div class="category-business"></div>
                                                        <div class="category-social"></div>
                                                        <div class="category-important"></div>
                                                        <span class="more-options text-dark"><i class="icon-options-vertical"></i></span>
                                                    </div>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right category-menu">
                                                    <a class="note-business badge-group-item badge-business dropdown-item position-relative category-business text-success" href="javascript:void(0);">
                                                        <i class="mdi mdi-checkbox-blank-circle-outline mr-1"></i>Business
                                                    </a>
                                                    <a class="note-social badge-group-item badge-social dropdown-item position-relative category-social text-info" href="javascript:void(0);">
                                                        <i class="mdi mdi-checkbox-blank-circle-outline mr-1"></i> Social
                                                    </a>
                                                    <a class="note-important badge-group-item badge-important dropdown-item position-relative category-important text-danger" href="javascript:void(0);">
                                                        <i class="mdi mdi-checkbox-blank-circle-outline mr-1"></i> Important
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <c:forEach var="result" items="${statusResult}">
            <c:forEach var="resume" items="${result.resumeDTOList}">
                <c:if test="${result.interview_date != null}">
                <li class="resume_item">
                        <span><a href="${cPath}/seeker/resumeDetail/${result.posting_no}">공고제목</a>
                        <div><a href="${cPath}/seeker/resumeDetail/${result.resume_no}">이력서 보러가기 ${resume.resume_title}</a></div>
                        </span>
                        <span>
                            <button class="modifyBtn" type="button">
                                <fmt:formatDate value="${result.interview_date}" pattern="yyyy/MM/dd" var="formattedDate" />
                                ${formattedDate}
                            </button>
                        </span>
                </li>
                </c:if>
            </c:forEach>
        </c:forEach>
    </div>

</main>
    <%@ include file="../../layout/layoutFooter.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/css/template/assets/js/side.js"></script>
</body>
</html>

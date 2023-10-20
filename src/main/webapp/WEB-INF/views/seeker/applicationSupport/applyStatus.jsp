<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/list.css" type="text/css"/>
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
    <div class="resume_wrap">
        <h3 class="resume_title">입사지원 현황</h3>
        <c:forEach var="result" items="${statusResult}">
            <c:forEach var="resume" items="${result.resumeDTOList}">
                <li class="resume_item">
                    <span><a href="${cPath}/seeker/resumeDetail/${result.resume_no}">${resume.resume_title}</a></span>
                    <span>
                    <c:set var="statusMessage">
                        <c:choose>
                            <c:when test="${result.first_pass == 'N' and result.final_pass == 'N' and result.interview_date == null}">
                                지원완료
                            </c:when>
                            <c:when test="${result.first_pass == 'Y' and result.final_pass == 'N' and result.interview_date == null}">
                                서류통과
                            </c:when>
                            <c:when test="${result.first_pass == 'F' and result.final_pass == 'N' and result.interview_date == null}">
                                불합격
                            </c:when>
                            <c:when test="${result.first_pass == 'Y' and result.final_pass == 'Y' and result.interview_date == null}">
                                최종합격
                            </c:when>
                            <c:when test="${result.interview_date != null}">
                                면접일자 확인
                            </c:when>
                        </c:choose>
                    </c:set>
                    <button class="modifyBtn" type="button">${statusMessage}</button>
                </span>
                </li>
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

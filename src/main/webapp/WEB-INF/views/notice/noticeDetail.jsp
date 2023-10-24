<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Notice List</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/common/base.css" type="text/css">
    <link rel="stylesheet" href="/css/notice/detail.css" type="text/css">
</head>
<body>
<!-- ***** Nav start ***** -->
<%@ include file="../layout/layoutNav.jsp" %>
<div id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<!-- ***** Nav End ***** -->
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<article class="post">
   <h3>게시글 보기</h3>
    <section class="contents">
        <section class="view">
            <h5 class="centerClass"><small>[${noticeDTO.not_category}]</small>&nbsp${noticeDTO.not_title}</h5>
            <section class="posting">
                <div class="date">
                    <c:if test="${!empty noticeDTO.not_modDate}">
                        <h7><fmt:parseDate value="${noticeDTO.not_modDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                           var="parsedDateTime" type="both"/>
                            <fmt:formatDate value="${parsedDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/></h7>
                    </c:if>
                    <c:if test="${empty noticeDTO.not_modDate}">
                    <h7><fmt:parseDate value="${noticeDTO.not_regDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                       var="parsedDateTime" type="both"/>
                        <fmt:formatDate value="${parsedDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/></h7>
                    </c:if>
                </div>

                <div class="content">${noticeDTO.not_content}</div>

                <div class="file">
                    <c:if test="${!empty noticeDTO.fileDTOList}">
                        <c:forEach var="file" items="${noticeDTO.fileDTOList}">
                            <span id="img"><img src="${cPath}/image/notice/${file.notFile_savName}"
                                                style="width:500px;"/></span>
                        </c:forEach>
                    </c:if>
                </div>
            </section>
        </section>
    </section>
    <div class="btnDiv">
        <p class="btnP">
            <span><a class="subBtn" href="/notice/list">목록가기</a></span>
            <span><a class="subBtn" href="/notice/modify/${noticeDTO.not_no}">수정하기</a></span>
            <span><a class="subBtn" href="/notice/delete/${noticeDTO.not_no}">삭제하기</a></span>
        </p>
    </div>
</article>
<!-- Footer start -->
<%@ include file="../layout/layoutFooter.jsp" %>
<!-- Footer end -->

<script src="${cPath}/css/template/vendor/jquery/jquery.min.js"></script>
<script src="${cPath}/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${cPath}/css/template/assets/js/owl-carousel.js"></script>
<script src="${cPath}/css/template/assets/js/animation.js"></script>
<script src="${cPath}/css/template/assets/js/imagesloaded.js"></script>
<script src="${cPath}/css/template/assets/js/popup.js"></script>
<script src="${cPath}/css/template/assets/js/custom.js"></script>
<script src="${cPath}/css/template/assets/js/side.js"></script>
</body>
</html>

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
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<article class="post">
    <section class="contents">
        <h4>게시글 보기</h4>
        <section class="view">
            <h3><small>[${noticeDTO.not_category}]</small>&nbsp${noticeDTO.not_title}</h3>
            <section class="posting">
                <div class="date">
                    <c:if test="${!empty noticeDTO.not_modDate}">
                        <h5><fmt:parseDate value="${noticeDTO.not_modDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                           var="parsedDateTime" type="both"/>
                            <fmt:formatDate value="${parsedDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/></h5>
                    </c:if>
                    <h5><fmt:parseDate value="${noticeDTO.not_regDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                       var="parsedDateTime" type="both"/>
                        <fmt:formatDate value="${parsedDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/></h5>
                </div>

                <div class="content">${noticeDTO.not_content}</div>

                <div class="file">
                    <c:if test="${!empty noticeDTO.fileDTOList}">
                        <c:forEach var="file" items="${noticeDTO.fileDTOList}">
                            <span id="img"><img src="${cPath}/image/notice/${file.notFile_savName}"
                                                style="width:300px;"/></span>
                        </c:forEach>
                    </c:if>
                </div>
            </section>
        </section>
    </section>
    <div class="btn">
        <button type="button" name="list"><a href="/notice/list">목록가기</a></button>
        <button type="button" name="modify"><a href="/notice/modify/${noticeDTO.not_no}">수정하기</a></button>
        <button type="submit" type="button" name="delete"><a href="/notice/delete/${noticeDTO.not_no}">삭제하기</a></button>
    </div>
</article>
</body>
</html>

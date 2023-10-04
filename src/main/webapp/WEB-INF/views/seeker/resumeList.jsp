<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Job Start Up/이력서 목록</title>
</head>
<body>
    ${resumeList}

    <table id="resumeListTable" border="1" class="">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
        </tr>
        </thead>
        <tbody>
        <%-- 게시글이 존재하지 않는 경우 --%>
        <c:if test="${empty resumeList }">
            <tr>
                <td colspan="5">지금 이력서를 작성해보세요 !</td>
            </tr>
        </c:if>

        <%-- 게시글이 존재하는 경우, 게시글수만큼 반복 출력 --%>
        <c:if test="${not empty resumeList }">
            <c:forEach var="resume" items="${resumeList}">
                <tr>
                    <th>${resume.resume_no}</th>
                    <th><a href="${cPath}/seeker/resumeDetail?resume_no=${resume.resume_no}">${resume.resume_title}</a></th>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</body>
</html>

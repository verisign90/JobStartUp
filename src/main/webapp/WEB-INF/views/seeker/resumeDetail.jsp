<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Jop Start Up</title>
</head>
<body>
    ${resumeDetail}
    <a href="${cPath }/seeker/resumeModify"><button type="button">수정</button></a>
    <a href="${cPath }/seeker/resumeDelete?resume_no=${resumeDetail.resume_no}"><button type="button">삭제</button></a>
</body>
</html>

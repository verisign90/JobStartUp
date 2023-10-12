<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>마이페이지/스크랩목록</title>
</head>
<body>
    ${bookmarkListResult}
</body>
</html>

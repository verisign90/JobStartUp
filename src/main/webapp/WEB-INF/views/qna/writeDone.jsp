<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Question</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/common/base.css" type="text/css">
    <link rel="stylesheet" href="/css/qna/list.css" type="text/css">
</head>
<body>
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<article class="done">
    <section class="contents">
        <h4>문의 완료</h4>
        <div class="donepic">
            <img src="https://cdn-icons-png.flaticon.com/512/1042/1042010.png" alt="문의 완료">
        </div>
        <h3>문의가 정상적으로 등록되었습니다.<br>이용해주셔서 감사합니다.</h3>
        <p>영업일 기준으로 3일 이내에 답변드립니다.</p>
        <div>
            <button type="button" name="home">홈으로</button>
            <button type="button" name="go">나의 문의 목록</button>
        </div>
    </section>
</article>
</body>
</html>

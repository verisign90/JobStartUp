<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>
    <nav>
        nav
    </nav>
</header>
<main>
    <aside>
        <div>
            대쉬보드
        </div>
        <div>
            공지글 목록
            <!--등록/검색/수정/삭제-->
        </div>
        <div>
            박람회 목록
            <!--등록/검색/수정/삭제-->
            <div>
                참여 업체 목록
                <!--등록/검색/수정/삭제-->
            </div>
        </div>
        <div>
            공고 목록
            <!--등록/검색/수정/삭제-->
        </div>
        <div>
            유료 서비스 관리
        </div>
    </aside>
    <article>
        main_article
        <c:forEach var="sample" items="${sampleDTOs}">
            <tr>
                <td>${sample.id}</td>
                <td>${sample.password}</td>
            </tr>
        </c:forEach>
    </article>
</main>
<footer>
    footer
</footer>
</body>
</html>

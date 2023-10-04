<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>NoticeList</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/chart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/board.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
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
        <table>
            <c:forEach var="notice" items="${notice}">
                <tr>
                    <td id="board_no">${notice.NOT_NO}</td>
                    <td id="board_title">${notice.NOT_TITLE}</td>
                    <td id="board_date">${notice.NOT_REGDATE}</td>
                </tr>
            </c:forEach>
        </table>
    </article>
</main>
<footer>
    footer
</footer>
</body>
</html>

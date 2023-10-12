<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Title</title>
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
        main_sidebar
    </aside>
    <article>
        <section>
            <div>
                <h2>채용정보</h2>
            </div>
            <c:forEach var="board" items="${.content}">
                <div>
                    <div>
                        <div>
                            <h2><a href="#" target="_blank" title="${JPlist.posting_title}"></a></h2>
                            <div>
                                <span>지역${#}</span>
                                <span>경력${JPlist.posting_career}</span>
                                <span>학력${JPlist.poting_academy}</span>
                                <span>근무형태${JPlist.posting_labor}</span>
                                <span>연봉${JPlist.posting_salary}</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <strong><a>기업이름${company_name}</a></strong>
                </div>
            </c:forEach>
        </section>

    </article>
</main>
<footer>
    footer
</footer>
</body>
</html>

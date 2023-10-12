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
                <a href="#" title="" class="companyName" target="_blank"
                   onclick="window.open(this.href, ''); return false;">기업이름<</a>

            </div>
            <div>
                <h1>${JPdetail.posting_titel}</h1>
            </div>
        </section>
        <section>
            <div>
                <div>
                    <dl>
                        <dt>경력</dt>
                        <dd>${JPdetail.posting_career}</dd>
                    </dl>
                    <dl>
                        <dt>학력</dt>
                        <dd>${JPdetail.posting_academy}</dd>
                    </dl>
                    <dl>
                        <dt>근무형태</dt>
                        <dd>${JPdetail.posting_labor}</dd>
                    </dl>
                </div>
            </div>
        </section>
        <section>
            <div>
                <div>
                    <dl>
                        <dt>급여</dt>
                        <dd>${JPdetail.posting_salary}</dd>
                    </dl>
                    <dl>
                        <dt>근무일시</dt>
                        <dd>${JPdetail.posting_working_day}</dd>
                    </dl>
                    <dl>
                        <dt>근무지역</dt>
                        <dd></dd>
                    </dl>
                </div>
            </div>
        </section>

    </article>
</main>
<footer>
    footer
</footer>
</body>
</html>

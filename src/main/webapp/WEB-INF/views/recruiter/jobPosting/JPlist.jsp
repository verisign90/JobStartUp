<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPlist.css">
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">--%>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout/layout.css">--%>

    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">

    <title>Title</title>
</head>
<body>
<header>
    <!-- ***** Nav start ***** -->
    <nav>
        <%@ include file="../../layout/layoutNav.jsp" %>
    </nav>
    <!-- ***** Nav End ***** -->
</header>
<main>
    <article class="all-content">
        <section>
            <div>
                <h2>채용정보</h2>
            </div>
            <%--<c:forEach var="JPlist" items="${JPlist}">--%>
            <c:forEach var="jobPosting" items="${JPlist}">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="service-item first-service">
                                <h4><a href="${cPath}/recruiter/JPdetail/${jobPosting.posting_no}" target="_blank"
                                       title="${jobPosting.posting_title}">${jobPosting.posting_title}</a></h4>
                                <div>
                                    <%--<span>${JPlist.company_address_detail}</span>--%>
                                    <span>${fn:substring(jobPosting.company_address_detail, 0, 6)}</span>
                                    <span>${jobPosting.posting_career}</span>
                                    <span>${jobPosting.posting_academy}</span>
                                    <span>${jobPosting.posting_labor}</span>
                                    <span>${jobPosting.posting_salary}</span>
                                    <span>
                                        <strong><a>${jobPosting.company_name}</a></strong>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </section>

    </article>
</main>
<footer>
    footer
</footer>
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
</body>
</html>

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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
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
<main class="all-content">

    <ul class="webtong_tab_type03">
        <li class="dropdown">
            <a href="#" class="dropbtn">지역</a>
            <span class="dropdown-content">
                    <c:forEach items="${upperLoc}" var="upLoc">
                        <div class="checkbox-wrapper" onclick="toggleCheckbox(this)">
                            <input type="checkbox" name="upperLoc" id="${upLoc.detail_code_num}" value="${upLoc.detail_code_num}">
                            <span class="loc-detail-name">${upLoc.detail_name}</span>
                        </div>
                    </c:forEach>
            </span>
        </li>
        <li><a href="/#">개인회원</a></li>

        <li class="searchContainer">
            <div class="searchWrapper">
                <input type="text" id="searchInput" placeholder="검색어 입력">
            </div>
        </li>
    </ul>


    <article class="article-content">
        <section>
            <div>
                <h2>채용정보</h2>
            </div>


            <%--<c:forEach var="JPlist" items="${JPlist}">--%>
            <c:forEach var="jobPosting" items="${JPlist}">
                <input type="hidden" id="posting_swork" name="posting_swork">
                <input type="hidden" id="posting_ework" name="posting_ework">
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
    <%--<%@ include file="../../layout/layoutFooter.jsp" %>--%>
</footer>

<script>
    function toggleCheckbox(element) {
        var checkbox = element.querySelector('input[type="checkbox"]');
        checkbox.checked = !checkbox.checked;
    }
</script>
<script>
    var dropdown = document.querySelector('.dropdown');

    dropdown.addEventListener('click', function() {
        this.classList.toggle('active');

        var dropdownContent = this.querySelector('.dropdown-content');

        if (this.classList.contains('active')) {
            dropdownContent.style.display = 'block';

            // 드롭다운 내부의 스크롤을 마우스로 조작 가능하도록 설정합니다.
            dropdownContent.style.overflowY = 'auto';

            // 이벤트 전파를 막아 클릭 시 드롭다운이 닫히지 않도록 합니다.
            dropdownContent.addEventListener('click', function(event) {
                event.stopPropagation();
            });
        } else {
            dropdownContent.style.display = 'none';
        }
    });

    window.addEventListener('click', function(event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.querySelectorAll('.dropdown');

            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];

                if (openDropdown.classList.contains('active')) {
                    openDropdown.classList.remove('active');
                    openDropdown.querySelector('.dropdown-content').style.display = 'none';
                }
            }
        }
    });
</script>
<script>
    function toggleCheckbox(element) {
        var checkbox = element.querySelector('input[type="checkbox"]');
        checkbox.checked = !checkbox.checked;

        var locDetailName = element.querySelector('.loc-detail-name');
        locDetailName.classList.toggle('selected');
    }
</script>

<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script>
    $(document).ready(function () {
        $('#searchInput').on('focus', function () {
            $('.input_placeholder').hide();
        });

        $('#searchInput').on('blur', function () {
            if ($(this).val().length == 0)
                $('.input_placeholder').show();
        });

        $('.input_placeholder').click(function () {
            $('#searchInput').focus();
        });
    });
</script>
</body>
</html>

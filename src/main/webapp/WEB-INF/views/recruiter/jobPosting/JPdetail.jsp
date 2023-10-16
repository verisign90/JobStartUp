<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPdetail.css">


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
    <%--<div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>--%>
    <!-- ***** Nav start ***** -->
    <%@ include file="../../layout/layoutNav.jsp" %>
    <!-- ***** Nav End ***** -->
</header>
<main>
    <article class="all-content">
        <section>
            <div>
                <a href="#" title="" class="companyName" target="_blank"
                   onclick="window.open(this.href, ''); return false;">기업이름</a>
            </div>
            <div>
                <div>
                    <a href="#" title="회사이름" class="company-name" target="_blank">${JPdetail.company_name}</a>
                    <h1>${JPdetail.posting_title}</h1>
                    <button class="btn" title="클릭하면 입사지원 할수있습니다">입사지원</button>
                    <div>
                        <!-- 수정 버튼 -->
                        <a href="${cPath}/recruiter/modify/${JPdetail.posting_no}" class="btn btn-primary">수정</a>
                        <%--<button type="button" class="btn btn-primary" name="modify"><a href="/recruiter/modify/${jobPosting.posting_no}">수정하기</a></button>--%>
                        <!-- 삭제 버튼 -->
                        <a href="${cPath}/recruiter/delete/${jobPosting.posting_no}" class="btn btn-danger">삭제</a>

                        <%-- 민용님 제 스크랩 버튼 놓고갑니다 --%>
                        <div class="bookmark-item"
                             data-posting-no="${postingNo}"
                             data-member-no="${memberNo}">
                            <button class="btn btn-light bookmark-button" style="/*background-color: transparent; border: #0d6efd; */padding: 10px;">
                                <img class="bookmark-image" src="${cPath}/img/empty_star.png" style="width: 20px;" alt=""/> 스크랩
                            </button>
                        </div>

                        <%-- 기업팔로우 버튼 --%>
                        <div class="follow-item"
                             data-company-no="${JPdetail.company_no}"
                             data-member-no="${memberNo}">
                            <button class="follow-button" style="background-color: transparent; border: none;">
                                <img class="follow-image" src="${cPath}/img/status_unfollow.png" style="width: 20px;" alt=""/>
                            </button>
                        </div>
                        <a href="${cPath}/recruiter/delete/${JPdetail.posting_no}" class="btn btn-danger">삭제</a>
                    </div>
                </div>
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
                        <%--<dd>${fn:substring(JPdetail.company_address_detail, 0, 6)}</dd>--%>
                    </dl>
                </div>
            </div>
        </section>
        <section>
            <div>
                <div>
                    ${JPdetail.posting_content}
                </div>
            </div>
        </section>

    </article>
</main>
<footer>
    footer
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $(".bookmark-item").each(function () {
            const item = $(this);
            const posting_no = item.data("posting-no");
            const member_no = item.data("member-no");
            const bookmarkImage = item.find('.bookmark-image')[0];

            $.get("${cPath}/seeker/checkBookmark", {
                posting_no: posting_no,
                member_no: member_no,
            }, function (data) {
                if (data) {
                    // 북마크 되어 있는 경우
                    bookmarkImage.src = "${cPath}/img/star.png";
                } else {
                    // 북마크 되어 있지 않은 경우
                    bookmarkImage.src = "${cPath}/img/empty_star.png";
                }
            });
        });

        $(".follow-item").each(function () {
            const item = $(this);
            const company_no = item.data("company-no");
            const member_no = item.data("member-no");
            const followImage = item.find('.follow-image')[0];

            $.get("${cPath}/seeker/checkFollow", {
                member_no: member_no,
                company_no: company_no
            }, function (data) {
                if (data) {
                    // 북마크 되어 있는 경우
                    followImage.src = "${cPath}/img/status_follow.png";
                } else {
                    // 북마크 되어 있지 않은 경우
                    followImage.src = "${cPath}/img/status_unfollow.png";
                }
            });
        });
    });

    $(".bookmark-button").on("click", function() {
        const item = $(this).closest(".bookmark-item");
        const posting_no = item.data("posting-no");
        const member_no = item.data("member-no");
        const bookmarkImage = item.find('.bookmark-image')[0];

        const isBookmarked = bookmarkImage.src.endsWith('/img/star.png');

        $.ajax({
            type: "GET",
            url: "${cPath}/seeker/postBookmark",
            data: {
                isBookmarked: isBookmarked,
                posting_no: posting_no,
                member_no: member_no,
            },
            success: function (response) {
                if (response === "inserted") {
                    bookmarkImage.src = "${cPath}/img/star.png";
                } else if (response === "deleted") {
                    bookmarkImage.src = "${cPath}/img/empty_star.png";
                }
            }
        });
    });

    $(".follow-button").on("click", function() {
        const item = $(this).closest(".follow-item");
        const member_no = item.data("member-no");
        const company_no = item.data("company-no");
        const followImage = item.find('.follow-image')[0];

        const isFollow = followImage.src.endsWith('/status_follow.png');

        $.ajax({
            type: "GET",
            url: "${cPath}/seeker/companyFollow",
            data: {
                isFollow: isFollow,
                member_no: member_no,
                company_no: company_no
            },
            success: function (response) {
                if (response === "inserted") {
                    followImage.src = "${cPath}/img/status_follow.png";
                } else if (response === "deleted") {
                    followImage.src = "${cPath}/img/status_unfollow.png";
                }
            }
        });
    });
</script>

<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
</body>
</html>

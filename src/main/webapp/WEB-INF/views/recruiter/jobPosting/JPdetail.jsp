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
                        <a href="${cPath}/recruiter/JPmodify/${JPdetail.posting_no}" class="btn btn-primary">수정</a>

                        <!-- 삭제 버튼 -->
                        <a href="${cPath}/recruiter/JPdelete/${JPdetail.posting_no}" class="btn btn-danger">삭제</a>

                        <%-- 민용님 제 스크랩 버튼 놓고갑니다 --%>
                        <div class="bookmark-item"
                             data-posting-no="${postingNo}"
                             data-member-no="${memberNo}">
                            <button class="btn btn-light bookmark-button"
                                    style="/*background-color: transparent; border: #0d6efd; */padding: 10px;">
                                <img class="bookmark-image" src="${cPath}/img/empty_star.png" style="width: 20px;"
                                     alt=""/> 스크랩
                            </button>
                        </div>

                        <%-- 기업팔로우 버튼 --%>
                        <div class="follow-item"
                             data-company-no="${JPdetail.company_no}"
                             data-member-no="${memberNo}">
                            <button class="follow-button" style="background-color: transparent; border: none;">
                                <img class="follow-image" src="${cPath}/img/status_unfollow.png" style="width: 20px;"
                                     alt=""/>
                            </button>
                        </div>
                    </div>
                    <!-- 버튼을 클릭하여 모달을 열도록 합니다. -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                        지원하기
                    </button>

                    <form id="applyForm" action="#" method="post">
                        <!-- 모달 창 -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <!-- 모달 헤더 -->
                                    <div class="modal-header">
                                        <h5 class="modal-title">지원하기</h5>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- 모달 본문 -->
                                    <div class="modal-body">
                                        <button><a href="${cPath}/seeker/resumeWrite">이력서 작성</a></button>
                                        <c:forEach items="${resumeList}" var="resume">
                                            <div class="resume_list_wrap">
                                                <ul class="resume_list">
                                                    <li class="resume_item">
                                                        <input class="member-no" type="hidden" value="${resume.member_no}">
                                                        <input class="posting-no" type="hidden" value="${postingNo}">
                                                        <span><a href="${cPath}/seeker/resumeDetail/${resume.resume_no}">${resume.resume_title}</a></span>
                                                        <span><input class="modifyBtn" type="checkbox" name="resume_no" id="resume_no" value="${resume.resume_no}"></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- 모달 하단 -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                        <input type="submit" class="modifyBtn" value="지원하기">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
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
                        <dd>
                            <span>${JPdetail.posting_working_day}</span>
                            <span>${JPdetail.posting_swork}</span> ~
                            <span>${JPdetail.posting_ework}</span>
                        </dd>
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

</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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

    $(".bookmark-button").on("click", function () {
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

    $(".follow-button").on("click", function () {
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

    $("#applyForm").on("submit", function(event) {
        event.preventDefault(); // 폼의 기본 동작 중단

        // 선택한 이력서의 값을 가져옵니다.
        const selectedResume = $("input[name='resume_no']:checked").val();
        const posting_no = $(".posting-no").val();
        const member_no = $(".member-no").val();

        console.log("posting_no", posting_no);
        console.log(member_no);

        if (selectedResume) {
            // 선택한 이력서 값을 서버로 전달
            $.ajax({
                type: "POST",
                url: "${cPath}/seeker/resumeApply",
                data: {
                    member_no: member_no, // 로그인한 회원의 고유 ID
                    posting_no: posting_no, // 공고의 고유 ID
                    resume_no: selectedResume // 선택한 이력서의 고유 ID
                },
                success: function(response) {
                    // 요청이 성공하면 적절한 처리를 수행
                    // 예를 들어, 성공 페이지로 리다이렉트
                    window.location.href = "${cPath}/seeker/resumeApplyDone";
                },
                error: function(error) {
                    // 요청이 실패하면 적절한 오류 처리
                    console.error("에러 발생: " + error);
                }
            });
        } else {
            alert("이력서를 선택해주세요."); // 이력서가 선택되지 않은 경우 경고 메시지 표시
        }
    });

</script>

<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>

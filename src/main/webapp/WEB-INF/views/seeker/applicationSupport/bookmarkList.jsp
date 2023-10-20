<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/list.css" type="text/css"/>
    <title>마이페이지/스크랩목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<header>
    <%@ include file="../../layout/layoutNav.jsp" %>
    <div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
        </div>
    </div>
</header>
<%@ include file="../../layout/layoutSideSeeker.jsp" %>
<main>
    <div class="resume_wrap">
        <h3 class="resume_title">스크랩 / 관심기업</h3>
        <div class="d-flex justify-content-start">
            <a href="${cPath}/seeker/bookmarkList"><button class="btn-md mx-2 text-dark fw-bold border-0" style="background-color:transparent;">스크랩<span>${bookmarkCnt}</span></button></a>
            <a href="${cPath}/seeker/companyFollowList"><button class="btn-md text-dark fw-bold border-0" style="background-color:transparent;">관심기업<span>${followCnt}</span></button></a>
        </div>
        <c:forEach var="bookmark" items="${bookmarkListResult}">
            <c:forEach var="jobPost" items="${bookmark.jobPostingDTOList}">
                <div class="resume_list_wrap">
                    <ul class="resume_list">
                        <li class="resume_item">
                            <span><a href="${cPath}/seeker/resumeDetail/${bookmark.posting_no}">${jobPost.posting_title}</a></span>
                            <div class="bookmark-item"
                                 data-jpbookmark-no="${bookmark.jpbookmark_no}"
                                 data-posting-no="${bookmark.posting_no}"
                                 data-member-no="${bookmark.member_no}">
                                <button class="btn btn-light bookmark-button" style="/*background-color: transparent; border: #0d6efd; */padding: 10px;">
                                    <img class="bookmark-image" src="${cPath}/img/empty_star.png" style="width: 20px;" alt=""/> 스크랩
                                </button>
                            </div>
                        </li>
                    </ul>
                </div>



            </c:forEach>
        </c:forEach>
    </div>
</main>
<footer>
    <%@ include file="../../layout/layoutFooter.jsp" %>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/css/template/assets/js/side.js"></script>
<script>
    $(document).ready(function () {
        $(".bookmark-item").each(function () {
            const item = $(this);
            const posting_no = item.data("posting-no");
            const member_no = item.data("member-no");
            const bookmarkImage = item.find('.bookmark-image')[0];

            $.get("/seeker/checkBookmark", {
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
</script>
</body>
</html>

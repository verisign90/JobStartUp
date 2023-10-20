<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/list.css" type="text/css"/>
    <title>관심기업 목록</title>
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
        <c:forEach var="follow" items="${companyFollowResult}">
                <li class="resume_item">
                    <span><a href="${cPath}/seeker/resumeDetail/${follow.company_no}">${follow.company_no}</a></span>
                    <div class="follow-item"
                         data-company-no="${follow.company_no}"
                         data-member-no="${memberNo}">
                        <button class="follow-button" style="background-color: transparent; border: none;">
                            <img class="follow-image" src="${cPath}/img/status_unfollow.png" style="width: 20px;" alt=""/>
                        </button>
                    </div>
                </li>
        </c:forEach>
    </div>
</main>
<footer>
    <%@ include file="../../layout/layoutFooter.jsp" %>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/css/template/assets/js/side.js"></script>
<script>
    $(document).ready(function () {
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
</body>
</html>

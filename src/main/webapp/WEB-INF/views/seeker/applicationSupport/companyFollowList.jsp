<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>관심기업 목록</title>
</head>
<body>
    ${companyFollowResult}
    <c:forEach var="follow" items="${companyFollowResult}">
        <div class="follow-item"
             data-follow-no="${follow.follow_no}"
             data-company-no="${follow.company_no}"
             data-member-no="${follow.member_no}">
            <button class="follow-button" style="background-color: transparent; border: none;">
                <img class="follow-image" src="${cPath}/img/unfollow.png" style="width: 20px;" alt=""/>
            </button>
        </div>
    </c:forEach>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function () {
            $(".follow-item").each(function () {
                const item = $(this);
                const follow_no = item.data("follow-no");
                const company_no = item.data("company-no");
                const member_no = item.data("member-no");
                const followImage = item.find('.follow-image')[0];

                $.get("/seeker/checkFollow", {
                    follow_no: follow_no,
                    member_no: member_no,
                    company_no: company_no
                }, function (data) {
                    if (data) {
                        // 북마크 되어 있는 경우
                        followImage.src = "${cPath}/img/follow.png";
                    } else {
                        // 북마크 되어 있지 않은 경우
                        followImage.src = "${cPath}/img/unfollow.png";
                    }
                });
            });
        });

        $(".follow-button").on("click", function() {
            const item = $(this).closest(".follow-item");
            const follow_no = item.data("follow-no");
            const member_no = item.data("member-no");
            const company_no = item.data("company-no");
            const followImage = item.find('.follow-image')[0];

            const isFollow = followImage.src.endsWith('/follow.png');

            $.ajax({
                type: "GET",
                url: "${cPath}/seeker/companyFollow",
                data: {
                    isFollow: isFollow,
                    follow_no: follow_no,
                    member_no: member_no,
                    company_no: company_no
                },
                success: function (response) {
                    if (response === "inserted") {
                        followImage.src = "${cPath}/img/follow.png";
                    } else if (response === "deleted") {
                        followImage.src = "${cPath}/img/unfollow.png";
                    }
                }
            });
        });

    </script>
</body>
</html>

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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>마이페이지/스크랩목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
${bookmarkListResult}
<c:forEach var="bookmark" items="${bookmarkListResult}">
    <div class="bookmark-item"
         data-jpbookmark-no="${bookmark.jpbookmark_no}"
         data-posting-no="${bookmark.posting_no}"
         data-member-no="${bookmark.member_no}">
        <button class="btn btn-light bookmark-button" style="/*background-color: transparent; border: #0d6efd; */padding: 10px;">
            <img class="bookmark-image" src="${cPath}/img/empty_star.png" style="width: 20px;" alt=""/> 스크랩
        </button>
    </div>
</c:forEach>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${cPath}/js/seeker/applicationSupport/postDetail.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>

<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
</head>
<body>
<h2>비밀번호 재설정</h2>
<form action="/member/updateCompanyPassword" method="post">
    <label for="newPassword">새 비밀번호:</label>
    <input type="password" id="newPassword" name="newPassword" required><br><br>

    <label for="confirmPassword">비밀번호 확인:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>

    <input type="hidden" name="memberId" value="${member.member_id}">

    <input type="submit" value="비밀번호 변경">
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $("form").on("submit", function (event) {
            event.preventDefault();

            var formData = $(this).serialize();

            $.post("/member/updateCompanyPassword", formData, function (response) {
                alert(response);
                window.location.href = 'http://localhost:8050/';
            }).fail(function (jqXHR) {
                alert(jqXHR.responseText);
            });
        });
    });
</script>
</body>
</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>비밀번호 재설정</title>
    <link href="/css/member/idpw.css" rel="stylesheet" type="text/css">
</head>
<body>
<article class="hero">
<h2>비밀번호 재설정</h2>
     <div class="login wrap">
        <div class="login-html">
         <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">비밀번호 재설정</label>
         <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab" style="display: none;">비밀번호 찾기</label>
            <div class="login-form">
                <div class="sign-in-htm">
                    <form action="/member/updatePassword" method="post">
                        <div class="group">
                            <!-- <label for="newPassword">새 비밀번호:</label> -->
                            <input type="password" id="newPassword" name="newPassword" class="input" placeholder="새 비밀번호" required>
                        </div>
                        <div class="group">
                            <!-- <label for="confirmPassword">비밀번호 확인:</label> -->
                            <input type="password" id="confirmPassword" name="confirmPassword" class="input" placeholder="비밀번호 확인" required>
                        </div>
                        <div class="group">
                            <input type="hidden" name="memberId" value="${member.member_id}">
                            <button type="submit" class="button">비밀번호 변경</button>
                        </div>
                    </form>
                    <div class="hr"></div>
                </div>
            </div>
        </div>
     </div>
</article>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $("form").on("submit", function (event) {
            event.preventDefault();

            var formData = $(this).serialize();

            $.post("/member/updatePassword", formData, function (response) {
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
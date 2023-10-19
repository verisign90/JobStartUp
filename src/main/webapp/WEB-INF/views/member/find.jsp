<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기</title>
    <script>
        function navigateTo(url) {
            window.location.href = url;
        }
    </script>
</head>
<body>
    <h2>아이디/비밀번호 찾기</h2>

    <div>
        <h3>개인회원</h3>
        <button onclick="navigateTo('/findPersonId')">아이디 찾기</button>
        <button onclick="navigateTo('/findPersonPassword')">비밀번호 찾기</button>
    </div>

    <div>
        <h3>기업회원</h3>
        <button onclick="navigateTo('/findCompanyId')">아이디 찾기</button>
        <button onclick="navigateTo('/findCompanyPassword')">비밀번호 찾기</button>
    </div>
</body>
</html>

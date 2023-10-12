<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
<%
    String error = request.getParameter("error");
    if ("true".equals(error)) {
%>
        <script>alert("아이디 또는 비밀번호가 일치하지 않습니다");</script>
<%
    }
%>
<form action="/login" method="post">
    <label for="username">아이디</label>
    <input type="text" id="username" name="username" required>

    <label for="password">비밀번호</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">로그인</button>
</form>
</body>
</html>
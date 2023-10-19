<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인회원 비밀번호 찾기</title>
</head>
<body>
<h2>개인회원 비밀번호 찾기</h2>
<c:if test="${not empty message}">
    <p style="color: red;">${message}</p>
</c:if>
<form action="/findPersonPassword" method="post">
    <label for="id">아이디:</label>
    <input type="text" id="id" name="memberId" required><br><br>

    <label for="name">이름:</label>
    <input type="text" id="name" name="memberName" required><br><br>

    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="memberPhone" required><br><br>

    <input type="submit" value="확인">
</form>
</body>
</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<button onclick="location.href='/join/common'">개인회원 가입</button>
<button onclick="location.href='/join/company'">기업회원 가입</button>
<%--<c:if test="${sessionScope.role == 3}">
<form action="<c:url value='/logout'/>" method="post">
    <input type="submit" value="로그아웃"/>
</form>
</c:if>--%>
</body>
</html>
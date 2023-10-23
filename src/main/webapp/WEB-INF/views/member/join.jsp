<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="/css/member/select.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="bg-blue">
    <a class="btn-ghost btn-white btn-align" href="/join/common">
        개인 회원가입
    </a>
</div>
<div id="bg-gray">
  <a class="btn-ghost btn-blue btn-align" href="/join/company">
        기업 회원가입
  </a>
</div>

<%--<c:if test="${sessionScope.role == 3}">
<form action="<c:url value='/logout'/>" method="post">
<input type="submit" value="로그아웃"/>
</form>
</c:if>--%>
</body>
</html>
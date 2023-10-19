<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업회원 아이디 찾기</title>
</head>
<body>
<h2>기업회원 아이디 찾기</h2>
<form action="/findCompanyId" method="post">
    <label for="corporateName">이름</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="business_no">사업자등록번호</label>
    <input type="text" id="business_no" name="business_no" required><br><br>

    <input type="submit" value="확인">
</form>
</body>
</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 페이지 제목</title>
</head>
<body>
<form action="/test" method="post">
            <!-- 텍스트 입력 필드 -->
            <label for="name">테스트아이디 숫자:</label>
            <input type="text" id="test_id" name="test_id" required><br><br>
            <label for="name">퍼스트네임:</label>
                        <input type="text" id="first_name" name="first_name" required><br><br>

            <input type="submit" value="제출">
        </form>
</body>
</html>
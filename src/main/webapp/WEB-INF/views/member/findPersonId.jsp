<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인회원 아이디 찾기</title>
</head>
<body>
<h2>개인회원 아이디 찾기</h2>

<form action="/findPersonId" method="post">
    <div>
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>
    </div>

    <div>
        <label for="phone">핸드폰 번호:</label>
        <input type="tel" id="phone" name="phone" pattern="[0-9]{3}[0-9]{3,4}[0-9]{4}" required placeholder="'-'없이 입력">
    </div>

    <div>
        <button type="submit">확인</button>
    </div>
</form>

</body>
</html>

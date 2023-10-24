<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html lang="ko" dir="ltr" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>
    <link href="/css/member/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class='login'>
    <!--Form side-->
    <div class="form">
        <div class="formHead">
            <h2>
                계정 로그인
            </h2>
            <p>
                <a href="/member/findPersonId">개인회원 아이디/비밀번호 찾기</a><br><br>
                <a href="/member/findCompanyId">기업회원 아이디/비밀번호 찾기</a>
            </p>
        </div>

        <form action="/login" method="post" novalidate>
            <div class="input-container">
                <input type="text" name="username" id="username" placeholder="아이디">
            </div>
            <div class="input-container">
                <input type="password" name="password" id="password" placeholder="비밀번호">
            </div>

            <button id='button' type="submit">로그인</button>
        </form>
    </div>

    <!--Introduction side-->
    <div class='blue'>
        <h2>Job Start Up</h2>
        <p style="width: 500px;">
           At Job Start Up, we believe that the right job can transform a person's life, and the right person can transform a business. This is the guiding principle behind
           our work at Job Start Up, where we connect talented individuals with diverse and
           exciting job opportunities across various industries. <br>
        </p>
    </div>
</div>
<script>
    window.onload = function() {
        var error = "${error}";
        if (error) {
            alert(error);
        }
    }
</script>
</body>
</html>
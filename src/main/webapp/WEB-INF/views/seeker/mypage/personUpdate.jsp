<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>개인정보 수정</title>
    <link href="/css/seeker/personUpdate.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commmon/base.css">
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/layout/layoutNav.jsp"%>
    <div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s"></div>
    </div>
</header>
<main>
<article class="article">
<section id="personalInfoSection">
<link href="/css/seeker/personUpdate.css" rel="stylesheet" type="text/css">
<form action="${cPath}/seeker/userInfoUpdate" class="joinForm" method="post">
<h3>기본 정보</h3>
<div class="textForm">
    <div class="inputGroup">
        <label for="member_name">이름</label>
        <input type="text" class="name" placeholder="이름" id="member_name" name="member_name" value="${member.member_name}" style="padding-left: 50px;"/>
    </div>
</div>
<div class="textForm">
    <div class="inputGroup">
        <label for="member_birth">생년월일</label>
        <input type="text" class="name" placeholder="생년월일" id="member_birth" name="member_birth" value="${member.member_birth}" style="padding-left: 20px;"/>
    </div>
</div>
<div class="textForm">
    <div class="inputGroup">
        <label for="member_sex">성별</label>
        <input type="text" class="name" placeholder="성별" id="member_sex" name="member_sex" value="${member.member_sex}" style="padding-left: 52px;"/>
    </div>
</div>
<h3 style="padding-top: 30px;">연락처 정보</h3>
<div class="textForm">
    <div class="inputGroup">
        <label for="member_hp">휴대폰</label>
        <input type="text" class="cellphoneNo" placeholder="휴대폰" id="member_hp" name="member_hp" value="${member.member_hp}" style="padding-left: 30px;"/>
    </div>
</div>
<div class="textForm">
    <div class="inputGroup">
        <label for="member_email">이메일</label>
        <input type="text" class="email" placeholder="이메일" id="member_email" name="member_email" value="${member.member_email}" style="padding-left: 30px;"/>
    </div>
</div>
<div class="textForm">
    <div class="inputGroup">
        <label for="member_loc">주소</label>
        <input type="text" class="name" placeholder="주소" id="member_loc" name="member_loc" value="${member.member_loc}" style="padding-left: 43px;"/>
    </div>
</div>
<input type="submit" class="hello" value="수정하기" style="margin-left: 30px; height: 45px; margin-top: 18px;">
</form>
</section>
</article>
</main>
<div class="dummy"></div>
<%@include file="/WEB-INF/views/layout/layoutFooter.jsp" %>
</body>
</html>

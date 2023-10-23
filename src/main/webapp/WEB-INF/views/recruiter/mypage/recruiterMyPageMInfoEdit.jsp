<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 일반 정보 변경</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="/css/recruiter/mypage/recruiterCompanyInfoEdited.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="/css/qna/list.css" type="text/css">
    <script src="/js/recruiter/mypage/recruiterCompanyInfoEdited.js"></script>
    <link rel="stylesheet" href="/css/recruiter/mypage/recruiterCompanyInfoEdited.css" type="text/css">
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<%@ include file="../../layout/layoutSideRecruiter.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<main>
    <article class="article1">
        <div class="container1">

            <div class="header">
                <h3 class="general-font">기업 일반 정보 수정</h3>
            </div>

            <form id="form" class = "form" action="#" method="post">
                <div class="form-control1">
                    <label for="member_name">이름</label>
                    <input type="text" id="member_name" name="member_name" value="${generalInfo.member_name}"/>
                </div>
                <div class="form-control1">
                    <label for="member_birth">생년월일</label>
                    <input type="text" id="member_birth" name="member_birth" value="${generalInfo.member_birth}"/>
                </div>
                <div class="form-control1">
                    <label for="member_sex">성별</label>
                    <input type="text" id="member_sex" name="member_sex" value="${generalInfo.member_sex}"/>
                </div>
                <div class="form-control1">
                    <label for="member_hp">연락처</label>
                    <input type="text" id="member_hp" name="member_hp" value="${generalInfo.member_hp}"/>
                </div>
                <div class="form-control1">
                    <label for="member_email">이메일</label>
                    <input type="text" id="member_email" name="member_email" value="${generalInfo.member_email}"/>
                </div>
                <div class="form-control1">
                    <label for="member_loc">주소</label>
                    <input type="text" id="member_loc" name="member_loc" value="${generalInfo.member_loc}"/>
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>
    </article>
</main>
<%@include file="../../layout/layoutFooter.jsp" %>
<!-- Scripts -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script src="/css/template/assets/js/side.js"></script>
</body>
</html>

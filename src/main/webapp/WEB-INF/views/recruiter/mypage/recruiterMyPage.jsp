<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 서비스</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- 기업 페이지 (일반) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css//recruiter/mypage/recruiterMyPage.css">

</head>
<body>
<div class="main-container">

    <div class="main-title-container"><h2>기업 페이지</h2></div>

    <div class="info-container">
        <div class="button-container">
            <button type="button" class="edit-button">정보 수정</button>
            <button type="button" class="edit-button">회원 탈퇴</button>
        </div>
        <div class="info-main-container">
            <form action="/recruiter/updateComLogo" method="POST" enctype="multipart/form-data">
                <div class="profile">
                    <div class="profile-pic">
                        <img src="${imagePath}" id="preview"/>
                    </div>
                    <div class="profile-edit-button-container">
                        <input type="hidden" class="profile-company-no" name="company_no" value="3">
                        <input type="file" id="logoFile" name="logoFile" class="profile-edit-button" accept="image/*" required>
                        <button type="submit" class="profile-edit-button">수정</button>
                        <button type="button" onclick="location.href='/recruiter/downloadComLogo/${recruiterFileDTO.company_no}'">다운로드</button>
                    </div>
                </div>
            </form>
            <div class ="company-info">
                기업 정보
            </div>
        </div>
    </div>

    <div class="status-container">
        <div>버튼 클릭 - AJAX로 데이터 불러오기</div>
        <div class="content-label-container">
            <div class="content-label">박람회 현황</div>
            <div class="content-label">공고 관리</div>
            <div class="content-label">지원자 관리</div>
        </div>

        <div class="content-container">
            <div class="content">
                최근 박람회 지원 현황
            </div>
            <div class="content">
                최근 박람회 지원 현황
            </div>
            <div class="content">
                최근 박람회 지원 현황
            </div>
            <div class="content">
                최근 박람회 지원 현황
            </div>
        </div>
    </div>

</div>
</body>
</html>
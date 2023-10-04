<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지원자 상세 조회</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css//recruiter/appManageListByMem.css">
</head>


<body>
<div class="main-container">

    <div class="info-container">
        <div class="button-container">
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/recruiter/myPage'" class="moving-button">기업페이지</button>
        </div>
        <div class="info-main-container">
            <div class="profile">
                <div class="profile-pic">
                    ${selectResume.profile_savname}
                </div>
            </div>
            <div class ="company-info">
                이름: <input type="text" value="${selectInfo.member_name}" readonly/>
                성별: <input type="text" value="${selectInfo.member_sex}" readonly/>
                연락처: <input type="text" value="${selectInfo.member_hp}" readonly/>
                이메일: <input type="text" value="${selectInfo.member_email}" readonly/>
            </div>
        </div>
    </div>

    <div class="status-container">
        <div class="content-label-container">
            <div class="content-label">지원 내용</div>
        </div>
        <div class="content-container">
            <div class="content">
                지원 내용이라고 합니다
            </div>
        </div>
    </div>

    <div class="approval-container">
        <div class="content-label-container">
            <div class="content-label">승인/반려</div>
        </div>
        <div class="content-container">
            <div class="content">
                지원 내용이라고 합니다
            </div>
            <div class="first-approval">
                면접일자
                <input type="date"/>
                <input type="time"/>
                <button type="button">등록</button>
                <button type="button">반려</button>
            </div>
            <div class="last-approval">
                최종 합격
                <button type="button">등록</button>
                <button type="button">반려</button>
            </div>
        </div>
    </div>


</div>
</body>
</html>
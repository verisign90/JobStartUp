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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/appmanagement/appManageListDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/appmanagement/appManageListDetail.js"></script>
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
                <form action="/recruiter/firstEnroll" method="post">
                    <input type="hidden" name="status_no" id="first_enroll" value="${selectInfo.status_no}">
                    면접일자
                    <input type="date" name="date" id="date_enroll"/>
                    <input type="time" name="time" id="time_enroll"/>
                    <button type="submit" class="first-enroll-button" id="first-enroll-button">등록</button>
                    <fmt:formatDate value="${selectInfo.interview_date}" pattern="yyyy-MM-dd HH:mm" />
                </form>
                <form action="/recruiter/firstDenial" method="post">
                    <input type="hidden" name="status_no" id="first_denial" value="${selectInfo.status_no}">
                    <button type="button" class="first-denial-button">반려</button>
                    ${selectInfo.first_pass}
                </form>
            </div>
            <div class="last-approval">
                최종 합격
                <form action="/recruiter/finalEnroll" method="post">
                    <input type="hidden" name="status_no" id="final_enroll" value="${selectInfo.status_no}">
                    <button type="button" class="final-enroll-button">등록</button>
                    ${selectInfo.final_pass}
                </form>
                <form action="/recruiter/finalDenial" method="post">
                    <input type="hidden" name="status_no" id="final_denial" value="${selectInfo.status_no}">
                    <button type="button" class="final-denial-button">반려</button>
                    ${selectInfo.final_pass}
                </form>
            </div>
        </div>
    </div>


</div>
</body>
</html>
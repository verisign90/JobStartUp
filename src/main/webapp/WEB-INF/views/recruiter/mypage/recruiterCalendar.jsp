<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.List"%>
<%@page import="com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterMyPageDTO"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 서비스</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">

    <!-- 캘린더 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendarEdit.css"/>
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendar.js"></script>
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendarEdit.js"></script>
</head>

<body>

    <div>
        ${recruiterCalendarDTOS}
    </div>


    <div id="calendar" class="calendar"></div>
</body>
</html>
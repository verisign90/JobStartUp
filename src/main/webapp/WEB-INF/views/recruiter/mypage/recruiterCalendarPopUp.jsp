<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이페이지(캘린더 등록)</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendarPopUp.css"/>
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendarPopUp.js"></script>

</head>
<body>

<form action="" method="post">
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div>
                일정 제목
                <input type="text" name="schedule_title" id="schedule_title"/>
            </div>
            <div>
                시작일자
                <input type="date" name="schedule_start" id="schedule_start"/>
            </div>
            <div>
                종료일자
                <input type="date" name="schedule_end" id="schedule_end"/>
            </div>
            <div>
                메모
                <input type="text" name="schedule_memo" id="schedule_memo"/>
            </div>
            <div>
                <button type="button" class="enroll_btn">등록</button>
            </div>
        </div>
    </div>
</form>

</body>
</html>
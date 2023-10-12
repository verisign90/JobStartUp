<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용자 관리 페이지</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/appmanagement/appManageListDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/appmanagement/appManageListDetail.js"></script>
</head>

<body>

<div class="main-container">

    <div class="main-title-container"><h2>채용관리 페이지</h2></div>
    <div class="info-container">
        <div class="button-container">
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/recruiter/myPage'" class="moving-button">기업페이지</button>
        </div>
        <div class="info-main-container">
            <div class="profile">
                <div class="profile-pic">
                    <img id="preview" src="${pageContext.request.contextPath}/recruiter/printAppProfile?status_no=${selectInfo.status_no}" />
                </div>
            </div>
            <div class ="company-info">
                <table>
                    <tr>
                        <th>지원자 성명</th>
                        <td>${selectInfo.member_name}</td>
                    </tr>
                    <tr>
                        <th>지원자 성별</th>
                        <td>${selectInfo.member_sex}</td>
                    </tr>
                    <tr>
                        <th>지원자 연락처</th>
                        <td>${selectInfo.member_hp}</td>
                    </tr>
                    <tr>
                        <th>지원자 이메일</th>
                        <td>${selectInfo.member_email}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div class="status-container">
        <div class="content-label-container">
            <div class="content-label">지원 내용</div>
        </div>
        <div class="content-container">
            <div class="content">
                <table>
                    <tr>
                        <th>이력서 제목</th>
                        <td>${selectResume.resume_title}</td>
                    </tr>
                    <tr>
                        <th>희망 연봉</th>
                        <td>${selectResume.resume_money}</td>
                    </tr>
                    <tr>
                        <th>업무 능력</th>
                        <td>${selectResume.resume_skill}</td>
                    </tr>
                    <tr>
                        <th>링크</th>
                        <td>${selectResume.resume_url}</td>
                    </tr>
                    <tr>
                        <th>서류</th>
                        <td><button type="button" onclick="location.href='/recruiter/getAppFile/${selectInfo.status_no}'">다운로드</button></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div class="approval-container">
        <div class="content-label-container">
            <div class="content-label">승인/반려</div>
        </div>
        <div class="content-container">
            <div class="content">
                주의사항 안내 문구
            </div>
            <c:if test="${selectInfo.first_pass eq 'N'}">
                <div class="first-approval">
                    <form action="/recruiter/firstEnroll" method="post">
                        <input type="hidden" name="status_no" id="first_enroll" value="${selectInfo.status_no}">
                        면접일자
                        <input type="date" name="date" id="date_enroll" required/>
                        <input type="time" name="time" id="time_enroll" required/>
                        <button type="submit" class="first-enroll-button" id="first-enroll-button">등록</button>
                        <fmt:formatDate value="${selectInfo.interview_date}" pattern="yyyy-MM-dd HH:mm" />
                    </form>
                    <form action="/recruiter/firstDenial" method="post">
                        <input type="hidden" name="status_no" id="first_denial" value="${selectInfo.status_no}">
                        <button type="button" class="first-denial-button">반려</button>
                        ${selectInfo.first_pass}
                    </form>
                </div>
            </c:if>
            <c:if test="${selectInfo.first_pass eq 'Y' && selectInfo.final_pass eq 'N'}">
                <div class="last-approval">
                    최종 합격 // 면접일자: <fmt:formatDate value="${selectInfo.interview_date}" pattern="yyyy-MM-dd HH:mm" />
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
            </c:if>
            <c:if test="${selectInfo.final_pass eq 'Y'}">
                채용이 승인된 지원자입니다.
            </c:if>
            <c:if test="${selectInfo.first_pass eq 'F' || selectInfo.final_pass eq 'F'}">
                채용이 거절된 지원자입니다.
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
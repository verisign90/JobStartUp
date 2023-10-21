<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용자 관리 페이지</title>
    <!-- 채용자 관리 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 채용자 관리 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/appmanagement/appManageListDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/appmanagement/appManageListDetail.js"></script>
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<%@ include file="../../layout/layoutSideRecruiter.jsp" %>
<main>
    <article>
        <div class="main-title-container"><h4>채용 관리 페이지</h4></div>
        <div class="main-container">
            <!-- 인적 사항 -->
            <div class="info-container">
                <div class="button-container">
                    <div class="profile-label">인적 사항</div>
                    <button type="button" onclick="location.href='${pageContext.request.contextPath}/recruiter/myPage'" class="moving-button">마이페이지</button>
                </div>
                <div class="info-main-container">
                    <div class="profile">
                        <div class="profile-pic">
                            <img class="image" src="${pageContext.request.contextPath}/image/appManage/${selectFile.profile_savname}" />
                        </div>
                    </div>
                    <div class ="appManage-info">
                        <table class = "appManage-profile">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
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
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 지원 내용 -->
            <div class="status-container">
                <div class="content-label-container">
                    <div class="content-label">지원 내용</div>
                </div>
                <div class="content-container">
                    <div class="content">
                        <table class = "appManage-content">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
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
                                    <td><a href="${selectResume.resume_url}">${selectResume.resume_url}</a></td>
                                </tr>
                                <tr>
                                    <th>제출 서류</th>
                                    <td><button type="button" class="download-button" onclick="location.href='/recruiter/getAppFile/${selectInfo.status_no}'">${selectFile.resume_orgname}</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 승인/반려 -->
            <div class="approval-container">
                <div class="content-label-container">
                    <div class="content-label">승인/반려</div>
                </div>
                <!-- 1차 합격 또는 거절 선택 -->
                <c:if test="${selectInfo.first_pass eq 'N'}">
                    <div class="first-select-container">
                    <!--면접일자 (현재 날짜 기준 이전 날짜 접근 제한)-->
                        <form action="/recruiter/firstEnroll" method="post">
                            <input type="hidden" name="status_no" id="first_enroll" value="${selectInfo.status_no}">
                            <div class = "first-approval">
                                <div class="first-sub-approval">
                                    <table class = "first-approval-date">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    면접일자 등록
                                                </th>
                                                <td>
                                                    <script>
                                                        $(document).ready(function() {
                                                            var today = new Date();
                                                            var yesterday = new Date(today);
                                                            yesterday.setDate(today.getDate());
                                                            var pastDate = yesterday.toISOString().slice(0,10);
                                                            $("#date_enroll").attr("min", pastDate);
                                                        });
                                                    </script>
                                                    <input type="date" name="date" id="date_enroll" min="YYYY-MM-DD" required/>
                                                    <input type="time" name="time" id="time_enroll" required/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="first-sub-approval-2">
                                <button type="button" class="first-enroll-button" id="first-enroll-button">등록</button>
                                </div>
                            </div>
                        </form>
                        <form action="/recruiter/firstDenial" method="post">
                            <div class="first-sub-approval-3">
                                <input type="hidden" name="status_no" id="first_denial" value="${selectInfo.status_no}">
                                <button type="button" class="first-denial-button">반려</button>
                            </div>
                        </form>
                    </div>
                </c:if>
                <!-- 1차 합격 -->
                <c:if test="${selectInfo.first_pass eq 'Y' && selectInfo.final_pass eq 'N'}">
                    <div class="last-select-container">
                        <div class="last-approval">
                            <div>
                                1차 서류 전형을 통과한 지원자입니다.
                            </div>
                            <div>
                                면접일자 : <fmt:formatDate value="${selectInfo.interview_date}" pattern="yyyy-MM-dd HH:mm" />
                            </div>
                        </div>
                        <form action="/recruiter/finalEnroll" method="post">
                            <div class="last-approval-button">
                                <input type="hidden" name="status_no" id="final_enroll" value="${selectInfo.status_no}">
                                <button type="button" class="final-enroll-button">등록</button>
                            </div>
                        </form>
                        <form action="/recruiter/finalDenial" method="post">
                            <div class="last-denial-button">
                                <input type="hidden" name="status_no" id="final_denial" value="${selectInfo.status_no}">
                                <button type="button" class="final-denial-button">반려</button>
                            </div>
                        </form>
                        <!--<form action="/recruiter/mailFirstEnroll" method="post">
                            <input type="hidden" id="first_enroll_mail_status_no" name="status_no" value="${selectInfo.status_no}">
                            <input type="hidden" id="first_enroll_mail_member_email" name="member_email" value="${selectInfo.member_email}">
                            <button type="button" class="first-enroll-mail">메일 안내</button>
                        </form>-->
                    </div>
                </c:if>
                <!-- 1차 채용 거절 -->
                <c:if test="${selectInfo.first_pass eq 'F'}">
                    <div class = "mention-container">
                        채용이 거절된 지원자입니다.
                    </div>
                    <!--<form action="/recruiter/mailFirstDenial" method="post">
                        <input type="hidden" id="first_denial_mail_status_no" name="status_no" value="${selectInfo.status_no}">
                        <input type="hidden" id="first_denial_mail_member_email" name="member_email" value="${selectInfo.member_email}">
                        <button type="button" class="first-denial-mail">메일 안내</button>
                    </form>-->
                </c:if>
                <!-- 최종 합격 -->
                <c:if test="${selectInfo.first_pass eq 'Y' && selectInfo.final_pass eq 'Y'}">
                    <div class = "mention-container">
                        채용이 승인된 지원자입니다.
                    </div>
                    <!--<form action="/recruiter/mailLastEnroll" method="post">
                        <input type="hidden" id="last_enroll_mail_status_no" name="status_no" value="${selectInfo.status_no}">
                        <input type="hidden" id="last_enroll_mail_member_email" name="member_email" value="${selectInfo.member_email}">
                        <button type="button" class="last-enroll-mail">메일 안내</button>
                    </form>-->
                </c:if>
                <!-- 최종 채용 거절 -->
                <c:if test="${selectInfo.first_pass eq 'Y' && selectInfo.final_pass eq 'F'}">
                    <div class = "mention-container">
                        채용이 거절된 지원자입니다.
                    </div>
                    <!--<form action="/recruiter/mailLastDenial" method="post">
                        <input type="hidden" id="last_denial_mail_status_no" name="status_no" value="${selectInfo.status_no}">
                        <input type="hidden" id="last_denial_mail_member_email" name="member_email" value="${selectInfo.member_email}">
                        <button type="button" class="last-denial-mail">메일 안내</button>
                    </form>-->
                </c:if>
                </div>
            </div>
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
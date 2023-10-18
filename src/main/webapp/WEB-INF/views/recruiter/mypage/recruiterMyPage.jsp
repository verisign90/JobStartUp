<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이 페이지</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterMyPage.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterMyPage.js"></script>
    <!-- 기업 마이 페이지 (캘린더) -->
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendar.js"></script>
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendarEdit.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendarEdit.css"/>
    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>

<main>
    <article>
    <div class="main-title-container"><h4>기업 마이 페이지</h4></div>
    <div class="main-container">
        <div class="info-container">
            <div class="info-main-container">
                <div class="company">
                    <form action="/recruiter/updateComLogo" method="POST" enctype="multipart/form-data">
                        <div class="profile">
                            <div class="profile-pic">
                                <img class="image" src="${pageContext.request.contextPath}/image/mypage/${recruiterFileDTO.logo_savname}" />
                            </div>
                            <div class="profile-edit-button-container">
                                <input type="hidden" class="profile-company-no" name="company_no" value="${recruiterFileDTO.company_no}">
                                <div>
                                    <input type="file" id="logoFile" name="logoFile" accept="image/*" required>
                                </div>
                                <div>
                                    <button type="button" id="profile-edit-button" class="edit-button">로고수정</button>
                                    <button type="button" class="edit-button" onclick="location.href='/recruiter/downloadComLogo/${recruiterFileDTO.company_no}'">다운로드</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class ="company-info">
                        <div class="button-container">
                            <button type="button" class="edit-button">정보 수정</button>
                            <button type="button" class="edit-button">회원 탈퇴</button>
                        </div>
                        <table>
                            <tr>
                                <th>회사 이름</th>
                                <td>${recruiterMyPageDTO.company_name}</td>
                            </tr>
                            <tr>
                                <th>회사 연락처</th>
                                <td>${recruiterMyPageDTO.company_hp}</td>
                            </tr>
                            <tr>
                                <th>회사 대표</th>
                                <td>${recruiterMyPageDTO.ceo_name}</td>
                            </tr>
                            <tr>
                                <th>회사 형태</th>
                                <td>${recruiterMyPageDTO.company_type}</td>
                            </tr>
                            <tr>
                                <th>회사 주소</th>
                                <td>${recruiterMyPageDTO.company_address_detail}</td>
                            </tr>
                            <tr>
                                <th>회사 위치</th>
                                <td>${recruiterMyPageDTO.company_site}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="company-schedule">
                    <div id="calendar" class="calendar"></div>
                </div>
                <!-- Modal -->
                <div class="modal_fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <form action="/recruiter/insertCalendar" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                                    <button type="button" id="closeModal" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="modal-item">
                                        <input type="hidden" id="COMPANY_NO" value="${recruiterFileDTO.company_no}">
                                        <label for="SCHEDULE_TITLE" class="col-form-label">일정 내용</label>
                                        <input type="text" class="form-control" id="SCHEDULE_TITLE" name="calendar_content" placeholder="일정을 입력하세요">
                                        <label for="SCHEDULE_START" class="col-form-label">시작 날짜</label>
                                        <input type="date" class="form-control" id="SCHEDULE_START" name="calendar_start_date" required>
                                        <label for="SCHEDULE_END" class="col-form-label">종료 날짜</label>
                                        <input type="date" class="form-control" id="SCHEDULE_END" name="calendar_end_date" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="question-answer">
                </div>

            </div>
        </div>

        <div class="status-container">

            <div class="content-label-container">
                <form action="/recruiter/getJobPostingList" method="post">
                    <input type="hidden" class="job_posting_company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                    <div class="content-label">
                        <button type="button" id="job-posting">공고 관리</button>
                    </div>
                </form>
                <form action="/recruiter/getJobFairList" method="post">
                    <input type="hidden" class="job_fair_company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                    <div class="content-label">
                        <button type="button" id="job-fair" >박람회 현황</button>
                    </div>
                </form>
                <form action="/recruiter/getAppList" method="post">
                    <input type="hidden" class="apply_manage_company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                    <div class="content-label">
                        <button type="button" id="apply-manage" >지원자 관리</button>
                    </div>
                </form>
            </div>

            <div class="content-container" id="content-container">
                현황을 확인해주세요
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

</body>
</html>
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
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<%@ include file="../../layout/layoutSideRecruiter.jsp" %>
<main>
    <article class="article">
    <div class="main-container">
        <div class="main-title-container"><h4>기업 마이 페이지</h4></div>
        <div class="info-container">
            <div class="info-main-container">
                <div class="company">
                    <form action="/recruiter/updateComLogo" method="POST" enctype="multipart/form-data">
                        <div class="profile">
                            <div class="profile-pic">
                                <img class="image" src="${pageContext.request.contextPath}/image/mypage/${recruiterFileDTO.logo_savname}" />
                            </div>
                            <div class="profile-edit-button-container">
                                <input type="hidden" class="profile-company-no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                                <div class ="profile-edit-button-1">
                                    <label for="logoFile">
                                        <div class="btn-upload">수정 파일 선택</div>
                                    </label>
                                    <input type="file" class = "logoFile" id="logoFile" name="logoFile" accept="image/*" required>
                                </div>
                                <div class ="profile-edit-button-2">
                                    <button type="button" id="profile-edit-button" class="edit-button">로고 수정</button>
                                    <button type="button" class="edit-button" onclick="location.href='/recruiter/myPage/downloadComLogo/${recruiterFileDTO.company_no}'">로고 저장</button>
                                    <button type="button" class="edit-button" onclick="location.href='/recruiter/myPage/generalInfo/${recruiterFileDTO.company_no}'">일반 수정</button>
                                    <button type="button" class="edit-button" onclick="location.href='/recruiter/myPage/editCompanyInfo/${recruiterFileDTO.company_no}'">기업 수정</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class ="company-info">
                        <div class="button-container">
                        </div>
                        <table class="company-info-lists">
                            <tbody>
                                <tr>
                                    <th>기업명</th>
                                    <td>${recruiterMyPageDTO.company_name}</td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>${recruiterMyPageDTO.company_hp}</td>
                                </tr>
                                <tr>
                                    <th>대표</th>
                                    <td>${recruiterMyPageDTO.ceo_name}</td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>${recruiterMyPageDTO.company_address_detail}</td>
                                </tr>
                                <tr>
                                    <th>사이트</th>
                                    <td>${recruiterMyPageDTO.company_site}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="company-schedule">
                    <div id="calendar" class="calendar"></div>
                </div>
                <!-- Modal Start -->
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
                                        <input type="text" class="form-control" id="SCHEDULE_TITLE" name="calendar_content" placeholder="일정을 입력하세요" required>
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
                <!-- Modal End -->
                <div class="list-container">
                    <div class="content-label-container">
                        <form action="/recruiter/getJobPostingList" method="post">
                            <input type="hidden" class="job_posting_company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                            <div class="content-label">
                                <button class="list-button" type="button" id="job-posting">공고 관리</button>
                            </div>
                        </form>
                        <form action="/recruiter/getJobFairList" method="post">
                            <input type="hidden" class="job_fair_company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                            <div class="content-label">
                                <button class="list-button" type="button" id="job-fair" >박람회 현황</button>
                            </div>
                        </form>
                        <form action="/recruiter/getAppList" method="post">
                            <input type="hidden" class="apply_manage_company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                            <div class="content-label">
                                <button class="list-button" type="button" id="apply-manage" >지원자 관리</button>
                            </div>
                        </form>
                        <form>
                            <input type="hidden" class="company_no" name="company_no" value="${recruiterMyPageDTO.company_no}">
                            <div class="content-label">
                                <button class="list-button" type="button" id="qna" >QnA</button>
                            </div>
                        </form>
                    </div>
                    <div class="content-container" id="content-container">
                        <div class="basic-content-container">
                            <br/><br/><br/>
                            추가 현황을 확인해주세요!<br/>
                            참여한 공고 👉 공고 관리<br/>
                            참여한 박람회 👉 박람회 현황<br/>
                            신청 받은 지원자 👉 지원자 관리<br/>
                            신청 받은 QnA 👉 QnA<br/>
                        </div>
                    </div>
                </div>
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
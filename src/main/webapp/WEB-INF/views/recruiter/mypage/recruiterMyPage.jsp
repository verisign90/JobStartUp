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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterMyPage.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterMyPage.js"></script>
    <!-- 기업 마이 페이지 (캘린더) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendar.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterCalendarEdit.css"/>
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendar.js"></script>
    <script src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterCalendarEdit.js"></script>
</head>
<body>

<div class="main-container">

    <div class="main-title-container"><h2>기업 마이페이지</h2></div>

    <div class="info-container">
        <div class="info-main-container">

            <div class="company-schedule">
                <div id="calendar" class="calendar"></div>
            </div>

            <div class="company">
                <form action="/recruiter/updateComLogo" method="POST" enctype="multipart/form-data">
                    <div class="profile">
                        <div class="profile-pic">
                            <img src="${pageContext.request.contextPath}/image/mypage/${recruiterFileDTO.logo_savname}" />
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

            <div class="question-answer">
                <h2>Q&A</h2>
            </div>

        </div>
    </div>

    <div class="status-container">

        <div class="content-label-container">
            <div id="apply-manage" class="content-label">
                지원자 관리
            </div>
            <div id="job-posting" class="content-label">
                공고 관리
            </div>
            <div id="job-fair" class="content-label">
                박람회 현황
            </div>
        </div>

        <div class="content-container">
            <c:forEach var="jobPosting" items="${recruiterJobPostingDTO}" varStatus="status">
                <div class="content">
                    <table>
                        <tr>
                            <th>공고 제목</th>
                            <td>${jobPosting.posting_title}</td>
                        </tr>
                        <tr>
                            <th>공고 시작일</th>
                            <td><fmt:formatDate value="${jobPosting.posting_sdate}" pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                        <tr>
                            <th>공고 종료일</th>
                            <td><fmt:formatDate value="${jobPosting.posting_edate}" pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                    </table>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                    <div class="form-group">
                        <input type="hidden" id="COMPANY_NO" value="${recruiterFileDTO.company_no}">
                        <label for="SCHEDULE_TITLE" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="SCHEDULE_TITLE" name="calendar_content">
                        <label for="SCHEDULE_START" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="SCHEDULE_START" name="calendar_start_date">
                        <label for="SCHEDULE_END" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="SCHEDULE_END" name="calendar_end_date">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
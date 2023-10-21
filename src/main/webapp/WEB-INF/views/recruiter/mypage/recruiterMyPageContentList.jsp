<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="content_list" id="content_list">
    <!--채용 공고-->
    <c:if test="${not empty jobPostingList}">
        <c:forEach var="jobPosting" items="${jobPostingList}" varStatus="status">
            <div class="content-hidden">
                <table class="company_table">
                    <thead>
                        <tr>
                            <th>제목(상세)</th>
                            <th><a href="/recruiter/JPdetail/${jobPosting.posting_no}">${jobPosting.posting_title}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>시작일</th>
                            <td><fmt:formatDate value="${jobPosting.posting_sdate}" pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                        <tr>
                            <th>종료일</th>
                            <td><fmt:formatDate value="${jobPosting.posting_edate}" pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:forEach>
        <div class="show-list">
            <a href="/recruiter/myPage/jobPostingWithPaging?company_no=${company_no}"><p>더보기</p></a>
        </div>
    </c:if>
    <!--박람회-->
    <c:if test="${not empty jobFairList}">
        <c:forEach var="jobFair" items="${jobFairList}" varStatus="status">
            <div class="content-hidden">
                <table class="company_table">
                    <thead>
                        <tr>
                            <th>제목(상세)</th>
                            <th><a href="/jobfair/detail/${jobFair.jobfair_no}">${jobFair.jobfair_title}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>장소</th>
                            <td>${jobFair.jobfair_place}</td>
                        </tr>
                        <tr>
                            <th>시작일</th>
                            <td><fmt:formatDate value="${jobFair.jobfair_sdate}" pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                        <tr>
                            <th>종료일</th>
                            <td><fmt:formatDate value="${jobFair.jobfair_edate}" pattern="yyyy년 MM월 dd일"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:forEach>
        <div class="show-list">
            <a href="/recruiter/myPage/jobFairWithPaging?company_no=${company_no}"><p>더보기</p></a>
        </div>
    </c:if>
    <!--채용관리(지원자)-->
    <c:if test="${not empty appList}">
        <c:forEach var="app" items="${appList}" varStatus="status">
            <div class="content-hidden">
                <table class="company_table">
                    <thead>
                        <tr>
                            <th>제목(상세)</th>
                            <th><a href="/recruiter/managePage/${app.status_no}">${app.resume_title}</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>면접일자</th>
                            <td>
                                <fmt:formatDate value="${app.interview_date}" pattern="yyyy년 MM월 dd일"/>
                            </td>
                        </tr>
                        <tr>
                            <th>1차 합격 여부</th>
                            <td>
                                <c:if test="${app.first_pass eq 'N'}">
                                    대기중
                                </c:if>
                                <c:if test="${app.first_pass eq 'Y'}">
                                    서류 합격
                                </c:if>
                                <c:if test="${app.first_pass eq 'F'}">
                                    불합격
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>최종 합격 여부</th>
                            <td>
                                <c:if test="${app.final_pass eq 'N'}">
                                    대기중
                                </c:if>
                                <c:if test="${app.final_pass eq 'Y'}">
                                    최종 합격
                                </c:if>
                                <c:if test="${app.final_pass eq 'F'}">
                                    불합격
                                </c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:forEach>
        <div class="show-list">
            <a href="/recruiter/myPage/appManageWithPaging?company_no=${company_no}"><p>더보기</p></a>
        </div>
    </c:if>
</div>
</body>
</html>

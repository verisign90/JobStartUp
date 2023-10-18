<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <div class="content">
                <table>
                    <tr>
                        <th>공고 번호</th>
                        <td>${jobPosting.posting_no}</td>
                    </tr>
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
        <div class="pagination">
            <ol>
                <c:if test="${jobPostingPaging.prev}">
                    <li>prev</li>
                </c:if>
                <c:forEach var ="pageNo" begin="${jobPostingPaging.strPage}" end="${jobPostingPaging.endPage}">
                    <li><c:out value="${pageNo}"/></li>
                </c:forEach>
                <c:if test ="${jobPostingPaging.next}">
                    <li>next</li>
                </c:if>
            </ol>
        </div>
    </c:if>

    <!--박람회-->
    <c:if test="${not empty jobFairList}">
        <c:forEach var="jobFair" items="${jobFairList}" varStatus="status">
            <div class="content">
                <table>
                    <tr>
                        <th>박람회 제목</th>
                        <td>${jobFair.jobfair_title}</td>
                    </tr>
                    <tr>
                        <th>박람회 장소</th>
                        <td>${jobFair.jobfair_place}</td>
                    </tr>
                    <tr>
                        <th>박람회 시작일</th>
                        <td><fmt:formatDate value="${jobFair.jobfair_sdate}" pattern="yyyy년 MM월 dd일"/></td>
                    </tr>
                    <tr>
                        <th>박람회 종료일</th>
                        <td><fmt:formatDate value="${jobFair.jobfair_edate}" pattern="yyyy년 MM월 dd일"/></td>
                    </tr>
                </table>
            </div>
        </c:forEach>
        <div class="pagination">
            <ol>
                <c:if test="${jobFairPaging.prev}">
                    <li>prev</li>
                </c:if>
                <c:forEach var ="pageNo" begin="${jobFairPaging.strPage}" end="${jobFairPaging.endPage}">
                    <li><c:out value="${pageNo}"/></li>
                </c:forEach>
                <c:if test ="${jobFairPaging.next}">
                    <li>next</li>
                </c:if>
            </ol>
        </div>
    </c:if>

    <!--채용관리(지원자)-->
    <c:if test="${not empty appList}">
        <c:forEach var="app" items="${appList}" varStatus="status">
            <div class="content">
                <table>
                    <tr>
                        <th>이력서 제목</th>
                        <td>${app.resume_title}</td>
                    </tr>
                    <tr>
                        <th>1차 합격 여부</th>
                        <td>${app.first_pass}</td>
                    </tr>
                    <tr>
                        <th>면접일자</th>
                        <td><fmt:formatDate value="${app.interview_date}" pattern="yyyy년 MM월 dd일"/></td>
                    </tr>
                    <tr>
                        <th>최종 합격 여부</th>
                        <td>${app.final_pass}</td>
                    </tr>
                </table>
            </div>
        </c:forEach>
        <div class="pagination">
            <ol>
                <c:if test="${appPaging.prev}">
                    <li>prev</li>
                </c:if>
                <c:forEach var ="pageNo" begin="${appPaging.strPage}" end="${appPaging.endPage}">
                    <li><c:out value="${pageNo}"/></li>
                </c:forEach>
                <c:if test ="${appPaging.next}">
                    <li>next</li>
                </c:if>
            </ol>
        </div>
    </c:if>

</div>
</body>
</html>

<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 마이 페이지 : 공고 관리</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterMyPage.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterMyPage.js"></script>
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<%@ include file="../../layout/layoutSideAdmin.jsp" %>
<main>
    <article>

        <div class="main-title-container"><h4>기업 마이 페이지</h4></div>
        <div class="info-list-container">
            <div class="list-up-container">


            <!--채용 공고-->
            <c:if test="${not empty jobPostingList}">
                <div><h6>채용 공고 리스트</h6></div>
                <c:forEach var="jobPosting" items="${jobPostingList}" varStatus="status">
                    <div class="content">
                        <table>
                            <tr>
                                <th>공고 제목//제목에서 table 눌렀을 때 이동하게끔</th>
                                <td><a href="/recruiter/JPdetail/${jobPosting.posting_no}">${jobPosting.posting_title}</a></td>
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
                <form id = "paging_jobPosting" action="/recruiter/myPageJobPostingWithPaging" method="get">
                    <input type="hidden" name="currentPageNo" value="${jobPostingPaging.criteria.currentPageNo}">
                    <input type="hidden" name="recordsPerPage" value="${jobPostingPaging.criteria.recordsPerPage}">
                    <input type="hidden" name="company_no" value="${jobPostingPaging.criteria.company_no}">
                    <div class="pagination">
                        <ol>
                            <c:if test="${jobPostingPaging.prev}">
                                <li class="paging_btn prev">
                                    <div id="${jobPostingPaging.strPage -1}">prev</div>
                                </li>
                            </c:if>
                            <c:forEach var ="pageNo" begin="${jobPostingPaging.strPage}" end="${jobPostingPaging.endPage}">
                                <li class="paging_btn ${jobPostingPaging.criteria.currentPageNo}">
                                    <div id="${pageNo}">${pageNo}</div>
                                </li>
                            </c:forEach>
                            <c:if test ="${jobPostingPaging.next}">
                                <li class="paging_btn next">
                                    <div id="${jobPostingPaging.endPage +1}">next</div>
                                </li>
                            </c:if>
                        </ol>
                    </div>
                </form>
            </c:if>


            <!--박람회-->
            <c:if test="${not empty jobFairList}">
                <c:forEach var="jobFair" items="${jobFairList}" varStatus="status">
                    <div class="content">
                        <table>
                            <tr>
                                <th>박람회 제목//제목에서 table 눌렀을 때 이동하게끔</th>
                                <td><a href="/admin/jobfairdetail/${jobFair.jobfair_no}">${jobFair.jobfair_title}</a></td>
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
                <form id = "paging_jobFair" action="/recruiter/myPageJobFairWithPaging" method="get">
                    <input type="hidden" name="currentPageNo" value="${jobFairPaging.criteria.currentPageNo}">
                    <input type="hidden" name="recordsPerPage" value="${jobFairPaging.criteria.recordsPerPage}">
                    <input type="hidden" name="company_no" value="${jobFairPaging.criteria.company_no}">
                    <div class="pagination">
                        <ol>
                            <c:if test="${jobFairPaging.prev}">
                                <li class="paging_btn prev">
                                    <div id="${jobFairPaging.strPage -1}">prev</div>
                                </li>
                            </c:if>
                            <c:forEach var ="jobfair_pageNo" begin="${jobFairPaging.strPage}" end="${jobFairPaging.endPage}">
                                <li class="paging_btn ${jobFairPaging.criteria.currentPageNo}">
                                    <div id="${jobfair_pageNo}">${jobfair_pageNo}</div>
                                </li>
                            </c:forEach>
                            <c:if test ="${jobFairPaging.next}">
                                <li class="paging_btn next">
                                    <div id="${jobFairPaging.endPage +1}">next</div>
                                </li>
                            </c:if>
                        </ol>
                    </div>
                </form>
            </c:if>



            <!--채용관리(지원자)-->
            <c:if test="${not empty appList}">
                <c:forEach var="app" items="${appList}" varStatus="status">
                    <div class="content">
                        <table>
                            <tr>
                                <th>이력서 제목//제목에서 table 눌렀을 때 이동하게끔</th>
                                <td><a href="/recruiter/managePage/${app.status_no}">${app.resume_title}</a></td>
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
                <form id = "paging_AppManage" action="/recruiter/myPageAppManageWithPaging" method="get">
                    <input type="hidden" name="currentPageNo" value="${appListPaging.criteria.currentPageNo}">
                    <input type="hidden" name="recordsPerPage" value="${appListPaging.criteria.recordsPerPage}">
                    <input type="hidden" name="company_no" value="${appListPaging.criteria.company_no}">
                    <div class="pagination">
                        <ol>
                            <c:if test="${appListPaging.prev}">
                                <li class="paging_btn prev">
                                    <div id="${appListPaging.strPage -1}">prev</div>
                                </li>
                            </c:if>
                            <c:forEach var ="app_pageNo" begin="${appListPaging.strPage}" end="${appListPaging.endPage}">
                                <li class="paging_btn ${appListPaging.criteria.currentPageNo}">
                                    <div id="${app_pageNo}">${app_pageNo}</div>
                                </li>
                            </c:forEach>
                            <c:if test ="${appListPaging.next}">
                                <li class="paging_btn next">
                                    <div id="${appListPaging.endPage +1}">next</div>
                                </li>
                            </c:if>
                        </ol>
                    </div>
                </form>
            </c:if>



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

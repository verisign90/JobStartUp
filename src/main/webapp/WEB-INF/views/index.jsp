<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <title>JobStartUp</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">

</head>
<body>


<!-- ***** Nav start ***** -->
<%@ include file="layout/layoutNav.jsp" %>
<!-- ***** Nav End ***** -->
<c:if test="${sessionScope.role == 3}">
    <%@ include file="layout/layoutAdminSidebar.jsp" %>
</c:if>

<div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-6 align-self-center">
                        <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s"
                             data-wow-delay="1s">
                            <div class="row" style="margin-left: -120px;">
                                <div class="col-lg-12">
                                    <div class="fw-bolder" style="color: white; font-size: 80px;">JOB START UP</div>
                                    <h4>오늘의 공고를 확인하세요.</h4>
                                </div>
                                <div class="col-lg-12">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                            <img src="/css/template/assets/images/slider-dec.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="services" class="services section">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2">
        <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
          <h4>Today's <em> Company &amp; Job Posting</em> for you</h4>
          <img src="/css/template/assets/images/heading-line-dec.png" alt="">
          <p class="font-class"> 당신을 위한 오늘의 <span>기업</span> 과 <a href="" target="_parent"> 공고 </a> 입니다. 확인해보세요!</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 관련 기업 소개 -->
<div class="container">
  <div class="row">
    <c:if test="${not empty applyDTOList }">
      <c:forEach items="${applyDTOList}" var="apply" varStatus="status">
       <c:if test="${status.index < 8}">
         <div class="col-lg-3">
            <div class="service-item first-service">
                <div class="icon"><img src="/image/apply/${apply.logo_savname}"/></div>
                <h4>${apply.company_name}</h4>
                <p>${apply.company_address_detail}</p>
                <p>${apply.company_hp}</p>
                <div class="text-button">
                  <a href="#">Job Posting More<i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
         </div>
        </c:if>
      </c:forEach>
    </c:if>
  </div>
</div>
<!-- 관련 기업 소개 -->

<div style="margin : 50px 0 50px 0;"></div>

<!-- 공고 소개 -->
<div class="container">
    <div class="row">
        <c:if test="${not empty jobPostingList}">
            <c:forEach var="jobPost" items="${jobPostingList}" varStatus="status">
                <c:if test="${status.index < 8}">
                    <div class="col-lg-3">
                        <div class="service-item first-service">
                            <div class="icon"><img src="/image/apply/${jobPost.logo_savname}"/></div>
                            <h4>${jobPost.company_name}</h4>
                            <p>${jobPost.posting_title}</p>
                            <p>
                                <c:if test="${not empty jobPost.posting_career}">
                                    <span>${jobPost.posting_career}&nbsp;/&nbsp;</span>
                                </c:if>
                                <c:if test="${not empty jobPost.posting_academy}">
                                    <span>${jobPost.posting_academy}&nbsp;/&nbsp;</span>
                                </c:if>
                                <c:if test="${not empty jobPost.posting_labor}">
                                    <span>${jobPost.posting_labor}&nbsp;/&nbsp;</span>
                                </c:if>
                                <c:if test="${not empty jobPost.posting_salary}">
                                    <span>${jobPost.posting_salary}</span>
                                </c:if>
                            </p>
                            <div class="text-button">
                                <a href="/recruiter/JPdetail/${jobPost.posting_no}">Job Posting More<i
                                        class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:if>
    </div>
</div>
<!-- 공고 소개 -->

<div id="services" class="services section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
                <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
                    <h4>Today's <em> JobFair </em> for you</h4>
                    <img src="/css/template/assets/images/heading-line-dec.png" alt="">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 취업 박람회 소개 -->
<div class="container">
    <div class="row">
        <c:if test="${not empty jobFairDTO}">
            <c:forEach var="jobFair" items="${jobFairDTO}" varStatus="status">
                <c:if test="${status.index < 4}">
                    <div class="col-lg-3">
                        <div class="service-item first-service">
                            <div class="icon"><img src="/image/apply/${apply.logo_orgname}"/></div>
                            <h4>${jobFair.JOBFAIR_TITLE}</h4>
                            <p>${jobFair.JOBFAIR_SDATE} ~ ${jobFair.JOBFAIR_EDATE}</p>
                            <p>${jobFair.JOBFAIR_HOST}</p>
                            <p>${jobFair.JOBFAIR_PLACE}</p>
                            <div class="text-button">
                                <a href="/jobfair/detail/${jobFair.JOBFAIR_NO}">JobFair More<i
                                        class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:if>
    </div>
</div>
<!-- 공고 소개 -->

<!-- 중간에 날린 부분 있음 -->

<!-- Footer start -->
<%@ include file="layout/layoutFooter.jsp" %>
<!-- Footer end -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script src="/css/template/assets/js/side.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="/css/template/assets/js/side.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

</body>
</html>
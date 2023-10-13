<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath()%>" />
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

  <title>JobStartUp</title>

  <!-- Bootstrap core CSS -->
  <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
  <link rel="stylesheet" href="/css/template/assets/css/animated.css">
  <link rel="stylesheet" href="/css/template/assets/css/owl.css">

</head>
<body>


<!-- ***** Nav start ***** -->
<%@ include file="layout/layoutNav.jsp" %>
<!-- ***** Nav End ***** -->


<div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
              <div class="row">
                <div class="col-lg-12">
                  <h2>JobStartUp</h2>
                  <p>오늘의 공고를 확인하세요.</p>
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
          <p class="font-class"> 당신을 위한 오늘의 <a rel="nofollow" href="https://www.toocss.com/" target="_blank">기업</a> 과 <a href="https://templatemo.com/contact" target="_parent"> 공고 </a> 입니다. 확인해보세요!</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <c:if test="${not empty applyDTOList }">
      <c:forEach items="${applyDTOList}" var="apply">
         <div class="col-lg-3">
            <div class="service-item first-service">
                <div class="icon"><img src="/image/apply/${apply.logo_orgname}"/></div>
                <h4>${apply.company_name}</h4>
                <p>${apply.company_address_detail}</p>
                <p>${apply.company_hp}</p>
                <div class="text-button">
                  <a href="#">Job Posting More<i class="fa fa-arrow-right"></i></a>
                </div>
            </div>
         </div>
      </c:forEach>
    </c:if>
  </div>
</div>



<!-- 중간에 날린 부분 있음 -->

<!-- Footer start -->
<%@ include file="layout/layoutFooter.jsp" %>
<!-- Footer end -->

</body>
</html>
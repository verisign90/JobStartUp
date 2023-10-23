<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>웹 페이지 제목</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterMyPage.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterMyPage.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">

    <link rel="stylesheet" href="/css/common/base.css" type="text/css">
    <link rel="stylesheet" href="/css/qna/list.css" type="text/css">
    <link rel="stylesheet" href="/css/recruiter/apply/apply.css" type="text/css">

</head>
<body>
<div>
    <%@ include file="../../layout/layoutNav.jsp" %>
</div>
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../../layout/layoutAdminSidebar.jsp" %>
</c:if>
<br><br><br><br><br><br>
<div class="container1">
    <c:choose>
        <c:when test="${entryDTO.JOBFAIRENTRY_STATUS eq 'N'}">
            <div class="header">
                <h2>승인대기중입니다.</h2>
            </div>
        </c:when>
    </c:choose>

    <div class="form-control1">
        <label for="company_name">회사명:</label>
        <input type="text" id="company_name" name="company_name" value="${applyDTO.company_name}" readonly required>
    </div>
    <div class="form-control1" style="display: none;">
        <label for="member_no">회원번호:</label>
        <input type="text" id="member_no" name="member_no" value="${applyDTO.member_no}" readonly required/>
    </div>
    <div class="form-control1">
        <label for="company_hp">회사전화번호</label>
        <input type="text" id="company_hp" name="company_hp" value="${applyDTO.company_hp}" readonly
               pattern="\d{3}-\d{4}-\d{4}">
        <small id="phone-error" style="color: red;"></small>
    </div>

    <div class="form-control1">
        <label for="ceo_name">대표자명</label>
        <input type="text" id="ceo_name" name="ceo_name" value="${applyDTO.ceo_name}" readonly required/>

    </div>

    <div class="form-control1">
        <label for="company_type">기업형태</label>
        <input type="text" id="company_type" name="company_type" value="${applyDTO.company_type}" readonly required/>

    </div>


    <div class="form-control1">
        <label for="company_est">회사 설립일:</label>
        <input type="text" id="company_est" name="company_est" value="${applyDTO.company_est}" readonly required
               onblur="validateDate()">
        <small id="date-error" style="color: red;"></small>
    </div>

    <div class="form-control1">
        <label for="company_site">회사 웹사이트:</label>
        <input type="text" id="company_site" name="company_site" value="${applyDTO.company_site}" readonly
               placeholder="https://www.example.com">
        <small id="website-error" style="color: red;"></small>
    </div>


    <div>
        <div class="form-control1">
            <label for="company_address">회사 주소</label>
            <input type="text" id="company_address" name="company_address" value="${applyDTO.company_address_detail}"
                   readonly placeholder="https://www.example.com">
            <small id="website-error" style="color: red;"></small>
        </div>
        <span id="img"><img id="logo-preview" src="${cPath}/image/apply/${applyDTO.logo_savname}" style="width:300px;"/></span>
        <div class="form-control1">
            <label for="logo">회사 로고</label>
            <!--<img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; width: 200px; height: auto;">-->
            <small id="logo" style="color: red;"></small><br><br>
        </div>


        <div id="fileListContainer">
            <c:forEach items="${fileDTOList}" var="file">
                <div id="${file.cfile_orgname}">
                    <p>File Name: ${file.cfile_orgname}</p>

                    <c:choose>
                        <c:when test="${fn:endsWith(file.cfile_orgname, '.pdf')}">
                            <img src="${cPath}/image/icon/pdf.png" alt="PDF Icon">

                        </c:when>
                        <c:when test="${fn:endsWith(file.cfile_orgname, '.xlsx')}">
                            <img src="${cPath}/image/icon/excel.png" alt="Excel Icon">
                        </c:when>
                        <c:when test="${fn:endsWith(file.cfile_orgname, '.pptx')}">
                            <img src="${cPath}/image/icon/ppt.png" alt="Excel Icon">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/resources/icons/default.png"
                                 alt="Default Icon">
                        </c:otherwise>
                    </c:choose>
                    <!-- 파일 아이콘 표시 -->

                    <!-- 파일 다운로드 링크 -->
                    <a href="/recruiter/download?fileName=${file.cfile_savname}" download="${file.cfile_orgname}">Download
                        File</a>

                </div>
            </c:forEach>
        </div>


        <div class="form-control1">
            <label for="company_sales">매출액</label>
            <input type="text" id="company_sales" name="company_sales" value="${applyDTO.company_sales}" readonly
                   required/>
            <small id="sales-error" style="color: red;"></small><br><br>
        </div>
    </div>

    <a href="/jobfair/jfmodify/${applyDTO.company_no}">수정</a>
    <a href="/jobfair/deleteEntry/${applyDTO.company_no}">삭제</a>

</div>


<script>


    <!-- Scripts -->
    <script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<!--<script src="/css/template/assets/js/custom.js"></script>-->
<script src="/js/recruiter/apply/apply2.js"></script>


</script>
<div>
    <%@include file="../../layout/layoutFooter.jsp" %>
</div>
</body>

</html>
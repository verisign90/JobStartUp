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
<div>
    <%@ include file="../layout/layoutNav.jsp" %>
</div>
<body>

<br><br><br><br><br><br>
<div class="container1">
    <div class="header">
        <h2>기업정보등록</h2>
    </div>
    <form id="form" class="form" action="/jobfair/apply/${JOBFAIR_NO}" method="post" enctype="multipart/form-data"
          onsubmit="return onSubmitForm();">
        <div class="form-control1">
                <label for="company_name">회사명:</label>
                <input type="text" id="company_name" name="company_name"  required>
        </div>

        <!--탁 회사번호 히든으로 전달-->
        <div class="form-control1">
            <label for="company_name">회원번호:</label>
            <input type="text" id="member_no" name="member_no" value="${member.member_no}" readonly />
        </div>

        <div class="form-control1">
            <label for="company_hp">회사전화번호</label>
            <input type="text" id="company_hp" name="company_hp" pattern="\d{2,3}-\d{3,4}-\d{4}">
            <small id="phone-error" style="color: red; margin-left:60px;"></small>
        </div>

        <div class="form-control1">
            <label for="ceo_name">대표자명</label>
            <input type="text" id="ceo_name" name="ceo_name"  required/>

        </div>
        <div class="form-control1">
            <label for="company_type" class="company_type">회사분류</label>
            <select id="company_type" name="company_type" required>
                <option value="">선택</option>
                <option value="대기업">대기업</option>
                <option value="중소기업">중소기업</option>
                <option value="소기업">소기업</option>
            </select>
        </div>


        <div>
            <div class="form-control1">
                <label for="sample6_postcode">회사주소</label>
                <input type="text" id="sample6_postcode" placeholder="우편번호"><br>
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                <input type="text" id="sample6_address" placeholder="주소">
                <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                <input type="hidden" id="company_address_detail" name="company_address_detail" required>
            </div>

            <div class="form-control1">
                <label for="business_type_code_up">회사업종코드:</label>
                <select id="business_type_code_up" class="upper" name="business_type_code_up" onchange="loadBusiness_type_code_up()"
                        required>
                    <option value="">선택</option>
                    <c:forEach items="${upperJob}" var="upJob">
                        <option value="${upJob.detail_code_num}">${upJob.detail_name}</option>
                    </c:forEach>
                </select>


                <select id="business_type_code" class="lower" name="business_type_code" required>
                    <option value="">선택</option>
                    <c:forEach items="${lowerJob}" var="loJob">
                        <option value="${loJob.detail_code_num}">${loJob.detail_name}</option>
                    </c:forEach>
                </select><br><br>
            </div>

            <div class="form-control1">
                <label for="upperLoc">회사주소코드:</label>
                <select id="upperLoc" class="upper" name="upperLoc" onchange="loadLowerLoc()" required>
                    <option value="">선택</option>
                    <c:forEach items="${upperLoc}" var="upLoc">
                        <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                    </c:forEach>
                </select>

                <select id="company_address_code" class="lower" name="company_address_code" required>
                    <option value="">선택</option>
                    <c:forEach items="${lowerLoc}" var="loLoc">
                        <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                    </c:forEach>
                </select><br><br>
            </div>
            <div class="form-control1 custom-file-upload">
                <label for="logo" style="font-size: 16px; display: inline-block; margin-right: 10px;">로고 업로드</label>
                <input type="file" id="logo" class="logo" width:200px; name="logo" accept="image/*" required style="display: inline-block; width: 300px;"/>
                <img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; width: 200px; height: auto;">
                <small id="logo-error" style="color: red;"></small><br><br>
            </div>

            <div class="form-control1">
                <label for="document" style="font-size: 16px; display: inline-block; margin-right: 10px;">파일 업로드</label>
                <input type="file" id="document" name="document" accept=".pdf, .doc, .docx , .pptx , .xlsx" required
                       style="display: inline-block; width: 300px;" multiple/>

                <small id="document-error" style="color: red;"></small><br><br>
            </div>

            <div class="form-control1">
                <label for="company_est">회사 설립일:</label>
                <input type="date" id="company_est" name="company_est" required onblur="validateDate()">
                <small id="date-error" style="color: red;"></small>
            </div>

            <div class="form-control1">
                <label for="company_site">회사 웹사이트:</label>
                <input type="text" id="company_site" name="company_site" placeholder="https://www.example.com">
                <small id="website-error" style="color: red;"></small>
            </div>

            <div class="form-control1">
                <label for="company_sales">매출액</label>
                <input type="text" id="company_sales" name="company_sales" required/>
                <small id="sales-error" style="color: red;"></small><br><br>
            </div>
            <button>Submit</button>
            <!--<input class="button" type="submit" value="제출">-->
        </div>
    </form>
</div>


<!-- Scripts -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<!--<script src="/css/template/assets/js/custom.js"></script>-->
<script src="/js/recruiter/apply/apply2.js"></script>

<div>
    <%@include file="../layout/layoutFooter.jsp" %>
</div>

</body>

</html>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:set var="cPath" value="<%=request.getContextPath()%>"/>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page"
      xmlns="http://www.w3.org/1999/html">
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원 정보 변경</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="/css/common/base.css" type="text/css">
    <link rel="stylesheet" href="/css/qna/list.css" type="text/css">
    <script src="/js/recruiter/mypage/recruiterCompanyInfoEdited.js"></script>
    <link rel="stylesheet" href="/css/recruiter/mypage/recruiterCompanyInfoEdited.css" type="text/css">
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<%@ include file="../../layout/layoutSideRecruiter.jsp" %>
<main>
    <article class="article1">
        <div class="container1">

            <div class="header">
                <h3>기업 고유 정보 수정</h3>
            </div>

            <form id="form" class="form" action="/recruiter/myPage/editCompanyInfo/${applyDTO.company_no}"
                                method="post" enctype="multipart/form-data" onsubmit="return onSubmitForm();">

                <input type="hidden" name="company_no" value="${applyDTO.company_no}"/>

                <div class="form-control1">
                    <label for="company_name">회사명</label>
                    <input type="text" id="company_name" name="company_name" value="${applyDTO.company_name}" required>
                </div>

                <div class="form-control1">
                    <label for="company_hp">회사 전화번호</label>
                    <input type="text" id="company_hp" name="company_hp" value="${applyDTO.company_hp}"pattern="\d{3}-\d{4}-\d{4}">
                    <small id="phone-error" style="color: red;"></small>
                </div>

                <div class="form-control1">
                    <label for="ceo_name">대표자명</label>
                    <input type="text" id="ceo_name" name="ceo_name" value="${applyDTO.ceo_name}" required/>
                </div>
                <div class="form-control1">
                    <label for="company_type">회사 분류</label>
                    <select id="company_type" name="company_type" required>
                        <c:if test="${applyDTO.company_type eq '대기업'}">
                            <option value="대기업">${applyDTO.company_type}</option>
                            <option value="중소기업">중소기업</option>
                            <option value="소기업">소기업</option>
                        </c:if>
                        <c:if test="${applyDTO.company_type eq '중소기업'}">
                            <option value="중소기업">${applyDTO.company_type}</option>
                            <option value="대기업">대기업</option>
                            <option value="소기업">소기업</option>
                        </c:if>
                        <c:if test="${applyDTO.company_type eq '소기업'}">
                            <option value="소기업">${applyDTO.company_type}</option>
                            <option value="중소기업">중소기업</option>
                            <option value="대기업">소기업</option>
                        </c:if>
                    </select>
                </div>

                <div>
                    <div class="form-control1">
                        <input type="hidden" id="org_company_address_detail" value="${applyDTO.company_address_detail}"/>
                        <label for="company_address_detail">회사 주소</label>
                            <input type="text" id="sample6_postcode" placeholder="우편번호">
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                            <input type="text" id="sample6_address" placeholder="주소">
                            <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                            <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                            <input type="hidden" id="company_address_detail" name="company_address_detail" required>
                    </div>
                    <!-- test -->
                    <script>
                        $(document).ready(function () {
                            var originalData = $("#org_company_address_detail").val();
                            var dataParts = originalData.split(" ");
                            var sample6_postcode = dataParts[0];
                            var sample6_address = dataParts.slice(1, dataParts.length - 1).join(" ");
                            var sample6_extraAddress = dataParts[dataParts.length - 1];

                            $("#sample6_postcode").val(sample6_postcode);
                            $("#sample6_address").val(sample6_address);
                            $("#sample6_extraAddress").val(sample6_extraAddress);
                        });
                    </script>

                    <div class="form-control1">
                        <label for="company_est">회사 설립일</label>
                        <input type="date" id="company_est" name="company_est" value="${applyDTO.company_est}" required onblur="validateDate()">
                        <small id="date-error" style="color: red;"></small>
                    </div>

                    <div class="form-control1">
                        <label for="company_site">회사 웹사이트</label>
                        <input type="text" id="company_site" name="company_site" value="${applyDTO.company_site}" placeholder="https://www.example.com">
                        <small id="website-error" style="color: red;"></small>
                    </div>

                    <div class="form-control1">
                        <label for="business_type_code_up">회사 업종 코드</label>
                        <select id="business_type_code_up" class="upper" name="business_type_code_up" onchange="loadBusiness_type_code_up()" required>
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
                        <label for="upperLoc">회사 주소 코드</label>
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
                    <span id="img"><img id="logo-preview" src="${cPath}/image/apply/${applyDTO.logo_savname}" style="width:300px;"/></span>
                    <div class="form-control1">
                        <label for="logo" style="font-size: 16px; display: inline-block; margin-right: 10px;">로고 업로드</label>
                        <input type="file" id="logo" name="logo" accept="image/*" onchange="previewLogo(event)" required required style="display: inline-block; width: 300px;"/>
                        <!--<img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; width: 200px; height: auto;">-->
                        <small id="logo-error" style="color: red;"></small><br><br>
                    </div>

                    <div class="form-control1">
                        <label for="document" style="font-size: 16px; display: inline-block; margin-right: 10px;">파일 업로드</label>
                        <input type="file" id="document" name="document" accept=".pdf, .doc, .docx , .pptx , .xlsx" style="display: inline-block; width: 300px;" multiple/>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small id="document-error" style="color: red;"></small><br><br>
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
                                        <img src="${cPath}/image/icon/excel.png"" alt="Excel Icon">
                                    </c:when>
                                    <c:when test="${fn:endsWith(file.cfile_orgname, '.pptx')}">
                                        <img src="${cPath}/image/icon/ppt.png"" alt="Excel Icon">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/resources/icons/default.png" alt="Default Icon">
                                    </c:otherwise>
                                </c:choose>

                                <a href="/recruiter/download?fileName=${file.cfile_savname}" download="${file.cfile_orgname}">Download File</a>
                                <button onclick="deleteFile('${file.cfile_savname}', '${file.cfile_no}')">파일 삭제</button>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="form-control1">
                        <label for="company_sales">매출액</label>
                        <input type="text" id="company_sales" name="company_sales" value="${applyDTO.company_sales}" required/>
                        <small id="sales-error" style="color: red;"></small><br><br>
                    </div>

                    <button type="submit">Submit</button>
                </div>
            </form>
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
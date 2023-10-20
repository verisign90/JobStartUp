<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--<link href="/css/recruiter/apply/apply.css" rel="stylesheet" />-->
    <!--<script src="/js/recruiter/apply/apply.js"></script>-->
    <title>웹 페이지 제목</title>

    <style>
    @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
    @import url('https://fonts.googleapis.com/css?family=Open+Sans:400,500&display=swap');

    * {
    	box-sizing: border-box;
    }

    body {
      margin:0;
      padding:0;
      font-family: sans-serif;
      background: linear-gradient(#00AFFF, #14D3FF);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }

    .container {
    	background-color: #fff;
    	border-radius: 5px;
    	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    	overflow: hidden;
    	width: 500px;
    	max-width: 100%;
    }

    .header {
    	border-bottom: 1px solid #f0f0f0;
    	background: rgba(255, 255, 255,.9);
    	padding: 20px 40px;
    }

    .header h2 {
    	margin: 0;
    }

    .form {
    	padding: 30px 40px;
    }

    .form-control {
    	margin-bottom: 10px;
    	padding-bottom: 20px;
    	position: relative;
    }

    .form-control label {
    	display: inline-block;
    	margin-bottom: 5px;
    }

    .form-control input {
    	border: 2px solid #f0f0f0;
    	border-radius: 4px;
    	display: block;
    	font-family: inherit;
    	font-size: 14px;
    	padding: 10px;
    	width: 100%;
    }

    .form-control input:focus {
    	outline: 0;
    	border-color: #777;
    }

    .form-control.success input {
    	border-color: #2ecc71;
    }

    .form-control.error input {
    	border-color: #e74c3c;
    }

    .form-control i {
    	visibility: hidden;
    	position: absolute;
    	top: 40px;
    	right: 10px;
    }





    .form-control.error small {
    	visibility: visible;
    }

    .form button {
    	background-color: #8e44ad;
    	border: 2px solid #8e44ad;
    	border-radius: 4px;
    	color: #fff;
    	display: block;
    	font-family: inherit;
    	font-size: 16px;
    	padding: 10px;
    	margin-top: 20px;
    	width: 100%;
    }
    .button {
    	background-color: #8e44ad;
    	border: 2px solid #8e44ad;
    	border-radius: 4px;
    	color: #fff;
    	display: block;
    	font-family: inherit;
    	font-size: 16px;
    	padding: 10px;
    	margin-top: 20px;
    	width: 100%;
    }









    /* SOCIAL PANEL CSS */
    .social-panel-container {
    	position: fixed;
    	right: 0;
    	bottom: 80px;
    	transform: translateX(100%);
    	transition: transform 0.4s ease-in-out;
    }

    .social-panel-container.visible {
    	transform: translateX(-10px);
    }

    .social-panel {
    	background-color: #fff;
    	border-radius: 16px;
    	box-shadow: 0 16px 31px -17px rgba(0,31,97,0.6);
    	border: 5px solid #001F61;
    	display: flex;
    	flex-direction: column;
    	justify-content: center;
    	align-items: center;
    	font-family: 'Muli';
    	position: relative;
    	height: 169px;
    	width: 370px;
    	max-width: calc(100% - 10px);
    }

    .social-panel button.close-btn {
    	border: 0;
    	color: #97A5CE;
    	cursor: pointer;
    	font-size: 20px;
    	position: absolute;
    	top: 5px;
    	right: 5px;
    }

    .social-panel button.close-btn:focus {
    	outline: none;
    }

    .social-panel p {
    	background-color: #001F61;
    	border-radius: 0 0 10px 10px;
    	color: #fff;
    	font-size: 14px;
    	line-height: 18px;
    	padding: 2px 17px 6px;
    	position: absolute;
    	top: 0;
    	left: 50%;
    	margin: 0;
    	transform: translateX(-50%);
    	text-align: center;
    	width: 235px;
    }

    .social-panel p i {
    	margin: 0 5px;
    }

    .social-panel p a {
    	color: #FF7500;
    	text-decoration: none;
    }

    .social-panel h4 {
    	margin: 20px 0;
    	color: #97A5CE;
    	font-family: 'Muli';
    	font-size: 14px;
    	line-height: 18px;
    	text-transform: uppercase;
    }

    .social-panel ul {
    	display: flex;
    	list-style-type: none;
    	padding: 0;
    	margin: 0;
    }

    .social-panel ul li {
    	margin: 0 10px;
    }

    .social-panel ul li a {
    	border: 1px solid #DCE1F2;
    	border-radius: 50%;
    	color: #001F61;
    	font-size: 20px;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	height: 50px;
    	width: 50px;
    	text-decoration: none;
    }

    .social-panel ul li a:hover {
    	border-color: #FF6A00;
    	box-shadow: 0 9px 12px -9px #FF6A00;
    }

    .floating-btn {
    	border-radius: 26.5px;
    	background-color: #001F61;
    	border: 1px solid #001F61;
    	box-shadow: 0 16px 22px -17px #03153B;
    	color: #fff;
    	cursor: pointer;
    	font-size: 16px;
    	line-height: 20px;
    	padding: 12px 20px;
    	position: fixed;
    	bottom: 20px;
    	right: 20px;
    	z-index: 999;
    }

    .floating-btn:hover {
    	background-color: #ffffff;
    	color: #001F61;
    }

    .floating-btn:focus {
    	outline: none;
    }

    .floating-text {
    	background-color: #001F61;
    	border-radius: 10px 10px 0 0;
    	color: #fff;
    	font-family: 'Muli';
    	padding: 7px 15px;
    	position: fixed;
    	bottom: 0;
    	left: 50%;
    	transform: translateX(-50%);
    	text-align: center;
    	z-index: 998;
    }

    .floating-text a {
    	color: #FF7500;
    	text-decoration: none;
    }

    @media screen and (max-width: 480px) {

    	.social-panel-container.visible {
    		transform: translateX(0px);
    	}

    	.floating-btn {
    		right: 10px;
    	}
    }
    </style>
</head>
<body>
    <div class="container">
    	<c:choose>
            <c:when test="${entryDTO.JOBFAIRENTRY_STATUS eq 'N'}">
                <div class="header">
                    <h2>승인대기중입니다.</h2>
                </div>
            </c:when>
        </c:choose>
    	<form id="form" class="form" action="/recruiter/jfmodify/${applyDTO.company_no}" method="post" enctype="multipart/form-data" onsubmit="return onSubmitForm();">
    		<div class="form-control">
    			<label for="username">회사명:</label>
    			<input type="text" id="company_name" name="company_name" value="${applyDTO.company_name}"  readonly required>
    		</div>
            <div class="form-control">
                <label for="username">회원번호:</label>
                <input type="text" id="member_no" name="member_no" readonly required />


    		</div>
    		<div class="form-control">
    			<label for="username">회사전화번호</label>
    			<input type="text" id="company_hp" name="company_hp" value="${applyDTO.company_hp}" readonly pattern="\d{3}-\d{4}-\d{4}">
    			<small id="phone-error" style="color: red;"></small>
    		</div>

    		<div class="form-control">
    			<label for="username">대표자명</label>
    			<input type="text" id="ceo_name" name="ceo_name" value="${applyDTO.ceo_name}" readonly required/>

    		</div>

    		<div class="form-control">
                <label for="username">대표자명</label>
                <input type="text" id="ceo_name" name="ceo_name" value="${applyDTO.company_type}" readonly required/>

            </div>


    		<div>


            <div class="form-control">
                <label for="establishment_date">회사 설립일:</label>
                <input type="text" id="company_est" name="company_est" value="${applyDTO.company_est}" readonly required onblur="validateDate()">
                <small id="date-error" style="color: red;"></small>
            </div>

            <div class="form-control">
                <label for="website">회사 웹사이트:</label>
                <input type="text" id="company_site" name="company_site" value="${applyDTO.company_site}" readonly placeholder="https://www.example.com">
                <small id="website-error" style="color: red;"></small>
            </div>



            <div>
                <div class="form-control">
                    <label for="website">회사 주소</label>
                    <input type="text" id="company_site" name="company_site" value="${applyDTO.company_address_detail}" readonly placeholder="https://www.example.com">
                    <small id="website-error" style="color: red;"></small>
                </div>
            <span id="img"><img id="logo-preview" src="${cPath}/image/apply/${applyDTO.logo_savname}" style="width:300px;"/></span>
    		<div class="form-control">
                <label for="username">회사 로고</label>
                <!--<img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; width: 200px; height: auto;">-->
                <small id="logo-error" style="color: red;"></small><br><br>
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
                        <!-- 파일 아이콘 표시 -->

                        <!-- 파일 다운로드 링크 -->
                        <a href="/recruiter/download?fileName=${file.cfile_savname}" download="${file.cfile_orgname}">Download File</a>

                    </div>
                </c:forEach>
            </div>


    		<div class="form-control">
                <label for="username">매출액</label>
                <input type="text" id="company_sales" name="company_sales" value="${applyDTO.company_sales}" readonly required/>
                <small id="sales-error" style="color: red;"></small><br><br>
            </div>



    	</form>
    </div>
    <a href="/recruiter/jfmodify/${applyDTO.company_no}">수정</a>
    <a href="#">삭제예정</a>

<!-- Scripts -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script src="/css/js/recruiter/apply/apply2.js"></script>




</body>
</html>
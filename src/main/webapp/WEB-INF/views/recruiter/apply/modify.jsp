<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    	background-color: #9b59b6;
    	font-family: 'Open Sans', sans-serif;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	min-height: 100vh;
    	margin: 0;
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
    	background-color: #f7f7f7;
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
    	<div class="header">
    		<h2>Create Account</h2>
    	</div>
    	<form id="form" class="form" action="/apply/apply" method="post" enctype="multipart/form-data" onsubmit="return onSubmitForm();">
    		<div class="form-control">
    			<label for="username">회사명:</label>
    			<input type="text" id="company_name" name="company_name" value="${applyDTO.company_name}" required>
    		</div>
            <div class="form-control">
                <label for="username">회원번호:</label>
                <input type="text" id="member_no" name="member_no" required />


    		</div>
    		<div class="form-control">
    			<label for="username">회사전화번호</label>
    			<input type="text" id="company_hp" name="company_hp" value="${applyDTO.company_hp}"pattern="\d{3}-\d{4}-\d{4}">
    			<small id="phone-error" style="color: red;"></small>
    		</div>

    		<div class="form-control">
    			<label for="username">대표자명</label>
    			<input type="text" id="ceo_name" name="ceo_name" value="${applyDTO.ceo_name}" required/>

    		</div>
    		<div class="form-control">
    			<label for="username">회사분류</label>
    			<input type="text" id="company_type" name="company_type" required/>

    		</div>

    		<div>
    		<div class="form-control">
                			<label for="username">회사주소</label>
                   <input type="text" id="sample6_postcode" placeholder="우편번호">
                   <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                   <input type="text" id="sample6_address" placeholder="주소">
                   <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                   <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                   <input type="hidden" id="company_address_detail" name="company_address_detail" required>
            </div>

            <div>
            <label for="name">회사업종코드:</label>
                            <select id="business_type_code_up" name="business_type_code_up" onchange="loadBusiness_type_code_up()" required>
                                    <option value="">선택</option>
                                    <c:forEach items="${upperJob}" var="upJob">
                                        <option value="${upJob.detail_code_num}">${upJob.detail_name}</option>
                                    </c:forEach>
                            </select>

                           <select id="business_type_code" name="business_type_code" required>
                                 <option value="">선택</option>
                                 <c:forEach items="${lowerJob}" var="loJob">
                                    <option value="${loJob.detail_code_num}">${loJob.detail_name}</option>
                                 </c:forEach>
                            </select><br><br>
            </div>

            <div>
            <label for="name">회사주소코드:</label>
                        <select id="upperLoc" name="upperLoc" onchange="loadLowerLoc()" required>
                                    <option value="">선택</option>
                                    <c:forEach items="${upperLoc}" var="upLoc">
                                        <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                                    </c:forEach>
                        </select>

                        <select id="company_address_code" name="company_address_code" required>
                                    <option value="">선택</option>
                                    <c:forEach items="${lowerLoc}" var="loLoc">
                                         <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                                    </c:forEach>
                        </select><br><br>
            </div>
            <span id="img"><img id="logo-preview" src="${cPath}/image/apply/${applyDTO.logo_savname}" style="width:300px;"/></span>
    		<div class="form-control">
                <label for="username">로고 업로드</label>
                <input type="file" id="logo" name="logo" accept="image/*" onchange="previewLogo(event)" required/>
                <!--<img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; width: 200px; height: auto;">-->
                <small id="logo-error" style="color: red;"></small><br><br>
            </div>

    		<div class="form-control">
                <label for="username">파일 업로드</label>
                <input type="file" id="document" name="document" accept=".pdf, .doc, .docx , .pptx , .xlsx" required multiple/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small id="document-error" style="color: red;"></small><br><br>
            </div>

            <div>
                <c:forEach items="${fileDTOList}" var="file">
                    <p>File Name: ${file.cfile_orgname}</p>

                    <c:choose>
                        <c:when test="${fn:endsWith(file.cfile_orgname, '.pdf')}">
                            <img src="${cPath}/image/apply/pdf.png" alt="PDF Icon">

                        </c:when>
                        <c:when test="${fn:endsWith(file.cfile_orgname, '.xlsx')}">
                            <img src="${cPath}/image/apply/excel.jpg"" alt="Excel Icon">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/resources/icons/default.png" alt="Default Icon">
                        </c:otherwise>
                    </c:choose>
                    <!-- 파일 아이콘 표시 -->

                    <!-- 파일 다운로드 링크 -->
                    <a href="/apply/download?fileName=${file.cfile_orgname}" download="${file.cfile_orgname}">Download File</a>
                    <button onclick="deleteFile('${file.cfile_orgname}')">Delete File</button>
                </c:forEach>
            </div>


    		<div class="form-control">
                <label for="username">매출액</label>
                <input type="text" id="company_sales" name="company_sales" value="${applyDTO.company_sales}" required/>
                <small id="sales-error" style="color: red;"></small><br><br>
            </div>


    		<input class="button"type="submit" value="제출">
    	</form>
    </div>





    <script>

    function deleteFile(fileName) {
        if (confirm("이 파일을 삭제하시겠습니까?")) {
            // AJAX를 사용하여 서버에 파일 삭제 요청을 보냅니다.
            fetch(`/deleteFile?fileName=${fileName}`, {
                method: 'DELETE'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // 파일 삭제가 성공적으로 수행될 때 필요한 동작을 수행합니다.
                    alert("파일이 성공적으로 삭제되었습니다.");
                    location.reload(); // 페이지 새로고침 (또는 필요한 다른 동작 수행)
                } else {
                    alert("파일 삭제 중 오류가 발생했습니다.");
                }
            })
            .catch(error => console.error('Error:', error));
        }
    }

    function previewLogo(event) {
        var logoInput = event.target;
        var logoPreview = document.getElementById("logo-preview");

        var file = logoInput.files[0];

        if (file) {
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

            if (!allowedExtensions.exec(file.name)) {
                document.getElementById("logo-error").textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                logoInput.value = ""; // 파일 선택 해제
                logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
            } else {
                // 파일 유효성 검사 통과 시 미리보기 설정
                document.getElementById("logo-error").textContent = ""; // 유효성 검사 메시지 지우기
                logoPreview.style.display = "block"; // 이미지 미리보기 표시

                var reader = new FileReader();
                reader.onload = function (e) {
                    logoPreview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        } else {
            logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
        }
    }

    function loadLowerLoc() {
                    var upperLocValue = document.getElementById("upperLoc").value;

                    fetch('/getLowerLoc?upperLoc=' + upperLocValue)
                        .then(response => response.json())
                        .then(data => {
                            var lowerLocSelect = document.getElementById("company_address_code");
                            lowerLocSelect.innerHTML = "";

                            data.forEach(loLoc => {
                                var option = document.createElement("option");
                                option.value = loLoc.detail_code_num;
                                option.text = loLoc.detail_name;
                                lowerLocSelect.appendChild(option);
                            });
                        })
                        .catch(error => console.error('Error:', error));
    }

    function loadBusiness_type_code_up() {
                var upperLocValue = document.getElementById("business_type_code_up").value;

                fetch('/getBusiness_type_code_up?business_type_code_up=' + upperLocValue)
                    .then(response => response.json())
                    .then(data => {
                        var lowerLocSelect = document.getElementById("business_type_code");
                        lowerLocSelect.innerHTML = "";

                        data.forEach(type_code => {
                            var option = document.createElement("option");
                            option.value = type_code.detail_code_num;
                            option.text = type_code.detail_name;
                            lowerLocSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error:', error));
    }

    <%-- 카카오 주소 api 우편번호 찾기 --%>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';  //주소 변수
                    var extraAddr = ''; //참고항목 변수

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }

                    if(data.userSelectedType === 'R'){
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;

                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }

    <%-- 주소 풀버전 만들기 --%>
    function address() {
        var postcode = document.getElementById("sample6_postcode").value;
        var address = document.getElementById("sample6_address").value;
        var detailAddress = document.getElementById("sample6_detailAddress").value;
        var extraAddress = document.getElementById("sample6_extraAddress").value;

        document.getElementById("company_address_detail").value =
            postcode + " " + address + " " + detailAddress + " " + extraAddress;

    }
    function logCompanyAddressDetail() {
        var companyAddressDetail = document.getElementById("company_address_detail").value;
        console.log("company_address_detail 값: " + companyAddressDetail);
    }
    <%-- 폼 제출시 호출되는 함수 --%>
    function onSubmitForm() {
        address();


        logCompanyAddressDetail();


   }


    var company_hpInput = document.getElementById("company_hp");
    var phoneError = document.getElementById("phone-error");

    company_hpInput.addEventListener("input", function () {
       if (!company_hpInput.checkValidity()) {
           phoneError.textContent = "전화번호 형식이 잘못되었습니다. 예: 010-1234-5678";
       } else {
           phoneError.textContent = "";
       }
    });

    <%-- 로고 업로드 유효성검사--%>
    var logoInput = document.getElementById("logo");
    var logoError = document.getElementById("logo-error");

    logoInput.addEventListener("change", function () {
        var file = logoInput.files[0];
        if (file) {
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
            if (!allowedExtensions.exec(file.name)) {
                logoError.textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                logoInput.value = ""; // 파일 선택 해제
            } else {
                logoError.textContent = ""; // 유효성 검사 메시지 지우기
            }
        }
    });

    <%-- 파일 유효성검사 --%>
    var documentInput = document.getElementById("document");
    var documentError = document.getElementById("document-error");

    documentInput.addEventListener("change", function () {
        var files = documentInput.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var allowedExtensions = /(\.pdf|\.doc|\.docx|\.pptx|\.xlsx)$/i;
            if (!allowedExtensions.exec(file.name)) {
                documentError.textContent = "문서 파일 (.pdf, .doc, .docx, .pptx, .xlsx)만 업로드할 수 있습니다.";
                documentInput.value = ""; // 파일 선택 해제
                return; // 유효성 검사 실패 시 함수 종료
            }
        }
        documentError.textContent = ""; // 유효성 검사 메시지 지우기
    });

    <%-- 매출액 숫자 유효성검사 --%>
            document.querySelector("form").addEventListener("submit", function (event) {
                    var companySalesInput = document.getElementById("company_sales");
                    var value = companySalesInput.value;
                    var isValid = /^\d+$/.test(value);

                    var salesError = document.getElementById("sales-error");

                    if (!isValid) {
                        salesError.textContent = "숫자만 입력하세요.";
                        event.preventDefault(); // 제출 방지
                    } else {
                        salesError.textContent = ""; // 유효성 검사 메시지 지우기
                    }

                    // 다른 필드의 유효성 검사 수행
                    // 필요한 다른 유효성 검사 수행
                });

    <%--로고 바로보여지게--%>
    var logoInput = document.getElementById("logo");
    var logoPreview = document.getElementById("logo-preview");
    var logoError = document.getElementById("logo-error");

    logoInput.addEventListener("change", function () {
        var file = logoInput.files[0];

        if (file) {
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

            if (!allowedExtensions.exec(file.name)) {
                logoError.textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                logoInput.value = ""; // 파일 선택 해제
                logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
            } else {
                // 파일 유효성 검사 통과 시 미리보기 설정
                logoError.textContent = ""; // 유효성 검사 메시지 지우기
                logoPreview.style.display = "block"; // 이미지 미리보기 표시

                var reader = new FileReader();
                reader.onload = function (e) {
                    logoPreview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }
    });






    </script>
</body>
</html>
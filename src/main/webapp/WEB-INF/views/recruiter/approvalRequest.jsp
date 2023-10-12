<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page"xmlns:fmt="http://java.sun.com/JSP/Page">
<html>
<head>
    <title>입력해</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <h2>사용자 정보 입력</h2>
        <form action="/apply" method="post" enctype="multipart/form-data" onsubmit="return onSubmitForm();">
            <!-- 텍스트 입력 필드 -->
            <label for="name">회사명:</label>
            <input type="text" id="company_name" name="company_name" required><br><br>
            <label for="name">회원번호:</label>
                        <input type="number" id="member_no" name="member_no" required><br><br>


            <label for="name">회사전화번호:</label>
                        <input type="text" id="company_hp" name="company_hp" pattern="\d{3}-\d{4}-\d{4}">
                        <small id="phone-error" style="color: red;"></small><br><br>

            <label for="name">대표자명:</label>
                        <input type="text" id="ceo_name" name="ceo_name" required><br><br>

            <label for="name">회사분류:</label>
                        <input type="text" id="company_type" name="company_type" required><br><br>

            <div>
                   <input type="text" id="sample6_postcode" placeholder="우편번호">
                   <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                   <input type="text" id="sample6_address" placeholder="주소"><br>
                   <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                   <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                   <input type="hidden" id="company_address_detail" name="company_address_detail" required>
            </div>

            <label for="name">회사업종코드:</label>
                            <select id="business_type_code_up" name="business_type_code_up" onchange="loadBusiness_type_code_up()" required>
                                    <option value="">선택</option>
                                    <c:forEach items="${upperJob}" var="upJob">
                                        <option value="${upJob.detail_code_num}">${upJob.detail_name}</option>
                                    </c:forEach>
                            </select>
                            </select>
                                   <select id="business_type_code" name="business_type_code" required>
                                         <option value="">선택</option>
                                         <c:forEach items="${lowerJob}" var="loJob">
                                            <option value="${loJob.detail_code_num}">${loJob.detail_name}</option>
                                         </c:forEach>
            </select><br><br>

            <label for="name">회사주소코드:</label>
            <select id="upperLoc" name="upperLoc" onchange="loadLowerLoc()" required>
                        <option value="">선택</option>
                        <c:forEach items="${upperLoc}" var="upLoc">
                            <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                        </c:forEach>
            </select>
            </select>
            <select id="company_address_code" name="company_address_code" required>
                        <option value="">선택</option>
                        <c:forEach items="${lowerLoc}" var="loLoc">
                             <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                        </c:forEach>
            </select><br><br>

           <label for="logo">로고 업로드:</label>
                        <input type="file" id="logo" name="logo" accept="image/*" required>
                        <small id="logo-error" style="color: red;"></small><br><br>

           <label for="document">문서 업로드:</label>
               <input type="file" id="document" name="document" accept=".pdf, .doc, .docx , .pptx , .xlsx" required multiple>
               <small id="document-error" style="color: red;"></small><br><br>




            <label for="name">매출액:</label>
                        <input type="text" id="company_sales" name="company_sales" required><p style="display: inline;">(숫자만 입력)</p>
                        <small id="sales-error" style="color: red;"></small><br><br>

            <!-- <label for="name">로고원본명:</label>
                        <input type="text" id="logo_orgname" name="logo_orgname" required><br><br>

            <label for="name">로고저장명:</label>
                        <input type="text" id="logo_savname" name="logo_savname" required><br><br>-->







            <!-- 제출 버튼 -->
            <input type="submit" value="제출">
        </form>

<script>


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

</script>
</body>
</html>

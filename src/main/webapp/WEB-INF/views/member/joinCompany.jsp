<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>기업 회원가입</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="/css/member/joinCompany.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="/join/company" method="post" class="joinForm" onsubmit="return onSubmitForm();">
    <h2>기업 회원가입</h2>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_id">아이디</label>
            <div class="inputWithMessage">
                <input type="text" id="member_id" name="member_id" class="id" required oninput="checkDuplicate()"
                       placeholder="4~20자리 / 영문, 숫자, '_' 사용가능">
                <p id="idCheckMsg"></p>
            </div>
            <c:forEach var="error" items="${errors}">
                <c:if test="${error.field == 'member_id'}">
                    <p style="color: red;">${error.defaultMessage}</p>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_pw">비밀번호</label>
            <div class="inputWithMessage">
                <input type="password" id="member_pw" name="member_pw" class="pw" required placeholder="4~8자리 / 영문 대소문자, 숫자, 특수문자 사용가능">
                <p id="pwMsg"></p>
            </div>
            <c:forEach var="error" items="${errors}">
                <c:if test="${error.field == 'member_pw'}">
                    <p style="color: red;">${error.defaultMessage}</p>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_pw_confirm">비밀번호 확인</label>
            <div class="inputWithMessage">
                <input type="password" id="member_pw_confirm" name="member_pw_confirm" class="pw" required>
                <p id="pwEqualMsg"></p>
            </div>
            <c:if test="${not empty errorMessage}">
                <p style="color: red;">${errorMessage}</p>
            </c:if>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_name">이름</label>
            <div class="inputWithMessage">
                <input type="text" id="member_name" name="member_name" class="name" required oninput="validateInput()" onblur="nameEmpty()" placeholder="이름 입력">
                <p id="nameCheckMsg"</p>
            </div>
            <c:forEach var="error" items="${errors}">
                <c:if test="${error.field == 'member_name'}">
                    <p style="color: red;">${error.defaultMessage}</p>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_birth">생년월일</label>
            <div class="inputWithMessage">
                <input type="text" id="member_birth" name="member_birth" class="id" pattern="^\d{8}$" placeholder="YYYYMMDD" required>
                <p id="birthMsg" class="message"></p>
            </div>
            <c:if test="${not empty errors}">
                <c:forEach var="error" items="${errors}">
                    <c:if test="${error.field == 'member_birth'}">
                        <p style="color: red;">${error.defaultMessage}</p>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <p style="color: red;">${errorMessage}</p>
            </c:if>
        </div>
    </div>

    <div class="textForm">
       <div class="inputGroup">
           <label for="gender" class="genderLabel">성별</label>
           <div class="genderSelection" style="margin-right:50px;">
               <label class="placeholderColor" style="margin-left:30px;">
                   <input type="radio" id="gender" name="member_sex" value="male" required style="width:55px;">남
               </label>
               <label class="placeholderColor">
                   <input type="radio" name="member_sex" value="female" required style="width:50px;">여
               </label>
           </div>
       </div>
    </div>

    <div class="textForm">
        <div class="inputGroup">
            <label for="member_hp">휴대폰</label>
            <input type="text" id="member_hp" name="member_hp" class="cellphoneNo" required pattern="^\d{3}\d{3,4}\d{4}$"
                   placeholder="'-' 빼고 숫자만 입력" style="margin-left:-850px; margin-bottom:0px; width:300px; margin-right:0px;">
            <button type="button" id="phone1Btn" class="btn" style="margin-bottom: 0px;">인증요청</button>
            <p id="hpMsg"></p>
            <c:forEach var="error" items="${errors}">
                <c:if test="${error.field == 'member_hp'}">
                    <p style="color: red;">${error.defaultMessage}</p>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_hp2">인증번호 입력</label>
               <input type="text" id="member_hp2" placeholder="인증번호를 입력해 주세요">
               <span id="countdown" style="margin-right: 10px;"></span>
               <button type="button" id="phone2Btn" class="btn" style="margin-bottom: 0px;">확인</button>
               <p id="hp2Msg"></p>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="member_email">이메일</label>
            <input type="email" id="member_email" name="member_email" class="email" required style="margin-left:105px;"
                   pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$" placeholder="email@jobstartup.com">
            <p id="emailMsg" style="color:red;"></p>
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="sample6_address">주소</label>
            <input type="text" id="sample6_postcode" placeholder="우편번호">
            <img src="${cPath}/img/glasses.png" alt="" style="width: 20px; cursor: pointer; position: absolute; top: 100; right: 0px;" onclick="sample6_execDaumPostcode();">
            <input type="text" id="sample6_address" placeholder="주소">
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width: 250px; margin-left: 160px;">
        </div>
    </div>
     <div class="textForm">
        <div class="inputGroup">
            <input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width: 250px; margin-left: 160px;">
            <input type="hidden" id="member_loc" name="member_loc">
        </div>
    </div>
    <div class="textForm">
        <div class="inputGroup">
            <label for="business_no">사업자등록번호</label>
            <input type="text" id="business_no" name="business_no" class="cellphoneNo" maxlength="10" placeholder="사업자등록번호 직접 입력(10자리)" style="margin-left:80px">
            <p id="result"></p>
        </div>
    </div>
    <div>
        <input type="submit" class="btn specialBtn" value="확인">
    </div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    <%-- 아이디 유효성 검사 로직 --%>

    function isValidId(id) {
        if (id.length < 4 || id.length > 20) {
            return false;
        }

        const idPattern = /^[a-zA-Z0-9_]+$/;
        return idPattern.test(id);
    }

    let timeoutId;

    function checkDuplicate() {
        clearTimeout(timeoutId);

        var memberId = document.getElementById("member_id").value;
        var message = document.getElementById("idCheckMsg")

        if (!isValidId(memberId)) {
            message.innerText = "아이디는 4~20자의 영문, 숫자, '_'로 이루어져야 합니다.";
            message.style.color = "red";
            return;
        }

        if (!memberId) {
            message.innerText = "아이디를 입력하세요.";
            message.style.color = "red";
            return;
        }

        timeoutId = setTimeout(() => {
            fetch('/join/checkDuplicate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({member_id: memberId})
            })
                .then(response => response.json())
                .then(data => {
                    if (data.isDuplicate) {
                        message.innerText = "이미 사용 중인 아이디입니다.";
                        message.style.color = "red";
                    } else {
                        message.innerText = "사용 가능한 아이디입니다.";
                        message.style.color = "blue";
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    message.innerText = "오류가 발생했습니다. 다시 시도하세요.";
                    message.style.color = "red";
                });
        }, 500);
    }

    <%-- 비밀번호 유효성 검사 로직 --%>
    document.getElementById('member_pw').addEventListener('focus', showMessage);
    document.getElementById('member_pw').addEventListener('input', makePassword);

    function showMessage() {
        var pwMsg = document.getElementById('pwMsg');
        pwMsg.innerText = '4~8자리 영문 대소문자, 숫자, 특수문자 중 2가지 조합으로 만들어 주세요';
        pwMsg.style.color = "red";
    }

    function makePassword() {
        var password = document.getElementById('member_pw').value;
        var pwMsg = document.getElementById('pwMsg');
        var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,8}$|(?=.*[A-Za-z])(?=.*[\W_])[A-Za-z\W_]{4,8}$|(?=.*\d)(?=.*[\W_])[\d\W_]{4,8}$/;

        if (!regex.test(password)) {
            pwMsg.innerText = '4~8자리 영문 대소문자, 숫자, 특수문자 중 2가지 조합으로 만들어 주세요';
            pwMsg.style.color = "red";
        } else {
            pwMsg.innerText = '사용 가능한 비밀번호입니다';
            pwMsg.style.color = "blue";
        }
    }

    <%-- 비밀번호 확인 --%>
    document.getElementById('member_pw_confirm').addEventListener('input', validatePassword);

    function validatePassword() {
        var password = document.getElementById("member_pw").value;
        var passwordConfirm = document.getElementById("member_pw_confirm").value;
        var pwEqualMsg = document.getElementById("pwEqualMsg");

        if (password !== passwordConfirm) {
            pwEqualMsg.innerText = "비밀번호가 일치하지 않습니다.";
            pwEqualMsg.style.color = "red";
            return false;
        } else {
            pwEqualMsg.innerText = "";
            return true;
        }
    }


    <%-- 카카오 주소 api 우편번호 찾기 --%>

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = '';  //주소 변수
                var extraAddr = ''; //참고항목 변수

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
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

        document.getElementById("member_loc").value =
            postcode + " " + address + " " + detailAddress + " " + extraAddress;
    }

    <%-- 폼 제출시 호출되는 함수 --%>

    function onSubmitForm() {
        address();

        return validatePassword();
    }

    <%-- 이름 유효성 검사 로직 --%>

    function validateInput() {
        var nameInput = document.getElementById("member_name").value;
        var message = document.getElementById("nameCheckMsg");

        var namePattern = /^[a-zA-Z가-힣]+$/;

        if (!namePattern.test(nameInput) && nameInput !== "") {
            message.innerText = "이름에는 특수문자와 숫자를 사용할 수 없습니다.";
            nameCheckMsg.style.color = "red";
        } else {
            message.innerText = "";
        }
    }

    function nameEmpty() {
        var nameInput = document.getElementById("member_name").value;
        var message = document.getElementById("nameCheckMsg");

        if (!nameInput) {
            message.innerText = "이름은 필수 입력 정보입니다.";
            nameCheckMsg.style.color = "red";
        } else {
            message.innerText = "";
        }
    }

    <%-- 생년월일 유효성 검사 --%>
    document.getElementById("member_birth").addEventListener("input", validateBirthDate);
    document.getElementById("member_birth").addEventListener("blur", validateBirthDate);
    document.getElementById("member_birth").addEventListener("focus", showAgeMessage);

    function validateBirthDate() {
        var input = this.value;
        var birthMsg = document.getElementById("birthMsg");

        if (input === "") {
            birthMsg.innerText = "생년월일은 필수 입력 정보입니다";
        } else if (isValidDate(input)) {
            birthMsg.innerText = "";
        } else {
            birthMsg.innerText = "YYYYMMDD 입력 형식을 확인해 주세요";
        }
        birthMsg.style.color = "red";

    }

    function isValidDate(dateStr) {
        var year = Number(dateStr.substr(0, 4));
        var month = Number(dateStr.substr(4, 2));
        var day = Number(dateStr.substr(6, 2));

        if (1900 > year || year > new Date().getFullYear() || month < 1 || month > 12 || day < 1 || day > 31) {
            return false;
        } else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
            return false;
        } else if (month == 2) {
            var isLeapYear = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
            return !(day > 29 || (day == 29 && !isLeapYear));
        } else {
            return true;
        }
    }

    function showAgeMessage() {
        var birthMsg = document.getElementById('birthMsg');
        birthMsg.innerText = '만 15세 이상인지 확인이 필요해요';
        birthMsg.style.color = "red";
        birthMsg.style.display = "block";
    }

    <%-- 휴대폰 번호 유효성 검사 --%>
    document.getElementById("member_hp").addEventListener("input", validatePhoneNumber);

    function validatePhoneNumber() {
        var input = this.value;
        var hpMsg = document.getElementById("hpMsg");

        var phonePattern = /^\d{3}\d{3,4}\d{4}$/;

        if (input === "") {
            hpMsg.innerText = "휴대폰 번호는 필수 입력 정보입니다";
            hpMsg.style.color = "red";
        } else if (!phonePattern.test(input)) {
            hpMsg.innerText = "잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해 주세요";
            hpMsg.style.color = "red";
        } else {
            hpMsg.innerText = "";
        }
    }

    <%-- 핸드폰 본인인증 --%>
    var originalCode;

    $(document).ready(function(){
        var countdownTimer;
        var timeLeft = 180;

        $('#phone1Btn').click(function(){
            var phoneNumber = $('#member_hp').val();

            $.ajax({
                url: '/join/phoneCheck',
                type: 'POST',
                data: { 'userPhoneNumber': phoneNumber },
                success: function(response) {
                    $('#phone1Btn').text('재발송');
                    timeLeft = 180;
                    startCountdown();
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        });

    $('#phone2Btn').click(function(){
        var userEnteredCode = $('#member_hp2').val();

        $.ajax({
            url: '/join/verifyCode',
            type: 'POST',
            data: { 'userEnteredCode': userEnteredCode },
            success: function(response) {
                if(response.verified) {
                    $('#hp2Msg').text('인증이 완료되었습니다').css('color', 'blue');

                    clearInterval(countdownTimer);
                    $('#countdown').text('');
                } else {
                    $('#hp2Msg').text('인증번호가 일치하지 않습니다. 다시 입력해 주세요').css('color', 'red');
                }
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
    });

    <%-- 핸드폰 인증번호 입력 시간 3분 카운트다운 --%>
        function startCountdown() {
            clearInterval(countdownTimer);

            countdownTimer = setInterval(function() {
                var minutes = Math.floor(timeLeft / 60);
                var seconds = timeLeft % 60;

                $('#countdown').text(minutes + '분 ' + seconds + '초').css('color', 'red');

                timeLeft--;

                if (timeLeft < 0) {
                    clearInterval(countdownTimer);
                    $('#hp2Msg').text('인증 시간이 만료되었습니다. 인증번호를 다시 받아주세요').css('color', 'red');
                }
            }, 1000);
        }
    });

    <%-- 이메일 유효성 검사 --%>
    $(document).ready(function () {
        $('#member_email').on('blur', function () {
            var emailInput = $(this).val();

            if (!emailInput.match(/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/)) {
                $('#emailMsg').text('잘못된 이메일 주소입니다. 이메일 주소를 정확하게 입력해주세요').css('color', 'red');
                return;
            }

            $.ajax({
                url: '/join/duplicateEmail',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({'member_email': emailInput}),
                success: function (response) {
                    if (response.isDuplicate) {
                        $('#emailMsg').text('이미 사용 중인 이메일 주소입니다').css('color', 'red');
                    } else {
                        $('#emailMsg').text('사용 가능한 이메일 주소입니다').css('color', 'blue');
                    }
                },
                error: function (error) {
                    console.error('Error:', error);
                }
            });
        });
    });

// 사업자등록번호 상태조회 함수
function checkBusinessNoStatus(businessNumber) {
    $.ajax({
        url: "/join/duplicateBusinessNo",
        type: "POST",
        data: {business_no: businessNumber},
        success: function (isDuplicated) {
            if (isDuplicated) {
                $("#result").text("이미 사용 중인 사업자번호입니다").css('color', 'red');
            } else {
                var data = {
                    "b_no": [businessNumber]
                };

                $.ajax({
                    url: "http://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=xuAfhMKhUa%2B1jNrdQ1fDVMZ%2F3iAYEDs3pblcc50QZPoB23k4kXlYiJ7N1HqZt49lj0fCgLRj7%2BmNrVWjxYfxRA%3D%3D",
                    type: "POST",
                    data: JSON.stringify(data),
                    dataType: "JSON",
                    contentType: "application/json",
                    accept: "application/json",
                    success: function (result) {
                        var taxType = result.data[0].tax_type;

                        if (taxType === "국세청에 등록되지 않은 사업자등록번호입니다.") {
                            $("#result").text(taxType).css('color', 'red');
                        } else {
                            $("#result").text("유효한 사업자등록번호입니다.").css('color', 'blue');
                        }
                    },
                    error: function (result) {
                        console.log(result.responseText);
                    }
                });
            }
        },
        error: function (error) {
            console.log(error.responseText);
        }
    });
}

// 사업자등록번호 유효성 검사
$("#business_no").on("blur", function () {
    if ($(this).val() === "") {
        $("#result").text("사업자등록번호를 입력하세요").css('color', 'red');
    }
});

$("#business_no").on("keyup", function () {
    var inputValue = $(this).val();

    clearTimeout(timeoutId);

    timeoutId = setTimeout(function() {
        if (isNaN(inputValue)) {
            $("#result").text("사업자번호는 숫자만 입력하세요").css('color', 'red');
        } else if (inputValue.length === 10) {
            $("#result").text("");
            checkBusinessNoStatus(inputValue);
        }
    }, 1000);
});

// 복사 붙여넣기 할 때 '-'가 있으면 제거하고 숫자만 적기
document.getElementById("business_no").addEventListener("paste", function(e) {
    var clipboardData = e.clipboardData || window.clipboardData;
    var pastedData = clipboardData.getData('Text');

    var modifiedData = pastedData.replace(/[^0-9]/g, '');

    e.preventDefault();
    e.target.value = modifiedData;

    // 이전 타이머 해제
    clearTimeout(timeoutId);

    // 2초 후에 함수 실행
    timeoutId = setTimeout(function() {
        checkBusinessNoStatus(modifiedData);
    }, 2000);
});

</script>
</body>
</html>
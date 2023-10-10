<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>개인 회원가입</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<h2>개인 회원가입</h2>
<form action="/joinCommon" method="post" onsubmit="return onSubmitForm();">
   <div>
       <label for="member_id">아이디</label>
       <input type="text" id="member_id" name="member_id" required oninput="checkDuplicate()" placeholder="4~20자리 / 영문, 숫자, '_' 사용가능">
       <p id="idCheckMsg"></p>
       <c:forEach var="error" items="${errors}">
           <c:if test="${error.field == 'member_id'}">
               <p style="color: red;">${error.defaultMessage}</p>
           </c:if>
       </c:forEach>
   </div>
   <div>
       <label for="member_pw">비밀번호</label>
       <input type="password" id="member_pw" name="member_pw" required placeholder="4~8자리 / 영문 대소문자, 숫자, 특수문자 사용가능">
       <p id="pwMsg" style="color:red;"></p>
       <c:forEach var="error" items="${errors}">
          <c:if test="${error.field == 'member_pw'}">
              <p style="color: red;">${error.defaultMessage}</p>
          </c:if>
       </c:forEach>
   </div>
   <div>
       <label for="member_pw_confirm">비밀번호 확인</label>
       <input type="password" id="member_pw_confirm" name="member_pw_confirm" required>
       <p id="pwEqualMsg" style="color:red;"></p>
       <c:if test="${not empty errorMessage}">
           <p style="color: red;">${errorMessage}</p>
       </c:if>
   </div>
   <div>
       <label for="member_name">이름</label>
       <input type="text" id="member_name" name="member_name" required oninput="validateInput()" onblur="nameEmpty()" placeholder="이름 입력">
       <p id="nameCheckMsg" style="color: red;"></p>
        <c:forEach var="error" items="${errors}">
           <c:if test="${error.field == 'member_name'}">
               <p style="color: red;">${error.defaultMessage}</p>
           </c:if>
        </c:forEach>
   </div>
   <div>
       <label for="member_birth">생년월일</label>
       <input type="text" id="member_birth" name="member_birth" pattern="^\d{8}$" placeholder="YYYYMMDD" required>
       <p id="birthMsg" style="color:red;"></p>
       <p id="ageMsg" style="color:red;"></p>
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
   <div>
       <label>
           <input type="radio" name="member_sex" value="male" required>남
       </label>
       <label>
           <input type="radio" name="member_sex" value="female" required>여
       </label>
   </div>
   <div>
       <label for="member_hp">휴대폰</label>
       <input type="text" id="member_hp" name="member_hp" required pattern="^\d{3}\d{3,4}\d{4}$" placeholder="'-' 빼고 숫자만 입력">
       <button type="button" id="phone1Btn">인증요청</button>
       <p id="hpMsg" style="color:red;"></p>
       <c:forEach var="error" items="${errors}">
          <c:if test="${error.field == 'member_hp'}">
              <p style="color: red;">${error.defaultMessage}</p>
          </c:if>
       </c:forEach>
       <div id="certificationDiv" style="display: none;">
           <input type="text" id="member_hp2" placeholder="인증번호를 입력해 주세요">
           <button type="button" id="phone2Btn">확인</button>
           <p id="countdown"></p>
           <p id="hp2Msg"></p>
       </div>
   </div>
   <div>
       <label for="member_email">이메일:</label>
       <input type="email" id="member_email" name="member_email" required pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$" title="올바른 이메일 형식을 입력해주세요.">
   </div>
   <div>
       <input type="text" id="sample6_postcode" placeholder="우편번호">
       <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
       <input type="text" id="sample6_address" placeholder="주소"><br>
       <input type="text" id="sample6_detailAddress" placeholder="상세주소">
       <input type="text" id="sample6_extraAddress" placeholder="참고항목">
       <input type="hidden" id="member_loc" name="member_loc">
   </div>
   <div>
       <input type="submit" value="확인">
       <input type="reset" value="취소">
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
        return;
    }

    if (!memberId) {
        message.innerText = "아이디를 입력하세요.";
        return;
    }

    timeoutId = setTimeout(() => {
        fetch('/checkDuplicate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ member_id: memberId })
            })
            .then(response => response.json())
            .then(data => {
                if (data.isDuplicate) {
                    message.innerText = "이미 사용 중인 아이디입니다.";
                } else {
                    message.innerText = "사용 가능한 아이디입니다.";
                }
            })
            .catch(error => {
                console.error('Error:', error);
                message.innerText = "오류가 발생했습니다. 다시 시도하세요.";
            });
    }, 500);
}

<%-- 비밀번호 유효성 검사 로직 --%>
document.getElementById('member_pw').addEventListener('focus', showMessage);
document.getElementById('member_pw').addEventListener('input', makePassword);

function showMessage() {
    var pwMsg = document.getElementById('pwMsg');
    pwMsg.innerText = '4~8자리 영문 대소문자, 숫자, 특수문자 중 2가지 조합으로 만들어 주세요';
}

function makePassword() {
    var password = document.getElementById('member_pw').value;
    var pwMsg = document.getElementById('pwMsg');
    var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,8}$|(?=.*[A-Za-z])(?=.*[\W_])[A-Za-z\W_]{4,8}$|(?=.*\d)(?=.*[\W_])[\d\W_]{4,8}$/;

    if(!regex.test(password)) {
        pwMsg.innerText = '4~8자리 영문 대소문자, 숫자, 특수문자 중 2가지 조합으로 만들어 주세요';
    } else {
        pwMsg.innerText = '사용 가능한 비밀번호입니다';
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
        return false;
    } else {
        pwEqualMsg.innerText = "";
        return true;
    }
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
    } else {
        message.innerText = "";
    }
}

function nameEmpty() {
    var nameInput = document.getElementById("member_name").value;
    var message = document.getElementById("nameCheckMsg");

    if (!nameInput) {
        message.innerText = "이름은 필수 입력 정보입니다.";
    } else {
        message.innerText = "";
    }
}

<%-- 생년월일 유효성 검사 --%>
document.getElementById("member_birth").addEventListener("input", validateBirthDate);
document.getElementById("member_birth").addEventListener("blur", validateBirthDate);
document.getElementById("member_birth").addEventListener("focus", showAgeMessage);
document.getElementById("member_birth").addEventListener("blur", hideAgeMessage);

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
}

function isValidDate(dateStr) {
    var year = Number(dateStr.substr(0,4));
    var month = Number(dateStr.substr(4,2));
    var day = Number(dateStr.substr(6,2));

    if (1900 > year || year > new Date().getFullYear() || month < 1 || month > 12 || day < 1 || day > 31) {
        return false;
    }
    else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
        return false;
    }
    else if (month == 2) {
        var isLeapYear = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        return !(day > 29 || (day == 29 && !isLeapYear));
    }
    else {
        return true;
    }
}

function showAgeMessage() {
    document.getElementById('ageMsg').innerText = '만 15세 이상인지 확인이 필요해요';
}

function hideAgeMessage() {
    document.getElementById('ageMsg').innerText = '';
}

<%-- 휴대폰 번호 유효성 검사 --%>
document.getElementById("member_hp").addEventListener("input", validatePhoneNumber);

function validatePhoneNumber() {
    var input = this.value;
    var hpMsg = document.getElementById("hpMsg");

    var phonePattern = /^\d{3}\d{3,4}\d{4}$/;

    if (input === "") {
        hpMsg.innerText = "휴대폰 번호는 필수 입력 정보입니다";
    } else if (!phonePattern.test(input)) {
        hpMsg.innerText = "잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해 주세요";
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
            url: '/phoneCheck',
            type: 'POST',
            data: { 'userPhoneNumber': phoneNumber },
            success: function(response) {
                $('#certificationDiv').show();
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
        url: '/verifyCode',
        type: 'POST',
        data: { 'userEnteredCode': userEnteredCode },
        success: function(response) {
            if(response.verified) {
                $('#hp2Msg').text('인증이 완료되었습니다.');
                $('#phone1Btn, #phone2Btn, #member_hp, #member_hp2').attr('disabled', 'disabled');
            } else {
                $('#hp2Msg').text('인증번호가 일치하지 않습니다. 다시 입력해 주세요');
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

            $('#countdown').text('남은 시간: ' + minutes + '분 ' + seconds + '초');

            timeLeft--;

            if (timeLeft < 0) {
                clearInterval(countdownTimer);
                $('#hp2Msg').text('인증 시간이 만료되었습니다. 인증번호를 다시 받아주세요.');
            }
        }, 1000);
    }
});
</script>
</body>
</html>
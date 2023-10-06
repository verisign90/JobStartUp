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
       <input type="password" id="member_pw" name="member_pw" required>
   </div>
   <div>
       <label for="member_pw_confirm">비밀번호 확인</label>
       <input type="password" id="member_pw_confirm" name="member_pw_confirm" required>
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
       <input type="text" id="member_birth" name="member_birth" pattern="^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$" placeholder="YYYYMMDD" required>
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
       <input type="text" id="member_hp" name="member_hp" required pattern="^\d{3}\d{3,4}\d{4}$" title="'-' 빼고 숫자만 입력">
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

<%-- 비밀번호 확인 --%>
function validatePassword() {
    var password = document.getElementById("member_pw").value;
    var passwordConfirm = document.getElementById("member_pw_confirm").value;

    if (password !== passwordConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    return true;
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



</script>
</body>
</html>
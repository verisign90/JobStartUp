<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>개인회원 아이디/비밀번호 찾기</title>
    <link href="/css/member/idpw.css" rel="stylesheet" type="text/css">
</head>
<body>
<article class="hero">
<h2>개인회원 아이디/비밀번호 찾기</h2>
    <div class="login wrap">
        <div class="login-html">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">아이디 찾기</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">비밀번호 찾기</label>
                <div class="login-form">
                    <div class="sign-in-htm">
                        <form action="/member/findPersonId" method="post">
                            <input type="hidden" name="requestType" value="findId">
                            <div class="group">
                                <h4>휴대폰 번호 확인</h4>
                                <h5>휴대폰을 이용하여 아이디를 확인하실 수 있습니다</h5>
                                <!-- <label for="name">이름:</label> -->
                                <input type="text" id="name" name="name" class="input" placeholder="이름" required>
                            </div>
                            <div class="group">
                                <!-- <label for="phone">핸드폰 번호:</label> -->
                                <input type="tel" id="phone" name="phone" class="input" placeholder="핸드폰 번호" pattern="[0-9]{3}[0-9]{3,4}[0-9]{4}" required placeholder="'-'없이 입력">
                            </div>
                            <div class="group">
                                <button type="submit" class="button">확인</button>
                            </div>
                        </form>
                        <div class="hr"></div>
                    </div>

                    <div class="sign-up-htm">
                    <c:if test="${not empty message}">
                           <script>
                               alert('${message}');
                           </script>
                    </c:if>
                        <form action="/member/findPersonPassword" method="post">
                        <input type="hidden" name="requestType" value="findPassword">
                        <div class="group">
                            <h4>휴대폰 번호 확인</h4>
                            <!-- <label for="id">아이디</label> -->
                            <input type="text" id="id" name="memberId" class="input" placeholder="아이디" required>
                        </div>
                        <div class="group">
                            <!-- <label for="name">이름:</label> -->
                            <input type="text" id="name" name="memberName" class="input" placeholder="이름" required>
                        </div>
                        <div class="group">
                            <!-- <label for="phone">전화번호:</label> -->
                            <input type="text" id="phone" name="memberPhone" class="input" placeholder="전화번호" required>
                        </div>
                        <div class="group">
                            <input type="submit" class="button" value="확인">
                        </div>
                        </form>
                    </div>
                </div>
        </div>
    </div>
</article>
<div id="modal-one" class="modal" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-header">
            <h2>아이디 조회 결과</h2>
            <a href="#" class="btn-close" onclick="closeModal()">x</a>
        </div>
        <div class="modal-body">
            <p id="result"></p>
        </div>
        <div class="modal-footer">
            <a href="/login" class="btn" onclick="closeModal()" style="background-color: blue; color: white;">로그인</a>
        </div>
    </div>
</div>

</body>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var modal = document.getElementById('modal-one');
    var closeModal = document.querySelector('.btn-close');
    var resultDiv = document.getElementById('result');
    var nameInput = document.getElementById('name');
    var phoneInput = document.getElementById('phone');

    // 아이디 찾기 폼
    document.querySelector('.sign-in-htm form').addEventListener('submit', function (event) {
        event.preventDefault();
        var name = nameInput.value.trim();
        var phone = phoneInput.value.trim();

        if (name === "" || phone === "") {
            alert("Please enter both name and phone number.");
            return;
        }

        fetch('/member/findPersonId', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'name=' + encodeURIComponent(name) + '&phone=' + encodeURIComponent(phone)
        })
        .then(response => response.json())
        .then(data => {
            resultDiv.textContent = data.message;
            modal.style.display = 'block';
        })
        .catch(error => console.error('Error fetching data: ', error));
    });

    closeModal.addEventListener('click', function () {
        modal.style.display = 'none';
    });

    // 비밀번호 찾기 폼
    document.querySelector('.sign-up-htm form').addEventListener('submit', function (event) {
        event.preventDefault();

        var formData = new FormData(event.target);

        fetch('/member/findPersonPassword', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
             if (data.status === 'success') {
                // 회원 정보를 찾았을 때, 페이지 리디렉션 수행
                window.location.href = '/member/updatePassword';
            }
        })
        .catch(error => console.error('Error fetching data: ', error));
    });
});

</script>
</html>

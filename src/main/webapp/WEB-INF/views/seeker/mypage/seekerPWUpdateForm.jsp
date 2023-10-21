<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-10-21
  Time: 오후 5:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<main>
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center custom-padding">
                <h3 class="">비밀번호 변경</h3>
                <form action="${cPath}/seeker/userPWUpdate" method="post" onsubmit="return checkPasswordMatch()">
                    <div>
                        현재 비밀번호: <input type="password" id="member_name" name="member_name" value="${member.member_pw}"/>
                    </div>
                    <div>
                        새 비밀번호: <input type="password" id="member_pw" name="member_pw"/>
                    </div>
                    <div>
                        새 비밀번호 확인: <input type="password" id="member_pw_check" name="member_pw_check"/>
                    </div>

                    <input type="submit" value="변경하기">
                </form>
            </div>
        </div>
    </section>
</main>
<script>
    function checkPasswordMatch() {
        var newPassword = document.getElementById("member_pw").value;
        var confirmPassword = document.getElementById("member_pw_check").value;

        if (newPassword !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해 주세요.");
            return false; // 폼 제출을 중단
        }
        return true; // 폼 제출을 계속
    }
</script>
</body>
</html>

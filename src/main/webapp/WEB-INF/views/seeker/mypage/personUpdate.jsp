<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <%@ include file="../../layout/layoutNav.jsp"%>
    <div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s"></div>
    </div>
</header>
<main>
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center custom-padding">
                <h3 class="">개인정보 수정</h3>
                <form action="${cPath}/seeker/userInfoUpdate" method="post">
                    <div>기본정보</div>
                    <div>
                        이름: <input type="text" id="member_name" name="member_name" value="${member.member_name}"/>
                    </div>
                    <div>
                        생년월일: <input type="text" id="member_birth" name="member_birth" value="${member.member_birth}"/>
                    </div>
                    <div>
                        성별: <input type="text" id="member_sex" name="member_sex" value="${member.member_sex}"/>
                    </div>

                    <div>연락처 정보</div>
                    <div>
                        휴대폰: <input type="text" id="member_hp" name="member_hp" value="${member.member_hp}"/>
                    </div>
                    <div>
                        이메일: <input type="text" id="member_email" name="member_email" value="${member.member_email}"/>
                    </div>
                    <div>
                        주소: <input type="text" id="member_loc" name="member_loc" value="${member.member_loc}"/>
                    </div>


                    <input type="submit" value="수정하기">
                </form>
            </div>
        </div>
    </section>
</main>
</body>
</html>

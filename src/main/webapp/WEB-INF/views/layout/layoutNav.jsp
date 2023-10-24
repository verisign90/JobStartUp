<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
    <script src="https://cdn.jsdelivr.net/gh/sockjs/sockjs-client/dist/sockjs.min.js"></script>
</head>
<body>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
        <div class="row">
            <div class="col-12" style="height: 100px;">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/" class="logo">
                        <img src="/css/template/assets/images/logo.png" style="height: 90px; padding-top: 10px"
                             alt="Chain App Dev">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">취업박람회<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <!-- 드롭다운 항목 추가 -->
                                <li><a href="${cPath}/jobfair/list"> 목록 보기</a></li>
                            </ul>
                        </li>
                        <li class="scroll-to-section dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">채용공고<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <!-- 드롭다운 항목 추가 -->
                                <li><a href="${cPath}/recruiter/JPlist">목록 보기</a></li>
                            </ul>
                        </li>
                        <c:if test="${sessionScope.role == 1}">
                            <li class="scroll-to-section"><a href="${cPath}/seeker/mypageHome">개인서비스</a></li>
                        </c:if>
                        <c:if test="${sessionScope.role == 2}">
                            <li class="scroll-to-section"><a
                                    href="${cPath}/recruiter/myPage?company_no=${sessionScope.companyNo}">기업서비스</a></li>
                        </c:if>
                        <li class="scroll-to-section dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">고객센터<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <!-- 드롭다운 항목 추가 -->
                                <li><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
                                <li><a href="${pageContext.request.contextPath}/qna/list">QnA</a></li>
                                <li><a href="${pageContext.request.contextPath}/qna/write">문의 작성</a></li>
                            </ul>
                        </li>
                        <li class="scroll-to-section" style="min-width: 100px">
                            <a href="${cPath}/admin/dashboard">
                                <c:if test="${sessionScope.role == 3}">관리자</c:if>
                            </a>
                        </li>
                        <li class="scroll-to-section nav-member-name">
                            <c:choose>
                                <c:when test="${sessionScope.role != null}">
                                <div id="someElement" data-member-no="${sessionScope.memberNo}"></div>
                                <span><sec:authentication property="name" /> 님</span>
                        </li>
                        <li class="scroll-to-section">
                                <span id="message_img_hover">
                                    <a id="message" href="${cPath}/message/list" style="display: flex; align-items: center;">
                                        <img id="message_img" src="${cPath}/img/message/messageList.png"
                                             style="width:25px;"
                                             onmouseover="this.src='${cPath}/img/message/openMessage.png'"
                                             onmouseout="this.src='${cPath}/img/message/messageList.png'"/>
                                    </a>
                                </span>
                        </li>
                        <li style="min-width: 200px">
                            <div class="gradient-button"><a id="modal_trigger_out"
                                                            href="${cPath}/logout">
                                <i class="fa fa-sign-in-alt"></i>로그아웃</a></div>
                            </c:when>
                            <c:otherwise>
                                <div style="display: flex;">
                                    <div class="gradient-button"><a id="modal_trigger_in" href="${cPath}/login"><i
                                            class="fa fa-sign-in-alt"></i>로그인</a></div>
                                    <div class="gradient-button" style="margin-left: 5px"><a id="modal_trigger_up"
                                                                                             href="${cPath}/join/select"><i
                                            class="fa fa-sign-in-alt"></i>회원가입</a></div>
                                </div>
                            </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ***** Header Area End ***** -->
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    var memberNo = document.getElementById("someElement").getAttribute("data-member-no");
    function send_message() {
        websocket = new SockJS("/message/list");
        websocket.onopen = function (evt) {
            onOpen(evt);
        };

        websocket.onmessage = function (evt) {
            onMessage(evt);
        };

        websocket.onerror = function (evt) {
            onError(evt);
        };
    }

    function onOpen(evt) {
        websocket.send(memberNo);
    }

    function onMessage(evt) {
        $('#messageCnt').append(evt.data);
        if (evt.data != '0') {
            $('#message_img').attr('src', '${cPath}/img/message/newMessage.png');
            $('#message_img').attr('onmouseout', "this.src='${cPath}/img/message/newMessage.png'");
        }
    }

    function onError(evt) {
    }

    $(document).ready(function(){
            send_message();
    });

</script>
</html>

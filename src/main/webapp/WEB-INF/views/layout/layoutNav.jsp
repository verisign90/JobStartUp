<%@ page language="java" pageEncoding="UTF-8" %>
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
                        <img src="/css/template/assets/images/jobstartup_logo04.png" style="height: 100px;"
                             alt="Chain App Dev">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li class="scroll-to-section"><a href="${cPath}/" class="active">Home</a></li>
                        <li class="scroll-to-section"><a href="${cPath}/jobfair/list">취업박람회</a></li>
                        <li class="scroll-to-section"><a href="${cPath}/recruiter/JPlist">채용공고</a></li>
                        <li class="scroll-to-section"><a href="${cPath}/seeker/resumeList">개인서비스</a></li>
                        <li class="scroll-to-section"><a href="${cPath}/recruiter/myPage?company_no=4">기업서비스</a></li>
                        <li class="scroll-to-section"><a href="${cPath}/notice/list">고객센터</a></li>
                        <li class="scroll-to-section" style="min-width: 100px"><a href="${cPath}/admin/dashboard">
                            <c:if test="${sessionScope.role == 3}">관리자</c:if>
                        </a></li>
                        <li style="min-width: 280px">
                            <c:choose>
                                <c:when test="${sessionScope.role != null}">
                                    <div class="gradient-button"><a id="modal_trigger_out"
                                                                    href="${cPath}/logout">
                                        <i class="fa fa-sign-in-alt"></i>로그아웃</a></div>
                                </c:when>
                                <c:otherwise>
                                    <div style="display: flex;">
                                        <div class="gradient-button"><a id="modal_trigger_in" href="${cPath}/login/"><i
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

<div id="modal" class="popupContainer" style="display:none;">
    <div class="popupHeader">
        <span class="header_title">Login</span>
        <span class="modal_close"><i class="fa fa-times"></i></span>
    </div>

    <section class="popupBody">
        <!-- Social Login -->
        <div class="social_login">
            <div class="">
                <a href="#" class="social_box fb">
                    <span class="icon"><i class="fab fa-facebook"></i></span>
                    <span class="icon_title">Connect with Facebook</span>

                </a>

                <a href="#" class="social_box google">
                    <span class="icon"><i class="fab fa-google-plus"></i></span>
                    <span class="icon_title">Connect with Google</span>
                </a>
            </div>

            <div class="centeredText">
                <span>Or use your Email address</span>
            </div>

            <div class="action_btns">
                <div class="one_half"><a href="#" id="login_form" class="btn">Login</a></div>
                <div class="one_half last"><a href="#" id="register_form" class="btn">Sign up</a></div>
            </div>
        </div>

        <!-- Username & Password Login form -->
        <div class="user_login">
            <form>
                <label>Email / Username</label>
                <input type="text"/>
                <br/>

                <label>Password</label>
                <input type="password"/>
                <br/>

                <div class="checkbox">
                    <input id="remember" type="checkbox"/>
                    <label for="remember">Remember me on this computer</label>
                </div>

                <div class="action_btns">
                    <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a>
                    </div>
                    <div class="one_half last"><a href="#" class="btn btn_red">Login</a></div>
                </div>
            </form>

            <a href="#" class="forgot_password">Forgot password?</a>
        </div>

        <!-- Register Form -->
        <div class="user_register">
            <form>
                <label>Full Name</label>
                <input type="text"/>
                <br/>

                <label>Email Address</label>
                <input type="email"/>
                <br/>

                <label>Password</label>
                <input type="password"/>
                <br/>

                <div class="checkbox">
                    <input id="send_updates" type="checkbox"/>
                    <label for="send_updates">Send me occasional email updates</label>
                </div>

                <div class="action_btns">
                    <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a>
                    </div>
                    <div class="one_half last"><a href="#" class="btn btn_red">Register</a></div>
                </div>
            </form>
        </div>
    </section>
</div>
</body>
</html>

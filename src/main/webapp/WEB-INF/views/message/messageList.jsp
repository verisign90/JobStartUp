<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/mypage/recruiterMyPage.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/recruiter/mypage/recruiterMyPage.js"></script>
    <!-- 쪽지 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/message/list.css">
    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
    <script src="https://cdn.jsdelivr.net/gh/sockjs/sockjs-client/dist/sockjs.min.js"></script>
</head>
<body>
<%@ include file="../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<main>
    <article>
    <div class="main-title-container"><h4>쪽지함</h4></div>
    <div class="main-container">
        <div class="info-container">
            <div class="info-main-container">
                <div class="container-header">
                    ${sessionScope.memberNo}
                    <!-- modal 구동 버튼 (trigger) -->
                    <div id="btnWrap">
                      <button type="button" id="popupBtn"><img src="${pageContext.request.contextPath}/img/message/messageList.png"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </article>
</main>
<!-- Modal -->
<div id="modalWrap">
   <div id="modalBody">
   <div class="modalHeader">
     <span id="closeBtn">&times;</span>
     <h4 class="modal-title" id="myModalLabel">쪽지 보내기</h4>
   </div>
      <form class="msg_form">
          <input type="hidden" name="mes_sender" id="mes_sender" value="${sessionScope.memberNo}"/>
            <div class="form-group">
              <label for="to">To</label>
              <input type="text" value="57" class="form-control" id="mes_receiver" name="mes_receiver" disabled>
              <input type="hidden" value="57" class="form-control" id="mes_receiver" name="mes_receiver">
            </div>
            <div class="form-group">
              <label for="mes_content">Message</label>
              <textarea class="form-control" id="mes_content" name="mes_content" rows="10"></textarea>
            </div>
            <div class="modalFooter">
                <button type="button" class="btn" data-dismiss="modal">Close</button>
                <button type="button" class="btn" id="sendBtn">Send</button>
            </div>
      </form>
   </div>
</div>
<%@include file="../layout/layoutFooter.jsp" %>

<!-- Scripts -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    const btn = document.getElementById('popupBtn');
    const modal = document.getElementById('modalWrap');
    const closeBtn = document.getElementById('closeBtn');

    modal.style.display = 'none'; // 페이지 로드 시 모달 숨김

    btn.addEventListener('click', function(event) {
      event.preventDefault(); // 폼 제출 동작 막기
      modal.style.display = 'block';
    });

    closeBtn.addEventListener('click', function() {
      modal.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
      if (event.target === modal) {
        modal.style.display = 'none';
      }
    });
</script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script>
$("#sendBtn").click(function(){
    var msg = "쪽지를 보내시겠습니까?";

    if(!confirm(msg)) {
        return false;
    }

    var jsonStr = $(".msg_form").serialize();
    console.log(jsonStr);

    $.ajax({
        url : '/message/write',
        type: 'POST',
        data: $(".msg_form").serialize(),
        success: function(data) {
            console.log(data);
            alert("쪽지를 보냈습니다.");
            $("#modalWrap").hide();
            $("#mes_content").val('');
        },
         error: function(jqXHR, textStatus, errorThrown) {
              console.error('Error:', errorThrown);
              console.error('Error:', jqXHR);
              console.error('Error:', textStatus);
         }
    });
});
</script>
</body>
</html>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보낸 쪽지함</title>
    <!-- 기업 마이 페이지 (폰트, Jquery, icon)-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" rel="stylesheet">
    <!-- 기업 마이 페이지 (private edited) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">
    <!-- 쪽지 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/message/list02.css">
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
<!-- sidebar -->
  <div class="navSide">
    <button>
      <sec:authentication property="name" /> 님
    </button>
    <a href="/message/list">
    <button>
      <i class="menu__icon fas fa-inbox"></i><br/>
      Inbox
    </button>
    </a>
    <a href="/message/sentList">
    <button>
      <i class="menu__icon fas fa-paper-plane"></i><br/>
      Sent Mail
    </button>
    </a>
  </div>
<!-- sidebar -->
   <div class="main-container">
      <div class="info-container">
         <div class="message-container">
             <!-- messageList -->
                <div class="content_message">
                  <div class="second-nav">
                    <div class="header">
                        <div class="title">
                           <h7>Sent Message Box</h7>
                        </div>
                    </div>
                    <div class="controls">
                      <div class="control" id="deleteBtn">
                        <i class="fa fa-trash-o fa-1x"></i>
                        <div class="comment bottom">Delete</div>
                      </div>
                      <div class="control" onclick="movePage(${messageDTOPage.pagination.firstPage-1})">
                        <a href="javascript:void(0);" >
                            <i class="fa fa-mail-reply fa-1x"></i>
                            <div class="comment bottom">Reply</div>
                        </a>
                      </div>
                      <div class="control" onclick="movePage(${messageDTOPage.pagination.lastPage+1})">
                        <a href="javascript:void(0);" >
                            <i class="fa fa-mail-forward fa-1x"></i>
                            <div class="comment bottom">Forward</div>
                        </a>
                      </div>
                    </div>
                   <c:forEach var="message" items="${messageDTOPage.list}" varStatus="loop">
                    <div class="messages">
                      <div class="message">
                        <div class="cell">
                          <div class="checkbox">
                            <input type="checkbox" name="${message.mes_no}" id="${message.mes_no}" value="${message.mes_no}"/>
                		        <label class="checkbox_label" for="${message.mes_no}"></label>
                          </div>
                          <div class="message_metadata">
                           <div class="mes-no" id="mes_no_${loop.index}" data-mes-no="${message.mes_no}"></div>
                            <p class="from d-flex justify-content-between"><span>To. ${message.member_id}</span>
                                <span><c:if test="${message.mes_read=='Y'}">읽음</c:if>
                                <c:if test="${message.mes_read=='N'}">읽지않음</c:if></span>
                            </p><br/>
                            <c:choose>
                            <c:when test="${message.mes_content.length()<30}">
                                <p class="d-flex justify-content-between" id="content_p">
                                <span>${message.mes_content}</span>
                                <span>
                                    <fmt:parseDate value="${message.mes_regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                    <fmt:formatDate value="${parsedDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/>
                                </span>
                                </p>
                            </c:when>
                            <c:otherwise>
                                <p class="d-flex justify-content-between">
                                    <span>${message.mes_content.substring(0, 30)}...</span>
                                    <span>
                                        <fmt:parseDate value="${message.mes_regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                                        <fmt:formatDate value="${parsedDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/>
                                    </span>
                                </p>
                            </c:otherwise>
                            </c:choose>
                          </div>
                        </div>
                      </div>
                    </div>
                   </c:forEach>
                  </div>
                  <div class="viewer" id="viewer">
                    <div class="scroll">
                        <div id="checkMessage" >
                            <div class="d-flex justify-content-center"><img src="${cPath}/img/message/send-mail.png" style="width:200px;"/></div>
                            <div class="d-flex justify-content-center" id="messagefonts">쪽지를 확인하세요!</div>
                        </div>
                    </div>
                  </div>
                </div>
             <!-- messageList -->
         </div>
      </div>
   </div>
<%@include file="../layout/layoutFooter.jsp" %>

<!-- Scripts -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function movePage(currentPageNo) {
        const currentURL = new URL(window.location.href);
        const urlParams = new URLSearchParams(currentURL.search);
        const queryParams = {
            currentPageNo: (currentPageNo) ? currentPageNo : 1,
            recordsPerPage: 6,
            pageSize: 1,
        }
        location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
    }

    $(".message").click(function(){
        const mesNoElement = $(this).find('.mes-no');
        const mes_no = mesNoElement.data('mes-no');
        $.ajax({
            url: '/message/read',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ mes_no: mes_no }),
            success: function(data) {
                let parsedData = JSON.parse(data);
                let regDateArray = parsedData.mes_regDate;
                let regDate = new Date(
                    regDateArray[0],
                    regDateArray[1] - 1,
                    regDateArray[2],
                    regDateArray[3],
                    regDateArray[4],
                    regDateArray[5]
                );
                if (isNaN(regDate)) {
                    console.error('Invalid date format');
                    return;
                }
                let formatted = regDate.getFullYear() + '-' +
                    ('0' + (regDate.getMonth()+1)).slice(-2) + '-' +
                    ('0' + regDate.getDate()).slice(-2) + ' ' +
                    ('0' + regDate.getHours()).slice(-2) + ':' +
                    ('0' + regDate.getMinutes()).slice(-2) + ':' +
                    ('0' + regDate.getSeconds()).slice(-2);

                var htmlList = "";

                htmlList += '<div class="scroll">';
                htmlList += '<div class="header" id="sender_id">';
                htmlList += '<p class="mes_sender"> RECEIVER : '+parsedData.member_id+'</p>';
                htmlList += '<p class="mes_regdate"> Date : '+formatted+'</p>';
                htmlList += '</div><div class="body">'+parsedData.mes_content+'</div></div>';

                $("#viewer").empty().append(htmlList);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                   console.error('Error:', errorThrown);
            }
        });
    });

     $("#deleteBtn").on("click", function() {
         const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
         const selectedValues = Array.from(checkboxes).map(checkbox => checkbox.value);
         if (selectedValues.length === 0) {
             return false;
         }
        console.log(selectedValues.getDate);
         var msg = "삭제하시겠습니까?";
         if(!confirm(msg)) {
             return false;
         }

        $.ajax({
            url : '/message/sender/delete',
            type: 'POST',
            data: JSON.stringify(selectedValues),
            contentType: 'application/json',
            success: function(data) {
                alert("삭제되었습니다.");
                location.reload();
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
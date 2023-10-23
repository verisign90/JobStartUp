<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPdetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPqna.css">
    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/base.css">

    <title>공고 상세(기업 소개) 페이지</title>

</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<main>
    <article class="all-content">

        <!-- 채용 공고 제목 및 여러 아이콘 -->
        <section>
            <div class="main-first-container">
                <div class="first-first-container">
                    <span>
                        <a href="#" title="" class="companyName" target="_blank"
                           onclick="window.open(this.href, ''); return false;">${JPdetail.company_name}</a>
                    <span class="second-second-items">
                    </span>
                        <%-- 기업팔로우 버튼 --%>
                        <span class="follow-item"
                              data-company-no="${JPdetail.company_no}"
                              data-member-no="${memberNo}">
                            <button class="follow-button" style="background-color: transparent; border: none;">
                                <img class="follow-image" src="${cPath}/img/status_unfollow.png" style="width: 20px;" alt=""/>
                            </button>
                        </span>
                    </span>
                    <div>
                        <h1>${JPdetail.posting_title}</h1>
                    </div>
                </div>
                <div class="first-second-container">
                    <div class="second-first-items">
                        <%-- 민용님 제 스크랩 버튼 놓고갑니다 --%>
                        <div class="bookmark-item"
                             data-posting-no="${postingNo}"
                             data-member-no="${memberNo}">
                            <button class="btn btn-light bookmark-button"
                                    style="/*background-color: transparent; border: #0d6efd; */padding: 10px;">
                                <img class="bookmark-image" src="${cPath}/img/empty_star.png" style="width: 20px;"
                                     alt=""/>
                            </button>
                        </div>
                    </div>
                    <div class="second-third-items">
                        <%-- 기업팔로우 버튼 --%>
                        <!-- 쪽지 -->
                        <div id="btnWrap">
                          <button type="button" id="popupBtn"><img src="${pageContext.request.contextPath}/img/message/messageList.png" style="width:25px;"/></button>
                        </div>
                        <!-- 쪽지 -->
                    </div>
                    <div class="second-fourth-items">
                        <!-- 버튼을 클릭하여 모달을 열도록 합니다. -->
                        <button type="button" class="btn btn-apply" data-toggle="modal" data-target="#myModal">
                            지원하기
                        </button>
                        <form id="applyForm" action="#" method="post">
                            <!-- 모달 창 -->
                            <div class="modal" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- 모달 헤더 -->
                                        <div class="modal-header">
                                            <h5 class="modal-title">지원하기</h5>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- 모달 본문 -->
                                        <div class="modal-body">
                                            <button><a href="${cPath}/seeker/resumeWrite">이력서 작성</a></button>
                                            <c:forEach items="${resumeList}" var="resume">
                                                <div class="resume_list_wrap">
                                                    <ul class="resume_list">
                                                        <li class="resume_item">
                                                            <input class="member-no" type="hidden"
                                                                   value="${resume.member_no}">
                                                            <input class="posting-no" type="hidden"
                                                                   value="${postingNo}">
                                                            <span><a
                                                                    href="${cPath}/seeker/resumeDetail/${resume.resume_no}">${resume.resume_title}</a></span>
                                                            <span><input class="modifyBtn" type="checkbox"
                                                                         name="resume_no" id="resume_no"
                                                                         value="${resume.resume_no}"></span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <!-- 모달 하단 -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                            <input type="submit" class="modifyBtn" value="지원하기">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- 기업 정보 -->
        <section>
            <div class="main-second-container">
                <div>
                    <div class = "second-container">
                        <div class="company_logo">
                            <img class="image" src="${pageContext.request.contextPath}/image/mypage/${JPdetail.logo_savname}" />
                        </div>
                        <div>
                            <table class="company_info">
                                <tbody>
                                    <tr>
                                        <th>주소</th>
                                        <td>${JPdetail.company_address_detail}</td>
                                    </tr>
                                    <tr>
                                        <th>유형</th>
                                        <td>${JPdetail.company_type}</td>
                                    </tr>
                                    <tr>
                                        <th>사이트</th>
                                        <td>${JPdetail.company_site}</td>
                                    </tr>
                                    <tr>
                                        <th>설립연도</th>
                                        <td>${JPdetail.company_est}</td>
                                    </tr>
                                    <tr>
                                        <th>매출액</th>
                                        <td>${JPdetail.company_sales}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 채용 공고 정보 : 일반 -->
        <section>
            <div class="main-third-container">
                <div class="third-container">
                    <table class="posting_info">
                        <tr>
                            <th>경력</th>
                            <td>${JPdetail.posting_career}</td>
                        </tr>
                        <tr>
                            <th>학력</th>
                            <td>${JPdetail.posting_academy}</td>
                        </tr>
                        <tr>
                            <th>근무 형태</th>
                            <td>${JPdetail.posting_labor}</td>
                        </tr>
                        <tr>
                            <th>급여</th>
                            <td>${JPdetail.posting_salary}</td>
                        </tr>
                        <tr>
                            <th>근무 일시</th>
                            <td>
                                <span>${JPdetail.posting_working_day}</span>
                                <span>|&nbsp;${JPdetail.posting_swork}</span> ~
                                <span>&nbsp;:&nbsp;${JPdetail.posting_ework}</span>
                            </td>
                        </tr>
                        <tr>
                            <th>근무지역</th>
                            <td>${fn:substring(JPdetail.company_address_detail, 6, 12)}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>

        <!-- 채용 공고 정보 : editor-->
        <section>
            <div class="main-fourth-container">
                <div class="fourth-container">
                    회사 컨텐츠가 들어갈 예정입니다 ${JPdetail.posting_content}
                </div>
            </div>
        </section>

        <!-- QnAList-->
        <section>
            <div class = "main-six-container">
                <div class="qnaList">
                  <div class="qnaTitle">
                    <h5> Q & A </h5>
                    <button type="button" class="writeBtn" id="writeBtn">1:1 문의하기</button>&nbsp;&nbsp;<button type="button" class="writeBtn"><a href="/qna/list">1:1 문의내역</a></button>
                  </div>
                <div class="writeFormDiv"></div>
                    <div id="accordion_wrap">
                        <c:forEach var="question" items="${questionPage.list}" >
                    	   <div class="que">
                    	    <c:choose>
                              <c:when test="${fn:length(question.q_content) > 30}">
                                <span class="categoryFont">[${question.q_category}]</span>&nbsp;&nbsp;<span><c:out value="${fn:substring(question.q_content,0,29)}"/>...</span>
                              </c:when>
                              <c:otherwise>
                                <span class="categoryFont">[${question.q_category}]</span>&nbsp;&nbsp;<span><c:out value="${question.q_content}"/></span>
                              </c:otherwise>
                            </c:choose>
                               <div class="arrow-wrap">
                                 <span class="arrow-top">↑</span>
                                <span class="arrow-bottom">↓</span>
                               </div>
                    	   </div>
                    	   <div class="anw">
                    	     <p class="questionBox"><span class="qusestion_content"><c:out value="${question.q_content}"/></span></p>
                    		  <c:choose>
                               <c:when test="${empty question.answerDTO}">
                                 <div class="answerSts">
                                     <strong>답변대기</strong>
                                      <p style="margin-left:10px;">
                                          아직 질문에 답변이 달리지 않았습니다.
                                      </p>
                                  </div>
                               </c:when>
                             <c:otherwise>
                                <div class="answerSts">
                                  <strong>답변완료</strong>
                                  <p style="margin-left:10px;">${question.answerDTO.a_content}</p>
                                </div>
                             </c:otherwise>
                             </c:choose>
                    	   </div>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <!-- QnAList-->

        <!-- 삭제 또는 수정 -->
        <section>
            <div class="main-fifth-container">
                <!-- 삭제 버튼 -->
                <a href="${cPath}/recruiter/JPdelete/${JPdetail.posting_no}" class="btn btn-delete"
                   onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
                <!-- 수정 버튼 -->
                <a href="${cPath}/recruiter/JPmodify/${JPdetail.posting_no}" class="btn btn-primary">수정</a>
            </div>
        </section>

    </article>
</main>
<!--qna modal-->
        <div id="QnAmodalWrap">
           <div class="modalBody">
           <div class="modalHeader">
             <span id="closeBtn" class="closeBtn">&times;</span>
             <h4 class="modal-title" id="myModalLabel">인사담당자에게 질문하기</h4>
           </div>
              <form class="qnaForm">
                <input type="hidden" name="q_type" id="q_type" value="seeker"/>
                <input type="hidden" name="company_no" id="company_no" value="${JPdetail.company_no}" />
                <div class="form-group">
                  <label for="q_category">카테고리</label>
                  <select class="form-control" name="q_category" id="q_category">
                    <option value="q_category" selected disabled>선택해주세요</option>
                    <option value="채용일반">채용일반</option>
                    <option value="경력사항">경력사항</option>
                    <option value="근무환경">근무환경</option>
                    <option value="기타">기타</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="q_content">문의 내용</label>
                  <textarea class="form-control" name="q_content" id="q_content" placeholder="문의내용을 입력하세요." rows="10"></textarea>
                </div>
                <div class="modalFooter">
                    <button type="button" class="btn" data-dismiss="modal">Close</button>
                    <button type="button" class="btn" id="qnaSub">작성</button>
                </div>
              </form>
           </div>
        </div>
<!--qna modal-->
<!-- message modal -->
    <div id="modalWrap">
       <div class="modalBody">
       <div class="modalHeader">
         <span id="messageCloseBtn" class="messageCloseBtn">&times;</span>
         <h4 class="modal-title" id="myModalLabel">쪽지 보내기</h4>
       </div>
          <form class="msg_form">
              <input type="hidden" name="mes_sender" id="mes_sender" value="${sessionScope.memberNo}"/>
                <div class="form-group">
                  <label for="to">To</label>
                  <input type="text" value="${JPdetail.company_name}" class="form-control" id="mes_receiver" name="mes_receiver" disabled>
                  <input type="hidden" value="${recruiterNo}" class="form-control" id="mes_receiver" name="mes_receiver">
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
<!-- message modal -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    $(document).ready(function () {
        $(".bookmark-item").each(function () {
            const item = $(this);
            const posting_no = item.data("posting-no");
            const member_no = item.data("member-no");
            const bookmarkImage = item.find('.bookmark-image')[0];

            $.get("${cPath}/seeker/checkBookmark", {
                posting_no: posting_no,
                member_no: member_no,
            }, function (data) {
                if (data) {
                    // 북마크 되어 있는 경우
                    bookmarkImage.src = "${cPath}/img/star.png";
                } else {
                    // 북마크 되어 있지 않은 경우
                    bookmarkImage.src = "${cPath}/img/empty_star.png";
                }
            });
        });

        $(".follow-item").each(function () {
            const item = $(this);
            const company_no = item.data("company-no");
            const member_no = item.data("member-no");
            const followImage = item.find('.follow-image')[0];

            $.get("${cPath}/seeker/checkFollow", {
                member_no: member_no,
                company_no: company_no
            }, function (data) {
                if (data) {
                    // 북마크 되어 있는 경우
                    followImage.src = "${cPath}/img/status_follow.png";
                } else {
                    // 북마크 되어 있지 않은 경우
                    followImage.src = "${cPath}/img/status_unfollow.png";
                }
            });
        });
    });

    $(".bookmark-button").on("click", function () {
        const item = $(this).closest(".bookmark-item");
        const posting_no = item.data("posting-no");
        const member_no = item.data("member-no");
        const bookmarkImage = item.find('.bookmark-image')[0];

        const isBookmarked = bookmarkImage.src.endsWith('/img/star.png');

        $.ajax({
            type: "GET",
            url: "${cPath}/seeker/postBookmark",
            data: {
                isBookmarked: isBookmarked,
                posting_no: posting_no,
                member_no: member_no,
            },
            success: function (response) {
                if (response === "inserted") {
                    bookmarkImage.src = "${cPath}/img/star.png";
                } else if (response === "deleted") {
                    bookmarkImage.src = "${cPath}/img/empty_star.png";
                }
            }
        });
    });

    $(".follow-button").on("click", function () {
        const item = $(this).closest(".follow-item");
        const member_no = item.data("member-no");
        const company_no = item.data("company-no");
        const followImage = item.find('.follow-image')[0];

        const isFollow = followImage.src.endsWith('/status_follow.png');

        $.ajax({
            type: "GET",
            url: "${cPath}/seeker/companyFollow",
            data: {
                isFollow: isFollow,
                member_no: member_no,
                company_no: company_no
            },
            success: function (response) {
                if (response === "inserted") {
                    followImage.src = "${cPath}/img/status_follow.png";
                } else if (response === "deleted") {
                    followImage.src = "${cPath}/img/status_unfollow.png";
                }
            }
        });
    });

    $("#applyForm").on("submit", function (event) {
        event.preventDefault(); // 폼의 기본 동작 중단

        // 선택한 이력서의 값을 가져옵니다.
        const selectedResume = $("input[name='resume_no']:checked").val();
        const posting_no = $(".posting-no").val();
        const member_no = $(".member-no").val();

        console.log("posting_no", posting_no);
        console.log(member_no);

        if (selectedResume) {
            // 선택한 이력서 값을 서버로 전달
            $.ajax({
                type: "POST",
                url: "${cPath}/seeker/resumeApply",
                data: {
                    member_no: member_no, // 로그인한 회원의 고유 ID
                    posting_no: posting_no, // 공고의 고유 ID
                    resume_no: selectedResume // 선택한 이력서의 고유 ID
                },
                success: function (response) {
                    // 요청이 성공하면 적절한 처리를 수행
                    // 예를 들어, 성공 페이지로 리다이렉트
                    window.location.href = "${cPath}/seeker/resumeApplyDone";
                },
                error: function (error) {
                    // 요청이 실패하면 적절한 오류 처리
                    console.error("에러 발생: " + error);
                }
            });
        } else {
            alert("이력서를 선택해주세요."); // 이력서가 선택되지 않은 경우 경고 메시지 표시
        }
    });

</script>
<!-- qna 및 message script -->
<script>
    //QnA 아코디언
    $(".que").click(function() {
       $(this).next(".anw").stop().slideToggle(300);
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
    });

    //qna 작성 모달창
    const writeBtn = document.getElementById('writeBtn');
    const modal = document.getElementById('QnAmodalWrap');
    const closeBtn = document.getElementById('closeBtn');

    modal.style.display = 'none'; // 페이지 로드 시 모달 숨김

    writeBtn.addEventListener('click', function(event) {
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

    //QnA 남기기
    $("#qnaSub").click(function(){
        var msg = "1:1 문의를 남기시겠습니까?";

        if(!confirm(msg)) {
            return false;
        }

        var jsonStr = $(".qnaForm").serialize();
        console.log(jsonStr);

        $.ajax({
            url : '${cPath}/qna/recruiter/write',
            type: 'POST',
            data: $(".qnaForm").serialize(),
            success: function(data) {
                console.log(data);
                alert("문의를 남겼습니다. ");
                $("#QnAmodalWrap").hide();
                $("#mes_content").val('');
            },
             error: function(jqXHR, textStatus, errorThrown) {
                  console.error('Error:', errorThrown);
                  console.error('Error:', jqXHR);
                  console.error('Error:', textStatus);
             }
        });
    });

    //qna 작성 모달창
    const btn = document.getElementById('popupBtn');
    const messageModal = document.getElementById('modalWrap');
    const messageCloseBtn = document.getElementById('messageCloseBtn');

    messageModal.style.display = 'none'; // 페이지 로드 시 모달 숨김

    btn.addEventListener('click', function(event) {
      event.preventDefault(); // 폼 제출 동작 막기
      messageModal.style.display = 'block';
    });

    messageCloseBtn.addEventListener('click', function() {
      messageModal.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
      if (event.target === modal) {
        messageModal.style.display = 'none';
      }
    });


    //message 보내기
    $("#sendBtn").click(function(){
        var msg = "쪽지를 보내시겠습니까?";

        if(!confirm(msg)) {
            return false;
        }

        var jsonStr = $(".msg_form").serialize();
        console.log(jsonStr);

        $.ajax({
            url : '${cPath}/message/write',
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
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
</body>
</html>

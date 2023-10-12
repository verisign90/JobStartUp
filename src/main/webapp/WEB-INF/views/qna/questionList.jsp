<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
<title>QnA List</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="/css/notice/list.css" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="/css/common/base.css" type="text/css">
  <link rel="stylesheet" href="/css/qna/list.css" type="text/css">
</head>
<body>
  <article class="question">
    <section class="contents">
      <h4>문의 내역</h4>
      <div class="inner">
        <h3 class="sans">1:1 문의 내역이 <span class="red">3</span>건 있습니다.</h3>

        <div class="acco">
          <section class="three open">
            <div class="q">
              <span class="yet">답변대기</span>
              <p>CJ SNS 페이지가 궁금..</p>
              <p>➳</p>
            </div>
            <div class="a">
              <div class="line">
                <p>제일제당 SNS 페이지가 궁금합니다.<br>공식 SNS 페이지를 알려주세요.</p>
              </div>
              <div>
                <p>아직 질문에 답변이 달리지 않았습니다. 영업일 기준 3일 이내로 회신드립니다.</p>
              </div>
            </div>
          </section>

          <section class="three close">
            <div class="q">
              <span class="finish">답변완료</span>
              <p>이벤트 당첨 상품이 아직..</p>
              <p>➳</p>
            </div>
            <div class="a">
              <div class="line">
                <p>이벤트 당첨 상품이 아직 도착하지 않았습니다.<br>언제쯤 수령할 수 있을까요?</p>
              </div>
              <div>
                <strong>답변완료</strong>
                <p>이벤트 상품은 2022년 3월 12일 일괄 배송되었으며, 문자로 발송드린 송장번호를 통해 배송조회 하실 수 있습니다.<br>감사합니다.</p>
              </div>
            </div>
          </section>

          <section class="three close">
            <div class="q">
              <span class="finish">답변완료</span>
              <p>이벤트 당첨 여부를 어떻게..</p>
              <p>➳</p>
            </div>
            <div class="a">
              <div class="line">
                <p>이벤트 당첨 여부를 어떻게 알 수 있나요?</p>
              </div>
              <div>
                <strong>답변완료</strong>
                <p>이벤트에 당첨되신 고객님의 경우 문자 메시지로 별도 연락을 드리고 있습니다.<br>감사합니다.</p>
              </div>
            </div>
          </section>
        </div>
      </div>
    </section>
  </article>
</body>
</html>
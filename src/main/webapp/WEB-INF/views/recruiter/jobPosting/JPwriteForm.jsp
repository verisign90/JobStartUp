<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPwriteForm.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/ckeditor5-2/sample/styles.css">--%>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout/layout.css">--%>
    <%--<script src="${contextPath}/ckeditor5-2/build/ckeditor.js"></script>--%>
    <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
          integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">
    <title>Title</title>
</head>
<body>
<header>
    <%--<div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>--%>
    <nav class="layout_nav">
        <%@ include file="../../layout/layoutNav.jsp" %>
    </nav>
</header>
<main>
    <article class="all-content">
        <form action="${pageContext.request.contextPath}/recruiter/JPwrite" method="post" enctype="multipart/form-data">
            <section>
                <div>
                    <h3>모집분야</h3>
                </div>

                <div>
                    <label for="posting_title" class="">공고 제목</label>
                    <input type="text" name="posting_title" id="posting_title" class="">
                </div>
                <div>
                    <label for="c1" class="">직무·직업</label>
                    <input type="checkbox" name="posting_career" id="c1" value="신입"/><label for="c1">신입</label>
                    <input type="checkbox" name="posting_career" id="c2" value="경력"/><label for="c2">경력</label>
                    <input type="checkbox" name="posting_career" id="c3" value="경력무관"/><label for="c3">경력무관</label>
                    <input type="checkbox" name="posting_career" id="c4" value="신입 지원 가능"/><label for="c4">신입 지원 가능</label>
                </div>
                <div>
                    <h3>지원자격</h3>
                </div>
                <div>
                    <span>지원학력</span>
                    <select name="posting_academy" id="posting_academy">
                        <option value="" selected disabled>--학력선택--</option>
                        <option value="학력무관">학력무관</option>
                        <option value="고등학교졸업 이상">고등학교졸업 이상</option>
                        <option value="대학졸업(2,3년) 이상">대학졸업(2,3년) 이상</option>
                        <option value="대학교졸업(4년) 이상">대학교졸업(4년) 이상</option>
                        <option value="석사졸업 이상">석사졸업 이상</option>
                        <option value="박사졸업 이상">박사졸업 이상</option>
                        <option value="기타">기타</option>
                    </select>
                </div>

                <div>
                    <label for="w1" class="">근무형태</label>
                    <label for="w1">정규직</label>
                    <input type="checkbox" name="posting_labor" id="w1" value="정규직"/>
                    <label for="w2">계약직</label>
                    <input type="checkbox" name="posting_labor" id="w2" value="계약직"/>
                    <label for="w3">인턴직</label>
                    <input type="checkbox" name="posting_labor" id="w3" value="인턴직"/>
                    <label for="w4">아르바이트</label>
                    <input type="checkbox" name="posting_labor" id="w4" value="아르바이트"/>
                    <label for="w5">파견직</label>
                    <input type="checkbox" name="posting_labor" id="w5" value="파견직"/>
                    <label for="w6">해외취업</label>
                    <input type="checkbox" name="posting_labor" id="w6" value="해외취업"/>
                    <label for="w7">계약직(정규직 전환가능)</label>
                    <input type="checkbox" name="posting_labor" id="w7" value="계약직(정규직 전환가능)"/>
                    <label for="w8">인턴직(정규직 전환가능)</label>
                    <input type="checkbox" name="posting_labor" id="w8" value="인턴직(정규직 전환가능)"/>
                    <label for="w9">교육생</label>
                    <input type="checkbox" name="posting_labor" id="w9" value="교육생"/>
                    <label for="w10">기간제</label>
                    <input type="checkbox" name="posting_labor" id="w10" value="기간제"/>
                </div>
            </section>
            <section>
                <div>
                    <span>급여</span>
                    <select name="posting_salary" id="posting_salary">
                        <option value="" selected disabled>--급여선택--</option>
                        <option value="회사내규에 따름">회사내규에 따름</option>
                        <option value="면접후 결정">면접후 결정</option>
                        <option value="2,000만원 이상">2,000만원 이상</option>
                        <option value="2,200만원 이상">2,200만원 이상</option>
                        <option value="2,400만원 이상">2,400만원 이상</option>
                        <option value="2,600만원 이상">2,600만원 이상</option>
                        <option value="2,800만원 이상">2,800만원 이상</option>
                        <option value="3,000만원 이상">3,000만원 이상</option>
                        <option value="3,200만원 이상">3,200만원 이상</option>
                        <option value="3,400만원 이상">3,400만원 이상</option>
                        <option value="3,600만원 이상">3,600만원 이상</option>
                        <option value="3,800만원 이상">3,800만원 이상</option>
                        <option value="4,000만원 이상">4,000만원 이상</option>
                        <option value="5,000만원 이상">5,000만원 이상</option>
                        <option value="6,000만원 이상">6,000만원 이상</option>
                        <option value="7,000만원 이상">7,000만원 이상</option>
                        <option value="8,000~9,000만원">8,000~9,000만원</option>
                        <option value="9,000~1억원">9,000~1억원</option>
                        <option value="1억원 이상">1억원 이상</option>
                    </select>
                </div>
                <div>
                    <span>근무일시</span>
                    <input type="radio" name="posting_working_day" value="주 5일(월~금)">주 5일(월~금)
                    <input type="radio" name="posting_working_day" value="주 6일(월~토)">주 6일(월~토)
                    <input type="radio" name="posting_working_day" value="주 3일(격일제)">주 3일(격일제)
                    <input type="radio" name="posting_working_day" value="유연근무제">유연근무제
                    <input type="radio" name="posting_working_day" value="면접 후 결정">면접 후 결정
                </div>
                <div>
                    <span>출근시간</span>
                    <select id="posting_swork" name="posting_swork">
                        <option value="" selected disabled>--선택--</option>
                        <option value="08:00">08:00</option>
                        <option value="08:30">08:30</option>
                        <option value="09:00">09:00</option>
                        <option value="09:30">09:30</option>
                        <option value="10:00">10:00</option>
                    </select>
                </div>
                <div>
                    <span>퇴근시간</span>
                    <select id="posting_ework" name="posting_ework">
                        <option value="" selected disabled>--선택--</option>
                        <option value="17:00">17:00</option>
                        <option value="17:30">17:30</option>
                        <option value="18:00">18:00</option>
                        <option value="18:30">18:30</option>
                        <option value="19:00">19:00</option>
                    </select>

                </div>
                <div>
                    <span>근무지역</span>
                    <select id="upperLoc" name="upperLoc" onchange="loadLowerLoc()">
                        <option value="">선택</option>
                        <c:forEach items="${upperLoc}" var="upLoc">
                            <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                        </c:forEach>
                    </select>
                    <select id="lowerLoc" name="lowerLoc">
                        <option value="">선택</option>
                        <c:forEach items="${lowerLoc}" var="loLoc">
                            <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <span>시작일</span>
                    <input type="datetime-local" name="posting_sdate" id="posting_sdate"/>
                </div>
                <div>
                    <span>마감일</span>
                    <input type="datetime-local" name="posting_edate" id="posting_edate"/>
                </div>
            </section>
            <section>
                <textarea class="editor" name="posting_content" id="editor"></textarea>
            </section>
            <section>
                <div>
                    <label for="imageFileName" class="form-label">이미지</label>
                    <input type="file" name="imageFileName" id="imageFileName" class="form-control-file"
                           onchange="readURL(this);"/>
                    <img src="#" id="preview" style="width:150px;"/>
                </div>
            </section>
            <div>
                <button type="submit" name="subBtn" id="subBtn">입력</button>
            </div>
        </form>
    </article>
</main>
<footer>
    footer
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>

<script>
    ClassicEditor
        .create(document.querySelector('#editor'), {
            ckfinder: {
                uploadUrl: '/upload'
            }
        })
        .then(editor => {
            console.log('Editor was initialized');
        })
        .catch(error => {
            console.error(error);
        });


    document.addEventListener("DOMContentLoaded", function () {
        const sdateElem = document.getElementById('posting_sdate');
        const edateElem = document.getElementById('posting_edate');

        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');

        const formattedDate = yyyy + '-' + mm + '-' + dd + 'T' + '00:00:00';

        sdateElem.setAttribute('min', formattedDate);
        sdateElem.setAttribute('value', formattedDate);

        edateElem.setAttribute('min', formattedDate);
        edateElem.setAttribute('value', formattedDate);

        sdateElem.addEventListener("change", function () {
            const sdate = this.value;
            edateElem.setAttribute('min', sdate);
            edateElem.setAttribute('value', sdate);
        });
    });
</script>
<script>
    <%-- 상위 지역에 따른 하위 지역 목록 불러오기 --%>

    function loadLowerLoc() {
        var upperLocValue = document.getElementById("upperLoc").value;

        fetch('/recruiter/getJPLowerLoc?upperLoc=' + upperLocValue)
            .then(response => response.json())
            .then(data => {
                var lowerLocSelect = document.getElementById("lowerLoc");
                lowerLocSelect.innerHTML = "";

                data.forEach(loLoc => {
                    var option = document.createElement("option");
                    option.value = loLoc.detail_code_num;
                    option.text = loLoc.detail_name;
                    lowerLocSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error:', error));
    }
</script>
</body>
</html>

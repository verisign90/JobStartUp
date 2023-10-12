<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ckeditor5-2/sample/styles.css">
    <script src="${contextPath}/ckeditor5-2/build/ckeditor.js"></script>
    <%--<script src="https://cdn.ckeditor.com/ckeditor5/39.0.2/classic/ckeditor.js"></script>--%>
    <title>Title</title>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>
    <nav>
        nav
    </nav>
</header>
<main>
    <aside>
        main_sidebar
    </aside>
    <article>
        <form action="${pageContext.request.contextPath}/recruiter/write" method="post" enctype="multipart/form-data">
            <section>
                <div>
                    <h3>모집분야</h3>
                </div>

                <div>
                    <label for="posting_title" class="">공고 제목</label>
                    <input type="text" name="posting_title" id="posting_title" class=""/>
                </div>
                <div>
                    <label for="c1" class="">직무·직업</label>
                    <input type="checkbox" name="posting_career" id="c1" value="신입"/><label for="c1">신입</label>
                    <input type="checkbox" name="posting_career" id="c2" value="경력"/><label for="c2">경력</label>
                    <input type="checkbox" name="posting_career" id="c3" value="경력무관"/><label for="c3">경력무관</label>
                    <input type="checkbox" name="posting_career" id="c4" value="신입 지원 가능"/><label for="c4">신입 지원
                    가능</label>
                </div>
                <%--<div>
                    <input type="button" value="근무부서" onclick="addWorkDepartment()"/>
                    <input type="button" value="직급직책" onclick="addPosition()"/>
                    <input type="button" value="필수/우대조건" onclick="addRequirements()"/>
                </div>
                <div id="workDepartmentContainer">
                    <!-- 여기에 동적으로 생성될 요소들이 들어감 -->
                </div>
                <div id="positionContainer">
                    <!-- 여기에 동적으로 생성될 요소들이 들어감 -->
                </div>
                <div id="requirementsContainer">
                    <!-- 여기에 동적으로 생성될 요소들이 들어감 -->
                </div>--%>
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
                    <input type="checkbox" name="posting_labor" id="w1" value="정규직"/><label for="w1">정규직</label>
                    <input type="checkbox" name="posting_labor" id="w2" value="계약직"/><label for="w2">계약직</label>
                    <input type="checkbox" name="posting_labor" id="w3" value="인턴직"/><label for="w3">인턴직</label>
                    <input type="checkbox" name="posting_labor" id="w4" value="아르바이트"/><label for="w4">아르바이트</label>
                    <input type="checkbox" name="posting_labor" id="w5" value="파견직"/><label for="w5">파견직</label>
                    <input type="checkbox" name="posting_labor" id="w6" value="해외취업"/><label for="w6">해외취업</label>
                    <input type="checkbox" name="posting_labor" id="w7" value="계약직 (정규직 전환가능)"/><label for="w7">계약직 (정규직
                    전환가능)</label>
                    <input type="checkbox" name="posting_labor" id="w8" value="인턴직 (정규직 전환가능)"/><label for="w8"> 인턴직
                    (정규직 전환가능)</label>
                    <input type="checkbox" name="posting_labor" id="w9" value="교육생"/><label for="w9">교육생</label>
                    <input type="checkbox" name="posting_labor" id="w10" value="기간제"/><label for="w10">기간제</label>
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
                <%--<textarea class="editor" name="editor" id="editor"></textarea>--%>
                <%--<div><input type="text" name="posting_content" id="posting_content"></div>--%>
                <%--<div class="editor" name="posting_content" id="editor"></div>--%>
                <textarea class="editor" name="posting_content" id="editor"></textarea>
                <%--                <p><input type="submit" value="등록"></p>--%>
            </section>
            <section>
                <%--<div id="editor1" contenteditable="true"></div>
                <input id="img-selector" type="file" accept="image/*"/>
                <div>
                    <label for="ir1" class="form-label">내용</label>
                    <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
                </div>--%>
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
<script>
    const watchdog = new CKSource.EditorWatchdog();

    window.watchdog = watchdog;

    watchdog.setCreator((element, config) => {
        return CKSource.Editor
            .create(element, config)
            .then(editor => {
                return editor;
            });
    });

    watchdog.setDestructor(editor => {
        return editor.destroy();
    });

    watchdog.on('error', handleSampleError);

    watchdog
        .create(document.querySelector('.editor'), {
            // Editor configuration.
        })
        .catch(handleSampleError);

    function handleSampleError(error) {
        const issueUrl = 'https://github.com/ckeditor/ckeditor5/issues';

        const message = [
            'Oops, something went wrong!',
            `Please, report the following error on ${ issueUrl } with the build id "jdvxf7v1zcxg-ysu3jnu712sw" and the error stack trace:`
        ].join('\n');

        console.error(message);
        console.error(error);
    }
</script>
<script>
    /*// "근무부서" 입력 필드를 추가하는 함수
    function addWorkDepartment() {
        // 새로운 <input> 요소 생성
        var inputElement = $("<input>").attr("type", "text").attr("name", "workDepartment");

        // 새로운 <label> 요소 생성
        var labelElement = $("<label>").text("근무부서");

        // <div> 요소에 <input>과 <label> 추가
        var container = $("#workDepartmentContainer");
        container.append(labelElement);
        container.append(inputElement);
    }

    // "직급직책" 입력 필드를 추가하는 함수
    function addPosition() {
        // 새로운 <input> 요소 생성
        var inputElement = $("<input>").attr("type", "text").attr("name", "position");

        // 새로운 <label> 요소 생성
        var labelElement = $("<label>").text("직급직책");

        // <div> 요소에 <input>과 <label> 추가
        var container = $("#positionContainer");
        container.append(labelElement);
        container.append(inputElement);
    }

    // "필수/우대조건" 입력 필드를 추가하는 함수
    function addRequirements() {
        // 새로운 <input> 요소 생성
        var inputElement = $("<input>").attr("type", "text").attr("name", "requirements");

        // 새로운 <label> 요소 생성
        var labelElement = $("<label>").text("필수/우대조건");

        // <div> 요소에 <input>과 <label> 추가
        var container = $("#requirementsContainer");
        container.append(labelElement);
        container.append(inputElement);
    }*/

    <%-- 상위 지역에 따른 하위 지역 목록 불러오기 --%>

    function loadLowerLoc() {
        var upperLocValue = document.getElementById("upperLoc").value;

        fetch('/getLowerLoc?upperLoc=' + upperLocValue)
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

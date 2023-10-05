<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
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
        <form action="write.do" method="post" enctype="multipart/form-data">
            <section>
                <div>
                    <h3>모집분야</h3>
                </div>
                <div>
                    <label for="title" class="">공고 제목</label>
                    <input type="text" name="title" id="title" class=""/>
                </div>
                <div>
                    <label for="c1" class="">직무·직업</label>
                    <input type="checkbox" name="career" id="c1" value=""/><label for="c1">신입</label>
                    <input type="checkbox" name="career" id="c2" value=""/><label for="c2">경력</label>
                    <input type="checkbox" name="career" id="c3" value=""/><label for="c3">경력무관</label>
                    <input type="checkbox" name="career" id="c4" value=""/><label for="c4">신입 지원 가능</label>
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
                    <select name="academic" id="academic">
                        <option value="" selected disabled>--학력선택--</option>
                        <option value="">학력무관</option>
                        <option value="">고등학교졸업 이상</option>
                        <option value="">대학졸업(2,3년) 이상</option>
                        <option value="">대학교졸업(4년) 이상</option>
                        <option value="">석사졸업 이상</option>
                        <option value="">박사졸업 이상</option>
                        <option value="">기타</option>
                    </select>
                </div>

                <div>
                    <label for="w1" class="">근무형태</label>
                    <input type="checkbox" name="worktype" id="w1" value=""/><label for="w1">정규직</label>
                    <input type="checkbox" name="worktype" id="w2" value=""/><label for="w2">계약직</label>
                    <input type="checkbox" name="worktype" id="w3" value=""/><label for="w3">인턴직</label>
                    <input type="checkbox" name="worktype" id="w4" value=""/><label for="w4">아르바이트</label>
                    <input type="checkbox" name="worktype" id="w5" value=""/><label for="w5">파견직</label>
                    <input type="checkbox" name="worktype" id="w6" value=""/><label for="w6">해외취업</label>
                    <input type="checkbox" name="worktype" id="w7" value=""/><label for="w7">계약직 (정규직 전환가능)</label>
                    <input type="checkbox" name="worktype" id="w8" value=""/><label for="w8"> 인턴직 (정규직 전환가능)</label>
                    <input type="checkbox" name="worktype" id="w9" value=""/><label for="w9">교육생</label>
                    <input type="checkbox" name="worktype" id="w10" value=""/><label for="w10">기간제</label>
                </div>

            </section>
            <section>
                <div>
                    <span>급여</span>
                    <select name="salary" id="salary">
                        <option value="" selected disabled>--급여선택--</option>
                        <option value="">회사내규에 따름</option>
                        <option value="">면접후 결정</option>
                        <option value="">2,000만원 이상</option>
                        <option value="">2,200만원 이상</option>
                        <option value="">2,400만원 이상</option>
                        <option value="">2,600만원 이상</option>
                        <option value="">2,800만원 이상</option>
                        <option value="">3,000만원 이상</option>
                        <option value="">3,200만원 이상</option>
                        <option value="">3,400만원 이상</option>
                        <option value="">3,600만원 이상</option>
                        <option value="">3,800만원 이상</option>
                        <option value="">4,000만원 이상</option>
                        <option value="">5,000만원 이상</option>
                        <option value="">6,000만원 이상</option>
                        <option value="">7,000만원 이상</option>
                        <option value="">8,000~9,000만원</option>
                        <option value="">9,000~1억원</option>
                        <option value="">1억원 이상</option>
                        <option value="">월급</option>
                        <option value="">주급</option>
                        <option value="">일급</option>
                        <option value="">시급</option>
                        <option value="">건당</option>
                    </select>
                </div>
                <div>
                    <span>근무일시</span>
                    <input type="radio" name="workingDay" >주 5일(월~금)
                    <input type="radio" name="workingDay" >주 6일(월~토)
                    <input type="radio" name="workingDay" >주 3일(격일제)
                    <input type="radio" name="workingDay" >유연근무제
                    <input type="radio" name="workingDay" >면접 후 결정
                </div>
                <div>
                    <span>출퇴근 시간</span>
                    <select id="gowork" name="gowork" onchange="loadLowerLoc()">
                        <option value="">선택</option>
                        <c:forEach items="${upperLoc}" var="upLoc">
                            <option value="${upLoc.detailCodeNum}">${upLoc.detailName}</option>
                        </c:forEach>
                    </select>
                    <select id="workover" name="workover">
                        <option value="">선택</option>
                        <c:forEach items="${lowerLoc}" var="loLoc">
                            <option value="${loLoc.detailCodeNum}">${loLoc.detailName}</option>
                        </c:forEach>
                    </select>

                </div>
                <div>
                    <span>근무지역</span>
                    <select id="upperLoc" name="upperLoc" onchange="loadLowerLoc()">
                        <option value="">선택</option>
                        <c:forEach items="${upperLoc}" var="upLoc">
                            <option value="${upLoc.detailCodeNum}">${upLoc.detailName}</option>
                        </c:forEach>
                    </select>
                    <select id="lowerLoc" name="lowerLoc">
                        <option value="">선택</option>
                        <c:forEach items="${lowerLoc}" var="loLoc">
                            <option value="${loLoc.detailCodeNum}">${loLoc.detailName}</option>
                        </c:forEach>
                    </select>
                </div>
            </section>

            <section>
                <div id="editor" contenteditable="true"></div>
                <input id="img-selector" type="file" accept="image/*"/>
                <div>
                    <label for="ir1" class="form-label">내용</label>
                    <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
                </div>
                <div>
                    <label for="imageFileName" class="form-label">이미지</label>
                    <input type="file" name="imageFileName" id="imageFileName" class="form-control-file"
                           onchange="readURL(this);"/>
                    <img src="#" id="preview" style="width:150px;"/>
                </div>
            </section>

        </form>
    </article>
</main>
<footer>
    footer
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    /*텍스트에디터*/
    var oEditors = [];
    smartEditor = function () {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "ir1",
            sSkinURI: "/smarteditor2/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
    }

    $(document).ready(function () {
        smartEditor();
    })
</script>
<script>
    // "근무부서" 입력 필드를 추가하는 함수
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
    }

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
                    option.value = loLoc.detailCodeNum;
                    option.text = loLoc.detailName;
                    lowerLocSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error:', error));
    }
</script>
<script>
    //<input type="file" name="imageFileName" id="imageFileName"  class="form-control-file" onchange="readURL(this);"/>
    //file을 선택하면 호출되는 메서드
    //매개변수 obj에는 이벤트가 발생한 객체=>change이벤트가 발생한 input요소객체 저장된다
    function readURL(obj) {
        if (obj.files && obj.files[0]) { //파일이 있드면
            var reader = new FileReader(); //FileReader()객체생성
            reader.onload = function (e) {
                //id가 preview인 요소의 src속성값을 설정 =>img src속성값을 파일명으로 적용
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(obj.files[0]);
        }
    }
</script>
</body>
</html>

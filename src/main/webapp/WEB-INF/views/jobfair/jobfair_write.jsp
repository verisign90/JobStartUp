<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>JobFairList</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/chart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/board.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>
    <nav>
        <div>
            menu1
        </div>
        <div>
            menu2
        </div>
        <div>
            menu3
        </div>
        <div>
            menu4
        </div>
        <div>
            menu5
        </div>
    </nav>
    <div id="sign_button">
        <div class="sign_button_inner">
            <button>SignIn</button>
        </div>
        <div class="sign_button_inner">
            <button>SignUp</button>
        </div>
    </div>
</header>
<main>
    <aside>
        <ul>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        대쉬보드
                    </a>
                </div>
            </li>
            <li>
                공지글 목록
            </li>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/jobfairlist">
                        박람회 목록
                    </a>
                </div>
            </li>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/jobfair/companylist">
                        참여 업체 목록
                    </a>
                </div>
            </li>
            <li>
                공고 목록
            </li>
            <li>
                유료 서비스 관리
            </li>
        </ul>
    </aside>
    <article>
        <div>
            박람회 등록하기
        </div>
        <div>
            <form method="post" action="${pageContext.request.contextPath}/admin/jobfair/save"
                  enctype="multipart/form-data">

                <div>
                    <label for="title">제목:</label>
                    <input type="text" id="title" name="JOBFAIR_TITLE">
                </div>
                <div>
                    <label for="sdate">시작일:</label>
                    <input type="datetime-local" id="sdate" name="JOBFAIR_SDATE">
                </div>
                <div>
                    <label for="edate">종료일:</label>
                    <input type="datetime-local" id="edate" name="JOBFAIR_EDATE">
                </div>
                <div>
                    <label for="place">장소:</label>
                    <input type="text" id="place" name="JOBFAIR_PLACE">
                </div>
                <div>
                    <label for="target">대상:</label>
                    <input type="text" id="target" name="JOBFAIR_TARGET">
                </div>
                <div>
                    <label for="host">주최:</label>
                    <input type="text" id="host" name="JOBFAIR_HOST">
                </div>
                <div>
                    <label for="site">사이트:</label>
                    <input type="text" id="site" name="JOBFAIR_SITE">
                </div>
                <div>
                    <label for="loc_code">위치 코드:</label>
                    <input type="text" id="loc_code" name="JOBFAIR_LOC_CODE">
                </div>
                <div>
                    <label for="editor">내용:</label>
                    <textarea id="editor" name="JOBFAIR_CONTENT"></textarea>
                </div>
                <input type="submit" value="등록하기"/>
                <input type="button" value="목록보기"
                       onclick="location.href='${pageContext.request.contextPath}/admin/jobfairlist'"/>
            </form>
        </div>
    </article>


</main>
<footer>
    footer
</footer>
<script>
    let editor;

    document.addEventListener("DOMContentLoaded", function () {
        const sdateElem = document.getElementById('sdate');
        const edateElem = document.getElementById('edate');

        const today = new Date();
        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0');
        const dd = String(today.getDate()).padStart(2, '0');

        const formattedDate = yyyy + '-' + mm + '-' + dd + 'T' + '00:00:00';

        sdateElem.setAttribute('min', formattedDate);
        sdateElem.setAttribute('value', formattedDate);
        edateElem.setAttribute('value', formattedDate);

        sdateElem.addEventListener("change", function () {
            const sdate = this.value;
            edateElem.setAttribute('min', sdate);
            edateElem.setAttribute('value', sdate);
        });
    });

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
</script>
</body>
</html>
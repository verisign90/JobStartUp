<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Notice Form</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/common/base.css" type="text/css">
    <link rel="stylesheet" href="/css/notice/writeForm.css" type="text/css">
</head>
<body>
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<article class="board">
    <h1>Notice</h1>
    <section class="contents">
        <h4>글 수정하기</h4>
        <div class="inner">
            <form action="/notice/modify" enctype="multipart/form-data" method="post" name="writeFrom" id="writeFrom"
                  class="txt">
                <input type="hidden" value="${noticeDTO.not_no}" id="not_no" name="not_no"/>
                <select class="selectCategory" name="not_category" id="not_category">
                    <option value="all" selected>전체</option>
                    <option value="seeker">일반회원</option>
                    <option value="company">기업회원</option>
                </select>
                <input type="text" name="not_title" id="not_title" value="${noticeDTO.not_title}">
                <textarea name="not_content" id="not_content">${noticeDTO.not_content}</textarea>
                <div class="file">
                    <label for="notFile_orgName">
                        <div class="btn-upload">+</div>
                    </label>
                    <input type="file" multiple="multiple" name="notFile_orgName" id="notFile_orgName"/>
                    <div id='att_zone'
                         data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                </div>
                <div class="btn">
                    <button type="button" name="list"><a href="/notice/list">목록가기</a></button>
                    <button type="submit" type="button" name="sign">등록하기</button>
                </div>
            </form>
        </div>
    </section>
</article>
<script>
    (
        imageView = function imageView(att_zone, notFile_orgName) {
            var attZone = document.getElementById(att_zone);
            var notFile_orgName = document.getElementById(notFile_orgName);
            var sel_files = [];

            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block;position:relative;'
                + 'width:150px;height:120px;margin:5px;z-index:1';
            // 미리보기 이미지 속성
            var img_style = 'width:100%;height:100%;z-index:none';
            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:18px;height:18px;position:absolute;font-size:13px;'
                + 'right:5px;bottom:96px;z-index:999;color: black;background-color: white;border-radius: 50px; border: none';

            notFile_orgName.onchange = function (e) {
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files);
                for (f of fileArr) {
                    imageLoader(f);
                }
            }

            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function (e) {
                e.preventDefault();
                e.stopPropagation();
            }, false)

            attZone.addEventListener('dragover', function (e) {
                e.preventDefault();
                e.stopPropagation();

            }, false)

            attZone.addEventListener('drop', function (e) {
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for (f of files) {
                    imageLoader(f);
                }

            }, false)

            /*첨부된 이미지를 배열에 넣고 미리보기 */
            imageLoader = function (file) {
                sel_files.push(file);
                var reader = new FileReader();
                reader.onload = function (ee) {
                    let img = document.createElement('img');
                    img.setAttribute('style', img_style);
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                }
                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function (img, file) {
                var div = document.createElement('div');
                div.setAttribute('style', div_style);

                var btn = document.createElement('input');
                btn.setAttribute('type', 'button');
                btn.setAttribute('value', 'x');
                btn.setAttribute('class', 'xBtn');
                btn.setAttribute('delFile', file.name);
                btn.setAttribute('style', chk_style);
                btn.onclick = function (ev) {
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for (var i = 0; i < sel_files.length; i++) {
                        if (delFile == sel_files[i].name) {
                            sel_files.splice(i, 1);
                        }
                    }

                    dt = new DataTransfer();
                    for (f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    notFile_orgName.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p);
                }
                div.appendChild(img);
                div.appendChild(btn);
                return div;
            }

            /* 기존에 저장된 이미지 div 반환 */
            makePreDiv = function (img, hiddenInput) {
                var div = document.createElement('div');
                div.setAttribute('style', div_style);

                var btn = document.createElement('input');
                btn.setAttribute('type', 'button');
                btn.setAttribute('value', 'x');
                btn.setAttribute('class', 'xBtn');
                btn.setAttribute('style', chk_style);
                btn.onclick = function (ev) {
                    var ele = ev.srcElement;
                    var p = ele.parentNode;
                    attZone.removeChild(p);
                    var hiddenInput = ele.parentNode.querySelector('#hiddenField');
                    if (hiddenInput) {
                        hiddenInput.parentNode.removeChild(hiddenInput);
                    }
                }
                div.appendChild(img);
                div.appendChild(hiddenInput);
                div.appendChild(btn);
                return div;
            }

            // fileListJson 값 가져오기
            var fileListJson = '${fileListJson}';

            // JSON 문자열을 객체 배열로 변환
            var fileListArray = JSON.parse(fileListJson);

            // 이미지 불러오기 및 표시
            fileListArray.forEach(function (item) {
                let img = document.createElement('img');
                img.src = '/image/notice/' + item.notFile_savName;
                img.setAttribute('style', img_style);

                let hiddenInput = document.createElement('input');
                hiddenInput.setAttribute('type', 'hidden');
                hiddenInput.setAttribute('name', 'preFileNo');
                hiddenInput.setAttribute('id', 'hiddenField');
                hiddenInput.setAttribute('value', item.notFile_no);
                attZone.appendChild(makePreDiv(img, hiddenInput));
            });
        }
    )('att_zone', 'notFile_orgName')

    // optional selected 값 변경
    var selectedValue = ${categoryJson};
    var selectElement = document.getElementById('not_category');

    for (var i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === selectedValue) {
            selectElement.selectedIndex = i;
            break;
        }
    }
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
<title>Question Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/f3def94eb2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/common/base.css" type="text/css">
  <link rel="stylesheet" href="/css/qna/writeForm.css" type="text/css">
</head>
<body>
  <article class="qna">
    <h1>Q & A</h1>
    <section class="contents">
      <h4>문의하기</h4>
      <div class="inner">
      <form action="/qna/write" enctype ="multipart/form-data" method="post" name="writeFrom" id="writeFrom" class="txt">
       <div class="wrap_input">
         <span class="choice_input">
          <span class="inpRdo">
              <input type="radio" name="q_type" id="q_type" class="q_type" value="seeker" />
              <label class="lbl" for="q_type">개인</label>
          </span>
          <span class="inpRdo">
              <input type="radio" name="q_type" id="q_type" class="q_type" value="company" />
              <label class="lbl" for="q_type">기업</label>
          </span>
         </span>
       </div>
        <select class="select" name="q_category" id="q_category">
          <option value="q_category" selected disabled>선택해주세요</option>
          <option value="회원정보">회원 정보</option>
          <option value="서비스이용·문의">서비스이용·문의</option>
          <option value="불량정보·오류신고">불량정보·오류신고</option>
          <option value="서비스제안·칭찬">서비스제안·칭찬</option>
          <option value="기타">기타</option>
        </select>
          <input type="text" value="xiuxiu@mylover.com" id="email"/>
          <textarea name="q_content" id="textarea" placeholder="문의내용을 입력하세요.(3000자 이내)" rows="10" cols="30"></textarea>
          <span class="length" id="length">(0/3000자)</span>

          <div class="file">
            <label for="qFile_orgName"><div class="upload">첨부파일</div></label>
            <input type="file" name="qFile_orgName" id="qFile_orgName" multiple="multiple" />
            <div id="att_zone"></div>
          </div>
          <h5 class="h-class">5MB이하의 파일(JPG, PNG, GIF, PDF) 최대 3개까지 첨부하실 수 있습니다.</h5>

        <section class="answer">
         <div class="call">
            <div class="section-wrapper"><span class="typography">개인정보 수집 및 이용안내</span></div>
            <div class="typography-section"><span class="typography-bold">문의에 대한 처리 및 답변</span>을 위해<span class="typography-bold">이메일, 계정정보, 전화번호(선택), 첨부파일(선택), IP주소, 브라우저 및 OS 정보</span>
            가 수집되며, 수집된 정보는 <span class="typography-bold">3년간 보관</span>합니다. 이에 동의하지 않을 경우 문의/제안/신고 등록이 불가하며, 선택항목은 입력하지 않더라도 서비스이용에 제한을 두지 않습니다.</div>
          <div class="typography-border">
           <label data-label-placement="right" data-group-item="false" >
             <input type="checkbox" name="agree"/><span class="typography-checked"><em>개인정보수집 및 이용안내</em>에 동의합니다.</span>
           </label>
          </div>
         </div>
         <button type="submit" name="subBtn">등록하기</button>
        </section>
      </form>
      </div>
    </section>
  </article>
  <div id="top">
    <a href="#">TOP</a>
  </div>
  <script>
    showUploadResult = function showUploadResult(){
      var attZone = document.getElementById('att_zone');
      var qFile_orgName = document.getElementById('qFile_orgName');
      var str = "";
      var sel_files = [];

      // 속성
      var div_style = 'display:inline-flex;padding:6px 12px;border: 1px solid #171717; margin : 5px;'
                    + 'border-radius:4px;align-items:center;font-weight:400;'
                    + 'font-size: .8125rem; letter-spacing: -.005em; line-height: 20px; height: 34px';
      var btn_style = 'border:none';

      qFile_orgName.addEventListener('change', function(e){
        var files = e.target.files;
        var fileArr = Array.prototype.slice.call(files);
        for (var f of fileArr){
          fileListLoader(f);
        }
      });

      fileListLoader = function(file){
        sel_files.push(file);
        attZone.appendChild(makeIcon(file));
      }

      makeIcon = function(file) {
        var div = document.createElement('div');
        div.setAttribute('style', div_style);

        var fileSpan = document.createElement('span');
        fileSpan.setAttribute('id', 'fileName');

        var fileSpanText = document.createTextNode(file.name);
        fileSpan.appendChild(fileSpanText);

        var btn = document.createElement('button');
        btn.setAttribute('type', 'button');
        btn.setAttribute('class', 'no-hover');
        btn.setAttribute('delFile', file.name);
        btn.setAttribute('style', btn_style);
        btn.onclick = function(ev){
          var ele = ev.srcElement;
          var delFile = ele.getAttribute('delFile');
          for(var i=0 ;i<sel_files.length; i++){
            if(delFile== sel_files[i].name){
              sel_files.splice(i, 1);
            }
          }
          dt = new DataTransfer();
          for(f in sel_files) {
            var file = sel_files[f];
            dt.items.add(file);
          }
          qFile_orgName.files = dt.files;
          var p = ele.parentNode;
          attZone.removeChild(p);
        }

        var icon = document.createElement('i');
        icon.setAttribute('class', 'fa-solid fa-xmark fa-lg');
        icon.setAttribute('style', 'color: #5a5858; margin-left : 5px;');
        icon.setAttribute('id', 'icon-x');

        icon.onclick = function(event) {
          event.stopPropagation();
          btn.click();
        };

        btn.appendChild(icon);
        div.appendChild(fileSpan);
        div.appendChild(btn);
        return div;
      }
    };

    $(document).ready(function() {
        showUploadResult();

        $("#textarea").keyup(function(e) {
            var content = $(this).val();
            $("#length").html("("+content.length+" / 3000)");
            if (content.length > 3000) {
                alert("최대 3000자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 3000));
                $('#length').html("(3000 / 최대 3000자)");
            }
        });

        $('#top').click(function() {
            $('html, body').animate({
              scrollTop: 0
            }, 400);
            return false;
        });
    });
  </script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Notice Form</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    //미리보기 이미지
    function setThumbnails(event){
        for(var image of event.target.files){
            var reader = new FileReader();
            reader.onload = function(event){
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);       //img 속성 추가
                img.setAttribute("class", "col-lg-6");
                img.style.width = "200px";
                document.querySelector("div#images_container").appendChild(img);
            };
            console.log(image);
            reader.readAsDataURL(image);
        }
    }

    //파일 확장자 및 크기 유효성 검사
      var regex = new RegExp("(.*?)\.(jpg|png|GIF)$");
      var maxSixe = 10485760;

      function checkExtension(obj) {
         var files = obj.files;
         for(var i = 0; i<files.length; i++){
              if(!regex.test(files[i].name)){
                  alert("해당 종류의 파일은 업로드할 수 없습니다.")
                   document.getElementById("notFile_orgName").value = "";
                  return false;
              }
              if(files[i].size >= maxSixe){
                  alert("업로드 가능한 최대 파일 크기를 초과했습니다.");
                  document.getElementById("notFile_orgName").value = "";
                  return false;
              }
         }
         return true;
      }

    function handleFileSelect(event) {
        if (checkExtension(event.target)) {
           setThumbnails(event);
        }
    }
</script>
<body>
<h2>Notice Write Form</h2>
<form action="/notice/write" enctype ="multipart/form-data" method="post" name="writeFrom" id="writeFrom" >
    <div class="writeForm">
        <div name="titleDiv">
            <label for="not_title"> title </label>
            <input type="text" name="not_title" id="not_title"/>
        </div>
        <div name ="contentDiv">
            <label for="not_content">content</label>
            <textarea name="not_content" id="not_content"></textarea>
        </div>
        <div name="imageDiv">
            <label for="notFile_orgName"  class="form-label">이미지</label>
            <input type="file" multiple="multiple" name="notFile_orgName" id="notFile_orgName" onchange="handleFileSelect(event);"/>
            <div id="images_container"></div>
        </div>
    </div>
    <button type"submit" name="subBtn" id="subBtn">입력</button>
</form>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page"xmlns:fmt="http://java.sun.com/JSP/Page">
<html>
<head>
    <title>입력해</title>
</head>
<body>
    <h2>사용자 정보 입력</h2>
        <form action="/apply" method="post" enctype="multipart/form-data">
            <!-- 텍스트 입력 필드 -->
            <label for="name">회사명:</label>
            <input type="text" id="company_name" name="company_name" required><br><br>
            <label for="name">회원번호:</label>
                        <input type="number" id="member_no" name="member_no" required><br><br>


            <label for="name">회사전화번호:</label>
                        <input type="text" id="company_hp" name="company_hp" required><br><br>

            <label for="name">대표자명:</label>
                        <input type="text" id="ceo_name" name="ceo_name" required><br><br>

            <label for="name">회사분류:</label>
                        <input type="text" id="company_type" name="company_type" required><br><br>



            <label for="name">회사주소코드:</label>
            <select id="upperLoc" name="upperLoc" onchange="loadLowerLoc()">
                        <option value="">선택</option>
                        <c:forEach items="${upperLoc}" var="upLoc">
                            <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                        </c:forEach>
            </select>
            </select>
                   <select id="company_address_code" name="company_address_code">
                         <option value="">선택</option>
                         <c:forEach items="${lowerLoc}" var="loLoc">
                            <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                         </c:forEach>
            </select><br><br>

           <label for="logo">로고 업로드:</label>
                        <input type="file" id="logo" name="logo" accept="image/*" required><br><br>

           <label for="document">문서 업로드:</label>
               <input type="file" id="document" name="document" accept=".pdf, .doc, .docx" required multiple>
               <br><br>

            <label for="name">회사업종코드:</label>
                        <input type="text" id="business_type_code" name="business_type_code" required><br><br>

            <label for="name">매출액:</label>
                        <input type="text" id="company_sales" name="company_sales" required><br><br>

            <!-- <label for="name">로고원본명:</label>
                        <input type="text" id="logo_orgname" name="logo_orgname" required><br><br>

            <label for="name">로고저장명:</label>
                        <input type="text" id="logo_savname" name="logo_savname" required><br><br>-->

            <!-- 라디오 버튼 -->
            <!-- <label>성별:</label>
            <input type="radio" id="male" name="gender" value="male">
            <label for="male">남성</label>
            <input type="radio" id="female" name="gender" value="female">
            <label for="female">여성</label><br><br>-->

            <!-- 체크 박스 -->
            <!-- <label>취미:</label>
            <input type="checkbox" id="hobby1" name="hobbies" value="reading">
            <label for="hobby1">독서</label>
            <input type="checkbox" id="hobby2" name="hobbies" value="traveling">
            <label for="hobby2">여행</label>
            <input type="checkbox" id="hobby3" name="hobbies" value="sports">
            <label for="hobby3">스포츠</label><br><br>-->

            <!-- 드롭다운 목록 -->
            <!-- <label for="country">국가:</label>
            <select id="country" name="country">
                <option value="usa">미국</option>
                <option value="canada">캐나다</option>
                <option value="uk">영국</option>
                <option value="france">프랑스</option>
            </select><br><br>-->

            <!-- 제출 버튼 -->
            <input type="submit" value="제출">
        </form>

<script>
    function loadLowerLoc() {
            var upperLocValue = document.getElementById("upperLoc").value;

            fetch('/getLowerLoc?upperLoc=' + upperLocValue)
                .then(response => response.json())
                .then(data => {
                    var lowerLocSelect = document.getElementById("company_address_code");
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

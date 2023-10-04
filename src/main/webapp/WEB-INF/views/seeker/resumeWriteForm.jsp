<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Job Start Up</title>
</head>
<body>
    <form action="${cPath}/seeker/resumeWrite" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="member_no" id="member_no" value="3"/>
        <input type="text" name="resume_title" id="resume_title" placeholder="제목"/>
        <input type="file" name="profileOrgNameFile" id="profileOrgNameFile" placeholder="프로필사진"/>
        <input type="hidden" name="profile_savname" id="profile_savname" value="test"/>
        <input type="text" name="resume_money" id="resume_money" value="30000000"/>
        <input type="text" name="resume_skill" id="resume_skill" value="업무능력"/>
        희망근무지역<input type="text" name="loc_detail_code_num" id="loc_detail_code_num"/>
        첨부파일<input type="file" name="resumeOrgNameFile" id="resumeOrgNameFile"/>
        URL첨부<input type="text" name="resume_url" id="resume_url"/>

        <div>경력</div>
        회사명<input type="text" name="career_company" id="career_company"/>
        경력기간<input type="text" name="career_date" id="career_date"/>
        경력직무<input type="text" name="business_type" id="business_type"/>
        담당업무<input type="text" name="career_work" id="career_work"/>

        <div>자격증</div>
        자격증명<input type="text" name="cer_name" id="cer_name"/>
        발급처<input type="text" name="cer_issuer" id="cer_issuer"/>
        취득일자<input type="date" name="cer_date" id="cer_date"/>

        <div>언어</div>
        언어명<input type="text" name="lang_name" id="lang_name"/>
        회화능력<input type="text" name="lang_level" id="lang_level"/>

        <div>어학 자격증</div>
        자격증명<input type="text" name="lang_cer_exam" id="lang_cer_exam"/>
        등급 및 점수<input type="text" name="lang_cer_grade" id="lang_cer_grade"/>
        취득일자<input type="date" name="lang_cer_date" id="lang_cer_date"/>

        <input type="submit" name="submitBtn" id="submitBtn" value="등록">
    </form>
</body>
</html>

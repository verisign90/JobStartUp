<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Job Start Up / 수정폼</title>
</head>
<body>
${modifyResumeDTO}
<form action="${cPath}/seeker/resumeModify/${modifyResumeDTO.resume_no}" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="member_no" id="member_no" value="${modifyResumeDTO.member_no}"/>
    <input type="text" name="resume_title" id="resume_title" value="${modifyResumeDTO.resume_title}"/>
    <input type="file" name="profileOrgNameFile" id="profileOrgNameFile" placeholder="프로필사진"/>
    <c:if test="${not empty modifyResumeDTO.profile_savname}">
        <img src="/image/resume/${modifyResumeDTO.profile_savname}"/>
    </c:if>
    <input type="hidden" name="profile_savname" id="profile_savname" value="test"/>
    <input type="text" name="resume_money" id="resume_money" value="${modifyResumeDTO.resume_money}"/>
    <input type="text" name="resume_skill" id="resume_skill" value="${modifyResumeDTO.resume_skill}"/>
    희망근무지역<input type="text" name="resumeLocDTOList[0].loc_detail_code_num" id="loc_detail_code_num" value="${modifyResumeDTO.resumeLocDTOList[0].loc_detail_code_num}"/>
    첨부파일<input type="file" name="resumeOrgNameFile" id="resumeOrgNameFile"/>
    <c:if test="${not empty modifyResumeDTO.resume_savname} != null">
        <img src="/image/resume/${modifyResumeDTO.resume_savname}"/>
    </c:if>
    URL첨부<input type="text" name="resume_url" id="resume_url"/>

    <div>경력</div>
    회사명<input type="text" name="careerDTOList[0].career_company" id="career_company" value="${modifyResumeDTO.careerDTOList[0].career_company}"/>
    경력기간<input type="text" name="careerDTOList[0].career_date" id="career_date" value="${modifyResumeDTO.careerDTOList[0].career_date}"/>
    경력직무<input type="text" name="careerDTOList[0].business_type" id="business_type" value="${modifyResumeDTO.careerDTOList[0].business_type}"/>
    담당업무<input type="text" name="careerDTOList[0].career_work" id="career_work" value="${modifyResumeDTO.careerDTOList[0].career_work}"/>

    <!-- 자격증 -->
    <div>자격증</div>
    자격증명<input type="text" name="certificateDTOList[0].cer_name" id="cer_name" value="${modifyResumeDTO.certificateDTOList[0].cer_name}"/>
    발급처<input type="text" name="certificateDTOList[0].cer_issuer" id="cer_issuer" value="${modifyResumeDTO.certificateDTOList[0].cer_issuer}"/>
    취득일자<input type="date" name="certificateDTOList[0].cer_date" id="cer_date" value="${modifyResumeDTO.certificateDTOList[0].cer_date}"/>

    <!-- 언어 -->
    <div>언어</div>
    언어명<input type="text" name="languageDTOList[0].lang_name" id="lang_name" value="${modifyResumeDTO.languageDTOList[0].lang_name}"/>
    회화능력<input type="text" name="languageDTOList[0].lang_level" id="lang_level" value="${modifyResumeDTO.languageDTOList[0].lang_level}"/>

    <!-- 어학 자격증 -->
    <div>어학 자격증</div>
    자격증명<input type="text" name="languageCertificateDTOList[0].lang_cer_exam" id="lang_cer_exam" value="${modifyResumeDTO.languageCertificateDTOList[0].lang_cer_exam}"/>
    등급 및 점수<input type="text" name="languageCertificateDTOList[0].lang_cer_grade" id="lang_cer_grade" value="${modifyResumeDTO.languageCertificateDTOList[0].lang_cer_grade}"/>
    취득일자<input type="date" name="languageCertificateDTOList[0].lang_cer_date" id="lang_cer_date" value="${modifyResumeDTO.languageCertificateDTOList[0].lang_cer_date}"/>

    <input type="submit" name="submitBtn" id="submitBtn" value="등록">
</form>

</body>
</html>

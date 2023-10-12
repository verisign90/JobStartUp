<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Jop Start Up</title>
</head>
<body>
    ${resumeDetail}
    ${resumeDetail.languageCertificateDTOList[0].lang_no}
    <img src="/image/resume/${resumeDetail.profile_savname}"/>
    <img src="/image/resume/${resumeDetail.resume_savname}"/>
    <a href="${cPath }/seeker/resumeModify/${resumeDetail.resume_no}"><input class="" type="button" style="background-color: #7A41FF; border: none;">수정</a>
    <a href="${cPath }/seeker/resumeDelete?resume_no=${resumeDetail.resume_no}&lang_no=${resumeDetail.languageCertificateDTOList[0].lang_no}"><button type="button">삭제</button></a>
</body>
</html>

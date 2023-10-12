<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/form.css" type="text/css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이력서 지원하기</title>
</head>
<body>
    <div class="wrap">
          <form action="${cPath}/seeker/resumeWrite" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="member_no" id="member_no" value="13"/>
            <div class="mb-3">
              <input type="text" name="resume_title" id="resume_title" placeholder="제목" class=""/>
            </div>
            <div>
              <input type="file" name="profileOrgNameFile" id="profileOrgNameFile" placeholder="프로필사진" class=""/>
              <input type="hidden" name="profile_savname" id="profile_savname" value="test"/>
            </div>
            <div>
              <input type="text" name="resume_money" id="resume_money" value="30000000" class=""/>
            </div>
            <div>
              <input type="text" name="resume_skill" id="resume_skill" value="업무능력" class=""/>
            </div>
            <div>
              희망근무지역<input type="text" name="resumeLocDTOList[0].loc_detail_code_num" id="loc_detail_code_num" class=""/>
            </div>
            <div>
              첨부파일<input type="file" name="resumeOrgNameFile" id="resumeOrgNameFile"/>
              URL첨부<input type="text" name="resume_url" id="resume_url" class=""/>
            </div>

            <div class="container text-center">
              <div class="row">
                <div class="col">col</div>
                <div class="col">col</div>
                <div class="col">col</div>
                <div class="col">col</div>
              </div>
              <div class="row">
                <div class="col-8">col-8</div>
                <div class="col-4">col-4</div>
              </div>
            </div>

            <%--<div class="">
                <div class="container container1">
                    <div class="row">
                        <div class="input">
                            <input type="text" name="careerDTOList[0].career_company" id="" class=""/>
                        </div>
                        <div class="input">
                            <input type="text" name="careerDTOList[0].career_company" id="" class=""/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input">
                            <input type="text" name="careerDTOList[0].career_company" id="" class=""/>
                        </div>
                        <div class="input">
                            <input type="text" name="careerDTOList[0].career_company" id="" class=""/>
                        </div>
                    </div>
                </div>
            </div>--%>

            <div>경력</div>
            <div>
              회사명<input type="text" name="careerDTOList[0].career_company" id="career_company" class=""/>
            </div>
            <div>
              경력기간<input type="text" name="careerDTOList[0].career_date" id="career_date" class=""/>
            </div>
            <div>
              경력직무<input type="text" name="careerDTOList[0].business_type" id="business_type" class=""/>
            </div>
            <div>
              담당업무<input type="text" name="careerDTOList[0].career_work" id="career_work" class=""/>
            </div>

            <!-- 자격증 -->
            <div>자격증</div>
            <div>
              자격증명<input type="text" name="certificateDTOList[0].cer_name" id="cer_name" class=""/>
            </div>
            발급처<input type="text" name="certificateDTOList[0].cer_issuer" id="cer_issuer" class=""/>
            취득일자<input type="date" name="certificateDTOList[0].cer_date" id="cer_date" class=""/>

            <!-- 언어 -->
            <div>언어</div>
            언어명<input type="text" name="languageDTOList[0].lang_name" id="lang_name" class=""/>
            회화능력<input type="text" name="languageDTOList[0].lang_level" id="lang_level" class=""/>

            <!-- 어학 자격증 -->
            <div>어학 자격증</div>
            자격증명<input type="text" name="languageCertificateDTOList[0].lang_cer_exam" id="lang_cer_exam" class=""/>
            등급 및 점수<input type="text" name="languageCertificateDTOList[0].lang_cer_grade" id="lang_cer_grade" class=""/>
            취득일자<input type="date" name="languageCertificateDTOList[0].lang_cer_date" id="lang_cer_date" class=""/>

            <input type="submit" name="submitBtn" id="submitBtn" value="등록" class="btn">
          </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>

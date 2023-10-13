<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%-- 레이아웃 위해 추가 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="/css/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/template/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="/css/template/assets/css/animated.css">
    <link rel="stylesheet" href="/css/template/assets/css/owl.css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Jop Start Up</title>
</head>
<body>
<header>
    <%@ include file="../../layout/layoutNav.jsp"%>
    <div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s"></div>
    </div>
</header>
<main>
<section class="py-5">
    <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-10">
                <!-- 제목 input -->
                ${resumeDetail.resume_title}
                <div class="form-floating mb-3">
                    <input type="text" name="resume_title" id="resume_title" class="form-control" placeholder="${resumeDetail.resume_title}"/>
                    <label for="resume_title">제목</label>
                </div>
                <!-- 프로필사진 input -->
                <div class="mb-3">
                    <label for="profileOrgNameFile" class="form-label">프로필사진</label>
                    <input type="file" name="profileOrgNameFile" id="profileOrgNameFile" class="form-control" placeholder="${resumeDetail.profile_orgname}"/>
                    <input type="hidden" name="profile_savname" id="profile_savname" value="${resumeDetail.profile_savname}"/>
                </div>
                <!-- 원하는 연봉 input -->
                <div class="form-floating mb-3">
                    <input type="text" name="resume_money" id="resume_money" class="form-control" placeholder="${resumeDetail.resume_money}"/>
                    <label for="resume_money">희망연봉</label>
                </div>
                <!-- 업무능력 input -->
                <div class="form-floating mb-3">
                    <input type="text" name="resume_skill" id="resume_skill" class="form-control" placeholder="${resumeDetail.resume_skill}"/>
                    <label for="resume_skill">업무능력</label>
                </div>
                <!-- 희망근무지역 input -->
                <div>
                    <div class="form-floating mb-3">
                        <input type="text" name="resumeLocDTOList[0].loc_detail_code_num" id="loc_detail_code_num" class="form-control" placeholder="${resumeDetail.resumeLocDTOList[0].loc_detail_code_num}"/>
                        <label for="loc_detail_code_num">희망근무지역</label>
                    </div>
                </div>
                <!-- 경력 섹션 -->
                <p class="lead mb-0">경력</p>
                <hr>
                <div class="row g-2">
                    <div class="form-floating mb-3 col-sm-6">
                        <input type="text" name="careerDTOList[0].career_company" id="career_company" class="form-control" placeholder="${resumeDetail.careerDTOList[0].career_company}"/>
                        <label for="career_company">회사명</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="text" name="careerDTOList[0].career_date" id="career_date" class="form-control" placeholder="${resumeDetail.careerDTOList[0].career_date}"/>
                        <label for="career_date">경력기간</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="text" name="careerDTOList[0].business_type" id="business_type" class="form-control" placeholder="${resumeDetail.careerDTOList[0].business_type}"/>
                        <label for="business_type">경력직무</label>
                    </div>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" name="careerDTOList[0].career_work" id="career_work" class="form-control" placeholder="${resumeDetail.careerDTOList[0].career_work}"/>
                    <label for="career_work">담당업무</label>
                </div>

                <!-- 자격증 섹션 -->
                <p class="lead mb-0">자격증</p>
                <hr>
                <div class="row g-2">
                    <div class="form-floating mb-3 col-sm-6">
                        <input type="text" name="certificateDTOList[0].cer_name" id="cer_name" class="form-control" placeholder="${resumeDetail.certificateDTOList[0].cer_name}"/>
                        <label for="cer_name">자격증명</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="text" name="certificateDTOList[0].cer_issuer" id="cer_issuer" class="form-control" placeholder="${resumeDetail.certificateDTOList[0].cer_issuer}"/>
                        <label for="cer_issuer">발급처</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="date" name="certificateDTOList[0].cer_date" id="cer_date" class="form-control" placeholder="${resumeDetail.certificateDTOList[0].cer_date}"/>
                        <label for="cer_date">취득일자</label>
                    </div>
                </div>

                <!-- 언어 섹션 -->
                <p class="lead mb-0">언어</p>
                <hr>
                <div class="row g-2">
                    <div class="form-floating mb-3 col-sm-6">
                        <input type="text" name="languageDTOList[0].lang_name" id="lang_name" class="form-control" placeholder="${resumeDetail.languageDTOList[0].lang_name}"/>
                        <label for="lang_name">언어명</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="text" name="languageDTOList[0].lang_level" id="lang_level" class="form-control" placeholder="${resumeDetail.languageDTOList[0].lang_level}"/>
                        <label for="lang_level">회화능력</label>
                    </div>
                </div>

                <!-- 어학 자격증 섹션 -->
                <p class="lead mb-0">어학 자격증</p>
                <hr>
                <div class="row g-3">
                    <div class="form-floating mb-3 col-sm-6">
                        <input type="text" name="languageCertificateDTOList[0].lang_cer_exam" id="lang_cer_exam" class="form-control" placeholder="${resumeDetail.languageCertificateDTOList[0].lang_cer_exam}"/>
                        <label for="lang_cer_exam">자격증명</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="text" name="languageCertificateDTOList[0].lang_cer_grade" id="lang_cer_grade" class="form-control" placeholder="${resumeDetail.languageCertificateDTOList[0].lang_cer_grade}"/>
                        <label for="lang_cer_grade">등급 및 점수</label>
                    </div>
                    <div class="form-floating mb-3 col-sm">
                        <input type="date" name="languageCertificateDTOList[0].lang_cer_date" id="lang_cer_date" class="form-control" placeholder="${resumeDetail.languageCertificateDTOList[0].lang_cer_date}"/>
                        <label for="lang_cer_date">취득일자</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</main>

    <img src="/image/resume/${resumeDetail.profile_savname}" style="width: 20%; height: auto;"/>
    <img src="/image/resume/${resumeDetail.resume_savname}" style="width: 20%; height: auto;"/>
    <a href="${cPath }/seeker/resumeModify/${resumeDetail.resume_no}"><button type="button">수정</button></a>
    <a href="${cPath }/seeker/resumeDelete?resume_no=${resumeDetail.resume_no}&lang_no=${resumeDetail.languageCertificateDTOList[0].lang_no}"><button type="button">삭제</button></a>
    <%@ include file="../../layout/layoutFooter.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>

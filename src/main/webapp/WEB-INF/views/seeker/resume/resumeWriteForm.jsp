<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/form.css" type="text/css"/>
    <link rel="stylesheet" href="/css/layout/layout.css" type="text/css"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Start Up</title>
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
                    <form action="${cPath}/seeker/resumeWrite" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="member_no" id="member_no" value="${}"/>
                        <!-- 제목 input -->
                        <div class="form-floating mb-3">
                            <input type="text" name="resume_title" id="resume_title" class="form-control" placeholder=""/>
                            <label for="resume_title">제목</label>
                        </div>
                        <!-- 프로필사진 input -->
                        <div class="mb-3">
                            <label for="profileOrgNameFile" class="form-label"></label>
                            <img id= "profileImage" src="/img/default_profile.jpg" style="width: 140px; max-height: 170px;" class="mb-3">
                            <input type="file" name="profileOrgNameFile" id="profileOrgNameFile" class="form-control" onchange="displayProfileImage(this)";/>
                            <input type="hidden" name="profile_savname" id="profile_savname" value="test"/>
                        </div>
                        <!-- 원하는 연봉 input -->
                        <div class="form-floating mb-3">
                            <input type="text" name="resume_money" id="resume_money" class="form-control"/>
                            <label for="resume_money">희망연봉</label>
                        </div>
                        <!-- 업무능력 input -->
                        <div class="form-floating mb-3">
                            <input type="text" name="resume_skill" id="resume_skill" class="form-control"/>
                            <label for="resume_skill">업무능력</label>
                        </div>

                        <!-- 희망근무지역 input -->
                        <div id="locationContainer">
                            <div class="locationBlock">
                                <div class="form-floating mb-3">
                                    <input type="text" name="resumeLocDTOList[0].loc_detail_code_num" id="loc_detail_code_num0" class="form-control"/>
                                    <label for="loc_detail_code_num0">희망근무지역</label>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-outline-secondary addFieldButton" data-section="location" data-basename="resumeLocDTOList" type="button">+ 추가</button>


                        <!-- 첨부파일 및 URL input -->
                        <div class="mb-3">
                            <label for="resumeOrgNameFile" class="form-label">첨부파일</label>
                            <input type="file" name="resumeOrgNameFile" id="resumeOrgNameFile" class="form-control"/>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" name="resume_url" id="resume_url" class="form-control"/>
                            <label for="resume_url">URL첨부</label>
                        </div>

                        <!-- 경력 섹션 -->
                        <p class="lead mb-0">경력</p>
                        <hr>
                        <div id="careerContainer">
                            <div class="careerBlock">
                                <div class="row g-2">
                                    <div class="form-floating mb-3 col-sm-6">
                                        <input type="text" name="careerDTOList[0].career_company" id="career_company0" class="form-control"/>
                                        <label for="career_company0">회사명</label>
                                    </div>
                                    <div class="form-floating mb-3 col-sm">
                                        <input type="text" name="careerDTOList[0].career_date" id="career_date0" class="form-control"/>
                                        <label for="career_date0">경력기간</label>
                                    </div>
                                    <div class="form-floating mb-3 col-sm">
                                        <input type="text" name="careerDTOList[0].business_type" id="business_type0" class="form-control"/>
                                        <label for="business_type0">경력직무</label>
                                    </div>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" name="careerDTOList[0].career_work" id="career_work0" class="form-control"/>
                                    <label for="career_work0">담당업무</label>
                                </div>
                            </div>
                        </div>
                        <button class="addFieldButton btn btn-outline-secondary" data-section="career" data-basename="careerDTOList" type="button">+ 추가</button>



                        <!-- 자격증 섹션 -->
                        <p class="lead mb-0">자격증</p>
                        <hr>
                        <div id="certificateContainer">
                            <div class="certificateBlock">
                                <div class="row g-2">
                                    <div class="form-floating mb-3 col-sm-6">
                                        <input type="text" name="certificateDTOList[0].cer_name" id="cer_name0" class="form-control"/>
                                        <label for="cer_name0">자격증명</label>
                                    </div>
                                    <div class="form-floating mb-3 col-sm">
                                        <input type="text" name="certificateDTOList[0].cer_issuer" id="cer_issuer0" class="form-control"/>
                                        <label for="cer_issuer0">발급처</label>
                                    </div>
                                    <div class="form-floating mb-3 col-sm">
                                        <input type="date" name="certificateDTOList[0].cer_date" id="cer_date0" class="form-control"/>
                                        <label for="cer_date0">취득일자</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="addFieldButton btn btn-outline-secondary" data-section="certificate" data-basename="certificateDTOList" type="button">+ 추가</button>


                        <!-- 언어 섹션 -->
                        <p class="lead mb-0">언어</p>
                        <hr>
                        <div id="languageContainer">
                            <div class="languageBlock">
                                <div class="row g-2">
                                    <div class="form-floating mb-3 col-sm-6">
                                        <input type="text" name="languageDTOList[0].lang_name" id="lang_name0" class="form-control"/>
                                        <label for="lang_name0">언어명</label>
                                    </div>
                                    <div class="form-floating mb-3 col-sm">
                                        <input type="text" name="languageDTOList[0].lang_level" id="lang_level0" class="form-control"/>
                                        <label for="lang_level0">회화능력</label>
                                    </div>
                                </div>

                                <!-- 어학 자격증 섹션 -->
                                <p class="lead mb-0">어학 자격증</p>
                                <hr>
                                <div id="langCerContainer">
                                    <div class="langCerBlock">
                                        <div class="row g-3">
                                            <div class="form-floating mb-3 col-sm-6">
                                                <input type="text" name="languageCertificateDTOList[0].lang_cer_exam" id="lang_cer_exam0" class="form-control"/>
                                                <label for="lang_cer_exam0">자격증명</label>
                                            </div>
                                            <div class="form-floating mb-3 col-sm">
                                                <input type="text" name="languageCertificateDTOList[0].lang_cer_grade" id="lang_cer_grade0" class="form-control"/>
                                                <label for="lang_cer_grade0">등급 및 점수</label>
                                            </div>
                                            <div class="form-floating mb-3 col-sm">
                                                <input type="date" name="languageCertificateDTOList[0].lang_cer_date" id="lang_cer_date0" class="form-control"/>
                                                <label for="lang_cer_date0">취득일자</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="addFieldButton btn btn-outline-secondary" data-section="langCer" data-basename="languageCertificateDTOList" type="button">+ 추가</button>

                            </div>
                        </div>
                        <button class="addFieldButton btn btn-outline-secondary" data-section="language" data-basename="languageDTOList" type="button">+ 추가</button>

                        <div class="d-flex justify-content-center">
                            <input type="submit" name="submitBtn" id="submitBtn" value="등록" class="btn btn-primary btn-lg col-lg-6" style="background-color: #7A41FF; border: none;" >
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<%@ include file="../../layout/layoutFooter.jsp"%>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const addButtons = document.getElementsByClassName("addFieldButton");
        Array.from(addButtons).forEach(button => {
            button.addEventListener("click", addField);
        });
        // const addButtons = document.querySelectorAll(".addFieldButton");
        // addButtons.forEach(button => {
        //     button.addEventListener("click", addField);
        // });

        function addField(event) {
            const section = event.currentTarget.getAttribute('data-section');
            console.log("section:", section);
            const baseName = event.currentTarget.getAttribute('data-basename');
            console.log("baseName:", baseName);
            const container = $("#" + section + "Container");
            console.log("container:", container);
            const count = container.find("." + section + "Block").length;
            console.log("count:", count);

            let newBlock = document.createElement("div");
            newBlock.className = section + "Block";

            // Depending on the section, adjust the innerHTML
            switch (section) {
                case "location":
                    newBlock.innerHTML =
                        '<div class="form-floating mb-3">' +
                        '<input type="text" name="' + baseName + '[' + count + '].loc_detail_code_num" id="loc_detail_code_num' + count + '" class="form-control"/>' +
                        '<label for="loc_detail_code_num' + count + '">희망근무지역 ' +  (count+1) + '</label>' +
                        '</div>';
                    break;
                case "career":

                    newBlock.innerHTML =
                        '<div class="row g-2">' +
                        '<div class="form-floating mb-3 col-sm-6">' +
                        '<input type="text" name="' + baseName + '[' + count + '].career_company" id="career_company' + count + '" class="form-control"/>' +
                        '<label for="career_company' + count + '">회사명' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="text" name="' + baseName + '[' + count + '].career_date" id="career_date' + count + '" class="form-control"/>' +
                        '<label for="career_date' + count + '">경력기간' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="text" name="' + baseName + '[' + count + '].business_type" id="business_type' + count + '" class="form-control"/>' +
                        '<label for="business_type' + count + '">경력직무' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3">' +
                        '<input type="text" name="' + baseName + '[' + count + '].career_work" id="career_work' + count + '" class="form-control"/>' +
                        '<label for="career_work' + count + '">담당업무' +  (count+1) + '</label>' +
                        '</div>' +
                        '</div>';
                    break;
                case "certificate":
                    newBlock.innerHTML =
                        '<div class="row g-2">' +
                        '<div class="form-floating mb-3 col-sm-6">' +
                        '<input type="text" name="' + baseName + '[' + count + '].cer_name" id="cer_name' + count + '" class="form-control"/>' +
                        '<label for="cer_name' + count + '">자격증명' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="text" name="' + baseName + '[' + count + '].cer_issuer" id="cer_issuer' + count + '" class="form-control"/>' +
                        '<label for="cer_issuer' + count + '">발급처' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="date" name="' + baseName + '[' + count + '].cer_date" id="cer_date' + count + '" class="form-control"/>' +
                        '<label for="cer_date' + count + '">취득일자' +  (count+1) + '</label>' +
                        '</div>' +
                        '</div>';
                    break;
                case "language":
                    newBlock.innerHTML =
                        '<div class="row g-2">' +
                        '<div class="form-floating mb-3 col-sm-6">' +
                        '<input type="text" name="' + baseName + '[' + count + '].lang_name" id="lang_name' + count + '" class="form-control"/>' +
                        '<label for="lang_name' + count + '">언어명' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="text" name="' + baseName + '[' + count + '].lang_level" id="lang_level' + count + '" class="form-control"/>' +
                        '<label for="lang_level' + count + '">회화능력' +  (count+1) + '</label>' +
                        '</div>' +
                        '</div>';
                    break;
                case "langCer":
                    newBlock.innerHTML =
                        '<div class="row g-3">' +
                        '<div class="form-floating mb-3 col-sm-6">' +
                        '<input type="text" name="' + baseName + '[' + count + '].lang_cer_exam" id="lang_cer_exam' + count + '" class="form-control"/>' +
                        '<label for="lang_cer_exam' + count + '">자격증명' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="text" name="' + baseName + '[' + count + '].lang_cer_grade" id="lang_cer_grade' + count + '" class="form-control"/>' +
                        '<label for="lang_cer_grade' + count + '">등급 및 점수' +  (count+1) + '</label>' +
                        '</div>' +
                        '<div class="form-floating mb-3 col-sm">' +
                        '<input type="date" name="' + baseName + '[' + count + '].lang_cer_date" id="lang_cer_date' + count + '" class="form-control"/>' +
                        '<label for="lang_cer_date' + count + '">취득일자' + (count+1) + '</label>' +
                        '</div>' +
                        '</div>';
                    break;

            }
            container.append(newBlock);
        }
    });
    function displayProfileImage(input) {
        var imageElement = document.getElementById('profileImage');
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                imageElement.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            imageElement.src = "/img/default_profile.jpg";
        }
    }
</script>
</html>

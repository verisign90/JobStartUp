// 설립일 유효성검사
    function validateDate() {
        var dateInput = document.getElementById("establishment_date");
        var errorSpan = document.getElementById("date-error");

        // 정규 표현식을 사용하여 날짜 형식 (YYYY-MM-DD) 검사
        var datePattern = /^\d{4}-\d{2}-\d{2}$/;

        if (!datePattern.test(dateInput.value)) {
            errorSpan.textContent = "올바른 날짜 형식 (YYYY-MM-DD)으로 입력하세요.";
            dateInput.focus();
        } else {
            errorSpan.textContent = "";
            // 유효한 날짜 형식으로 입력되었을 때 추가 작업 수행
        }
    }

    function deleteFile(cfile_savname, cfile_no) {
        if (confirm("파일을 삭제하시겠습니까?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/jobfair/jfdelete", true);
            console.log("도달");
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var response = xhr.responseText;
                        if (response === "success") {
                            // 파일 삭제 성공 시 해당 파일 엘리먼트를 삭제합니다.
                            var fileListContainer = document.getElementById("fileListContainer");
                            var fileContainer = document.getElementById(cfile_savname);
                            if (fileContainer) {
                                fileListContainer.removeChild(fileContainer); // 파일 엘리먼트를 제거합니다.

                                // 파일 목록 갱신을 위해 현재 페이지 다시 로드
                                window.location.reload();
                            }
                        } else {
                            alert("파일 삭제에 실패했습니다.");
                        }
                    } else {
                        alert("파일 삭제 요청 중 오류가 발생했습니다.");
                    }
                }
            };
            xhr.send("cfile_savname=" + cfile_savname + "&cfile_no=" + cfile_no);
        }
    }




 /*   function deleteFile(cfile_savname, cfile_no) {
        if (confirm("파일을 삭제하시겠습니까?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/apply/delete", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var response = xhr.responseText;
                        if (response === "success") {
                            // 파일 삭제 성공 시 해당 파일 아이콘과 파일 이름을 숨김
                            var fileDiv = document.getElementById(cfile_savname);
                            if (fileDiv) {
                                fileDiv.style.display = "none"; // 해당 요소를 숨깁니다.
                            }
                        } else {
                            alert("파일 삭제에 실패했습니다.");
                        }
                    } else {
                        alert("파일 삭제 요청 중 오류가 발생했습니다.");
                    }
                }
            };
            xhr.send("cfile_savname=" + cfile_savname + "&cfile_no=" + cfile_no);
        }
    }*/



    // 파일 목록 업데이트 함수
    function updateFileList() {
        var fileListDiv = document.querySelector("#fileListDiv");
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/apply/getFileList", true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    fileListDiv.innerHTML = xhr.responseText;
                } else {
                    alert("파일 목록을 업데이트하는 중 오류가 발생했습니다.");
                }
            }
        };
        xhr.send();
    }

    /*function deleteFile(cfile_savname, cfile_no) {
        if (confirm("파일을 삭제하시겠습니까?")) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/apply/delete", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var response = xhr.responseText;
                        if (response === "success") {
                            // 파일 삭제 성공 시 해당 파일 아이콘 숨김
                            var fileIcon = document.getElementById(cfile_savname);
                            if (fileIcon) {
                                fileIcon.style.display = "none";
                            }
                        } else {
                            alert("파일 삭제에 실패했습니다.");
                        }
                    } else {
                        alert("파일 삭제 요청 중 오류가 발생했습니다.");
                    }
                }
            };
            xhr.send("cfile_savname=" + cfile_savname + "&cfile_no=" + cfile_no);
        }
    }*/






    /*function deleteFile(cfile_savname,cfile_no) {
        if (confirm("파일을 삭제하시겠습니까?")) {
            // 사용자 확인 메시지. 필요에 따라 사용하세요.

            // AJAX를 사용하여 파일 삭제 요청을 서버로 전송합니다.
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/apply/delete", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // 서버에서 파일 삭제 요청을 처리한 후 실행되는 코드
                    // 서버로부터 반환된 데이터를 확인하여 성공 또는 실패 여부를 처리할 수 있습니다.
                    var response = xhr.responseText;
                    if (response === "success") {
                        // 파일 삭제 성공
                        // 페이지를 새로 고침하거나 업데이트하여 변경 사항을 반영할 수 있습니다.
                        window.location.reload();
                    } else {
                        // 파일 삭제 실패 또는 오류 처리
                        alert("파일 삭제에 실패했습니다.");
                    }
                }
            };
            xhr.send("cfile_savname=" + cfile_savname + "&cfile_no=" + cfile_no);
        }
    }*/


    function previewLogo(event) {
            var logoInput = event.target;
            var logoPreview = document.getElementById("logo-preview");
            var logoError = document.getElementById("logo-error");
            var currentLogoName = "${applyDTO.logo_savname}"; // 현재 파일명을 가져옴
            console.log(currentLogoName);
            var file = logoInput.files[0];

            if (file) {
                var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

                if (!allowedExtensions.exec(file.name)) {
                    logoError.textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                    logoInput.value = ""; // 파일 선택 해제
                    logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
                } else {
                    // 파일 유효성 검사 통과 시 미리보기 설정
                    logoError.textContent = ""; // 유효성 검사 메시지 지우기
                    logoPreview.style.display = "block"; // 이미지 미리보기 표시

                    var reader = new FileReader();
                    reader.onload = function (e) {
                        logoPreview.src = e.target.result;
                    };
                    reader.readAsDataURL(file);

                    // 파일을 서버로 업로드할 수 있도록 AJAX 요청을 보내고 파라미터로 파일과 현재 파일명 전달
                    var formData = new FormData();
                    formData.append("logo", file);
                    formData.append("currentLogoName", currentLogoName);

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "/jobfair/deleteLogo", true);
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // 성공적으로 업로드 및 수정이 완료됐을 때의 로직을 이곳에 추가
                        }
                    };
                    xhr.send(formData);
                }
            } else {
                logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
            }
        }



    /*function previewLogo(event) {
        var logoInput = event.target;
        var logoPreview = document.getElementById("logo-preview");

        var file = logoInput.files[0];

        if (file) {
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

            if (!allowedExtensions.exec(file.name)) {
                document.getElementById("logo-error").textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                logoInput.value = ""; // 파일 선택 해제
                logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
            } else {
                // 파일 유효성 검사 통과 시 미리보기 설정
                document.getElementById("logo-error").textContent = ""; // 유효성 검사 메시지 지우기
                logoPreview.style.display = "block"; // 이미지 미리보기 표시

                var reader = new FileReader();
                reader.onload = function (e) {
                    logoPreview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        } else {
            logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
        }
    }*/

    function loadLowerLoc() {
                        var upperLocValue = document.getElementById("upperLoc").value;

                        fetch('/jobfair/getLowerLoc2?upperLoc=' + upperLocValue)
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

        function loadBusiness_type_code_up() {
                        var upperLocValue = document.getElementById("business_type_code_up").value;

                        fetch('/jobfair/getBusiness_type_code_up?business_type_code_up=' + upperLocValue)
                            .then(response => response.json())
                            .then(data => {
                                var lowerLocSelect = document.getElementById("business_type_code");
                                lowerLocSelect.innerHTML = "";

                                data.forEach(type_code => {
                                    var option = document.createElement("option");
                                    option.value = type_code.detail_code_num;
                                    option.text = type_code.detail_name;
                                    lowerLocSelect.appendChild(option);
                                });
                            })
                            .catch(error => console.error('Error:', error));
            }

    /* 카카오 주소 api 우편번호 찾기 */
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';  //주소 변수
                    var extraAddr = ''; //참고항목 변수

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }

                    if(data.userSelectedType === 'R'){
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;

                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }

    /* 주소 풀버전 만들기 */
    function address() {
        var postcode = document.getElementById("sample6_postcode").value;
        var address = document.getElementById("sample6_address").value;
        var detailAddress = document.getElementById("sample6_detailAddress").value;
        var extraAddress = document.getElementById("sample6_extraAddress").value;

        document.getElementById("company_address_detail").value =
            postcode + " " + address + " " + detailAddress + " " + extraAddress;

    }
    function logCompanyAddressDetail() {
        var companyAddressDetail = document.getElementById("company_address_detail").value;
        console.log("company_address_detail 값: " + companyAddressDetail);
    }
    /* 폼 제출시 호출되는 함수 */
    function onSubmitForm() {
        address();


        logCompanyAddressDetail();


   }


    var company_hpInput = document.getElementById("company_hp");
    var phoneError = document.getElementById("phone-error");

    company_hpInput.addEventListener("input", function () {
       if (!company_hpInput.checkValidity()) {
           phoneError.textContent = "전화번호 형식이 잘못되었습니다. 예: 010-1234-5678";
       } else {
           phoneError.textContent = "";
       }
    });

    /* 로고 업로드 유효성검사*/
    var logoInput = document.getElementById("logo");
    var logoError = document.getElementById("logo-error");

    logoInput.addEventListener("change", function () {
        var file = logoInput.files[0];
        if (file) {
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
            if (!allowedExtensions.exec(file.name)) {
                logoError.textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                logoInput.value = ""; // 파일 선택 해제
            } else {
                logoError.textContent = ""; // 유효성 검사 메시지 지우기
            }
        }
    });

    /* 파일 유효성검사 */
    var documentInput = document.getElementById("document");
    var documentError = document.getElementById("document-error");

    documentInput.addEventListener("change", function () {
        var files = documentInput.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var allowedExtensions = /(\.pdf|\.doc|\.docx|\.pptx|\.xlsx)$/i;
            if (!allowedExtensions.exec(file.name)) {
                documentError.textContent = "문서 파일 (.pdf, .doc, .docx, .pptx, .xlsx)만 업로드할 수 있습니다.";
                documentInput.value = ""; // 파일 선택 해제
                return; // 유효성 검사 실패 시 함수 종료
            }
        }
        documentError.textContent = ""; // 유효성 검사 메시지 지우기
    });

    /* 매출액 숫자 유효성검사 */
            document.querySelector("form").addEventListener("submit", function (event) {
                    var companySalesInput = document.getElementById("company_sales");
                    var value = companySalesInput.value;
                    var isValid = /^\d+$/.test(value);

                    var salesError = document.getElementById("sales-error");

                    if (!isValid) {
                        salesError.textContent = "숫자만 입력하세요.";
                        event.preventDefault(); // 제출 방지
                    } else {
                        salesError.textContent = ""; // 유효성 검사 메시지 지우기
                    }

                    // 다른 필드의 유효성 검사 수행
                    // 필요한 다른 유효성 검사 수행
                });

    /*로고 바로보여지게*/
    var logoInput = document.getElementById("logo");
    var logoPreview = document.getElementById("logo-preview");
    var logoError = document.getElementById("logo-error");

    logoInput.addEventListener("change", function () {
        var file = logoInput.files[0];

        if (file) {
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

            if (!allowedExtensions.exec(file.name)) {
                logoError.textContent = "이미지 파일 (.jpg, .jpeg, .png, .gif)만 업로드할 수 있습니다.";
                logoInput.value = ""; // 파일 선택 해제
                logoPreview.style.display = "none"; // 이미지 미리보기 숨기기
            } else {
                // 파일 유효성 검사 통과 시 미리보기 설정
                logoError.textContent = ""; // 유효성 검사 메시지 지우기
                logoPreview.style.display = "block"; // 이미지 미리보기 표시

                var reader = new FileReader();
                reader.onload = function (e) {
                    logoPreview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }
    });

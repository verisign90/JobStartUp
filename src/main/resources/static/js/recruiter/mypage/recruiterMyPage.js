$(document).ready(function(){

    /* 기업 로고 이미지 수정 */
    $("#profile-edit-button").on("click",function(){

        //company_no
        var company_no = $(".profile-company-no").val();
        //file
        var fileInput = $("#logoFile")[0]; // 파일 입력 필드 가져오기
        var logoFile = fileInput.files[0]; // 선택된 파일 가져오기
        //폼 태그로 추가
        var formData = new FormData();
        formData.append("company_no",company_no);
        formData.append("logoFile",logoFile);

        $.ajax({
            type:"POST",
            url: "/recruiter/updateComLogo",
            data: formData,
            contentType:false,
            processData:false,
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/myPage?company_no=" + company_no;
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다" + error);
            }
        });
    });

    /* 공고 관리 */
    $("#job-posting").on("click",function(){
        let company_no = $(".job_posting_company_no").val();
        $.ajax({
            type:"GET",
            url: "/recruiter/myPageJobPosting",
            data: {company_no : company_no}
        }).done(function(result){
            var html = jQuery('<div>').html(result);
            var contents = html.find("div#content_list").html();
            $("#content-container").html(contents);
        }).fail(function (jqXHR, textStatus, errorThrown) {
            console.log("에러");
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        });
    });

    /* 박람회 관리 */
    $("#job-fair").on("click",function(){
        let company_no = $(".job_fair_company_no").val();
        $.ajax({
            type:"GET",
            url: "/recruiter/myPageJobFair",
            data: {company_no : company_no}
        }).done(function(result){
            var html = jQuery('<div>').html(result);
            var contents = html.find("div#content_list").html();
            $("#content-container").html(contents);
        }).fail(function (jqXHR, textStatus, errorThrown) {
            console.log("에러");
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        });
    });

    /* 박람회 관리 */
    $("#apply-manage").on("click",function(){
        let company_no = $(".apply_manage_company_no").val();
        $.ajax({
            type:"GET",
            url: "/recruiter/myPageAppManage",
            data: {company_no : company_no}
        }).done(function(result){
            var html = jQuery('<div>').html(result);
            var contents = html.find("div#content_list").html();
            $("#content-container").html(contents);
        }).fail(function (jqXHR, textStatus, errorThrown) {
            console.log("에러");
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        });
    });


});
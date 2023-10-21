$(document).ready(function(){

    /* 기업 로고 이미지 수정 */
    $("#profile-edit-button").on("click",function(){
        var company_no = $(".profile-company-no").val();
        var fileInput = $(".logoFile")[0]; // 파일 입력 필드 가져오기
        var logoFile = fileInput.files[0]; // 선택된 파일 가져오기
        var formData = new FormData(); //폼 태그로 추가
        formData.append("company_no",company_no);
        formData.append("logoFile",logoFile);
        $.ajax({
            type:"POST",
            url: "/recruiter/myPage/updateComLogo",
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
            url: "/recruiter/myPage/jobPosting",
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

    /* 공고 관리 + pagination */
    var paging_jobPosting = $("#paging_jobPosting");
    $(".paging_btn").on("click", function(e){
        e.preventDefault();
        var pageNo = $(this).find("div").attr("id");
        paging_jobPosting.find("input[name='currentPageNo']").val(pageNo);
        paging_jobPosting.submit();
    });

    /* 박람회 관리 */
    $("#job-fair").on("click",function(){
        let company_no = $(".job_fair_company_no").val();
        $.ajax({
            type:"GET",
            url: "/recruiter/myPage/jobFair",
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

    /* 박람회 관리 + pagination */
    var paging_jobFair = $("#paging_jobFair");
    $(".paging_btn").on("click", function(e){
        e.preventDefault();
        var pageNo = $(this).find("div").attr("id");
        paging_jobFair.find("input[name='currentPageNo']").val(pageNo);
        paging_jobFair.submit();
    });

    /* 지원자 관리 */
    $("#apply-manage").on("click",function(){
        let company_no = $(".apply_manage_company_no").val();
        $.ajax({
            type:"GET",
            url: "/recruiter/myPage/appManage",
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

    /* 지원자 관리 + pagination */
    var paging_AppManage = $("#paging_AppManage");
    $(".paging_btn").on("click", function(e){
        e.preventDefault();
        var pageNo = $(this).find("div").attr("id");
        paging_AppManage.find("input[name='currentPageNo']").val(pageNo);
        paging_AppManage.submit();
    });

});
$(document).ready(function(){

    /* 기업 로고 이미지 수정 */
    $(".profile-edit-button").on("click",function(){
        //company_no
        var company_no = $(".profile-company-no").val();

        //file
        var file=$(".profile-edit-button");
        console.dir(file[0].files[0]);

        //폼태그로 추가
        var formData = new FormData();
        formData.append("company_no",company_no);
        formData.append("file",file[0].files[0]);
        $(".profile-edit-button").on("click",function(){
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
                    console.log("에러입니다");
                }
            });
        });
    });

    /* 박람회 현황 */



    /* 공고 관리 */



    /* 지원자 관리 */








});
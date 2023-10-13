$(document).ready(function(){

    /* 채용 절차(1차) 승인 및 면접일자 등록 */
    $(".first-enroll-button").on("click",function(){
        let status_no = document.getElementById("first_enroll").value;
        let date = document.getElementById("date_enroll").value;
        let time = document.getElementById("time_enroll").value;
        if(status_no === "" || date === "" || time === ""){
            document.getElementById("first_denial").focus();
            return;
        }
        alert("1차 채용 승인하고, 면접 일자를 등록하였습니다.");
        $.ajax({
            type:"POST",
            url: "/recruiter/firstEnroll",
            data: {status_no: status_no,
                    date: date,
                    time: time},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage?status_no=" + status_no;
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* 채용 절차(1차) 반려 */
    $(".first-denial-button").on("click",function(){
        let status_no = document.getElementById("first_denial").value;
        if(status_no === ""){
            document.getElementById("first_denial").focus();
            return;
        }
        alert("1차 채용을 취소하였습니다.");
        $.ajax({
            type:"POST",
            url: "/recruiter/firstDenial",
            data: {status_no: status_no},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage?status_no=" + status_no;
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* 채용 절차(최종) 승인 */
    $(".final-enroll-button").on("click",function(){
        let status_no = document.getElementById("final_enroll").value;
        if(status_no === ""){
            document.getElementById("final_enroll").focus();
            return;
        }
        alert("최종 채용 승인하였습니다.");
        $.ajax({
            type:"POST",
            url: "/recruiter/finalEnroll",
            data: {status_no: status_no},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage?status_no=" + status_no;
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* 채용 절차(최종) 반려 */
    $(".final-denial-button").on("click",function(){
        let status_no = document.getElementById("final_denial").value;
        if(status_no === ""){
            document.getElementById("final_denial").focus();
            return;
        }
        alert("최종 채용을 취소하였습니다.");
        $.ajax({
            type:"POST",
            url: "/recruiter/finalDenial",
            data: {status_no: status_no},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage?status_no=" + status_no;
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

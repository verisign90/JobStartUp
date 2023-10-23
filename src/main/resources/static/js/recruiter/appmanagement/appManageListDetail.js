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
                          window.location.href = "/recruiter/managePage/" + status_no;
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
                          window.location.href = "/recruiter/managePage/" + status_no;
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
                          window.location.href = "/recruiter/managePage/" + status_no;
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
                          window.location.href = "/recruiter/managePage/" + status_no;
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* mailing service */
    /* 메일링 - 1차 합격 */
    $(".first-enroll-mail").on("click",function(){
        let status_no = document.getElementById("first_enroll_mail_status_no").value;
        let member_email = document.getElementById("first_enroll_mail_member_email").value;
        if(status_no === "" || member_email === ""){
            document.getElementById("first_enroll_mail_status_no").focus();
            return;
        }
        $.ajax({
            type:"POST",
            url: "/recruiter/mailFirstEnroll",
            data: {status_no: status_no,
                    member_email: member_email},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage/" + status_no;
                          alert("메일을 보냈습니다");
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* 메일링 - 1차 채용 거절 */
    $(".first-denial-mail").on("click",function(){
        let status_no = document.getElementById("first_denial_mail_status_no").value;
        let member_email = document.getElementById("first_denial_mail_member_email").value;
        if(status_no === "" || member_email === ""){
            document.getElementById("first_denial_mail_status_no").focus();
            return;
        }
        $.ajax({
            type:"POST",
            url: "/recruiter/mailFirstDenial",
            data: {status_no: status_no,
                    member_email: member_email},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage/" + status_no;
                          alert("메일을 보냈습니다");
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* 메일링 - 최종 채용 */
    $(".last-enroll-mail").on("click",function(){
        let status_no = document.getElementById("last_enroll_mail_status_no").value;
        let member_email = document.getElementById("last_enroll_mail_member_email").value;
        if(status_no === "" || member_email === ""){
            document.getElementById("last_enroll_mail_status_no").focus();
            return;
        }
        $.ajax({
            type:"POST",
            url: "/recruiter/mailLastEnroll",
            data: {status_no: status_no,
                    member_email: member_email},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href = "/recruiter/managePage/" + status_no;
                          alert("메일을 보냈습니다");
                      } else {
                          console.log("수정 실패");
                      }
                },
            error:function(request,status,error){
                console.log("에러입니다");
            }
        });
    });

    /* 메일링 - 최종 채용 거절 */
    $(".last-denial-mail").on("click",function(){
        let status_no = document.getElementById("last_denial_mail_status_no").value;
        let member_email = document.getElementById("last_denial_mail_member_email").value;
        if(status_no === "" || member_email === ""){
            document.getElementById("last_denial_mail_status_no").focus();
            return;
        }
        $.ajax({
            type:"POST",
            url: "/recruiter/mailLastDenial",
            data: {status_no: status_no,
                    member_email: member_email},
            success:
                function(response){
                      if (response !== null) {
                          window.location.href ="/recruiter/managePage/" + status_no;
                          alert("메일을 보냈습니다");
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

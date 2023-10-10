$(document).ready(function(){
    /* calendar (Ajax 수정 예정) */
    $(".enroll_btn").on("click",function(){
        let schedule_title = document.getElementById("schedule_title").value;
        let schedule_start = document.getElementById("schedule_start").value;
        let schedule_end = document.getElementById("schedule_end").value;
        let schedule_memo = document.getElementById("schedule_memo").value;

        if(schedule_title === "" || schedule_start === "" || schedule_end === "" || schedule_memo === ""){
            document.getElementById("enroll_btn").focus();
            return;
        }
        alert("일정을 등록하였습니다.");
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
});

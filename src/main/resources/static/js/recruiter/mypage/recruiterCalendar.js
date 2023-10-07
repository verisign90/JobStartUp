/* https://fullcalendar.io/ */
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})

    var calendar = new FullCalendar.Calendar(calendarEl, {
      locale: 'ko',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
      select: function(arg) {
          console.log(arg);

        var schedule_title = prompt('입력할 일정:');
    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
        if (schedule_title) {
          calendar.addEvent({
            schedule_title: schedule_title,
            schedule_start: arg.schedule_start,
            schedule_end: arg.schedule_end,
            schedule_memo: arg.schedule_memo,
            company_no: arg.company_no,
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
          // 있는 일정 클릭시,
          console.log("#등록된 일정 클릭#");
          console.log(arg.event);

        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events:function(info, successCallback, failureCallback){
              // ajax 처리로 데이터를 로딩 시킨다.
              var company_no = 3;
              $.ajax({
                 type:"get",
                 url:"calendar?company_no="+company_no,
                 dataType:"json",
                 success: function(data) {
                     successCallback(data); // 데이터를 successCallback에 전달
                 },
                 error: function(xhr, status, error) {
                     console.error("데이터 로딩 실패:", error);
                     failureCallback(error);
                 }
              });
      }
  });
  calendar.render();
});

// Calendar 일정 추가: 입력 창 Modal 크기 조절
function openModal() {
    var url = "calendarPopup";
    var name = "recruiterCalendarPopUp";
    var option = "width=600, height=600, left=100, top=50, location=no"
    window.open(url,name,option)
}
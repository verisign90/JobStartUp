// Calendar 일정 추가: 입력 창 Modal 크기 조절
function openModal() {
    var url = "calendarPopup";
    var name = "recruiterCalendarPopUp";
    var option = "width=600, height=600, left=100, top=50, location=no"
    window.open(url,name,option)
}

// https://fullcalendar.io/
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ko',
        initialDate: new Date(),
        navLinks: true,
        selectable: true,
        selectMirror: true,
        // 캘린더 select
        events: function(info, successCallback, failureCallback) {
             $.ajax({
                 type: "GET",
                 url: "/recruiter/getCalendar?method=data",
                 dataType: "text",
                 aysnc: false,
                 success: function(response) {
                    console.log(JSON.parse(response));
                    var eventData = JSON.parse(response);
                    var eventsArray = [];
                    for (var i = 0; i < eventData.length; i++) {
                        eventsArray.push({
                            title: eventData[i].SCHEDULE_TITLE,
                            start: eventData[i].SCHEDULE_START,
                            allDay: eventData[i].ALL_DAY,
                            memo:  eventData[i].SCHEDULE_MEMO
                        });
                    }
                    successCallback(eventsArray);
                 },
                 error: function() {
                     failureCallback();
                 }
             });
        },
        customButtons: {
            addList: {
                text: '일정추가',
                click: function() {
                   openModal();
                }
            },
        },
        // end: eventData[i].SCHEDULE_END,
        // 캘린더 insert


        // 캘린더 delete


    });
    calendar.render();
});
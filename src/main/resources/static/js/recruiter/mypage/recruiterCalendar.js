// Calendar 일정 추가: 입력 창 Modal 크기 조절 (수정중)
/*
function openModal2() {
    var url = "/recruiter/calendarPopup";
    var name = "recruiterCalendarPopUp";
    var option = "width=600, height=600, left=100, top=50, location=no"
    window.open(url,name,option)
}
*/

// 캘린더 입력: 입력창 Modal 열기
function openModal() {
    var calendarModal = document.querySelector('#calendarModal');
    if (calendarModal) {
        calendarModal.style.display = 'block';
    }
}
// 캘린더 입력: Modal 닫기
function closeModal(){
    var calendarModal = document.querySelector('#calendarModal');
    var calendarModal = document.querySelector('#calendarModal');
    if (calendarModal) {
        calendarModal.style.display = 'none';
    }
}
// 캘린더 입력: Modal 내 추가 button 클릭
function clickInsert(){
    var clickButton = document.querySelector('#addCalendar');
}

// 캘린더 api: https://fullcalendar.io/
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ko',
        initialDate: new Date(),
        navLinks: true,
        selectable: true,
        selectMirror: true,
        headerToolbar: {
            start: 'addEventButton',
            center: 'title',
            end: 'prev,next dayGridMonth today',
        },
        customButtons: {
            addEventButton: {
                text: '추가',
                click: function() {
                    openModal();

                    // 캘린더 '추가' 버튼 클릭: insert
                    var clickInsertButton = document.querySelector('#addCalendar');
                    clickInsertButton.addEventListener('click', function() {
                        var SCHEDULE_TITLE = document.getElementById('SCHEDULE_TITLE').value;
                        var SCHEDULE_START = document.getElementById('SCHEDULE_START').value;
                        var SCHEDULE_END = document.getElementById('SCHEDULE_END').value;
                        var COMPANY_NO = document.getElementById('COMPANY_NO').value;
                        $.ajax({
                            type: "POST",
                            url: "/recruiter/insertCalendar?method=data",
                            data: JSON.stringify({
                                schedule_title: SCHEDULE_TITLE,
                                schedule_start: SCHEDULE_START,
                                schedule_end: SCHEDULE_END,
                                company_no: COMPANY_NO
                            }),
                            contentType: "application/json; charset=UTF-8",
                            dataType: "text",
                            success: function(success) {
                                closeModal();
                                location.reload();
                            }, error: function() {
                                closeModal();
                            }
                        });
                        closeModal();
                    });
                    // 캘린더 '닫기' 버튼 클릭
                    var clickCloseButton = document.querySelector('#closeModal');
                    clickCloseButton.addEventListener('click', function() {
                        closeModal();
                    });

                }
            },
        },
        // 캘린더 read
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
                            end: eventData[i].SCHEDULE_END,
                            memo:  eventData[i].SCHEDULE_MEMO,
                            allDay: eventData[i].ALL_DAY
                        });
                    }
                    successCallback(eventsArray);
                 },
                 error: function() {
                     failureCallback();
                 }
             });
        },
        // 캘린더 delete





    });
    calendar.render();
});
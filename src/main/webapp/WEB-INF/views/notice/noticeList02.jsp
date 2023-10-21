<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Notice List</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/notice/list.css" type="text/css"/>
    <c:set var="category" value="${param.category}"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.role == 3}">
    <%@ include file="../layout/layoutAdminSidebar.jsp" %>
</c:if>
<article class="total">
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
  </div>
    <div class="content">
       <div class="category_bar">
            <ul class="webtong_tab_type03">
                <li class="on"><a href="/notice/list">전체</a></li>
                <li><a href="/notice/list/seeker">개인회원</a></li>
                <li><a href="/notice/list/company">기업회원</a></li>
            </ul>
       </div>
            <!--/* 검색 */-->
            <div id="board-search">
                <div class="container">
                    <div class="search-window">
                        <form id="searchForm">
                            <div class="search-wrap">
                              <div class="selcetType">
                                <select id="searchType" name="searchType" title="검색 유형 선택">
                                    <option value="">전체 검색</option>
                                    <option value="not_title">제목</option>
                                    <option value="not_content">내용</option>
                                </select>
                                <label for="keyword" class="blind">공지사항 검색</label>
                                    <input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요." title="키워드 입력"/>
                                <button type="button" class="bt_search" onclick="movePage(1, '${category}');"><i
                                        class="fas fa-search"></i><span class="skip_info">검색</span></button>
                               </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--/* 리스트 */-->
            <div id="board-list">
                <div class="container">
                    <table class="board-table">
                      <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-date">등록일</th>
                        </tr>
                      </thead>
                        <!--/* 리스트 데이터 렌더링 영역 */-->
                      <tbody id="list">

                      </tbody>
                    </table>

            <!--/* 페이지네이션 렌더링 영역 */-->
            <div class="paging">

            </div>

            <!--/* 버튼 */-->
            <p class="btn_set tr">
                <a href="/notice/write" class="btns btn_st3 btn_mid">글쓰기</a>
            </p>
    </div>
</section>
</article>
<script>
    window.onload = () => {
        findAllPost();
    }

    // 게시글 리스트 조회
    function findAllPost() {
        const list = JSON.parse('${listJson}');
        if (!list.length) {
            document.getElementById('list').innerHTML = '<td colspan="6"><div className="no_data_msg">검색된 결과가 없습니다.</div></td>';
            drawPage();
        }
        const pagination = JSON.parse('${noticePageJson}');
        const criteria = JSON.parse('${criteriaJson}');
        console.log(pagination);
        console.log(pagination.totalRecordCount);
        console.log(criteria);
        console.log(criteria.currentPageNo);

        let num = ${noticePage.pagination.totalRecordCount} -((${criteria.currentPageNo} -1) * ${criteria.recordsPerPage});
        console.log('num : ' + num);
        drawList(list, num);
        drawPage(pagination, criteria);
    }

    function drawList(list, num) {
        let html = '';
        console.log(list);
        list.forEach(row => {
            let dateArray = row.not_regDate;
            dateArray[1] -= 1;
            let date = new Date(...dateArray.slice(0, 6));
            let formatted = date.getFullYear() + '-' +
                ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
                ('0' + date.getDate()).slice(-2) + ' ' +
                ('0' + date.getHours()).slice(-2) + ':' +
                ('0' + date.getMinutes()).slice(-2) + ':' +
                ('0' + date.getSeconds()).slice(-2);
            html += `
                <tr>
                    <td class="th-num">` + row.not_no + `</td>
                    <td class="th-title"><a href="/notice/read/` + row.not_no + `">` + row.not_title + `</a></td>
                    <td class="th-date">` + formatted + `</td>
                </tr>
            `;
        })
        $("#list").empty().append(html);
    }

    function drawPage(pagination, criteria) {
        if (!pagination || !criteria) {
            document.querySelector('.paging').innerHTML = '';
            throw new Error('Missing required parameters...');
        }
        let html = '';
        if (pagination.hasPreviousPage) {
            html += `
                <a href="javascript:void(0);" onclick="movePage(1)" class="page_bt first">첫 페이지</a>
                <a href="javascript:void(0);" onclick="movePage(` + pagination.firstPage + `-1)" class="page_bt prev">이전 페이지</a>
            `;
        }
        html += '<p>';
        for (let i = pagination.firstPage; i <= pagination.lastPage; i++) {
            html += (i !== criteria.currentPageNo)
                ? `<a href="javascript:void(0);" onclick="movePage(` + i + `);">` + i + `</a>`
                : `<span class="on">` + i + `</span>`
        }
        html += '</p>';
        if (pagination.hasNextPage) {
            html += `
                <a href="javascript:void(0);" onclick="movePage(` + pagination.lastPage + ` + 1);" class="page_bt next">다음 페이지</a>
                <a href="javascript:void(0);" onclick="movePage(` + pagination.totalPageCount + `);" class="page_bt last">마지막 페이지</a>
            `;
        }
        document.querySelector('.paging').innerHTML = html;
    }


    function movePage(currentPageNo, category) {
        const form = document.getElementById('searchForm');
        const urlParams = new URLSearchParams(currentURL.search);
        console.log(category);
        const queryParams = {
            currentPageNo: (currentPageNo) ? currentPageNo : 1,
            recordsPerPage: 10,
            pageSize: 10,
            searchType: $("#.searchType").val(),
            keyword: $("#.keyword").val()
        }
        location.href = location.pathname + '/' + category + '/' + '?' + new URLSearchParams(queryParams).toString();
    }


</script>
</body>
</html>
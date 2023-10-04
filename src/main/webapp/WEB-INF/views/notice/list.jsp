<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOC TYPE html>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Notice List</title>
</head>
<body>
    <div class="page_tits">
        <h2>Notice List</h2>
    </div>
    <div class="content">
        <section>
            <!--/* 검색 */-->
            <div class="search_box">
                <form id="searchForm">
                    <div class="sch_group fl">
                        <select title="검색 유형 선택">
                            <option value="">전체 검색</option>
                            <option value="">일반</option>
                            <option value="">기업</option>
                        </select>
                        <input type="text" placeholder="키워드를 입력해 주세요." title="키워드 입력"/>
                        <button type="button" class="bt_search"><i class="fas fa-search"></i><span class="skip_info">검색</span></button>
                    </div>
                </form>
            </div>
            <!--/* 리스트 */-->
            <table class="tb tb_col">
                <col-group>
                    <col style="width:50px;"/><col style="width:7.5%;"/><col style="width:auto;"/><col style="width:10%;"/><col style="width:15%;"/><col style="width:7.5%;"/>
                </col-group>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
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
        </section>
    </div>
<script>
    window.onload = () => {
        findAllPost();
    }

    // 게시글 리스트 조회
    function findAllPost() {
        const list = JSON.parse('${listJson}');

        console.log(list);

        if ( !list.length ) {
            document.getElementById('list').innerHTML = '<td colspan="6"><div className="no_data_msg">검색된 결과가 없습니다.</div></td>';
            drawPage();
        }

        const pagination = JSON.parse('${noticePageJson}');
        const criteria =  JSON.parse('${criteriaJson}');

        console.log(pagination);
        console.log(pagination.totalRecordCount);
        console.log(criteria);
        console.log(criteria.currentPageNo);

        //let num = pagination.totalRecordCount - ((criteria.currentPageNo - 1) * criteria.recordsPerPage);

        let num = ${noticePage.pagination.totalRecordCount} - ((${criteria.currentPageNo} - 1) * ${criteria.recordsPerPage});
        console.log('num : '+num);
        drawList(list, num);
        drawPage(pagination, criteria);
    }

    function drawList(list, num) {
        let html = '';

        console.log(list);

        list.forEach(row => {
            html += `
                <tr>
                    <td>`+row.not_no+`</td>
                    <td class="tl"><a href="/notice/read/id=`+row.not_no+`">`+row.not_title+`</a></td>
                    <td>`+row.not_regDate+`</td>
                </tr>
            `;
        })
        document.getElementById('list').innerHTML = html;
    }

    function drawPage(pagination, criteria) {
        if ( !pagination || !criteria ) {
            document.querySelector('.paging').innerHTML = '';
            throw new Error('Missing required parameters...');
        }

        let html = '';

        if (pagination.hasPreviousPage) {
            html += `
                <a href="javascript:void(0);" onclick="movePage(1)" class="page_bt first">첫 페이지</a>
                <a href="javascript:void(0);" onclick="movePage(`+pagination.firstPage+`-1)" class="page_bt prev">이전 페이지</a>
            `;
        }

        html += '<p>';
        for (let i = pagination.firstPage; i <= pagination.lastPage; i++) {
            html += (i !== criteria.currentPageNo)
                ? `<a href="javascript:void(0);" onclick="movePage(`+i+`);">`+i+`</a>`
                : `<span class="on">`+i+`</span>`
        }
        html += '</p>';

        if (pagination.existNextPage) {
            html += `
                <a href="javascript:void(0);" onclick="movePage(`+pagination.lastPage+` + 1);" class="page_bt next">다음 페이지</a>
                <a href="javascript:void(0);" onclick="movePage(`+pagination.totalPageCount+`);" class="page_bt last">마지막 페이지</a>
            `;
        }

        document.querySelector('.paging').innerHTML = html;
    }


    function movePage(currentPageNo) {

        const queryParams = {
            currentPageNo: (currentPageNo) ? currentPageNo : 1,
            recordsPerPage: 10,
            pageSize: 10
        }

        location.href = location.pathname + '?' + new URLSearchParams(queryParams).toString();
    }
</script>
</body>
</html>
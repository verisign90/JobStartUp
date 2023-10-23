<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruiter/jobposting/JPlist.css">
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">-->
    <title>채용 공고 목록</title>
</head>
<body>
<%@ include file="../../layout/layoutNav.jsp" %>
<div  id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
    </div>
</div>
<%--<%@ include file="../../layout/layoutSideRecruiter.jsp" %>--%>
<main>
    <!--<article class="article-content">-->
    <article>

        <div class="recruitment">
            <h4><!--채용 공고 정보--></h4><br/>
            <h4><!--채용 공고 정보--></h4><br/>
            <h4><!--채용 공고 정보--></h4><br/>
            <h4><!--채용 공고 정보--></h4><br/>
            <h4><!--채용 공고 정보--></h4><br/>
            <h4><!--수정해야 함--></h4><br/>
        </div>

        <!-- 검색 -->
        <div class = "searchBar">
            <form action = "/recruiter/JPlistBySearch" method="get">
                <div class="">
                    <div class="selectType" id="selectBox">
                        <label for="keyword" class="blind">지역 검색</label>
                        <select id="upperLoc" name="upperLocSelected" onchange="loadLowerLoc()" required>
                            <option value="">선택</option>
                            <c:forEach items="${upperLoc}" var="upLoc">
                                <option value="${upLoc.detail_code_num}">${upLoc.detail_name}</option>
                            </c:forEach>
                        </select>
                        <select id="lowerLoc" name="lowerLocSelected" required>
                            <option value="">선택</option>
                            <c:forEach items="${lowerLoc}" var="loLoc">
                                <option value="${loLoc.detail_code_num}">${loLoc.detail_name}</option>
                            </c:forEach>
                        </select>
                        <input type="text" id="keyword" name="keyword" placeholder="키워드를 입력해 주세요."/>
                        <button type="submit" ><i class="fas fa-search"></i>
                            <span class="skip_info">검색</span></button>
                    </div>
                </div>
            </form>
        </div>

        <!-- jobPosting (검색 x) -->
        <c:if test="${not empty jobPostingList}">
            <div class="jobPostingList-container">
                <div class="info-container">
                    <c:forEach var="jobPosting" items="${jobPostingList}">
                        <div class="info-container-items">
                            <input type="hidden" id="posting_swork" name="posting_swork" ${jobPosting.posting_swork}>
                            <input type="hidden" id="posting_ework" name="posting_ework" ${jobPosting.posting_ework}>
                            <input type="hidden" id="posting_no" name="posting_no" ${jobPosting.posting_no}>
                            <a href="${cPath}/recruiter/JPdetail/${jobPosting.posting_no}" target="_blank">
                                <div class="info-items service-item first-service">
                                    <h3 class="posting_title">${jobPosting.posting_title}</h3>
                                    <div>
                                        <%--<span>${JPlist.company_address_detail}</span>--%>
                                        <span class="company_address">${fn:substring(jobPosting.company_address_detail, 6, 12)}</span>
                                            |
                                        <span class="posting_career">${jobPosting.posting_career}</span>
                                            |
                                        <span class="posting_academy">${jobPosting.posting_academy}</span>
                                            |
                                        <span class="posting_labor">${jobPosting.posting_labor}</span>
                                            |
                                        <span class="posting_salary">${jobPosting.posting_salary}</span>
                                        <span>
                                        <strong class="company_name"><a>${jobPosting.company_name}</a></strong>
                                    </span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <br/>
                <br/>
                <br/>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <!--<a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=1">처음</a>-->
                        <a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=${currentPage - 1}">이전</a>
                    </c:if>

                    <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageNum == currentPage}">
                                <span class="current page-link">${pageNum}</span>
                            </c:when>
                            <c:otherwise>
                                <a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=${pageNum}">${pageNum}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=${currentPage + 1}">다음</a>
                        <!--<a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=${totalPages}">마지막</a>-->
                    </c:if>
                </div>
            </div>
        </c:if>

        <!-- jobPosting (검색 o) -->
        <c:if test ="${not empty jobPostingListBySearch}">
            <div class="jobPostingList-container">
                <div class="info-container">
                <c:forEach var="jobPostingListBySearch" items="${jobPostingListBySearch}">
                    <div class="info-container-items">
                        <input type="hidden" name="posting_swork" ${jobPostingListBySearch.posting_swork}>
                        <input type="hidden" name="posting_ework" ${jobPostingListBySearch.posting_ework}>
                        <input type="hidden" name="posting_no" ${jobPostingListBySearch.posting_no}>
                        <a href="${cPath}/recruiter/JPdetail/${jobPostingListBySearch.posting_no}" target="_blank">
                            <div class="info-items service-item first-service">
                                <h3 class="posting_title">${jobPostingListBySearch.posting_title}</h3>
                                <div>
                                    <span class="company_address">${fn:substring(jobPostingListBySearch.company_address_detail, 0, 6)}</span>
                                    <span class="posting_career">${jobPostingListBySearch.posting_career}</span>
                                    <span class="posting_academy">${jobPostingListBySearch.posting_academy}</span>
                                    <span class="posting_labor">${jobPostingListBySearch.posting_labor}</span>
                                    <span class="posting_salary">${jobPostingListBySearch.posting_salary}</span>
                                    <span>
                            <strong class="company_name"><a>${jobPostingListBySearch.company_name}</a></strong>
                        </span>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                </div>
            </div>
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <!--<a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=1">처음</a>-->
                    <a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlistBySearch?page=${currentPage - 1}&upperLocSelected=${upperLocSelected}&lowerLocSelected=${lowerLocSelected}&keyword=${keyword}">이전</a>
                </c:if>

                <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                    <c:choose>
                        <c:when test="${pageNum == currentPage}">
                            <span class="current page-link">${pageNum}</span>
                        </c:when>
                        <c:otherwise>
                            <a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlistBySearch?page=${pageNum}&upperLocSelected=${upperLocSelected}&lowerLocSelected=${lowerLocSelected}&keyword=${keyword}">${pageNum}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlistBySearch?page=${currentPage + 1}&upperLocSelected=${upperLocSelected}&lowerLocSelected=${lowerLocSelected}&keyword=${keyword}">다음</a>
                    <!--<a class="page-link" href="${pageContext.request.contextPath}/recruiter/JPlist?page=${totalPages}">마지막</a>-->
                </c:if>
            </div>
        </c:if>

    </article>
</main>
<%@ include file="../../layout/layoutFooter.jsp" %>
<!-- Scripts -->
<script src="/css/template/vendor/jquery/jquery.min.js"></script>
<script src="/css/template/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/css/template/assets/js/owl-carousel.js"></script>
<script src="/css/template/assets/js/animation.js"></script>
<script src="/css/template/assets/js/imagesloaded.js"></script>
<script src="/css/template/assets/js/popup.js"></script>
<script src="/css/template/assets/js/custom.js"></script>
<script src="/css/template/assets/js/side.js"></script>

<!-- test 코드 -->
<script>
function loadLowerLoc() {
    var upperLocValue = document.getElementById("upperLoc").value;
    fetch('/recruiter/getJPLowerLoc?upperLoc=' + upperLocValue)
        .then(response => response.json())
        .then(data => {
            var lowerLocSelect = document.getElementById("lowerLoc");
            lowerLocSelect.innerHTML = "";
            data.forEach(loLoc => {
                var option = document.createElement("option");
                option.value = loLoc.detail_code_num;
                option.text = loLoc.detail_name;
                lowerLocSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error:', error));
}
</script>
<script>
    function toggleCheckbox(element) {
        var checkbox = element.querySelector('input[type="checkbox"]');
        checkbox.checked = !checkbox.checked;

        var locDetailName = element.querySelector('.loc-detail-name');
        locDetailName.classList.toggle('selected');
    }
</script>
<script>
    $(document).ready(function () {
        $('#searchInput').on('focus', function () {
            $('.input_placeholder').hide();
        });

        $('#searchInput').on('blur', function () {
            if ($(this).val().length == 0)
                $('.input_placeholder').show();
        });

        $('.input_placeholder').click(function () {
            $('#searchInput').focus();
        });
    });
</script>
<script>
   /* $(document).on('click', 'input[name="upperLoc"]', function () {
        let upperLoc = $(this).val();
        let isChecked = $(this).is(':checked');

        if (isChecked) { // 체크박스가 선택된 경우만 AJAX 요청
            $.ajax({
                url: '/recruiter/getJPLowerLoc', // 실제 서버 URL로 변경 필요
                type: 'GET',
                data: {upperLoc: upperLoc},
                dataType: 'json',
                success: function (response) {
                    let lowerLocContainer = $(".dropdown-low-content");
                    lowerLocContainer.empty(); // 기존 하위 지역 목록을 제거
                    $.each(response, function (index, loLoc) {
                        let lowerLocHtml = `
                        <div class="" onclick="toggleCheckbox(this)">
                            <input type="checkbox" name="lowerLoc" id="${loLoc.detail_code_num}" value="${loLoc.detail_code_num}">
                            <span class="loc-detail-name">${loLoc.detail_name}</span>
                        </div>
                    `;
                        lowerLocContainer.append(lowerLocHtml);
                    });
                }
            });
        } else {
            // 체크박스가 해제된 경우 하위 지역 목록 제거
            $(".dropdown-low-content").empty();
        }
    });*/
</script>
<script>
    /*document.getElementById('subBtn').addEventListener('click', function (e) {
        // 근무 지역 유효성 검사
        const selectUpperLoc = document.getElementById('upperLoc');
        const selectLowerLoc = document.getElementById('lowerLoc');

        if (selectUpperLoc.value === "" || selectLowerLoc.value === "") {
            e.preventDefault();
            alert("근무 지역을 모두 선택해주세요.");
        }
    });*/
</script>
</body>
</html>

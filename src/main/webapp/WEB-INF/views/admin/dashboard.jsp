<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/chart.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>
    <nav>
        nav
    </nav>
</header>
<main>
    <aside>
        <div>
            대쉬보드
        </div>
        <div>
            공지글 목록
            <!--등록/검색/수정/삭제-->
        </div>
        <div>
            박람회 목록
            <!--등록/검색/수정/삭제-->
            <div>
                참여 업체 목록
                <!--등록/검색/수정/삭제-->
            </div>
        </div>
        <div>
            공고 목록
            <!--등록/검색/수정/삭제-->
        </div>
        <div>
            유료 서비스 관리
        </div>
    </aside>
    <article>
        main_article
        <table>
            <c:forEach var="data" items="${dashboardData}">
                <tr>
                    <td>${data.name}</td>
                    <td>${data.age}</td>
                </tr>
            </c:forEach>
        </table>

        <div class="chart_bundle">
            <!-- Bar Chart -->
            <div>
                <canvas id="barChart"></canvas>
            </div>

            <!-- PI Chart -->
            <div>
                <canvas id="piChart"></canvas>
            </div>

            <!-- Line Chart -->
            <div>
                <canvas id="lineChart"></canvas>
            </div>
        </div>
    </article>
</main>
<footer>
    footer
</footer>

<script>
    // JSON 형식의 문자열을 JavaScript 객체로 변환
    var dashboardData = JSON.parse('${dashboardDataJson}');
    var ageGroupData = JSON.parse('${ageGroupDataJson}');

    var ctxBar = document.getElementById('barChart').getContext('2d');
    var ctxPi = document.getElementById('piChart').getContext('2d');
    var ctxLine = document.getElementById('lineChart').getContext('2d');

    var labels = ageGroupData.map(data => data.ageRange);
    var data = ageGroupData.map(data => data.count);

    // Bar Chart
    new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '나이 구간별 인원',
                data: data,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        }
    });

    // PI Chart
    new Chart(ctxPi, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(231, 233, 237, 0.6)',
                    'rgba(54, 162, 235, 0.6)'
                ]
            }]
        }
    });

    // Line Chart
    new Chart(ctxLine, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: '나이 구간별 인원',
                data: data,
                borderColor: 'rgba(75, 192, 192, 1)',
                fill: false
            }]
        }
    });

</script>
</body>
</html>

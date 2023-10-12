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
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<header>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
    </div>
    <nav>
        <div>
            menu1
        </div>
        <div>
            menu2
        </div>
        <div>
            menu3
        </div>
        <div>
            menu4
        </div>
        <div>
            menu5
        </div>
    </nav>
    <div id="sign_button">
        <div class="sign_button_inner">
            <button>SignIn</button>
        </div>
        <div class="sign_button_inner">
            <button>SignUp</button>
        </div>
    </div>
</header>
<main>
    <aside>
        <ul>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        대쉬보드
                    </a>
                </div>
            </li>
            <li>
                공지글 목록
            </li>
            <li>
                <div class="aside_item">
                    <a href="${pageContext.request.contextPath}/admin/jobfairlist">
                        박람회 목록
                    </a>
                </div>
            </li>
            <li>
                참여 업체 목록
            </li>
            <li>
                공고 목록
            </li>
            <li>
                유료 서비스 관리
            </li>
        </ul>
    </aside>
    <article>
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
        plugins: [ChartDataLabels],
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(153, 102, 255, 0.6)',
                    'rgba(255, 159, 64, 0.6)',
                    'rgba(255, 129, 102, 0.6)',
                    'rgba(52, 235, 164, 0.6)'
                ]
            }]
        },
        options: {
            plugins: {
                datalabels: {
                    display: true,
                    formatter: (value, ctx) => {
                        let sum = 0;
                        let dataArr = ctx.chart.data.datasets[0].data;
                        dataArr.map(data => {
                            sum += data;
                        });
                        return /*(value * 100 / sum).toFixed(2)*/ null;
                    },
                    color: '#000'
                },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            let value = context.raw;
                            let sum = context.dataset.data.reduce((a, b) => a + b, 0);
                            let percentage = (value * 100 / sum).toFixed(2);
                            return percentage + `%`;
                        }
                    }
                }
            }
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

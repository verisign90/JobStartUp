<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page"xmlns:fmt="http://java.sun.com/JSP/Page">
<html>
<head>
    <title>왜 안돼요</title>
</head>
<body>
    view 확인
    <table>
        <tr>
            <th>코드</th>
            <th>네임</th>
        </tr>
        <c:forEach var="data1" items="${testData}">
            <tr>
                <td>${data1.name}</td>
                <td>${data1.age}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

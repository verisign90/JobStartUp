<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-10-17
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div style="width: 1280px; margin: 0 auto; text-align: center; padding-top: 200px;">
        <div>
            <div><img src="${cPath}/img/applySuccess_1.png" alt="" style="width: 300px"></div>
            <div><img src="${cPath}/img/applySuccess_2.png" alt="" style="width: 40px;"></div>
            <div><h4 style="font-weight: bold">이력서 지원이 완료되었습니다.</h4></div>
            <div><h5>귀하의 합격을 응원합니다.</h5></div>
        </div>
        <div>
            <button></button>
            <button></button>
        </div>
    </div>
    <div></div>
</body>
</html>

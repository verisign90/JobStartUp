<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko" xmlns:c="http://java.sun.com/JSP/Page" xmlns:fmt="http://java.sun.com/JSP/Page" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 페이지 제목</title>
</head>
<body>
    <c:forEach items="${fileDTOList}" var="file">
        <p>File Name: ${file.cfile_orgname}</p>
        <p>File Path: ${file.cfile_savname}</p>
        <c:choose>
            <c:when test="${fn:endsWith(file.cfile_orgname, '.pdf')}">
                <img src="src/main/resources/static/recruiter/image/pdf.png" alt="PDF Icon">

            </c:when>
            <c:when test="${fn:endsWith(file.cfile_orgname, '.xlsx')}">
                <img src="${pageContext.request.contextPath}/resources/icons/excel.jpg" alt="Excel Icon">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/resources/icons/default.png" alt="Default Icon">
            </c:otherwise>
        </c:choose>
        <!-- 파일 아이콘 표시 -->

        <!-- 파일 다운로드 링크 -->
        <a href="/download?fileName=${file.cfile_orgname}" download="${file.cfile_orgname}">Download File</a>
    </c:forEach>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cPath" value="<%=request.getContextPath()%>" />
<html lang="ko" xmlns:c="http://java.sun.com/jsp/jstl/core" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt">
<head>
    <title>Title</title>
   <%--<script src="//cdn.ckeditor.com/4.22.1/full/ckeditor.js"></script>--%>
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.2/classic/ckeditor.js"></script>
</head>
<body>
<h1>CKEditor</h1>
<form action="" method="POST">
    <textarea id="contents" name="contents"></textarea>
    <p><input type="submit" value="전송"></p>
</form>

<h1>CKEditor2</h1>
<form action="" method="POST">
    <textarea id="contents2" name="contents"></textarea>
    <p><input type="submit" value="전송"></p>
</form>
<script>
    ClassicEditor.create( document.querySelector( '#contents2' ) );
</script>
<%--<script>
    CKEDITOR.replace("contents");
    CKEDITOR.replace("contents2");
</script>--%>
</body>
</html>

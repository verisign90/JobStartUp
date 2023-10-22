<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/resume/mypageHome.css" type="text/css"/>
    <title>Job Start Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<header>
    <%@ include file="../../layout/layoutNav.jsp" %>
    <div id="top" data-wow-duration="1s" data-wow-delay="0.5s">
        <div class="header-text" data-wow-duration="1s" data-wow-delay="1s">
        </div>
    </div>
</header>
<%@ include file="../../layout/layoutSideSeeker.jsp" %>
<main>
    <div class="home-wrap">
        <div><h1 class="fw-bolder">${member.member_name}님</h1></div>

        <div class="tab-content bg-transparent">
            <div id="note-full-container" class="note-has-grid row">
                <div class="col-md-4 single-note-item all-category" style="">
                    <div class="card card-body">
                        <span class="side-stick"></span>
                        <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie <i class="point fa fa-circle ml-1 font-10"></i></h5>
                        <p class="note-date font-12 text-muted">11 March 2009</p>
                        <div class="note-content">
                            <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="mr-1"><i class="fa fa-star favourite-note"></i></span>
                            <span class="mr-1"><i class="fa fa-trash remove-note"></i></span>
                            <div class="ml-auto">
                                <div class="category-selector btn-group">
                                    <a class="nav-link dropdown-toggle category-dropdown label-group p-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">
                                        <div class="category">
                                            <div class="category-business"></div>
                                            <div class="category-social"></div>
                                            <div class="category-important"></div>
                                            <span class="more-options text-dark"><i class="icon-options-vertical"></i></span>
                                        </div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right category-menu">
                                        <a class="note-business badge-group-item badge-business dropdown-item position-relative category-business text-success" href="javascript:void(0);">
                                            <i class="mdi mdi-checkbox-blank-circle-outline mr-1"></i>Business
                                        </a>
                                        <a class="note-social badge-group-item badge-social dropdown-item position-relative category-social text-info" href="javascript:void(0);">
                                            <i class="mdi mdi-checkbox-blank-circle-outline mr-1"></i> Social
                                        </a>
                                        <a class="note-important badge-group-item badge-important dropdown-item position-relative category-important text-danger" href="javascript:void(0);">
                                            <i class="mdi mdi-checkbox-blank-circle-outline mr-1"></i> Important
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <div class="d-flex justify-content-start">
            <div class="box-item mx-3" style="background-color: #b3c6ff;">
                아직 이력서가 없으신가요?
            </div>
            <div class="box-item mx-3" style="background-color: #d9b3ff;">
                즉시 지원하고 취뽀하자 !
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="/css/template/assets/js/side.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>

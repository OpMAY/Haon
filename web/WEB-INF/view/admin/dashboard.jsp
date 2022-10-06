<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>${HEADER_TITLE}</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc."
          name="description"/>
    <meta content="Coderthemes"
          name="author"/>
    <meta http-equiv="X-UA-Compatible"
          content="IE=edge"/>
    <!-- App favicon -->
    <link rel="shortcut icon"
          href="/resources/admin/assets/images/favicon.ico">

    <!-- plugin css -->
    <link href="/resources/admin/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css"
          rel="stylesheet"
          type="text/css"/>

    <!-- App css -->
    <link href="/resources/admin/assets/css/config/default/bootstrap.min.css"
          rel="stylesheet"
          type="text/css"
          id="bs-default-stylesheet"/>
    <link href="/resources/admin/assets/css/config/default/app.min.css"
          rel="stylesheet"
          type="text/css"
          id="app-default-stylesheet"/>

    <link href="/resources/admin/assets/css/config/default/bootstrap-dark.min.css"
          rel="stylesheet"
          type="text/css"
          id="bs-dark-stylesheet"/>
    <link href="/resources/admin/assets/css/config/default/app-dark.min.css"
          rel="stylesheet"
          type="text/css"
          id="app-dark-stylesheet"/>

    <!-- Custom Css -->
    <link rel="preconnect"
          href="https://fonts.googleapis.com">
    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link href="/resources/admin/assets/css/admin.css"
          rel="stylesheet"
          type="text/css"/>

    <!-- icons -->
    <link href="/resources/admin/assets/css/icons.min.css"
          rel="stylesheet"
          type="text/css"/>

</head>

<!-- body start -->
<body class="loading"
      data-layout='{"mode": "light", "width": "fluid", "menuPosition": "fixed", "sidebar": { "color": "dark", "size": "default", "showuser": false}, "topbar": {"color": "dark"}, "showRightSidebarOnPageLoad": true}'>

<!-- Begin page -->
<div id="wrapper">
    <jsp:include page="common/left-sidebar.jsp"/>
    <!-- ============================================================== -->
    <!-- Start Page Content here -->
    <!-- ============================================================== -->

    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Dashboard</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">광고 배너</h4>
                                <p class="sub-header">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, itaque, voluptas.
                                    Eaque earum, eos
                                    exercitationem labore nisi nobis quidem voluptatem voluptates. Aliquam ea earum et
                                    exercitationem
                                    fugit iste voluptate voluptates!
                                </p>
                                <div class="carousel-container">
                                    <div id="carouselExampleIndicators"
                                         class="carousel slide banner-carousel"
                                         data-bs-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <c:forEach items="${banners}" var="banner" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${status.first}">
                                                        <li data-bs-target="#carouselExampleIndicators"
                                                            data-bs-slide-to="${status.index}"
                                                            class="active"></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li data-bs-target="#carouselExampleIndicators"
                                                            data-bs-slide-to="${status.index}"></li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ol>
                                        <div class="carousel-inner"
                                             role="listbox">
                                            <c:forEach items="${banners}" var="banner" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${status.first}">
                                                        <div class="carousel-item active">
                                                            <div class="background"
                                                                 style="background-image: url('${banner.banner_image.url}')">
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="carousel-item">
                                                            <div class="background"
                                                                 style="background-image: url('${banner.banner_image.url}')">
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                        <a class="carousel-control-prev"
                                           href="#carouselExampleIndicators"
                                           role="button"
                                           data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon"
                                                  aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </a>
                                        <a class="carousel-control-next"
                                           href="#carouselExampleIndicators"
                                           role="button"
                                           data-bs-slide="next">
                                            <span class="carousel-control-next-icon"
                                                  aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </a>
                                    </div>
                                    <button type="button" data-href="/admin/banners"
                                            class="_more btn btn-dark waves-effect waves-light">더 보기
                                    </button>
                                </div>
                            </div> <!-- end card-body -->
                        </div> <!-- end card -->
                    </div><!-- end col -->
                </div>
                <!-- end row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex mb-3">
                                    <h4 class="header-title my-auto">신규 사용자(농장) 가입</h4>
                                    <button type="button" data-href="/admin/users"
                                            class="btn btn-dark waves-effect waves-light ms-auto">더 보기
                                    </button>
                                </div>
                                <p class="sub-header">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. At atque delectus dolor
                                    enim eveniet
                                    expedita explicabo facilis fuga impedit labore modi, nemo odio qui recusandae
                                    reprehenderit,
                                    repudiandae saepe totam voluptatum!
                                </p>
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead>
                                        <tr>
                                            <th>농장(사용자)</th>
                                            <th>농장 종류</th>
                                            <th>이메일(ID)</th>
                                            <th>가입 일자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${farms}" var="farm" varStatus="status">
                                            <tr data-href="/admin/user/detail/${farm.user.no}">
                                                <th scope="row">${farm.name}(${farm.user.name})</th>
                                                <td><span class="badge bg-dark">${farm.type.korName}</span></td>
                                                <td>${farm.user.email}</td>
                                                <td>
                                                    <custom:formatDatetime value="${farm.reg_datetime}"
                                                                           pattern="yyyy.MM.dd"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end card -->
                    </div> <!-- end col -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex mb-3">
                                    <h4 class="header-title my-auto">신규 커뮤니티 게시글</h4>
                                    <button type="button" data-href="/admin/boards"
                                            class="btn btn-dark waves-effect waves-light ms-auto">더 보기
                                    </button>
                                </div>
                                <p class="sub-header">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. At atque delectus dolor
                                    enim eveniet
                                    expedita explicabo facilis fuga impedit labore modi, nemo odio qui recusandae
                                    reprehenderit,
                                    repudiandae saepe totam voluptatum!
                                </p>
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead>
                                        <tr>
                                            <th>농장(사용자)</th>
                                            <th>카테고리</th>
                                            <th>게시글 제목</th>
                                            <th>작성 일자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${communities}" var="community" varStatus="status">
                                            <c:set var="type" value="${fn:toLowerCase(community.community_type)}"/>
                                            <tr data-href="/admin/${type}/detail/${community.no}">
                                                <th scope="row">${community.farm.name}(${community.farm.user.name})</th>
                                                <td>
                                                    <span class="badge bg-dark">${community.community_type.korName}</span>
                                                </td>
                                                <td>${community.title}</td>
                                                <td>
                                                    <custom:formatDatetime value="${community.reg_datetime}"
                                                                           pattern="yyyy.MM.dd"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end card -->
                    </div> <!-- end col -->
                </div>
                <!--- end row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex mb-3">
                                    <h4 class="header-title my-auto">작성된 매거진</h4>
                                    <button type="button" data-href="/admin/magazines"
                                            class="btn btn-dark waves-effect waves-light ms-auto">더 보기
                                    </button>
                                </div>
                                <p class="sub-header">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. At atque delectus dolor
                                    enim eveniet
                                    expedita explicabo facilis fuga impedit labore modi, nemo odio qui recusandae
                                    reprehenderit,
                                    repudiandae saepe totam voluptatum!
                                </p>
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead>
                                        <tr>
                                            <th>농장(사용자)</th>
                                            <th>카테고리</th>
                                            <th>게시글 제목</th>
                                            <th>상태</th>
                                            <th>작성 일자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${magazines}" var="magazine" varStatus="status">
                                            <tr data-href="/admin/magazine/detail/${magazine.no}">
                                                <th scope="row">${magazine.farm.name}(${magazine.farm.user.name})</th>
                                                <td><span class="badge bg-dark">최신 매거진</span></td>
                                                <td>${magazine.title}</td>
                                                <c:choose>
                                                    <c:when test="${magazine._show eq true}">
                                                        <td><span class="badge bg-success">활성화</span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td><span class="badge bg-danger">비활성화</span></td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>
                                                    <custom:formatDatetime value="${magazine.reg_datetime}"
                                                                           pattern="yyyy.MM.dd"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end card -->
                    </div> <!-- end col -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex mb-3">
                                    <h4 class="header-title my-auto">신규 이력 등록</h4>
                                    <button type="button" data-href="/admin/trace/traces"
                                            class="btn btn-dark waves-effect waves-light ms-auto">더 보기
                                    </button>
                                </div>
                                <p class="sub-header">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. At atque delectus dolor
                                    enim eveniet
                                    expedita explicabo facilis fuga impedit labore modi, nemo odio qui recusandae
                                    reprehenderit,
                                    repudiandae saepe totam voluptatum!
                                </p>
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead>
                                        <tr>
                                            <th>농장(사용자)</th>
                                            <th>종류</th>
                                            <th>개체 종류</th>
                                            <th>이력번호</th>
                                            <th>작성 일자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${traces}">
                                            <tr>
                                                <th scope="row">${item.farm_name}(${item.name})</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${item._bundle}">
                                                            <span class="badge bg-primary">묶음</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-success">이력</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td><span class="badge bg-dark">${item.type.korName}</span></td>
                                                <td>${item.code}</td>
                                                <td><custom:formatDatetime value="${item.reg_datetime}" pattern="yyyy.MM.dd"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> <!-- end card -->
                    </div> <!-- end col -->
                </div>
                <!--- end row -->
            </div> <!-- container -->

        </div> <!-- content -->
        <jsp:include page="common/footer.jsp"/>
    </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


</div>
<!-- END wrapper -->

<!-- Vendor js -->
<script src="/resources/admin/assets/js/vendor.min.js"></script>

<!-- App js-->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script src="/resources/js/utility.js"></script>
</body>
</html>

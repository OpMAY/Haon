<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Dashboard 2 | UBold - Responsive Admin Dashboard Template</title>
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
                                            <li data-bs-target="#carouselExampleIndicators"
                                                data-bs-slide-to="0"
                                                class="active"></li>
                                            <li data-bs-target="#carouselExampleIndicators"
                                                data-bs-slide-to="1"></li>
                                            <li data-bs-target="#carouselExampleIndicators"
                                                data-bs-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner"
                                             role="listbox">
                                            <div class="carousel-item active">
                                                <div class="background"
                                                     style="background-image: url('/resources/admin/assets/images/small/img-3.jpg')">
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="background"
                                                     style="background-image: url('/resources/admin/assets/images/small/img-2.jpg')">
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="background"
                                                     style="background-image: url('/resources/admin/assets/images/small/img-1.jpg')">
                                                </div>
                                            </div>
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
                                    <table class="table mb-0">
                                        <thead>
                                        <tr>
                                            <th>농장(사용자)</th>
                                            <th>농장 종류</th>
                                            <th>이메일(ID)</th>
                                            <th>연락처</th>
                                            <th>가입 일자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">양 & 염소</span></td>
                                            <td>asszxc@naver.com</td>
                                            <td>010-9431-1977</td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">양 & 염소</span></td>
                                            <td>asszxc@naver.com</td>
                                            <td>010-9431-1977</td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">양 & 염소</span></td>
                                            <td>asszxc@naver.com</td>
                                            <td>010-9431-1977</td>
                                            <td>2022.12.22</td>
                                        </tr>
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
                                    <table class="table mb-0">
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
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">질문과 답변</span></td>
                                            <td>게시글 제목 샘플입니다.</td>
                                            <td><span class="badge bg-success">활성화</span></td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">질문과 답변</span></td>
                                            <td>게시글 제목 샘플입니다.</td>
                                            <td><span class="badge bg-danger">비활성화</span></td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">질문과 답변</span></td>
                                            <td>게시글 제목 샘플입니다.</td>
                                            <td><span class="badge bg-success">활성화</span></td>
                                            <td>2022.12.22</td>
                                        </tr>
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
                                    <table class="table mb-0">
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
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">최신 매거진</span></td>
                                            <td>게시글 제목 샘플입니다.</td>
                                            <td><span class="badge bg-success">활성화</span></td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">최신 매거진</span></td>
                                            <td>게시글 제목 샘플입니다.</td>
                                            <td><span class="badge bg-danger">비활성화</span></td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-dark">최신 매거진</span></td>
                                            <td>게시글 제목 샘플입니다.</td>
                                            <td><span class="badge bg-success">활성화</span></td>
                                            <td>2022.12.22</td>
                                        </tr>
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
                                    <table class="table mb-0">
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
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-primary">묶음</span></td>
                                            <td><span class="badge bg-dark">양 & 염소</span></td>
                                            <td>0111-1222-2222333</td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-blue">이력</span></td>
                                            <td><span class="badge bg-dark">양 & 염소</span></td>
                                            <td>0111-1222-2222</td>
                                            <td>2022.12.22</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">오키위(유병준)</th>
                                            <td><span class="badge bg-blue">이력</span></td>
                                            <td><span class="badge bg-dark">양 & 염소</span></td>
                                            <td>0111-1222-2222</td>
                                            <td>2022.12.22</td>
                                        </tr>
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

<!-- Plugins js-->
<script src="/resources/admin/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="/resources/admin/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/resources/admin/assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js"></script>

<!-- Dashboard 2 init -->
<script src="/resources/admin/assets/js/pages/dashboard-2.init.js"></script>

<!-- App js-->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>

</body>
</html>

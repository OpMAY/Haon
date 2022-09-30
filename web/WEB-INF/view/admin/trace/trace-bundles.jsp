<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Datatables | UBold - Responsive Admin Dashboard Template</title>
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

  <!-- third party css -->
  <link href="/resources/admin/assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/datatables.net-select-bs5/css//select.bootstrap5.min.css"
        rel="stylesheet"
        type="text/css"/>
  <!-- third party css end -->

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
  <jsp:include page="../common/left-sidebar.jsp"/>
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
                  <li class="breadcrumb-item"><a href="../dashboard.html">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="javascript: void(0);">QR 이력 관리</a></li>
                  <li class="breadcrumb-item active">묶음 이력</li>
                </ol>
              </div>
              <h4 class="page-title">묶음 이력</h4>
            </div>
          </div>
        </div>
        <!-- end page title -->

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <div class="d-flex mb-3">
                  <h4 class="header-title my-auto">총 424개의 묶음 이력</h4>
                </div>
                <p class="text-muted font-13 mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque
                                                   consequuntur deserunt ea eveniet id ipsa, molestiae necessitatibus
                                                   praesentium quam reiciendis suscipit! Aut blanditiis distinctio
                                                   impedit, nulla praesentium quod rem!</p>
                <table id="basic-datatable"
                       class="table dt-responsive nowrap w-100">
                  <thead>
                  <tr>
                    <th>번호</th>
                    <th>농장(사용자)</th>
                    <th>개체 종류</th>
                    <th>묶음 번호</th>
                    <th>등록 이력 수</th>
                    <th>작성 일자</th>
                    <th>QR 코드</th>
                    <th>비고</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>1</td>
                    <td>하은 축산(유병준)</td>
                    <td><span class="badge bg-dark">양 & 염소</span></td>
                    <td>0111-1222-2222</td>
                    <td>32</td>
                    <td>2022.12.22</td>
                    <td>
                      <button type="button"
                              class="btn btn-dark waves-effect waves-light">다운로드
                      </button>
                    </td>
                    <td>
                      <button type="button" data-href="../trace/trace-bundle-detail.html"
                              class="btn btn-dark waves-effect waves-light">상세 보기
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>하은 축산(유병준)</td>
                    <td><span class="badge bg-dark">양 & 염소</span></td>
                    <td>0111-1222-2222</td>
                    <td>32</td>
                    <td>2022.12.22</td>
                    <td>
                      <button type="button"
                              class="btn btn-dark waves-effect waves-light">다운로드
                      </button>
                    </td>
                    <td>
                      <button type="button" data-href="../trace/trace-bundle-detail.html"
                              class="btn btn-dark waves-effect waves-light">상세 보기
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>하은 축산(유병준)</td>
                    <td><span class="badge bg-dark">양 & 염소</span></td>
                    <td>0111-1222-2222</td>
                    <td>32</td>
                    <td>2022.12.22</td>
                    <td>
                      <button type="button"
                              class="btn btn-dark waves-effect waves-light">다운로드
                      </button>
                    </td>
                    <td>
                      <button type="button" data-href="../trace/trace-bundle-detail.html"
                              class="btn btn-dark waves-effect waves-light">상세 보기
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>하은 축산(유병준)</td>
                    <td><span class="badge bg-dark">양 & 염소</span></td>
                    <td>0111-1222-2222</td>
                    <td>32</td>
                    <td>2022.12.22</td>
                    <td>
                      <button type="button"
                              class="btn btn-dark waves-effect waves-light">다운로드
                      </button>
                    </td>
                    <td>
                      <button type="button" data-href="../trace/trace-bundle-detail.html"
                              class="btn btn-dark waves-effect waves-light">상세 보기
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>하은 축산(유병준)</td>
                    <td><span class="badge bg-dark">양 & 염소</span></td>
                    <td>0111-1222-2222</td>
                    <td>32</td>
                    <td>2022.12.22</td>
                    <td>
                      <button type="button"
                              class="btn btn-dark waves-effect waves-light">다운로드
                      </button>
                    </td>
                    <td>
                      <button type="button" data-href="../trace/trace-bundle-detail.html"
                              class="btn btn-dark waves-effect waves-light">상세 보기
                      </button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div> <!-- end card body-->
            </div> <!-- end card -->
          </div><!-- end col-->
        </div>
        <!-- end row-->
      </div>
      <!-- container -->
    </div>
    <!-- content -->
    <jsp:include page="../common/footer.jsp"/>
  </div>

  <!-- ============================================================== -->
  <!-- End Page content -->
  <!-- ============================================================== -->


</div>
<!-- END wrapper -->
<!-- Vendor js -->
<script src="/resources/admin/assets/js/vendor.min.js"></script>

<!-- third party js -->
<script src="/resources/admin/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="/resources/admin/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>
<script src="/resources/admin/assets/libs/pdfmake/build/pdfmake.min.js"></script>
<script src="/resources/admin/assets/libs/pdfmake/build/vfs_fonts.js"></script>
<!-- third party js ends -->

<!-- Datatables init -->
<script src="/resources/admin/assets/js/pages/datatables.init.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>

</body>
</html>

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

  <!-- Plugins css -->
  <link href="/resources/admin/assets/libs/mohithg-switchery/switchery.min.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/multiselect/css/multi-select.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/select2/css/select2.min.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/selectize/css/selectize.bootstrap3.css"
        rel="stylesheet"
        type="text/css"/>
  <link href="/resources/admin/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css"
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
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
        rel="stylesheet">
  <link href="/resources/css/module/summernote.css"
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
                  <li class="breadcrumb-item"><a href="../trace/traces.html">축산 이력</a></li>
                  <li class="breadcrumb-item active">축산 이력 정보</li>
                </ol>
              </div>
              <h4 class="page-title">축산 이력 정보</h4>
            </div>
          </div>
        </div>
        <!-- end page title -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="header-title mb-4">축산 이력 정보
                  <div class="float-end">
                    <button type="button"
                            data-bs-target="#download-modal"
                            data-bs-toggle="modal"
                            data-bs-no="1"
                            class="btn btn-primary waves-effect waves-light text-white">
                      QR 다운로드
                    </button>
                    <button type="button"
                            data-href="../trace/trace-detail-update.html"
                            class="btn btn-dark waves-effect waves-light">수정
                    </button>
                    <button type="button"
                            data-bs-target="#delete-modal"
                            data-bs-toggle="modal"
                            data-bs-no="1"
                            class="btn btn-danger waves-effect waves-light">
                      삭제
                    </button>
                  </div>
                </h4>
                <p class="text-muted font-13 mb-3">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi
                  atque
                  consequuntur deserunt ea eveniet id ipsa, molestiae necessitatibus
                  praesentium quam reiciendis suscipit! Aut blanditiis distinctio
                  impedit, nulla praesentium quod rem!</p>
                <div class="row">
                  <div class="col-auto">
                    <label class="mb-1">사용자 이름</label>
                    <p class="text-muted">김우식</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">농장 이름</label>
                    <p class="text-muted">하은축산</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">작성 일자</label>
                    <p class="text-muted">2022.12.22</p>
                  </div>
                  <div class="col-12">
                    <div class="row">
                      <div class="col-auto">
                        <label class="mb-1">개체 축종</label>
                        <p class="text-muted">
                          <span class="badge bg-primary">양 & 염소</span>
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="row">
                      <div class="col-12">
                        <div class="list-group">
                          <a data-bs-toggle="collapse"
                             href="#traceCollapse1"
                             role="button"
                             aria-expanded="true"
                             aria-controls="traceCollapse1"
                             class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                              <h5 class="mb-1">No. 1001 2645 4888</h5>
                              <small class="text-muted">양 & 염소</small>
                            </div>
                            <p class="mb-1">
                              <span class="badge badge-soft-primary">1++</span>
                              <span class="badge badge-soft-dark">수컷</span>
                            </p>
                            <small class="text-muted">2023.12.12 출생</small>
                          </a>
                          <div id="traceCollapse1"
                               class="collapse show">
                            <div class="list-group-item"
                                 style="border-top: none;">
                              <div class="table-responsive mb-3">
                                <table class="table table-bordered mb-0">
                                  <thead>
                                  <tr>
                                    <th colspan="6"
                                        class="text-center">사육 정보
                                    </th>
                                  </tr>
                                  </thead>
                                  <thead>
                                  <tr>
                                    <th>삭제</th>
                                    <th>신고 구분</th>
                                    <th>농장 경영자</th>
                                    <th>농장 명</th>
                                    <th>날짜</th>
                                    <th>소재지</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-primary cursor-pointer">전산 등록</span>
                                      <span class="badge badge-soft-info cursor-pointer">도축 출하</span>
                                      <span class="badge badge-soft-success cursor-pointer">몰?루</span>
                                    </td>
                                    <td><span class="badge badge-soft-primary">김우식</span></td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-primary cursor-pointer">전산 등록</span>
                                      <span class="badge badge-soft-info cursor-pointer">도축 출하</span>
                                      <span class="badge badge-soft-success cursor-pointer">몰?루</span>
                                    </td>
                                    <td><span class="badge badge-soft-primary">김우식</span></td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-primary cursor-pointer">전산 등록</span>
                                      <span class="badge badge-soft-info cursor-pointer">도축 출하</span>
                                      <span class="badge badge-soft-success cursor-pointer">몰?루</span>
                                    </td>
                                    <td><span class="badge badge-soft-primary">김우식</span></td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  </tbody>
                                </table>
                              </div>
                              <div class="table-responsive mb-3">
                                <table class="table table-bordered mb-0">
                                  <thead>
                                  <tr>
                                    <th colspan="6"
                                        class="text-center">도축 정보
                                    </th>
                                  </tr>
                                  </thead>
                                  <thead>
                                  <tr>
                                    <th>삭제</th>
                                    <th>도축 결과</th>
                                    <th>도축장</th>
                                    <th>날짜</th>
                                    <th>소재지</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-success cursor-pointer">통과</span>
                                      <span class="badge badge-soft-danger cursor-pointer">불통</span>
                                    </td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-success cursor-pointer">통과</span>
                                      <span class="badge badge-soft-danger cursor-pointer">불통</span>
                                    </td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-success cursor-pointer">통과</span>
                                      <span class="badge badge-soft-danger cursor-pointer">불통</span>
                                    </td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td>
                                      <span class="badge badge-soft-success cursor-pointer">통과</span>
                                      <span class="badge badge-soft-danger cursor-pointer">불통</span>
                                    </td>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">2022년 09월 01일</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  </tbody>
                                </table>
                              </div>
                              <div class="table-responsive">
                                <table class="table table-bordered mb-0">
                                  <thead>
                                  <tr>
                                    <th colspan="6"
                                        class="text-center">가공 정보
                                    </th>
                                  </tr>
                                  </thead>
                                  <thead>
                                  <tr>
                                    <th>삭제</th>
                                    <th>업소명</th>
                                    <th>소재지</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                  <tr>
                                    <th scope="row">
                                      <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td class="text-nowrap">하은 축산</td>
                                    <td class="text-nowrap">
                                      경기도 화성시 몰루면
                                    </td>
                                  </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
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
<!-- Modal-->
<div id="update-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content modal-filled bg-success">
      <div class="modal-body p-4">
        <div class="text-center">
          <i class="dripicons-to-do h1 text-white"></i>
          <h4 class="mt-2 text-white">Oh snap!</h4>
          <p class="mt-3 text-white">Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                     facilisis in, egestas eget quam.</p>
          <button type="button"
                  class="btn btn-light my-2"
                  data-action="update">Continue
          </button>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="delete-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content modal-filled bg-danger">
      <div class="modal-body p-4">
        <div class="text-center">
          <i class="dripicons-wrong h1 text-white"></i>
          <h4 class="mt-2 text-white">Oh snap!</h4>
          <p class="mt-3 text-white">Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac
                                     facilisis in, egestas eget quam.</p>
          <button type="button"
                  class="btn btn-light my-2"
                  data-action="delete">Continue
          </button>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal End-->
<!-- Vendor js -->
<script src="/resources/admin/assets/js/vendor.min.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/plugin/summernote/custom_summernote-bs4.js"></script>
<script src="/resources/js/plugin/summernote/summernote-ko-KR.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        //event
        $('[data-action="delete"]').click(function (event) {
            console.log(this);
            let no = this.dataset.no;
            console.log(no);
            /*TODO Fetch*/
            alert('삭제');
            $('#delete-modal').modal('hide');
        });
        //fetch get data
        $('#delete-modal').on('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;
            let modal_success_btn = modal.querySelector('[data-action="delete"]');
            modal_success_btn.setAttribute('data-no', button.dataset.bsNo);
            console.log(button, modal);
        });
        //initailize modal
        $('#delete-modal').on('hide.bs.modal', function (event) {
            let modal = this;
            let modal_success_btn = modal.querySelector('[data-action="delete"]');
            modal_success_btn.removeAttribute('data-no');
            console.log(modal);
        });

        //event
        $('[data-action="update"]').click(function (event) {
            console.log(this);
            let no = this.dataset.no;
            console.log(no);
            /*TODO Fetch*/
            alert('수정');
            $('#update-modal').modal('hide');
        });
        //fetch get data
        $('#update-modal').on('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;
            let modal_success_btn = modal.querySelector('[data-action="update"]');
            modal_success_btn.setAttribute('data-no', button.dataset.bsNo);
            console.log(button, modal);
        });
        //initailize modal
        $('#update-modal').on('hide.bs.modal', function (event) {
            let modal = this;
            let modal_success_btn = modal.querySelector('[data-action="update"]');
            modal_success_btn.removeAttribute('data-no');
            console.log(modal);
        });
    });
</script>
</body>
</html>

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
  <link href="/resources/admin/assets/libs/dropify/css/dropify.min.css"
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
                  <li class="breadcrumb-item"><a href="../community/magazines.html">커뮤니티 관리(최신 매거진)</a></li>
                  <li class="breadcrumb-item"><a href="../community/magazines.html">최신 매거진</a></li>
                  <li class="breadcrumb-item active">최신 매거진 생성</li>
                </ol>
              </div>
              <h4 class="page-title">최신 매거진 생성</h4>
            </div>
          </div>
        </div>
        <!-- end page title -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="header-title mb-4">최신 매거진 생성
                  <div class="float-end">
                    <button type="button"
                            data-bs-target="#update-modal"
                            data-bs-toggle="modal"
                            data-bs-no="1"
                            class="btn btn-dark waves-effect waves-light">생성
                    </button>
                  </div>
                </h4>
                <p class="text-muted font-13 mb-3">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi
                  atque
                  consequuntur deserunt ea eveniet id ipsa, molestiae necessitatibus
                  praesentium quam reiciendis suscipit! Aut blanditiis distinctio
                  impedit, nulla praesentium quod rem!</p>
                <form action="#"
                      method="get"
                      onsubmit="return false;">
                  <div class="row">
                    <div class="col-12">
                      <div class="mb-3">
                        <label class="form-label">매거진 이미지</label>
                        <input type="file"
                               name="file"
                               data-plugins="dropify"
                               data-max-file-size="10M"/>
                      </div>
                    </div>
                    <div class="col-6">
                      <div class="mb-3">
                        <label class="form-label">게시글 명</label>
                        <input type="text"
                               placeholder="게시글 명을 입력해주세요."
                               class="form-control">
                      </div>
                    </div>
                    <div class="col-auto">
                      <div class="mb-3">
                        <label class="form-label">카테고리</label>
                        <select class="form-select">
                          <option selected
                                  value="none">선택 없음
                          </option>
                          <option>카테고리1</option>
                          <option>카테고리2</option>
                          <option>카테고리3</option>
                          <option>카테고리4</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-auto">
                      <label class="mb-2">작성자</label>
                      <p class="text-muted">김우식</p>
                    </div>
                    <div class="col-12 mb-3">
                      <label class="mb-1">상세 내용(스마트 에디터)</label>
                      <div id="summernote"></div>
                    </div>
                  </div>
                </form>
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
<script src="/resources/admin/assets/libs/dropify/js/dropify.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        $('[data-plugins="dropify"]').dropify({
            messages: {
                default: "Drag and drop a file here or click",
                replace: "Drag and drop or click to replace",
                remove: "Remove",
                error: "Ooops, something wrong appended."
            }, error: {fileSize: "The file size is too big (1M max)."}
        });

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

        $('#summernote').summernote({
            popover: {
                image: [
                    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
                    ['float', ['floatLeft', 'floatRight', 'floatNone']],
                    ['remove', ['removeMedia']]
                ],
                table: [
                    ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
                    ['delete', ['deleteRow', 'deleteCol', 'deleteTable']]
                ],
            },
            toolbar: [
                ['insert', ['picture', 'video', 'table', 'link', 'hr']],
                ['font', ['bold', 'underline', 'forecolor', 'backcolor']],
                ['fontsize', ['fontsize']],
                ['para', ['ul', 'ol', 'paragraph']],
            ],
            minHeight: 400,             // set minimum height of editor
            maxHeight: 800,             // set maximum height of editor
            focus: false,
            lang: 'ko-KR',
            tabDisable: false,
            shortcuts: false,
            placeholder: '게시글 내용을 입력해주세요.'
        });
    });
</script>
</body>
</html>

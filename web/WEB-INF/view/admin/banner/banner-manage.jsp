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
  <link href="/resources/admin/assets/libs/dropify/css/dropify.min.css"
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
                  <li class="breadcrumb-item"><a href="../dashboard.html">Home</a></li>
                  <li class="breadcrumb-item active">광고 배너 관리</li>
                </ol>
              </div>
              <h4 class="page-title">광고 배너 관리</h4>
            </div>
          </div>
        </div>
        <!-- end page title -->

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="header-title">총 3개의 광고 배너</h4>
                <p class="text-muted font-13 mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi atque
                                                   consequuntur deserunt ea eveniet id ipsa, molestiae necessitatibus
                                                   praesentium quam reiciendis suscipit! Aut blanditiis distinctio
                                                   impedit, nulla praesentium quod rem!</p>
                <div class="carousel-container mb-3">
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
                </div>
                <div class="table-responsive mb-3">
                  <table class="table table-centered mb-0"
                         id="btn-editable">
                    <thead>
                    <tr>
                      <th>번호</th>
                      <th>배너 이미지</th>
                      <th>상단 텍스트</th>
                      <th>중단 텍스트</th>
                      <th>하단 텍스트</th>
                      <th>비고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>1</td>
                      <td>
                        <img src="https://via.placeholder.com/1920x1080"
                             width="36"
                             height="36"/>
                      </td>
                      <td>상단 텍스트</td>
                      <td>중단 텍스트</td>
                      <td>하단 텍스트</td>
                      <td>
                        <button type="button"
                                class="btn btn-primary waves-effect waves-light"
                                data-bs-toggle="modal"
                                data-bs-target="#update-modal"
                                data-bs-no="1">수정
                        </button>
                        <button type="button"
                                class="btn btn-danger waves-effect waves-light"
                                data-bs-toggle="modal"
                                data-bs-target="#delete-modal"
                                data-bs-no="1">삭제
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>
                        <img src="https://via.placeholder.com/1920x1080"
                             width="36"
                             height="36"/>
                      </td>
                      <td>상단 텍스트</td>
                      <td>중단 텍스트</td>
                      <td>하단 텍스트</td>
                      <td>
                        <button type="button"
                                class="btn btn-primary waves-effect waves-light"
                                data-bs-toggle="modal"
                                data-bs-target="#update-modal"
                                data-bs-no="2">수정
                        </button>
                        <button type="button"
                                class="btn btn-danger waves-effect waves-light"
                                data-bs-toggle="modal"
                                data-bs-target="#delete-modal"
                                data-bs-no="2">삭제
                        </button>
                      </td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>
                        <img src="https://via.placeholder.com/1920x1080"
                             width="36"
                             height="36"/>
                      </td>
                      <td>상단 텍스트</td>
                      <td>중단 텍스트</td>
                      <td>하단 텍스트</td>
                      <td>
                        <button type="button"
                                class="btn btn-primary waves-effect waves-light"
                                data-bs-toggle="modal"
                                data-bs-target="#update-modal"
                                data-bs-no="3">수정
                        </button>
                        <button type="button"
                                class="btn btn-danger waves-effect waves-light"
                                data-bs-toggle="modal"
                                data-bs-target="#delete-modal"
                                data-bs-no="3">삭제
                        </button>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div> <!-- end .table-responsive-->
                <div class="text-end">
                  <button type="button"
                          class="btn btn-primary waves-effect waves-light"
                          data-bs-toggle="modal"
                          data-bs-target="#create-modal">배너 추가하기
                  </button>
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
<!-- Modal -->
<!-- Standard modal content -->
<div id="update-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-labelledby="update-modalLabel"
     aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"
            id="update-modalLabel">광고 배너 수정</h4>
        <button type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 class="mb-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores atque doloribus et
                         expedita ipsa
                         iusto
                         minima molestiae mollitia nesciunt non quas quis, quod repellat sequi, sit soluta vero
                         voluptate
                         voluptates.</h5>
        <form id="update-form"
              action="#"
              method="post"
              enctype="multipart/form-data">
          <div class="mb-3">
            <label for="file"
                   class="form-label">광고 배너 이미지</label>
            <input type="file"
                   id="file"
                   name="file"
                   data-plugins="dropify"
                   data-max-file-size="10M"
                   data-default-file="/resources/admin/assets/images/small/img-2.jpg"/>
          </div>
          <div class="mb-3">
            <label class="form-label">상단 텍스트</label>
            <input type="text"
                   name="top_text"
                   placeholder="상단 텍스트"
                   class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">중단 텍스트</label>
            <input type="text"
                   name="middle_text"
                   placeholder="중단 텍스트"
                   class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">하단 텍스트</label>
            <input type="text"
                   name="bottom_text"
                   placeholder="하단 텍스트"
                   class="form-control">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button"
                class="btn btn-light"
                data-bs-dismiss="modal">Close
        </button>
        <button type="button"
                class="btn btn-primary"
                data-action="update">Save changes
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Standard modal content -->
<div id="create-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-labelledby="create-modalLabel"
     aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"
            id="create-modalLabel">광고 배너 생성</h4>
        <button type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 class="mb-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores atque doloribus et
                         expedita ipsa
                         iusto
                         minima molestiae mollitia nesciunt non quas quis, quod repellat sequi, sit soluta vero
                         voluptate
                         voluptates.</h5>
        <form id="create-form"
              action="#"
              method="post"
              enctype="multipart/form-data">
          <div class="mb-3">
            <label for="file"
                   class="form-label">광고 배너 이미지</label>
            <input type="file"
                   name="file"
                   data-plugins="dropify"
                   data-max-file-size="10M"/>
          </div>
          <div class="mb-3">
            <label class="form-label">상단 텍스트</label>
            <input type="text"
                   name="top_text"
                   placeholder="상단 텍스트"
                   class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">중단 텍스트</label>
            <input type="text"
                   name="middle_text"
                   placeholder="중단 텍스트"
                   class="form-control">
          </div>
          <div class="mb-3">
            <label class="form-label">하단 텍스트</label>
            <input type="text"
                   name="bottom_text"
                   placeholder="하단 텍스트"
                   class="form-control">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button"
                class="btn btn-light"
                data-bs-dismiss="modal">Close
        </button>
        <button type="button"
                class="btn btn-primary"
                data-action="create">Save changes
        </button>
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
<!-- Table Editable plugin-->
<script src="/resources/admin/assets/libs/jquery-tabledit/jquery.tabledit.min.js"></script>

<script src="/resources/admin/assets/libs/dropify/js/dropify.min.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
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
        $('[data-action="update"]').click(function (event) {
            let no = this.dataset.no;
            let form = document.querySelector('#update-form');
            form.action = 'url' + no;
            /*TODO Fetch or Form Submit*/
            alert('수정');
            form.submit();
        });
        //fetch get data
        $('#update-modal').on('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;
            /*TODO Fetch*/

            let modal_success_btn = modal.querySelector('[data-action="update"]');
            modal_success_btn.setAttribute('data-no', button.dataset.bsNo);

            let preview = modal.querySelector('.dropify-preview .dropify-render img');
            preview.setAttribute('src', '/resources/admin/assets/images/small/img-1.jpg');

            let input = modal.querySelector('[data-plugins="dropify"]');
            input.setAttribute('data-default-file', '/resources/admin/assets/images/small/img-1.jpg');

            let top = modal.querySelector('[name="top_text"]');
            top.value = 'top value setting';
            let middle = modal.querySelector('[name="middle_text"]');
            middle.value = 'middle value setting';
            let bottom = modal.querySelector('[name="bottom_text"]');
            bottom.value = 'bottom value setting';

            console.log(button, modal);
        });
        //initailize modal
        $('#update-modal').on('hide.bs.modal', function (event) {
            let modal = this;

            let modal_success_btn = modal.querySelector('[data-action="update"]');
            modal_success_btn.removeAttribute('data-no');

            let top = modal.querySelector('[name="top_text"]');
            top.value = '';
            let middle = modal.querySelector('[name="middle_text"]');
            middle.value = '';
            let bottom = modal.querySelector('[name="bottom_text"]');
            bottom.value = '';

            console.log(modal);
        });
        //event
        $('[data-action="create"]').click(function (event) {
            let form = document.querySelector('#create-form');
            form.action = 'action_url';
            alert('생성');
            form.submit();
        });
        //fetch get data
        $('#create-modal').on('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;
            /*TODO Fetch*/
            let modal_success_btn = modal.querySelector('[data-action="create"]');
            modal_success_btn.setAttribute('data-no', button.dataset.bsNo);

            console.log(button, modal);
        });
        //initailize modal
        $('#create-modal').on('hide.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;

            let modal_success_btn = modal.querySelector('[data-action="create"]');
            modal_success_btn.removeAttribute('data-no');

            let remove_img_button = modal.querySelector('.dropify-clear');
            remove_img_button.click();

            let top = modal.querySelector('[name="top_text"]');
            top.value = '';
            let middle = modal.querySelector('[name="middle_text"]');
            middle.value = '';
            let bottom = modal.querySelector('[name="bottom_text"]');
            bottom.value = '';

            console.log(button, modal);
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
    });
</script>
</body>
</html>

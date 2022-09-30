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
            <!--TODO This-->
            <div class="page-title-box">
              <div class="page-title-right">
                <ol class="breadcrumb m-0">
                  <li class="breadcrumb-item"><a href="../dashboard.html">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="../community/tips.html">커뮤니티 관리(팁과 노하우)</a></li>
                  <li class="breadcrumb-item active">팁과 노하우</li>
                </ol>
              </div>
              <h4 class="page-title">팁과 노하우</h4>
            </div>
          </div>
        </div>
        <!-- end page title -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="header-title mb-4">팁과 노하우 정보
                  <div class="float-end">
                    <button type="button"
                            data-bs-target="#"
                            data-bs-toggle="modal"
                            data-bs-no="1"
                            class="btn btn-warning waves-effect waves-light text-white">
                      비 활성화
                    </button>
                    <button type="button"
                            data-href="../community/tip-detail-update.html"
                            class="btn btn-dark waves-effect waves-light">수정
                    </button>
                    <button type="button"
                            data-bs-target="#"
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
                  <div class="col-12">
                    <label class="mb-1">메인 이미지</label>
                    <div class="mb-3 background" style="padding-top: 30%; background-image:
                url('https://via.placeholder.com/1920x1080')">
                    </div>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">게시글 명</label>
                    <p class="text-muted">양& 염소는 어떻게?양& 염소는 어떻게?양& 염소는 어떻게?</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">카테고리</label>
                    <p class="text-muted">
                      <span class="badge bg-primary">기타</span>
                    </p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">작성 일자</label>
                    <p class="text-muted">2022.12.22</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">작성자</label>
                    <p class="text-muted">김우식</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">좋아요</label>
                    <p class="text-muted">999</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">댓글 수</label>
                    <p class="text-muted">999</p>
                  </div>
                  <div class="col-auto">
                    <label class="mb-1">Views</label>
                    <p class="text-muted">999</p>
                  </div>
                  <div class="col-12 mb-3">
                    <label class="mb-1">상세 내용(스마트 에디터)</label>
                    <div class="summernote-container"
                         style="border: 1px solid #ced4da; border-radius: 0.2rem; padding: 16px;">
                      <h2>What is Lorem Ipsum?</h2>
                      <p><strong>Lorem Ipsum</strong>
                        is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been the industry's standard dummy text ever since
                        the 1500s, when an unknown printer took a galley of type and
                        scrambled it to make a type specimen book. It has survived not
                        only five centuries, but also the leap into electronic
                        typesetting, remaining essentially unchanged. It was popularised
                        in the 1960s with the release of Letraset sheets containing Lorem
                        Ipsum passages, and more recently with desktop publishing software
                        like Aldus PageMaker including versions of Lorem Ipsum.</p>
                      <h2>What is Lorem Ipsum?</h2>
                      <p><strong>Lorem Ipsum</strong>
                        is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been the industry's standard dummy text ever since
                        the 1500s, when an unknown printer took a galley of type and
                        scrambled it to make a type specimen book. It has survived not
                        only five centuries, but also the leap into electronic
                        typesetting, remaining essentially unchanged. It was popularised
                        in the 1960s with the release of Letraset sheets containing Lorem
                        Ipsum passages, and more recently with desktop publishing software
                        like Aldus PageMaker including versions of Lorem Ipsum.</p>
                      <h2>What is Lorem Ipsum?</h2>
                      <p><strong>Lorem Ipsum</strong>
                        is simply dummy text of the printing and typesetting industry.
                        Lorem Ipsum has been the industry's standard dummy text ever since
                        the 1500s, when an unknown printer took a galley of type and
                        scrambled it to make a type specimen book. It has survived not
                        only five centuries, but also the leap into electronic
                        typesetting, remaining essentially unchanged. It was popularised
                        in the 1960s with the release of Letraset sheets containing Lorem
                        Ipsum passages, and more recently with desktop publishing software
                        like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    </div>
                  </div>
                  <div class="col-12">
                    <h4 class="mt-0 mb-1">코멘트 (258)</h4>
                    <div class="mt-2">
                      <div class="d-flex align-items-start">
                        <img class="me-2 avatar-sm rounded-circle"
                             src="/resources/admin/assets/images/users/user-3.jpg"
                             alt="Generic placeholder image">
                        <div class="w-100">
                          <h5 class="mt-0">
                            <a href="#"
                               class="text-reset">Jeremy Tomlinson</a>
                            <small class="text-muted">3 hours ago</small>
                          </h5>
                          Nice work, makes me think of The Money Pit.
                          <br>
                          <div class="d-flex align-items-start mt-3">
                            <a class="pe-2"
                               href="#">
                              <img src="/resources/admin/assets/images/users/user-4.jpg"
                                   class="avatar-sm rounded-circle"
                                   alt="Generic placeholder image">
                            </a>
                            <div class="w-100">
                              <h5 class="mt-0"><a href="contacts-profile.html"
                                                  class="text-reset">Kathleen Thomas</a> <small class="text-muted">1
                                                                                                                   hours
                                                                                                                   ago</small>
                              </h5>
                              i'm in the middle of a timelapse animation myself! (Very different though.) Awesome stuff.
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="d-flex align-items-start mt-3">
                        <img class="me-2 avatar-sm rounded-circle"
                             src="/resources/admin/assets/images/users/user-2.jpg"
                             alt="Generic placeholder image">
                        <div class="w-100">
                          <h5 class="mt-0">
                            <a href="#"
                               class="text-reset">Jonathan Tiner</a>
                            <small class="text-muted">1 day ago</small>
                          </h5>
                          The parallax is a little odd but O.o that house build is awesome!!
                          <br>
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
<!-- Standard modal content -->
<div id="suspense-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-labelledby="suspense-modalLabel"
     aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"
            id="suspense-modalLabel">회원 정지</h4>
        <button type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 class="mb-3">‘유병준’님을 서비스 이용 정지하시겠어요?</h5>
        <form id="suspense-form"
              action="#"
              method="post"
              enctype="multipart/form-data">
          <div class="mb-3">
            <label for="suspense-range-select"
                   class="form-label">기간 선택</label>
            <select class="form-select"
                    id="suspense-range-select">
              <option selected
                      value="none">시간 선택
              </option>
              <option value="week">1주일</option>
              <option value="month">1개월</option>
              <option value="quater">3개월</option>
              <option value="half">6개월</option>
              <option value="forever">영구</option>
            </select>
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
                data-action="suspense">Save changes
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
<!-- Modal End-->
<!-- Vendor js -->
<script src="/resources/admin/assets/js/vendor.min.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        //event
        $('[data-action="suspense"]').click(function (event) {
            let no = this.dataset.no;
            let form = document.querySelector('#suspense-form');
            form.action = 'url' + no;
            /*TODO Fetch or Form Submit*/
            alert('정지');
            form.submit();
        });
        //fetch get data
        $('#suspense-modal').on('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;

            let modal_success_btn = modal.querySelector('[data-action="suspense"]');
            modal_success_btn.setAttribute('data-no', button.dataset.bsNo);

            console.log(button, modal);
        });
        //initailize modal
        $('#suspense-modal').on('hide.bs.modal', function (event) {
            let modal = this;

            let select = document.querySelector('#suspense-range-select');
            select.value = 'none';

            let modal_success_btn = modal.querySelector('[data-action="suspense"]');
            modal_success_btn.removeAttribute('data-no');

            console.log(modal);
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

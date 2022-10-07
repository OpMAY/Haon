<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/manuals">커뮤니티 관리(축산 메뉴얼)</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="/admin/manual/detail/${manual.no}">축산 메뉴얼</a>
                                    </li>
                                    <li class="breadcrumb-item active">축산 메뉴얼 수정</li>
                                </ol>
                            </div>
                            <h4 class="page-title">축산 메뉴얼 수정</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-4">축산 메뉴얼 수정
                                    <div class="float-end">
                                        <button type="button"
                                                data-bs-target="#update-modal"
                                                data-bs-toggle="modal"
                                                data-bs-no="${manual.no}"
                                                class="btn btn-dark waves-effect waves-light">수정
                                        </button>
                                        <button type="button"
                                                data-bs-target="#delete-modal"
                                                data-bs-toggle="modal"
                                                data-bs-no="${manual.no}"
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
                                <form action="/admin/manual/update/${manual.no}"
                                      enctype="multipart/form-data"
                                      method="POST"
                                      onsubmit="return communitySubmit();">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="mb-3">
                                                <label class="form-label">최신 메뉴얼 이미지</label>
                                                <input type="file"
                                                       name="file"
                                                       data-plugins="dropify"
                                                       data-allowed-file-extensions='["jpeg/jfif", "tiff","gif","bmp","png","ppm","pgm","pbm","pnm","svg","jpg","jpeg"]'
                                                       data-thumbnail-image-url="${manual.thumbnail.url}"
                                                       data-thumbnail-image-size="${manual.thumbnail.size}"
                                                       data-thumbnail-image-name="${manual.thumbnail.name}"
                                                       data-thumbnail-image-type="${manual.thumbnail.type}"
                                                       data-default-file="${manual.thumbnail.url}"
                                                       data-max-file-size="10M"/>
                                                <input type="text"
                                                       class="d-none"
                                                       name="origin_thumbnail"/>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="mb-3">
                                                <label class="form-label">게시글 제목</label>
                                                <input type="text"
                                                       placeholder="게시글 제목을 입력해주세요."
                                                       value="${manual.title}"
                                                       name="title"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <div class="mb-3">
                                                <label class="form-label">카테고리</label>
                                                <select class="form-select" name="category">
                                                    <option value="none">선택 없음</option>
                                                    <c:forEach items="${communityCategory.categories}" var="category">
                                                        <c:choose>
                                                            <c:when test="${category eq manual.category}">
                                                                <option selected
                                                                        value="${category}">${category}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${category}">${category}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <label class="mb-2">작성 일자</label>
                                            <p class="text-muted">
                                                <custom:formatDatetime value="${manual.reg_datetime}"
                                                                       pattern="yyyy.MM.dd"/>
                                            </p>
                                        </div>
                                        <div class="col-auto">
                                            <label class="mb-2">작성자</label>
                                            <p class="text-muted">${manual.farm.name}</p>
                                        </div>
                                        <div class="col-auto">
                                            <label class="mb-2">좋아요</label>
                                            <p class="text-muted">${manual.likes}</p>
                                        </div>
                                        <div class="col-auto">
                                            <label class="mb-2">댓글 수</label>
                                            <p class="text-muted">${manual.comments}</p>
                                        </div>
                                        <div class="col-auto">
                                            <label class="mb-2">Views</label>
                                            <p class="text-muted">${manual.views}</p>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label class="mb-1">상세 내용(스마트 에디터)</label>
                                            <input type="text" name="content" class="d-none">
                                            <div id="summernote" class="summernote-container"></div>
                                        </div>
                                        <div class="col-12">
                                            <h4 class="mt-0 mb-1">코멘트 (${manual.comments})</h4>
                                            <div class="mt-2">
                                                <c:forEach items="${comments}" var="comment" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${status.first}">
                                                            <div class="d-flex align-items-start">
                                                                <img class="me-2 avatar-sm rounded-circle"
                                                                     src="${comment.user.profile_img.url}"
                                                                     alt="Generic placeholder image">
                                                                <div class="w-100">
                                                                    <h5 class="mt-0">
                                                                        <a href="javascript:void(0);"
                                                                           class="text-reset">${comment.user.name}</a>
                                                                        <small class="text-muted">
                                                                            <custom:formatDatetime
                                                                                    value="${comment.reg_datetime}"
                                                                                    pattern="yyyy.MM.dd"/>
                                                                        </small>
                                                                        <c:choose>
                                                                            <c:when test="${comment._blocked eq false}">
                                                                                <a class="badge badge-soft-primary"
                                                                                   data-action="lock"
                                                                                   data-no="${comment.no}"
                                                                                   href="javascript:void(0);">
                                                                                    <i class="dripicons-lock"></i>
                                                                                </a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a class="badge badge-soft-primary"
                                                                                   data-action="unlock"
                                                                                   data-no="${comment.no}"
                                                                                   href="javascript:void(0);">
                                                                                    <i class="dripicons-lock-open"></i>
                                                                                </a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:if test="${comment.user_no ne null}">
                                                                            <a class="badge badge-soft-danger"
                                                                               data-action="_delete"
                                                                               data-no="${comment.no}"
                                                                               href="javascript:void(0);">
                                                                                <i class="dripicons-trash"></i>
                                                                            </a>
                                                                        </c:if>
                                                                    </h5>
                                                                        ${comment.content}
                                                                    <br>
                                                                    <c:if test="${comment.comments.size() ne 0}">
                                                                        <c:forEach items="${comment.comments}"
                                                                                   var="recomment"
                                                                                   varStatus="recomment_status">
                                                                            <div class="d-flex align-items-start mt-3">
                                                                                <a class="pe-2"
                                                                                   href="javascript:void(0);">
                                                                                    <img src="${recomment.user.profile_img.url}"
                                                                                         class="avatar-sm rounded-circle"
                                                                                         alt="Generic placeholder image">
                                                                                </a>
                                                                                <div class="w-100">
                                                                                    <h5 class="mt-0">
                                                                                        <a href="javascript:void(0);"
                                                                                           class="text-reset">${recomment.user.name}</a>
                                                                                        <small class="text-muted">
                                                                                            <custom:formatDatetime
                                                                                                    value="${recomment.reg_datetime}"
                                                                                                    pattern="yyyy.MM.dd"/>
                                                                                        </small>
                                                                                        <c:choose>
                                                                                            <c:when test="${recomment._blocked eq false}">
                                                                                                <a class="badge badge-soft-primary"
                                                                                                   data-action="lock"
                                                                                                   data-no="${recomment.no}"
                                                                                                   href="javascript:void(0);">
                                                                                                    <i class="dripicons-lock"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <a class="badge badge-soft-primary"
                                                                                                   data-action="unlock"
                                                                                                   data-no="${recomment.no}"
                                                                                                   href="javascript:void(0);">
                                                                                                    <i class="dripicons-lock-open"></i>
                                                                                                </a>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                        <c:if test="${recomment.user_no ne null}">
                                                                                            <a class="badge badge-soft-danger"
                                                                                               data-action="_delete"
                                                                                               data-no="${recomment.no}"
                                                                                               href="javascript:void(0);">
                                                                                                <i class="dripicons-trash"></i>
                                                                                            </a>
                                                                                        </c:if>
                                                                                    </h5>
                                                                                        ${recomment.content}
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="d-flex align-items-start mt-3">
                                                                <img class="me-2 avatar-sm rounded-circle"
                                                                     src="${comment.user.profile_img.url}"
                                                                     alt="Generic placeholder image">
                                                                <div class="w-100">
                                                                    <h5 class="mt-0">
                                                                        <a href="javascript:void(0);"
                                                                           class="text-reset">${comment.user.name}</a>
                                                                        <small class="text-muted">
                                                                            <custom:formatDatetime
                                                                                    value="${comment.reg_datetime}"
                                                                                    pattern="yyyy.MM.dd"/>
                                                                        </small>
                                                                        <c:choose>
                                                                            <c:when test="${comment._blocked eq false}">
                                                                                <a class="badge badge-soft-primary"
                                                                                   data-action="lock"
                                                                                   data-no="${comment.no}"
                                                                                   href="javascript:void(0);">
                                                                                    <i class="dripicons-lock"></i>
                                                                                </a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <a class="badge badge-soft-primary"
                                                                                   data-action="unlock"
                                                                                   data-no="${comment.no}"
                                                                                   href="javascript:void(0);">
                                                                                    <i class="dripicons-lock-open"></i>
                                                                                </a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:if test="${comment.user_no ne null}">
                                                                            <a class="badge badge-soft-danger"
                                                                               data-action="_delete"
                                                                               data-no="${comment.no}"
                                                                               href="javascript:void(0);">
                                                                                <i class="dripicons-trash"></i>
                                                                            </a>
                                                                        </c:if>
                                                                    </h5>
                                                                        ${comment.content}
                                                                    <br>
                                                                    <c:if test="${comment.comments.size() ne 0}">
                                                                        <c:forEach items="${comment.comments}"
                                                                                   var="recomment"
                                                                                   varStatus="recomment_status">
                                                                            <div class="d-flex align-items-start mt-3">
                                                                                <a class="pe-2"
                                                                                   href="javascript:void(0);">
                                                                                    <img src="${recomment.user.profile_img.url}"
                                                                                         class="avatar-sm rounded-circle"
                                                                                         alt="Generic placeholder image">
                                                                                </a>
                                                                                <div class="w-100">
                                                                                    <h5 class="mt-0">
                                                                                        <a href="javascript:void(0);"
                                                                                           class="text-reset">${recomment.user.name}</a>
                                                                                        <small class="text-muted">
                                                                                            <custom:formatDatetime
                                                                                                    value="${recomment.reg_datetime}"
                                                                                                    pattern="yyyy.MM.dd"/>
                                                                                        </small>
                                                                                        <c:choose>
                                                                                            <c:when test="${recomment._blocked eq false}">
                                                                                                <a class="badge badge-soft-primary"
                                                                                                   data-action="lock"
                                                                                                   data-no="${recomment.no}"
                                                                                                   href="javascript:void(0);">
                                                                                                    <i class="dripicons-lock"></i>
                                                                                                </a>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <a class="badge badge-soft-primary"
                                                                                                   data-action="unlock"
                                                                                                   data-no="${recomment.no}"
                                                                                                   href="javascript:void(0);">
                                                                                                    <i class="dripicons-lock-open"></i>
                                                                                                </a>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                        <c:if test="${recomment.user_no ne null}">
                                                                                            <a class="badge badge-soft-danger"
                                                                                               data-action="_delete"
                                                                                               data-no="${recomment.no}"
                                                                                               href="javascript:void(0);">
                                                                                                <i class="dripicons-trash"></i>
                                                                                            </a>
                                                                                        </c:if>
                                                                                    </h5>
                                                                                        ${recomment.content}
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
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
                    <h4 class="mt-2 text-white">게시물 수정</h4>
                    <p class="mt-3 text-white">게시물을 수정하시겠습니까?</p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-action="update">수정
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
                    <h4 class="mt-2 text-white">게시물 삭제</h4>
                    <p class="mt-3 text-white">해당 게시물을 삭제하면 좋아요 및 댓글수, 조회수는 같이 삭제됩니다.</p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-action="delete">삭제하기
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
<script src="/resources/js/api.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/plugin/summernote/custom_summernote-bs4.js"></script>
<script src="/resources/js/plugin/summernote/summernote-ko-KR.js"></script>
<script src="/resources/admin/assets/libs/dropify/js/dropify.min.js"></script>
<script src="/resources/js/utility.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        $('[data-plugins="dropify"]').dropify({
            messages: {
                default: "파일을 넣거나 클릭해주세요.",
                replace: "파일을 넣거나 클릭해주세요.",
                remove: "삭제",
                error: "에러입니다. 관리자에게 문의해주세요."
            }, error: {fileSize: "파일 사이즈가 너무 큽니다. (10MB 미만)"}
        });

        //event
        $('[data-action="delete"]').click(function (event) {
            let no = this.dataset.no;
            deleteCommunity('MANUAL', no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('해당 게시글을 삭제하였습니다.');
                        location.href = '/admin/tips';
                    } else {
                        alert('해당 게시글을 삭제할 수 없습니다.');
                    }
                } else {
                    alert('해당 게시글을 삭제할 수 없습니다.');
                }
            });
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
            let form = document.querySelector('form');
            $('form').submit();
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
        $('#summernote').summernote('code', '${manual.content}'.replaceAll('&#39;', '\''));

        //comment event action
        $('[data-action="_delete"]').click(function (event) {
            deleteReviewReply('MANUAL', this.dataset.no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('코멘트를 삭제하였습니다.');
                        location.reload();
                    } else {
                        alert('코멘트를 삭제할 수 없습니다.');
                    }
                } else {
                    alert('코멘트를 삭제할 수 없습니다.');
                }
            });
        });
        $('[data-action="lock"]').click(function (event) {
            blockReview('LOCK', 'MANUAL', this.dataset.no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('해당 댓글을 비공개 처리 했습니다.');
                        location.reload();
                    } else {
                        alert('해당 댓글을 비공개 처리 할 수 없습니다.');
                    }
                } else {
                    alert('해당 댓글을 비공개 처리 할 수 없습니다.');
                }
            });
        });
        $('[data-action="unlock"]').click(function (event) {
            blockReview('UNLOCK', 'MANUAL', this.dataset.no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('해당 댓글을 공개 처리 했습니다.');
                        location.reload();
                    } else {
                        alert('해당 댓글을 공개 처리 할 수 없습니다.');
                    }
                } else {
                    alert('해당 댓글을 공개 처리 할 수 없습니다.');
                }
            });
        });
    });

    const communitySubmit = () => {
        let return_check = true;
        let title = $('[name="title"]').val();
        let title_regex = /^.{2,50}$/gm;
        if (!title_regex.test(title)) {
            alert('제목을 정확히 입력해주세요. 2글자 이상, 50글자 이내');
            return_check = false;
        }
        let content = $('#summernote').summernote('code');
        let content_regex = /^.{10,8000}$/gm;
        if (!content_regex.test($(content).text())) {
            alert('게시글 내용을 정확히 입력해주세요. 10글자 이상, 8000글자 이내');
            return_check = false;
        }
        $('[name="content"]').val(content);
        let category = $('[name="category"]').val();
        if (category === null || category === undefined || category.length === 0 || category === 'none') {
            alert('카테고리를 선택해주세요.');
            return_check = false;
        }
        let origin_thumbnail = $('[name="origin_thumbnail"]');
        let origin_dataset = $('[name="file"]')[0].dataset;
        if ($('.dropify-wrapper.has-preview').length !== 0) {
            origin_thumbnail.val(JSON.stringify({
                url: origin_dataset.thumbnailImageUrl,
                name: origin_dataset.thumbnailImageName,
                type: origin_dataset.thumbnailImageType,
                size: origin_dataset.thumbnailImageSize
            }));
        } else {
            origin_thumbnail.val(JSON.stringify({
                url: null,
                name: null,
                type: null,
                size: null
            }));
        }
        $('#update-modal').modal('hide');
        return return_check;
    }
</script>
</body>
</html>

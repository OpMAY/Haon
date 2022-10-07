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
                                    <li class="breadcrumb-item"><a href="/admin/magazines">커뮤니티 관리(최신
                                        매거진)</a></li>
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
                                        <button type="button" onclick="magazineFormSubmit();"
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
                                <form action="/admin/magazine/create"
                                      enctype="multipart/form-data"
                                      method="POST"
                                      onsubmit="return communitySubmit();">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="mb-3">
                                                <label class="form-label">매거진 이미지</label>
                                                <input type="file"
                                                       name="file"
                                                       data-plugins="dropify"
                                                       data-thumbnail-image-url=""
                                                       data-thumbnail-image-size=""
                                                       data-thumbnail-image-name=""
                                                       data-thumbnail-image-type=""
                                                       data-allowed-file-extensions='["jpeg/jfif", "tiff","gif","bmp","png","ppm","pgm","pbm","pnm","svg","jpg","jpeg"]'
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
                                                       name="title"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <div class="mb-3">
                                                <label class="form-label">카테고리</label>
                                                <select class="form-select" name="category">
                                                    <option value="none" selected>선택 없음</option>
                                                    <c:forEach items="${communityCategory.categories}" var="category">
                                                        <option value="${category}">${category}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <label class="mb-2">작성자</label>
                                            <p class="text-muted">${farm.name}</p>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label class="mb-1">상세 내용(스마트 에디터)</label>
                                            <input type="text" name="content" class="d-none">
                                            <div id="summernote" class="summernote-container"></div>
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
        if (${status ne null}) {
            if (${status eq true}) {
                alert('최신 매거진을 생성하였습니다.');
                location.href = '/admin/magazine/detail/${created_magazine_no}';
            } else {
                alert('최신 매거진을 생성할 수 없습니다.');
                location.href = '/admin/magazine/create';
            }
        }
        $('[data-plugins="dropify"]').dropify({
            messages: {
                default: "파일을 넣거나 클릭해주세요.",
                replace: "파일을 넣거나 클릭해주세요.",
                remove: "삭제",
                error: "에러입니다. 관리자에게 문의해주세요."
            }, error: {fileSize: "파일 사이즈가 너무 큽니다. (10MB 미만)"}
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
        return return_check;
    }

    function magazineFormSubmit() {
        $('form').submit();
    }
</script>
</body>
</html>

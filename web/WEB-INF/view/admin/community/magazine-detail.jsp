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
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/magazines">커뮤니티 관리(최신
                                        매거진)</a></li>
                                    <li class="breadcrumb-item active">최신 매거진</li>
                                </ol>
                            </div>
                            <h4 class="page-title">최신 매거진</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-4">최신 매거진 정보
                                    <div class="float-end">
                                        <c:choose>
                                            <c:when test="${magazine._show eq true}">
                                                <button type="button"
                                                        data-bs-target="#active-modal"
                                                        data-bs-type="INACTIVE"
                                                        data-bs-toggle="modal"
                                                        data-bs-no="${magazine.no}"
                                                        class="btn btn-warning waves-effect waves-light text-white">
                                                    비 활성화
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button"
                                                        data-bs-target="#active-modal"
                                                        data-bs-type="ACTIVE"
                                                        data-bs-toggle="modal"
                                                        data-bs-no="${magazine.no}"
                                                        class="btn btn-primary waves-effect waves-light text-white">
                                                    활성화
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                        <button type="button"
                                                data-href="/admin/magazine/update/${magazine.no}"
                                                class="btn btn-dark waves-effect waves-light">수정
                                        </button>
                                        <button type="button"
                                                data-bs-target="#delete-modal"
                                                data-bs-toggle="modal"
                                                data-bs-no="${magazine.no}"
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
                                        <c:choose>
                                            <c:when test="${magazine.thumbnail ne null}">
                                                <div class="mb-3 background"
                                                     style="padding-top: 30%; background-image: url('${magazine.thumbnail.url}')">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-muted">메인 이미지가 없습니다.</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">게시글 명</label>
                                        <p class="text-muted">${magazine.title}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">카테고리</label>
                                        <p class="text-muted">
                                            <span class="badge bg-primary">${magazine.category}</span>
                                        </p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">작성 일자</label>
                                        <p class="text-muted">
                                            <custom:formatDatetime value="${magazine.reg_datetime}"
                                                                   pattern="yyyy.MM.dd"/>
                                        </p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">작성자</label>
                                        <p class="text-muted">${magazine.farm.name}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">좋아요</label>
                                        <p class="text-muted">${magazine.likes}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">댓글 수</label>
                                        <p class="text-muted">${magazine.comments}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">Views</label>
                                        <p class="text-muted">${magazine.views}</p>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <label class="mb-1">상세 내용(스마트 에디터)</label>
                                        <div class="summernote-container"
                                             style="border: 1px solid #ced4da; border-radius: 0.2rem; padding: 16px;">
                                            ${magazine.content}
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <h4 class="mt-0 mb-1">코멘트 (${magazine.comments})</h4>
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
<div id="active-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-danger">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-wrong h1 text-white"></i>
                    <h4 class="mt-2 text-white">게시물 활성화</h4>
                    <p class="mt-3 text-white">해당 게시물을 활성화 하시겠습니까?</p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-action="active">확인
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
<script src="/resources/js/utility.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        //event
        $('[data-action="delete"]').click(function (event) {
            let no = this.dataset.no;
            deleteCommunity('MAGAZINE', no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('해당 게시글을 삭제하였습니다.');
                        location.href = '/admin/magazines';
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
        $('[data-action="active"]').click(function (event) {
            let no = this.dataset.no;
            let type = this.dataset.type;
            magazineStatusUpdate(type, no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        if (type === 'ACTIVE') {
                            alert('매거진을 활성화 하였습니다.');
                        } else {
                            alert('매거진을 비활성화 하였습니다.');
                        }
                        location.reload();
                    } else {
                        if (type === 'ACTIVE') {
                            alert('매거진을 활성화 할 수 없습니다.');
                        } else {
                            alert('매거진을 비활성화 할 수 없습니다.');
                        }
                    }
                } else {
                    if (type === 'ACTIVE') {
                        alert('매거진을 활성화 할 수 없습니다.');
                    } else {
                        alert('매거진을 비활성화 할 수 없습니다.');
                    }
                }
            });
            $('#active-modal').modal('hide');
        });
        //fetch get data
        $('#active-modal').on('show.bs.modal', function (event) {
            let button = event.relatedTarget;
            let modal = this;
            let modal_success_btn = modal.querySelector('[data-action="active"]');
            modal_success_btn.setAttribute('data-no', button.dataset.bsNo);
            modal_success_btn.setAttribute('data-type', button.dataset.bsType);

            let title = modal.querySelector('h4');
            let description = modal.querySelector('p');
            let action_button = modal.querySelector('button');
            if (button.dataset.bsType === 'INACTIVE') {
                title.innerHTML = '게시물 비활성화';
                description.innerHTML = '해당 게시물을 비활성화 하시겠습니까?';
                action_button.innerHTML = '비활성화';
            } else {
                title.innerHTML = '게시물 활성화';
                description.innerHTML = '해당 게시물을 활성화 하시겠습니까?';
                action_button.innerHTML = '활성화';
            }
            console.log(button, modal);
        });
        //initailize modal
        $('#active-modal').on('hide.bs.modal', function (event) {
            let modal = this;
            let modal_success_btn = modal.querySelector('[data-action="active"]');
            modal_success_btn.removeAttribute('data-no');
            modal_success_btn.removeAttribute('data-type');
            console.log(modal);
        });
    });
</script>
</body>
</html>

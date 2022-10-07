<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
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
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/users">사용자(농장 관리)</a></li>
                                    <li class="breadcrumb-item active">사용자(농장) 정보</li>
                                </ol>
                            </div>
                            <h4 class="page-title">사용자(농장 관리)</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">사용자 정보</h4>
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <div class="avatar-lg">
                                            <div class="background"
                                                 style="padding-top: 100%; background-image: url('${user.farm.profile_image.url}'); border-radius: 50%;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <h5 class="mb-1">${user.user.name}
                                            <div class="float-end">
                                                <c:choose>
                                                    <c:when test="${user.ban}">
                                                        <button type="button"
                                                                data-bs-target="#delete-modal"
                                                                data-bs-toggle="modal"
                                                                data-bs-no="${user.user.no}"
                                                                class="btn btn-dark waves-effect waves-light">정지 해제
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button type="button"
                                                                data-bs-target="#suspense-modal"
                                                                data-bs-toggle="modal"
                                                                data-bs-no="${user.user.no}"
                                                                class="btn btn-danger waves-effect waves-light">
                                                            회원정지
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </h5>
                                        <p class="mb-1 text-muted">${user.user.email}</p>
                                        <p class="mb-1 text-muted">전화번호 수집 필요</p>
                                        <p class="mb-1 text-muted"><custom:formatDatetime
                                                value="${user.user.reg_datetime}" pattern="yyyy.MM.dd"/></p>
                                    </div>
                                </div>
                            </div> <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->
                </div>
                <!-- end row-->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">농장 정보</h4>
                                <div class="background position-relative mb-3"
                                     style="padding-top: 30%; background-image: url('${user.farm.farm_image.url}')">
                                    <div class="background"
                                         style="background-image: url('${user.farm.profile_image.url}');
                                                 width: 160px; height: 160px; position: absolute; z-index: 1; top:  50%; left: 50%; transform: translate(-50%, -50%);">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-auto">
                                        <label class="mb-1">이름</label>
                                        <p class="text-muted">${user.farm.name}</p>
                                    </div>

                                    <div class="col-auto">
                                        <label class="mb-1">농장 타입</label>
                                        <p class="text-muted">${user.farm.type.korName} 농가</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">해시태그</label>
                                        <div>
                                            <c:forEach var="hash" items="${user.farm.hashtag}">
                                                <span class="badge badge-outline-success text-success me-1">${hash}</span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">인스타그램 주소</label>
                                        <p class="text-muted">${user.farm.sns.instagram}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">네이버 블로그 주소</label>
                                        <p class="text-muted">${user.farm.sns.blog}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">홈페이지 주소</label>
                                        <p class="text-muted">${user.farm.sns.homepage}</p>
                                    </div>
                                    <div class="col-12">
                                        <label class="mb-2">농장 설명</label>
                                        <div class="summernote-container" style="border: 1px solid #ced4da; border-radius: 0.2rem;
                    padding: 16px;">
                                            ${user.farm.description}
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
                <h5 class="mb-3">‘${user.user.name}’님을 서비스 이용 정지하시겠어요?</h5>
                <div class="mb-3">
                    <label for="suspense-range-select"
                           class="form-label">기간 선택</label>
                    <select class="form-select"
                            id="suspense-range-select">
                        <option selected
                                value="0">시간 선택
                        </option>
                        <option value="7">1주일</option>
                        <option value="30">1개월</option>
                        <option value="92">3개월</option>
                        <option value="183">6개월</option>
                        <option value="-1">영구</option>
                    </select>
                    <label for="suspend-reason"
                           class="form-label mt-3">정지 사유</label>
                    <textarea id="suspend-reason" rows="4" type="text" class="form-control"
                              placeholder="정지 사유를 입력하세요."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button"
                        class="btn btn-light"
                        data-bs-dismiss="modal">닫기
                </button>
                <button type="button"
                        class="btn btn-primary"
                        data-action="suspense">정지하기
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
                    <p class="mt-3 text-white">‘${user.user.name}’님을 서비스 이용 정지를 해제하시겠어요?</p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-action="delete">해제
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
<script src="/resources/js/utility.js"></script>
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        //event
        $('[data-action="suspense"]').click(function (event) {
            let no = this.dataset.no;
            let reason = $('#suspend-reason').val();
            let type = $('#suspense-range-select option:selected').val();
            if (type * 1 === 0) {
                alert('정지 기간을 선택해주세요.');
                return false;
            }
            if (reason.trim().length <= 0) {
                alert('정지 사유를 입력해주세요.');
                return false;
            } else if (reason.length > 255) {
                alert('정지 사유는 최대 255자 까지 가능합니다.');
                return false;
            }
            userBan(no, reason, type * 1).then((result) => {
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('해당 유저를 정지시켰습니다.');
                        window.location.reload();
                    } else {
                        alert('정지시킬 수 없습니다. 이미 정지되어있는 유저입니다.');
                        return false;
                        // window.location.reload();
                    }
                }
            })
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
            let no = this.dataset.no;
            removeUserBan(no).then((result) => {
                if (result.status === 'OK') {
                    alert('해당 회원의 정지를 해제했습니다.');
                    window.location.reload();
                }
            })
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

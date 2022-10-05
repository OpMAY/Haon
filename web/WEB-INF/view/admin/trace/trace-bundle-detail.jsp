<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>축산 묶음 이력 상세 정보</title>
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
                                    <li class="breadcrumb-item"><a href="/admin/dashboard">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/trace/bundles">QR 이력 관리</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/trace/bundles">축산 묶음 이력</a></li>
                                    <li class="breadcrumb-item active">축산 묶음 이력 정보</li>
                                </ol>
                            </div>
                            <h4 class="page-title">축산 묶음 이력 정보</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title mb-4">축산 묶음 이력 정보
                                    <div class="float-end">
                                        <button type="button"
                                                data-type="qr"
                                                data-trace="package"
                                                data-no="${bundle.no}"
                                                class="btn btn-primary waves-effect waves-light text-white">
                                            QR 다운로드
                                        </button>
                                        <button type="button"
                                                data-bs-target="#delete-modal"
                                                data-bs-toggle="modal"
                                                data-bs-no="${bundle.no}"
                                                class="btn btn-danger waves-effect waves-light">
                                            삭제
                                        </button>
                                    </div>
                                </h4>
                                <div class="row">
                                    <div class="col-auto">
                                        <label class="mb-1">사용자 이름</label>
                                        <p class="text-muted">${user.name}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">농장 이름</label>
                                        <p class="text-muted">${farm.name}</p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">작성 일자</label>
                                        <p class="text-muted"><custom:formatDatetime value="${bundle.reg_datetime}"
                                                                                     pattern="yyyy.MM.dd"/></p>
                                    </div>
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-auto">
                                                <label class="mb-1">개체 축종</label>
                                                <p class="text-muted">
                                                    <span class="badge bg-primary">${farm.type.korName}</span>
                                                </p>
                                            </div>
                                            <div class="col-auto">
                                                <label class="mb-1">묶음 번호</label>
                                                <p class="text-muted">${bundle.bundle_code}</p>
                                            </div>
                                            <div class="col-12 mb-3">
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="my-auto">총 ${bundle.traceList.size()}개의 이력</h5>
                                                    <c:if test="${farm.type.manual_available}">
                                                        <button type="button" data-bs-target="#find-modal"
                                                                data-bs-toggle="modal"
                                                                class="my-auto btn btn-primary waves-effect waves-light">
                                                            이력 추가하기
                                                        </button>
                                                    </c:if>
                                                </div>
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
                                                            <h5 class="mb-1">${bundle.bundle_code}</h5>
                                                            <small class="text-muted">${farm.type.korName}</small>
                                                        </div>
                                                    </a>
                                                    <div id="traceCollapse1"
                                                         class="collapse show">
                                                        <div class="list-group-item"
                                                             style="border-top: none;">
                                                            <div class="table-responsive">
                                                                <table class="table table-bordered mb-0">
                                                                    <thead>
                                                                    <tr>
                                                                        <c:if test="${farm.type.manual_available}">
                                                                            <th style="width: fit-content;">삭제</th>
                                                                        </c:if>
                                                                        <th style="width: 10%;">이력 번호</th>
                                                                        <th style="width: auto;">등급</th>
                                                                        <th style="width: auto;">사육자</th>
                                                                        <th style="width: 60%;">사육지</th>
                                                                        <th style="width: auto;">성별</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach var="item" items="${bundle.traceList}">
                                                                        <tr>
                                                                            <c:if test="${farm.type.manual_available}">
                                                                                <th scope="row">
                                                                                    <span class="badge badge-soft-danger cursor-pointer"
                                                                                          data-no="${item.no}"
                                                                                          data-bundle="${bundle.no}">삭제</span>
                                                                                </th>
                                                                            </c:if>
                                                                            <td class="cursor-pointer"
                                                                                data-href="/admin/trace/detail/trace/${item.no}">
                                                                                    ${item.trace_code}
                                                                            </td>
                                                                            <td><span
                                                                                    class="badge badge-soft-primary">${item.entity.rate == null ? '-' : item.entity.rate}</span>
                                                                            </td>
                                                                            <td class="text-nowrap">${item.breed.size() == 0 ? '-' : (item.breed.get(0).breed_farmer_name == null ? '-' : item.breed.get(0).breed_farmer_name)}</td>
                                                                            <td class="text-nowrap">${item.breed.size() == 0 ? '-' : (item.breed.get(0).breed_farm_addr == null ? '-' : item.breed.get(0).breed_farm_addr)}
                                                                            </td>
                                                                            <td class="text-nowrap">
                                                                                <span class="badge badge-soft-dark">${item.entity.gender == null ? '-' : item.entity.gender}</span>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
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
<div id="qrcode-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-labelledby="create-modalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"
                    id="create-modalLabel">이력 QR 코드</h4>
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button"
                        class="btn btn-light"
                        data-bs-dismiss="modal">닫기
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- END wrapper -->
<!-- Modal-->
<div id="find-modal"
     class="modal fade"
     tabindex="-1"
     role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-filled">
            <div class="modal-body p-4">
                <div class="text-center">
                    <p class="mt-3">추가할 이력 번호를 입력하세요.</p>
                    <input type="text" class="form-control" id="trace-search">
                </div>
                <div id="result">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button"
                        class="btn btn-primary" data-action="find" data-no="${bundle.no}">찾기
                </button>
                <button type="button"
                        class="btn btn-light"
                        data-bs-dismiss="modal">닫기
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
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-filled bg-danger">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-wrong h1 text-white"></i>
                    <h4 class="mt-2 text-white">주의!</h4>
                    <p class="mb-0 mt-3 text-white">해당 묶음 이력을 삭제하는 것을 농장 소유주는 알 수 없으며</p>
                    <p class="mb-0 text-white">삭제 전 이에 대해 꼭 알리시길 바랍니다.</p>
                    <p class="mb-0 text-white">삭제 후 복구하려면 해당 이력을 다시 입력해야 하며</p>
                    <p class="mb-0 text-white">묶음 이력 안의 이력은 삭제되지 않습니다.</p>
                    <p class="text-white">정말 삭제하시겠습니까?</p>
                    <button type="button"
                            class="btn btn-light my-2"
                            data-action="delete">삭제
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
<script src="/resources/js/plugin/qrcode.js?vc=${RESOURCES_VERSION}"></script>
<script src="/resources/js/utility.js?vc=${RESOURCES_VERSION}"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/plugin/summernote/custom_summernote-bs4.js"></script>
<script src="/resources/js/plugin/summernote/summernote-ko-KR.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {

        $('#traceCollapse1 table tbody').on('click', '.badge-soft-danger', function () {
            let trace_no = $(this).data().no;
            let bundle_no = $(this).data().bundle;
            if (confirm('해당 내역을 삭제하시겠습니까?')) {
                if ($('#traceCollapse1 table tbody tr').length <= 2) {
                    alert('묶음 이력엔 최소 2개 이상의 이력이 존재해야합니다.');
                    return false;
                } else {
                    // TODO FETCH DISCONNECT TRACE
                    disconnectBundleTrace(trace_no, bundle_no).then((result) => {
                        if (result.status === 'OK') {
                            if (result.data.status) {
                                alert('삭제되었습니다.');
                                $(this).closest('tr').remove();
                            } else {
                                alert('삭제할 수 없습니다, 묶음 이력엔 최소 2개 이상의 이력이 존재해야합니다.');
                            }
                        } else {
                            alert('삭제할 수 없습니다.');
                        }
                    })
                }
            }
        })

        $('[data-action="find"]').click(function (event) {
            let no = this.dataset.no;
            let code = $('#trace-search').val();
            if(code.trim().length > 0) {
                searchTrace(code.trim(), no).then((result) => {
                    if(result.status === 'OK') {
                        if(result.data.status) {
                            if(confirm('연결 가능한 이력을 찾았습니다. 연결하시겠습니까?')) {
                                connectBundleTrace(result.data.no, no).then((result) => {
                                    if(result.status === 'OK') {
                                        if(result.data.status) {
                                            alert('연결되었습니다.')
                                            window.location.reload();
                                        } else {
                                            alert('연결할 수 없는 이력입니다.');
                                        }
                                    } else {
                                        alert('오류가 발생했습니다.');
                                    }
                                })
                            }
                        } else {
                            alert(result.data.text);
                        }
                    } else {
                        alert('오류가 발생했습니다.');
                    }
                })
            } else {
                alert('찾을 이력 번호를 입력하세요.');
            }
        });

        //event
        $('[data-action="delete"]').click(function (event) {
            console.log(this);
            let no = this.dataset.no;
            console.log(no);
            /*TODO Fetch*/
            deleteBundle(no).then((result) => {
                if (result.status === 'OK') {
                    alert('삭제되었습니다.');
                    window.location.href = '/admin/trace/bundles'
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

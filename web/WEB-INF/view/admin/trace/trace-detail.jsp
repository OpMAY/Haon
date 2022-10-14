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
                                                data-type="qr"
                                                data-trace="single"
                                                data-no="${trace.no}"
                                                class="btn btn-primary waves-effect waves-light text-white">
                                            QR 다운로드
                                        </button>
                                        <c:if test="${farm.type.manual_available}">
                                            <button type="button"
                                                    data-href="/admin/trace/update/${trace.no}"
                                                    class="btn btn-dark waves-effect waves-light">수정
                                            </button>
                                        </c:if>
                                        <button type="button"
                                                data-bs-target="#delete-modal"
                                                data-bs-toggle="modal"
                                                data-bs-no="${trace.no}"
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
                                        <p class="text-muted"><custom:formatDatetime value="${trace.reg_datetime}"
                                                                                     pattern="yyyy.MM.dd"/></p>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">백신 접종 여부</label>
                                        <p class="text-muted">${trace.vaccine ne null ? (trace.vaccine.vaccine_used ? '접종' : '미접종') : '정보 없음'}</p>
                                    </div>
                                    <c:if test="${trace.vaccine ne null && trace.vaccine.vaccine_used}">
                                    <div class="col-auto">
                                        <label class="mb-1">백신 정보</label>
                                        <p class="text-muted">${trace.vaccine.vaccine_info}</p>
                                    </c:if>
                                    </div>
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-auto">
                                                <label class="mb-1">개체 축종</label>
                                                <p class="text-muted">
                                                    <span class="badge bg-primary">${farm.type.korName}</span>
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
                                                            <h5 class="mb-1">${trace.trace_code}</h5>
                                                            <small class="text-muted">${farm.type.korName}</small>
                                                        </div>
                                                        <p class="mb-1">
                                                            <span class="badge badge-soft-primary">${trace.entity.rate == null ? '등급 정보 없음' : trace.entity.rate}</span>
                                                            <span class="badge badge-soft-dark">${trace.entity.gender == null ? '성별 정보 없음' : trace.entity.gender}</span>
                                                        </p>
                                                        <small class="text-muted"><custom:numberDateFormat value="${trace.entity.birth == null ? '' : trace.entity.birth}"/>${trace.entity.birth == null ? '' : ' 출생'}</small>
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
                                                                        <c:if test="${farm.type.manual_available}">
                                                                            <th>삭제</th>
                                                                        </c:if>
                                                                        <th>신고 구분</th>
                                                                        <th>농장 경영자</th>
                                                                        <th>농장 명</th>
                                                                        <th>날짜</th>
                                                                        <th>소재지</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach var="item" items="${trace.breed}">
                                                                        <tr>
                                                                            <c:if test="${farm.type.manual_available}">
                                                                                <th scope="row">
                                                                                    <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                                                                </th>
                                                                            </c:if>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${item.type == 'REGISTER'}"><span
                                                                                            class="badge badge-soft-primary cursor-pointer">등록</span></c:when>
                                                                                    <c:when test="${item.type == 'AMNIOTIC'}"><span
                                                                                            class="badge badge-soft-info cursor-pointer">양도</span></c:when>
                                                                                    <c:when test="${item.type == 'SLAUGHTER'}"><span
                                                                                            class="badge badge-soft-success cursor-pointer">출하</span></c:when>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>${item.breed_farmer_name eq null ? '-' : item.breed_farmer_name}</td>
                                                                            <td class="text-nowrap">${item.breed_farm_name eq null ? '-' : item.breed_farm_name}</td>
                                                                            <td class="text-nowrap"><custom:numberDateFormat value="${item.breed_issue_date eq null ? '-' : item.breed_issue_date}"/></td>
                                                                            <td class="text-nowrap">
                                                                                    ${item.breed_farm_addr eq null ? '-' : item.breed_farm_addr}
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
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
                                                                        <c:if test="${farm.type.manual_available}">
                                                                            <th>삭제</th>
                                                                        </c:if>
                                                                        <th>도축 결과</th>
                                                                        <th>도축장</th>
                                                                        <th>날짜</th>
                                                                        <th>소재지</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach var="item" items="${trace.butchery}">
                                                                        <tr>
                                                                            <c:if test="${farm.type.manual_available}">
                                                                                <th scope="row">
                                                                                    <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                                                                </th>
                                                                            </c:if>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${item.butchery_result == '합격' || item.butchery_result == 'Y' || item.butchery_result == 'true'}"><span
                                                                                            class="badge badge-soft-success cursor-pointer">합격</span></c:when>
                                                                                    <c:otherwise><span
                                                                                            class="badge badge-soft-danger cursor-pointer">불합격</span></c:otherwise>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td class="text-nowrap">${item.butchery_corp eq null ? '-' : item.butchery_corp}</td>
                                                                            <td class="text-nowrap"><custom:numberDateFormat value="${item.butchery_date eq null ? '-' : item.butchery_date}"/></td>
                                                                            <td class="text-nowrap">${item.butchery_addr eq null ? '-' : item.butchery_addr} ${item.butchery_addr_spec}</td>
                                                                        </tr>
                                                                    </c:forEach>
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
                                                                        <c:if test="${farm.type.manual_available}">
                                                                            <th>삭제</th>
                                                                        </c:if>
                                                                        <th>업소명</th>
                                                                        <th>소재지</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:forEach var="item" items="${trace.process}">
                                                                        <tr>
                                                                            <c:if test="${farm.type.manual_available}">
                                                                                <th scope="row">
                                                                                    <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                                                                </th>
                                                                            </c:if>
                                                                            <td class="text-nowrap">${item.process_corp}</td>
                                                                            <td class="text-nowrap">${item.process_addr}</td>
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
                                    <c:if test="${farm.type.manual_available}">
                                        <div class="col-12 mt-3">
                                            <div class="form-group">
                                                <label class="form-label">기타 정보</label>
                                                <textarea class="form-control" rows="8" readonly style="resize: none">${trace.other_info}</textarea>
                                            </div>
                                        </div>
                                    </c:if>
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
                    <h4 class="mt-2 text-white">주의!</h4>
                    <p class="mt-3 text-white">해당 이력을 삭제하는 것을 농장 소유주는 모르며 삭제 전 이에 대해 꼭 알리시길 바랍니다. 삭제 후 복구하려면 해당 이력을 다시
                        입력해야 합니다. 정말 삭제하시겠습니까?</p>
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
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-filled bg-danger">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-wrong h1 text-white"></i>
                    <h4 class="mt-2 text-white">주의!</h4>
                    <p class="mb-0 mt-3 text-white">해당 이력을 삭제하는 것을 농장 소유주는 알 수 없으며</p>
                    <p class="mb-0 text-white">삭제 전 이에 대해 꼭 알리시길 바랍니다.</p>
                    <p class="mb-0 text-white">삭제 후 복구하려면 해당 이력을 다시 입력해야 합니다.</p>
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
        //event
        $('[data-action="delete"]').click(function (event) {
            console.log(this);
            let no = this.dataset.no;
            console.log(no);
            /*TODO Fetch*/
            deleteTrace(no).then((result) => {
                if(result.status === 'OK') {
                    alert('삭제되었습니다.');
                    window.location.href = '/admin/trace/traces'
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

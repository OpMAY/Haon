<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>이력 수정 페이지</title>
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
                                    <li class="breadcrumb-item"><a href="/admin/trace/traces">QR 이력 관리</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/trace/detail/trace/${trace.no}">축산 이력
                                        정보</a></li>
                                    <li class="breadcrumb-item active">축산 이력 정보 수정</li>
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
                                                data-bs-target="#update-modal"
                                                data-bs-toggle="modal"
                                                data-bs-no="1"
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
                                    <div class="col-12">
                                        <form action="#"
                                              method="get">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="mb-2">
                                                        <label class="mb-1">개체 축종</label>
                                                        <div class="d-flex">
                                                            <div class="form-check me-2">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="farmType"
                                                                       checked="">
                                                                <label class="form-check-label">${farm.type.korName}</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-2">
                                                        <label class="form-label">이력 번호</label>
                                                        <div class="input-group">
                                                            <input type="text"
                                                                   class="form-control"
                                                                   value="${trace.trace_code}"
                                                                   disabled
                                                                   placeholder="0000-0000-0000">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-2">
                                                        <label class="form-label">등급</label>
                                                        <select class="form-select">
                                                            <option value="none" class="d-none">등급 선택</option>
                                                            <option selected>1++</option>
                                                            <option>1+</option>
                                                            <option>1등급</option>
                                                            <option>2등급</option>
                                                            <option>3등급</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-2">
                                                        <label class="form-label">출생 일자</label>
                                                        <input class="form-control"
                                                               id="reg_datetime"
                                                               type="date"
                                                               value="<custom:stringDateFormat value="${trace.entity.birth}"/>"
                                                               name="date">
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <div class="mb-2">
                                                        <label class="mb-2">성별</label>
                                                        <div class="d-flex">
                                                            <div class="form-check me-2">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="sex"
                                                                       id="sex-man"
                                                                       <c:if test="${trace.entity.gender == '수컷'}">checked</c:if>>
                                                                <label class="form-check-label"
                                                                       for="sex-man">수컷</label>
                                                            </div>
                                                            <div class="form-check me-2 form-check-success">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="sex"
                                                                       id="sex-woman"
                                                                       <c:if test="${trace.entity.gender == '암컷'}">checked</c:if>>
                                                                <label class="form-check-label"
                                                                       for="sex-woman">암컷</label>
                                                            </div>
                                                            <div class="form-check me-2 form-check-warning">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="sex"
                                                                       id="sex-zero"
                                                                       <c:if test="${trace.entity.gender == '거세'}">checked</c:if>>
                                                                <label class="form-check-label"
                                                                       for="sex-zero">거세</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <ul class="nav nav-tabs nav-bordered">
                                                        <li class="nav-item">
                                                            <a href="#breed-b1"
                                                               data-bs-toggle="tab"
                                                               aria-expanded="true"
                                                               class="nav-link active">
                                                                사육
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="#slaughter-b1"
                                                               data-bs-toggle="tab"
                                                               aria-expanded="true"
                                                               class="nav-link">
                                                                도축
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="#processing-b1"
                                                               data-bs-toggle="tab"
                                                               aria-expanded="false"
                                                               class="nav-link">
                                                                가공
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane show active"
                                                             id="breed-b1">
                                                            <!--TODO 사육-->
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
                                                                    <c:forEach items="${trace.breed}" var="item">
                                                                        <tr data-type="${item.type}">
                                                                            <th scope="row">
                                                                                <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                                                            </th>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${item.type == 'REGISTER'}"><span
                                                                                            class="badge badge-soft-primary cursor-pointer"
                                                                                            data-type="${item.type}">등록</span></c:when>
                                                                                    <c:when test="${item.type == 'AMNIOTIC'}"><span
                                                                                            class="badge badge-soft-info cursor-pointer"
                                                                                            data-type="${item.type}">양도</span></c:when>
                                                                                    <c:when test="${item.type == 'SLAUGHTER'}"><span
                                                                                            class="badge badge-soft-success cursor-pointer"
                                                                                            data-type="${item.type}">출하</span></c:when>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>${item.breed_farmer_name}</td>
                                                                            <td class="text-nowrap">${item.breed_farm_name}</td>
                                                                            <td class="text-nowrap">${item.breed_issue_date}</td>
                                                                            <td class="text-nowrap">
                                                                                    ${item.breed_farm_addr}
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 buttons text-end">
                                                                    <button type="button" id="breed-add"
                                                                            class="btn btn-primary waves-effect waves-light text-white">
                                                                        사육 정보 새로 등록
                                                                    </button>
                                                                    <button type="button" id="breed-add-cancel"
                                                                            class="btn btn-secondary waves-effect waves-light text-white d-none">
                                                                        취소
                                                                    </button>
                                                                    <button type="button" id="breed-add-confirm"
                                                                            class="btn btn-primary waves-effect waves-light text-white d-none">
                                                                        등록
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane"
                                                             id="slaughter-b1">
                                                            <!--TODO 도축-->
                                                            <div class="row">
                                                                <div class="col-12 _checkbox">
                                                                    <div class="mb-2">
                                                                        <div class="form-check">
                                                                            <label class="form-check-label">도축 정보
                                                                                사용</label>
                                                                            <input type="checkbox"
                                                                                   id="butchery-use-checkbox"
                                                                                   <c:if test="${trace.butchery.size() > 0}">checked</c:if>
                                                                                   class="form-check-input">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">도축장</label>
                                                                        <input type="text"
                                                                               placeholder="도축장을 입력해주세요."
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_corp : ''}"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">도축 일자</label>
                                                                        <input class="form-control"
                                                                               id="slaughter-datetime"
                                                                               type="date"
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="<custom:stringDateFormat value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_date : null}"/>"
                                                                               name="date">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 링크</label>
                                                                        <input type="text"
                                                                               placeholder="농장 링크를 입력해주세요."
                                                                               value=""
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">소재지</label>
                                                                        <input type="text"
                                                                               placeholder="소개지를 입력해주세요."
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_addr : ''}"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">상세 주소</label>
                                                                        <input type="text"
                                                                               placeholder="상세 주소를 입력해주세요."
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_addr_spec : ''}"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="mb-2">도축 결과</label>
                                                                        <div class="d-flex">
                                                                            <div class="form-check me-2 form-check-success">
                                                                                <input class="form-check-input"
                                                                                       type="radio" name="slaughter"
                                                                                       id="slaughter-success"
                                                                                       <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                                       <c:if test="${trace.butchery.size() > 0 ? (trace.butchery.get(0).butchery_result == '합격' || trace.butchery.get(0).butchery_result == 'Y' || trace.butchery.get(0).butchery_result == 'true') : false}">checked</c:if>>
                                                                                <label class="form-check-label"
                                                                                       for="sex-woman">합격</label>
                                                                            </div>
                                                                            <div class="form-check me-2 form-check-danger">
                                                                                <input class="form-check-input"
                                                                                       type="radio" name="slaughter"
                                                                                       id="slaughter-fail"
                                                                                       <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                                       <c:if test="${trace.butchery.size() > 0 ? (trace.butchery.get(0).butchery_result == '불합격' || trace.butchery.get(0).butchery_result == 'N' || trace.butchery.get(0).butchery_result == 'false') : false}">checked</c:if>>
                                                                                <label class="form-check-label"
                                                                                       for="sex-zero">불합격</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane"
                                                             id="processing-b1">
                                                            <!--TODO 가공-->
                                                            <div class="table-responsive mb-3">
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
                                                                    <c:forEach var="item" items="${trace.process}">
                                                                        <tr>
                                                                            <th scope="row">
                                                                                <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                                                            </th>
                                                                            <td class="text-nowrap">${item.process_corp}</td>
                                                                            <td class="text-nowrap">${item.process_addr}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12 buttons text-end">
                                                                    <button type="button" id="process-add"
                                                                            class="btn btn-primary waves-effect waves-light text-white">
                                                                        가공 정보 새로 등록
                                                                    </button>
                                                                    <button type="button" id="process-add-cancel"
                                                                            class="btn btn-secondary waves-effect waves-light text-white d-none">
                                                                        취소
                                                                    </button>
                                                                    <button type="button" id="process-add-confirm"
                                                                            class="btn btn-primary waves-effect waves-light text-white d-none">
                                                                        등록
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-filled bg-success">
            <div class="modal-body p-4">
                <div class="text-center">
                    <i class="dripicons-to-do h1 text-white"></i>
                    <h4 class="mt-2 text-white">주의!</h4>
                    <p class="mt-3 text-white">조건에 맞지 않으면 수정이 되지 않을 수 있습니다.</p>
                    <p class="text-white">정말 이력을 수정하시겠습니까?</p>
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
                    <h4 class="mt-2 text-white">Oh snap!</h4>
                    <p class="mt-3 text-white">Cras mattis consectetur purus sit amet fermentum. Cras justo odio,
                        dapibus ac
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

        $('#breed-add').on('click', function () {
            $(this).parent().parent().prepend(`<div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 경영자</label>
                                                                        <input type="text"
                                                                               placeholder="농장 경영자를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 명</label>
                                                                        <input type="text"
                                                                               placeholder="농장 명을 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 링크 (선택)</label>
                                                                        <input type="text"
                                                                               placeholder="농장 링크를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">소재지</label>
                                                                        <input type="text"
                                                                               placeholder="소재지를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">상세 주소</label>
                                                                        <input type="text"
                                                                               placeholder="상세 주소를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>`);
            $(this).addClass('d-none')
            $('#breed-add-cancel').removeClass('d-none');
            $('#breed-add-confirm').removeClass('d-none');
        });

        $('#process-add').on('click', function () {
            $(this).parent().parent().prepend(`<div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">가공장</label>
                                                                        <input type="text"
                                                                               placeholder="가공장을 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">가공 일자</label>
                                                                        <input class="form-control"
                                                                               id="processing-datetime"
                                                                               type="date"
                                                                               value=""
                                                                               name="date">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 링크 (선택)</label>
                                                                        <input type="text"
                                                                               placeholder="농장 링크를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">소재지</label>
                                                                        <input type="text"
                                                                               placeholder="소개지를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">상세 주소</label>
                                                                        <input type="text"
                                                                               placeholder="상세 주소를 입력해주세요."
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>`);
            $(this).addClass('d-none');
            $('#process-add-cancel').removeClass('d-none');
            $('#process-add-confirm').removeClass('d-none');
        });

        $('#breed-add-confirm').on('click', function () {

        })

        $('#process-add-confirm').on('click', function () {

        })

        $('#breed-add-cancel').on('click', function () {
            $(this).parent().parent().find('div:not(.buttons)').remove();
            $(this).addClass('d-none');
            $('#breed-add-confirm').addClass('d-none');
            $('#breed-add').removeClass('d-none');
        })

        $('#process-add-cancel').on('click', function () {
            $(this).parent().parent().find('div:not(.buttons)').remove();
            $(this).addClass('d-none');
            $('#process-add-confirm').addClass('d-none');
            $('#process-add').removeClass('d-none');
        })

        $('#butchery-use-checkbox').on('change', function (e) {
            const divs = $(this).parent().parent().parent().parent().children('div:not(._checkbox)');
            if ($(this).is(':checked')) {
                divs.each((idx, elem) => {
                    $(elem).removeClass('d-none');
                })
            } else {
                divs.each((idx, elem) => {
                    $(elem).addClass('d-none');
                })
            }
        })

    });



</script>
</body>
</html>

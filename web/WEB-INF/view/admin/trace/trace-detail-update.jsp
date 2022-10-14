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
                                                data-bs-no="${trace.no}"
                                                class="btn btn-dark waves-effect waves-light">수정
                                        </button>
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
                                        <div class="form-check">
                                            <label class="mb-1 form-check-label">백신 접종 여부</label>
                                            <input type="checkbox" class="form-check-input" id="vaccine_used"  <c:if test="${trace.vaccine ne null && trace.vaccine.vaccine_used}"> checked</c:if>>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <label class="mb-1">백신 정보</label>
                                        <input type="text" class="form-control" id="vaccine_info" data-origin="${trace.vaccine.vaccine_info}" value="${trace.vaccine.vaccine_info}">
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
                                                                       data-type="${farm.type}"
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
                                                                   name="trace_code"
                                                                   value="${trace.trace_code}"
                                                                   disabled
                                                                   placeholder="0000-0000-0000">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-2">
                                                        <label class="form-label">출생 일자</label>
                                                        <input class="form-control"
                                                               id="birth"
                                                               type="date"
                                                               value="<custom:stringDateFormat value="${trace.entity.birth}"/>"
                                                               name="date">
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <div class="mb-2">
                                                        <label class="mb-2">성별</label>
                                                        <div class="d-flex">
                                                            <div class="form-check me-2 form-check-blue">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="sex"
                                                                       id="sex-zero"
                                                                       value="거세"
                                                                       <c:if test="${trace.entity.gender == '거세'}">checked</c:if>>
                                                                <label class="form-check-label"
                                                                       for="sex-zero">거세</label>
                                                            </div>
                                                            <div class="form-check me-2">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="sex"
                                                                       id="sex-man"
                                                                       value="수컷"
                                                                       <c:if test="${trace.entity.gender == '비거세'}">checked</c:if>>
                                                                <label class="form-check-label"
                                                                       for="sex-man">비거세</label>
                                                            </div>
                                                            <div class="form-check me-2 form-check-success">
                                                                <input class="form-check-input"
                                                                       type="radio"
                                                                       name="sex"
                                                                       id="sex-woman"
                                                                       value="암컷"
                                                                       <c:if test="${trace.entity.gender == '암컷'}">checked</c:if>>
                                                                <label class="form-check-label"
                                                                       for="sex-woman">암컷</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label class="form-label">기타 정보</label>
                                                        <textarea class="form-control" rows="8" style="resize: none" id="other_info">${trace.other_info}</textarea>
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
                                                                            <td class="text-nowrap"
                                                                                data-url="${item.breed_farm_url}">${item.breed_farm_name}</td>
                                                                            <td class="text-nowrap">${item.breed_issue_date}</td>
                                                                            <td class="text-nowrap">${item.breed_farm_addr}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="row" id="breed-make-div">
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
                                                                <div class="col-auto <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">도축장</label>
                                                                        <input type="text"
                                                                               placeholder="도축장을 입력해주세요."
                                                                               id="slaughter-place"
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_corp : ''}"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
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
                                                                <div class="col-12 <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">사업장 링크</label>
                                                                        <input type="text"
                                                                               placeholder="사업장 링크를 입력해주세요."
                                                                               id="slaughter-link"
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_url : ''}"
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6 <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">소재지</label>
                                                                        <input type="text"
                                                                               placeholder="소개지를 입력해주세요."
                                                                               id="slaughter-addr"
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_addr : ''}"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">상세 주소</label>
                                                                        <input type="text"
                                                                               placeholder="상세 주소를 입력해주세요."
                                                                               id="slaughter-addr-spec"
                                                                               <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                               value="${trace.butchery.size() > 0 ? trace.butchery.get(0).butchery_addr_spec : ''}"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6 <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
                                                                    <div class="mb-2">
                                                                        <label class="mb-2">도축 결과</label>
                                                                        <div class="d-flex">
                                                                            <div class="form-check me-2 form-check-success">
                                                                                <input class="form-check-input"
                                                                                       type="radio" name="slaughter"
                                                                                       id="slaughter-success"
                                                                                       value="합격"
                                                                                       <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                                       <c:if test="${trace.butchery.size() > 0 ? (trace.butchery.get(0).butchery_result == '합격' || trace.butchery.get(0).butchery_result == 'Y' || trace.butchery.get(0).butchery_result == 'true') : false}">checked</c:if>>
                                                                                <label class="form-check-label"
                                                                                       for="sex-woman">합격</label>
                                                                            </div>
                                                                            <div class="form-check me-2 form-check-danger">
                                                                                <input class="form-check-input"
                                                                                       type="radio" name="slaughter"
                                                                                       id="slaughter-fail"
                                                                                       value="불합격"
                                                                                       <c:if test="${trace.butchery.size() == 0}">disabled</c:if>
                                                                                       <c:if test="${trace.butchery.size() > 0 ? (trace.butchery.get(0).butchery_result == '불합격' || trace.butchery.get(0).butchery_result == 'N' || trace.butchery.get(0).butchery_result == 'false') : false}">checked</c:if>>
                                                                                <label class="form-check-label"
                                                                                       for="sex-zero">불합격</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-6 <c:if test="${trace.butchery.size() == 0}">d-none</c:if>">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">등급</label>
                                                                        <select id="rate" class="form-select">
                                                                            <option value="none" class="d-none">등급 선택</option>
                                                                            <option <c:if test="${trace.entity.rate == '1++'}">selected</c:if>>1++</option>
                                                                            <option <c:if test="${trace.entity.rate == '1+'}">selected</c:if>>1+</option>
                                                                            <option <c:if test="${trace.entity.rate == '1등급'}">selected</c:if>>1등급</option>
                                                                            <option <c:if test="${trace.entity.rate == '2등급'}">selected</c:if>>2등급</option>
                                                                            <option <c:if test="${trace.entity.rate == '3등급'}">selected</c:if>>3등급</option>
                                                                        </select>
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
                                                                            <td class="text-nowrap"
                                                                                data-url="${item.process_url}">${item.process_corp}</td>
                                                                            <td class="text-nowrap"
                                                                                data-date="${item.process_date}">${item.process_addr}</td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="row" id="process-make-div">
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
<script src="/resources/js/utility.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/plugin/summernote/custom_summernote-bs4.js"></script>
<script src="/resources/js/plugin/summernote/summernote-ko-KR.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
            let use_butchery = $('#butchery-use-checkbox').is(':checked');
            let no = this.dataset.no;
            const trace = {};
            trace.no = no;
            trace.farm_no = ${farm.no};
            trace.trace_code = $('input[name=trace_code]').val();
            // Entity
            const entity = {};
            entity.entity_type = $('input[name=farmType]').data().type;
            entity.rate = use_butchery ? $('#rate option:selected').val() : null;
            if($('#birth').val().trim().length <= 0) {
                alert('출생 일자를 선택해주세요.');
                $('#update-modal').modal('hide');
                return false;
            }
            entity.birth = dateStringToKor($('#birth').val());
            entity.gender = $('input[name=sex]:checked').attr('value');
            const breeds = [];
            const butchery = [];
            const process = [];
            // BREED
            let breedTableBody = $('#breed-b1 table tbody');
            let b_datas = breedTableBody.find('tr');
            let registerCount = 0;
            let amnioticCount = 0;
            let slaughterCount = 0;
            b_datas.each((index, item) => {
                let $item = $(item);
                const breed = {};
                breed.type = $item.data().type;
                if (breed.type === 'REGISTER') {
                    registerCount = registerCount + 1;
                } else if (breed.type === 'AMNIOTIC') {
                    amnioticCount = amnioticCount + 1;
                } else {
                    slaughterCount = slaughterCount + 1;
                }
                breed.breed_farmer_name = $item.find('td:nth-child(3)').html();
                breed.breed_farm_name = $item.find('td:nth-child(4)').html();
                breed.breed_issue_date = $item.find('td:nth-child(5)').html();
                breed.breed_farm_addr = $item.find('td:nth-child(6)').html();
                breed.breed_farm_url = $item.find('td:nth-child(4)').data().url;
                breeds.push(breed);
            })
            if (!checkBreedCorrect(registerCount, amnioticCount, slaughterCount)) {
                alert('사육 정보가 올바르지 않습니다.');
                $('#update-modal').modal('hide');
                return false;
            }
            // BUTCHERY
            if (use_butchery) {
                let butcheryData = {};
                butcheryData.butchery_result = $('#slaughter-success:checked').attr('value');
                butcheryData.butchery_corp = $('#slaughter-place').val();
                butcheryData.butchery_date = dateStringToKor($('#slaughter-datetime').val());
                butcheryData.butchery_addr = $('#slaughter-addr').val();
                butcheryData.butchery_addr_spec = $('#slaughter-addr-spec').val();
                butcheryData.butchery_rate = $('#rate option:selected').val();
                butcheryData.butchery_url = $('#slaughter-link').val();
                if (butcheryData.butchery_result === undefined || butcheryData.butchery_result === null || butcheryData.butchery_result.length <= 0) {
                    alert('도축 합격 여부를 입력해주세요.');
                    $('#update-modal').modal('hide');
                    return false;
                }
                if (butcheryData.butchery_corp.trim().length <= 0) {
                    alert('도축장 명을 입력해주세요.');
                    $('#update-modal').modal('hide');
                    return false;
                }
                if (butcheryData.butchery_date.trim().length <= 0) {
                    alert('도축 일자를 입력해주세요.');
                    $('#update-modal').modal('hide');
                    return false;
                }
                if (butcheryData.butchery_addr.trim().length <= 0) {
                    alert('도축 소재지를 입력해주세요.');
                    $('#update-modal').modal('hide');
                    return false;
                }
                if (butcheryData.butchery_addr_spec.trim().length <= 0) {
                    alert('도축 소재지 상세 주소를 입력해주세요.');
                    $('#update-modal').modal('hide');
                    return false;
                }
                if(butcheryData.butchery_rate.trim().length <= 0) {
                    alert('도축 등급을 입력해주세요.');
                    $('#update-modal').modal('hide');
                    return false;
                }
                butchery.push(butcheryData);
            }

            // PROCESS
            let processTableBody = $('#processing-b1 table tbody');
            let p_datas = processTableBody.find('tr');
            if (!use_butchery && p_datas.length > 0) {
                alert('도축 정보를 사용하지 않으면 가공 정보를 입력할 수 없습니다.');
                $('#update-modal').modal('hide');
                return false;
            }
            p_datas.each((index, item) => {
                let $item = $(item);
                let processData = {};
                processData.process_corp = $item.find('td:nth-child(2)').html();
                processData.process_url = $item.find('td:nth-child(2)').data().url;
                processData.process_addr = $item.find('td:nth-child(3)').html();
                processData.process_date = $item.find('td:nth-child(3)').data().date;
                process.push(processData);
            })

            const vaccine = {};
            vaccine.vaccine_used = $('#vaccine_used').is(':checked');
            let vaccine_info = $('#vaccine_info').val();
            if(vaccine.vaccine_used && vaccine_info.trim().length <= 0){
                alert('백신 접종 정보를 입력하세요.');
                return false;
            }
            vaccine.vaccine_info = vaccine_info;

            trace.vaccine = vaccine;
            trace.breed = breeds;
            trace.entity = entity;
            trace.butchery = butchery;
            trace.process = process;
            trace.other_info = $('#other_info').val();

            console.log(trace);
            editTrace(trace).then((result) => {
                if (result.status === 'OK') {
                    if (result.data.status) {
                        alert('수정되었습니다.');
                        window.location.reload();
                    } else {
                        alert('이력 정보를 수정할 수 없습니다.');
                    }
                }
            })
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
                                                                        <label class="form-label">신고 구분</label>
                                                                        <select id="breed-type" class="form-select">
                                                                            <option data-type="REGISTER" selected>등록</option>
                                                                            <option data-type="AMNIOTIC">양도</option>
                                                                            <option data-type="SLAUGHTER">출하</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 경영자</label>
                                                                        <input type="text"
                                                                               placeholder="농장 경영자를 입력해주세요."
                                                                               id="breed-farmer"
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 명</label>
                                                                        <input type="text"
                                                                               placeholder="농장 명을 입력해주세요."
                                                                               id="breed-farm"
                                                                               value=""
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">출생 일자</label>
                                                                        <input class="form-control"
                                                                       id="breed-date"
                                                                       type="date"
                                                                       name="breed-date">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">농장 링크 (선택)</label>
                                                                        <input type="text"
                                                                               placeholder="농장 링크를 입력해주세요."
                                                                               value="" id="breed-url"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">소재지</label>
                                                                        <input type="text"
                                                                               placeholder="소재지를 입력해주세요."
                                                                               value="" id="breed-addr" readonly
                                                                               class="form-control cursor-pointer">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">상세 주소</label>
                                                                        <input type="text"
                                                                               placeholder="상세 주소를 입력해주세요."
                                                                               value="" id="breed-addr-spec"
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
                                                                               value="" id="process-corp"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">가공 일자</label>
                                                                        <input class="form-control"
                                                                               id="process-datetime"
                                                                               type="date"
                                                                               value=""
                                                                               name="date">
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">사업장 링크 (선택)</label>
                                                                        <input type="text"
                                                                               placeholder="사업장 링크를 입력해주세요."
                                                                               value="" id="process-url"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>
                                                                <div class="col-6">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">소재지</label>
                                                                        <input type="text"
                                                                               placeholder="소개지를 입력해주세요."
                                                                               value="" id="process-addr" readonly
                                                                               class="form-control cursor-pointer">
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <div class="mb-2">
                                                                        <label class="form-label">상세 주소</label>
                                                                        <input type="text"
                                                                               placeholder="상세 주소를 입력해주세요."
                                                                               value="" id="process-addr-spec"
                                                                               class="form-control">
                                                                    </div>
                                                                </div>`);
            $(this).addClass('d-none');
            $('#process-add-cancel').removeClass('d-none');
            $('#process-add-confirm').removeClass('d-none');
        });

        $('#breed-make-div').on('click', '#breed-add-confirm', function () {
            /* 1. 표 내용 검사
            *  2. 들어갈 내용 검사
            *  3. Format 후 등록
            * */
            if (confirm('사육 정보를 등록하시겠습니까?')) {
                let tableDiv = $('#breed-b1 table tbody');
                let makeDiv = $('#breed-make-div');
                let type = makeDiv.find('#breed-type option:selected')
                if (tableDiv.find('tr[data-type=REGISTER]').length > 0 && type.data().type === 'REGISTER') {
                    alert('사육 등록은 한 번만 가능합니다.');
                    return false;
                }
                let farmer = makeDiv.find('#breed-farmer').val();
                let farm = makeDiv.find('#breed-farm').val();
                let url = makeDiv.find('#breed-url').val();
                let addr = makeDiv.find('#breed-addr').val();
                let addr_spec = makeDiv.find('#breed-addr-spec').val();
                let date = makeDiv.find('#breed-date').val();
                if (farmer.trim().length <= 0) {
                    alert('농장 경영자 명을 입력해주세요.');
                    return false;
                }
                if (farm.trim().length <= 0) {
                    alert('농장 명을 입력해주세요.');
                    return false;
                }
                if (date.trim().length <= 0) {
                    alert('사육 정보 일자를 입력해주세요.');
                    return false;
                }
                if (addr.trim().length <= 0) {
                    alert('농장 주소를 입력해주세요.');
                    return false;
                }
                if (addr_spec.trim().length <= 0) {
                    alert('농장 상세 주소를 입력해주세요.');
                    return false;
                }

                if (type.data().type === 'REGISTER') {
                    tableDiv.prepend(`<tr data-type="` + type.data().type + `">
                                        <th scope="row">
                                            <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                        </th>
                                        <td>
                                            <span class="badge badge-soft-primary cursor-pointer"
                                                        data-type="` + type.data().type + `">등록</span>
                                        </td>
                                        <td>` + farmer + `</td>
                                        <td class="text-nowrap"
                                            data-url="` + url + `">` + farm + `</td>
                                        <td class="text-nowrap">` + dateStringToKor(date) + `</td>
                                        <td class="text-nowrap">` + addr + `, ` + addr_spec + `</td>
                                    </tr>`);
                } else if (type.data().type === 'AMNIOTIC') {
                    let element = `<tr data-type="` + type.data().type + `">
                                        <th scope="row">
                                            <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                        </th>
                                        <td>
                                            <span class="badge badge-soft-info cursor-pointer"
                                                        data-type="` + type.data().type + `">양도</span>
                                        </td>
                                        <td>` + farmer + `</td>
                                        <td class="text-nowrap"
                                            data-url="` + url + `">` + farm + `</td>
                                        <td class="text-nowrap">` + dateStringToKor(date) + `</td>
                                        <td class="text-nowrap">` + addr + `, ` + addr_spec + `</td>
                                    </tr>`;
                    // 등록 있다면 등록 다음에
                    // 출하 있다면 출하 이전에
                    // 없으면 그냥 넣기
                    if(tableDiv.find('tr[data-type=REGISTER]').length > 0) {
                        if(tableDiv.find('tr[data-type=SLAUGHTER]').length > 0) {
                            tableDiv.find('tr[data-type=SLAUGHTER]').before(element);
                        } else {
                            tableDiv.append(element);
                        }
                    } else {
                        tableDiv.append(element);
                    }
                } else {
                    tableDiv.append(`<tr data-type="` + type.data().type + `">
                                        <th scope="row">
                                            <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                        </th>
                                        <td>
                                            <span class="badge badge-soft-success cursor-pointer"
                                                        data-type="` + type.data().type + `">출하</span>
                                        </td>
                                        <td>` + farmer + `</td>
                                        <td class="text-nowrap"
                                            data-url="` + url + `">` + farm + `</td>
                                        <td class="text-nowrap">` + dateStringToKor(date) + `</td>
                                        <td class="text-nowrap">` + addr + `, ` + addr_spec + `</td>
                                    </tr>`);
                }
                $(this).parent().parent().find('div:not(.buttons)').remove();
                $(this).addClass('d-none');
                $('#breed-add-cancel').addClass('d-none');
                $('#breed-add').removeClass('d-none');
                alert('정보를 최종 반영하려면 화면 상단의 수정 버튼을 눌러야 수정 완료됩니다.');
            }
        })
            .on('click', '#breed-addr', function () {
                console.log('clicked')
                let $input = $(this);
                new daum.Postcode({
                    oncomplete: function (data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                        $input.val(data.address);
                    }
                }).open();
            })

        $('#process-make-div').on('click', '#process-add-confirm', function () {
            if (confirm('가공 이력을 등록하시겠어요?')) {
                let makeDiv = $('#process-make-div');
                let table = $('#processing-b1 table tbody');
                let corp = makeDiv.find('#process-corp').val();
                let date = makeDiv.find('#process-datetime').val();
                let url = makeDiv.find('#process-url').val();
                let addr = makeDiv.find('#process-addr').val();
                let addr_spec = makeDiv.find('#process-addr-spec').val();
                if (corp.trim().length <= 0) {
                    alert('가공장 명을 입력해주세요.');
                    return false;
                }
                if (date.trim().length <= 0) {
                    alert('가공 정보 일자를 입력해주세요.');
                    return false;
                }
                if (addr.trim().length <= 0) {
                    alert('농장 주소를 입력해주세요.');
                    return false;
                }
                if (addr_spec.trim().length <= 0) {
                    alert('농장 상세 주소를 입력해주세요.');
                    return false;
                }
                table.append(`<tr>
                                    <th scope="row">
                                        <span class="badge badge-soft-danger cursor-pointer">삭제</span>
                                    </th>
                                    <td class="text-nowrap"
                                        data-url="` + url + `">` + corp + `</td>
                                    <td class="text-nowrap"
                                        data-date="` + date + `">` + addr + `, ` + addr_spec + `</td>
                                </tr>`);
                $(this).parent().parent().find('div:not(.buttons)').remove();
                $(this).addClass('d-none');
                $('#process-add-cancel').addClass('d-none');
                $('#process-add').removeClass('d-none');
                alert('정보를 최종 반영하려면 화면 상단의 수정 버튼을 눌러야 수정 완료됩니다.');
            }
        }).on('click', '#process-addr', function () {
            let $input = $(this);
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    $input.val(data.address);
                }
            }).open();
        })


        $('#breed-b1 table tbody tr').on('click', '.badge-soft-danger', function () {
            if (confirm('해당 내역을 삭제하시겠습니까?')) {
                $(this).closest('tr').remove();
            }
        })

        $('#processing-b1 table tbody tr').on('click', '.badge-soft-danger', function () {
            if (confirm('해당 내역을 삭제하시겠습니까?')) {
                $(this).closest('tr').remove();
            }
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
                    $(elem).find('input').removeAttr('disabled');
                })
            } else {
                divs.each((idx, elem) => {
                    $(elem).addClass('d-none');
                    $(elem).find('input').attr('disabled', 'disabled');
                })
            }
        })

        $('#vaccine_used').on('change', function() {
            let $input = $('#vaccine_info')
            if($(this).is(':checked')) {
                $input.removeAttr('disabled');
                $input.val($input.data().origin);
            } else {
                $input.attr('disabled', 'disabled')
                $input.val('');
            }
        })
    });

    function dateStringToKor(date) {
        let d = new Date(date);
        return d.getFullYear() + '년 ' + dateZero(d.getMonth() + 1) + '월 ' + dateZero(d.getDate()) + '일';
    }

    function dateZero(value) {
        if (value < 10) {
            value = "0" + value;
        }
        return value;
    }

    function checkBreedCorrect(r, a, s) {
        return r === 1;
    }

</script>
</body>
</html>

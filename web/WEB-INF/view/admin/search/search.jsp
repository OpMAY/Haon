<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                    <li class="breadcrumb-item active">검색 키워드 관리</li>
                                </ol>
                            </div>
                            <h4 class="page-title">검색 키워드 관리</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="header-title">추천 검색</h4>
                                <p class="text-muted font-13 mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing
                                    elit. Animi atque
                                    consequuntur deserunt ea eveniet id ipsa, molestiae necessitatibus
                                    praesentium quam reiciendis suscipit! Aut blanditiis distinctio
                                    impedit, nulla praesentium quod rem!</p>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label class="form-label">추천 검색</label>
                                            <input type="text"
                                                   class="selectize-close-btn"
                                                   id="selectize-tags-recommend"
                                                   placeholder="추천 검색을 입력해주세요."
                                                   value="<custom:removeBrackets value="${recommend.keywords.toString()}"/>">
                                        </div>
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
                                <h4 class="header-title">검색 키워드</h4>
                                <p class="text-muted font-13 mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing
                                    elit. Animi atque
                                    consequuntur deserunt ea eveniet id ipsa, molestiae necessitatibus
                                    praesentium quam reiciendis suscipit! Aut blanditiis distinctio
                                    impedit, nulla praesentium quod rem!</p>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label class="form-label">검색 키워드</label>
                                            <input type="text"
                                                   class="selectize-close-btn"
                                                   id="selectize-tags-search"
                                                   placeholder="검색 키워드를 입력해주세요."
                                                   value="<custom:removeBrackets value="${search.keywords.toString()}"/>">
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

<!-- Vendor js -->
<script src="/resources/admin/assets/js/vendor.min.js"></script>

<script src="/resources/admin/assets/libs/selectize/js/standalone/selectize.min.js"></script>
<script src="/resources/admin/assets/libs/mohithg-switchery/switchery.min.js"></script>
<script src="/resources/admin/assets/libs/multiselect/js/jquery.multi-select.js"></script>
<script src="/resources/admin/assets/libs/select2/js/select2.min.js"></script>
<script src="/resources/admin/assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
<script src="/resources/admin/assets/libs/devbridge-autocomplete/jquery.autocomplete.min.js"></script>
<script src="/resources/admin/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="/resources/admin/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/js/utility.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        $('#selectize-tags-recommend').selectize({
            plugins: ["remove_button"],
            persist: !1,
            create: !0,
            maxItems: 10,
            render: {
                item: function (e, a) {
                    return '<div>"' + a(e.text) + '"</div>'
                }
            },
            onItemAdd: function (value, $item) {
                console.log(value, $item);
                let category_regex = /^[가-힣a-zA-Z\d\s]{1,10}$/;
                if (!category_regex.test(value.trim())) {
                    alert('추천 검색은 1글자 이상 10글자 이하로 입력해주세요. (특수문자 제외)');
                    $item.remove();
                    return false;
                }
                addKeyword('RECOMMEND', value).then((result) => {
                    console.log(result);
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            return true;
                        } else {
                            alert('추천 검색어를 추가할 수 없습니다.');
                            return false;
                        }
                    } else {
                        alert('추천 검색어를 추가할 수 없습니다.');
                        return false;
                    }
                });
            },
            onDelete: function (e) {
                if (confirm('"' + e[0] + '"' + '를 삭제하시겠습니까?')) {
                    removeKeyword('RECOMMEND', e[0]).then((result) => {
                        console.log(result);
                        if (result.status === 'OK') {
                            if (result.data.status) {
                                alert('추천 검색어를 삭제하였습니다.');
                                return true;
                            } else {
                                alert('추천 검색어를 삭제할 수 없습니다.');
                                return false;
                            }
                        } else {
                            alert('추천 검색어를 삭제할 수 없습니다.');
                            return false;
                        }
                    });
                } else {
                    return false;
                }
            }
        });
        $('#selectize-tags-search').selectize({
            plugins: ["remove_button"],
            persist: !1,
            create: !0,
            maxItems: 10,
            render: {
                item: function (e, a) {
                    return '<div>"' + a(e.text) + '"</div>'
                }
            },
            onItemAdd: function (value, $item) {
                console.log(value, $item);
                let category_regex = /^[가-힣a-zA-Z\d\s]{1,10}$/;
                if (!category_regex.test(value.trim())) {
                    alert('검색 키워드는 1글자 이상 10글자 이하로 입력해주세요. (특수문자 제외)');
                    $item.remove();
                    return false;
                }
                addKeyword('SEARCH', value).then((result) => {
                    console.log(result);
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            return true;
                        } else {
                            alert('검색 키워드를 추가할 수 없습니다.');
                            return false;
                        }
                    } else {
                        alert('검색 키워드를 추가할 수 없습니다.');
                        return false;
                    }
                });
            },
            onDelete: function (e) {
                if (confirm('"' + e[0] + '"' + '를 삭제하시겠습니까?')) {
                    removeKeyword('SEARCH', e[0]).then((result) => {
                        console.log(result);
                        if (result.status === 'OK') {
                            if (result.data.status) {
                                alert('검색 키워드를 삭제하였습니다.');
                            } else {
                                alert('검색 키워드를 삭제할 수 없습니다.');
                            }
                        } else {
                            alert('검색 키워드를 삭제할 수 없습니다.');
                        }
                    });
                    return true;
                } else {
                    return false;
                }
            }
        });
    });
</script>
</body>
</html>

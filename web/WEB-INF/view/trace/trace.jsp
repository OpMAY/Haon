<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/left-sidebar.jsp"/>
<jsp:include page="../common/right-sidebar.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-trace.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>
<div id="content-wrapper" class="c-bg-gray">
    <div class="container">
        <!--테마별 키워드-->
        <section class="section sm-section pt-80 c-gray-high-light"
                 style="min-height: calc(80vh);">
            <div class="trace-card">
                <div class="row p-16">
                    <div class="col-6 pt-8">
                        <img src="../../resources/assets/images/icon/logo-white-theme.png" alt="">
                    </div>

                    <div class="col-6">
                        <div class="form-group form-inner-button">
                            <input type="text" placeholder="이력 번호 또는 묶음 번호 입력" id="trace-search"
                                   class="form-control input-box medium-h5">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_225_6124)">
                                    <path d="M18.031 16.617L22.314 20.899L20.899 22.314L16.617 18.031C15.0237 19.3082 13.042 20.0029 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20.0029 13.042 19.3082 15.0237 18.031 16.617ZM16.025 15.875C17.2941 14.5699 18.0029 12.8204 18 11C18 7.132 14.867 4 11 4C7.132 4 4 7.132 4 11C4 14.867 7.132 18 11 18C12.8204 18.0029 14.5699 17.2941 15.875 16.025L16.025 15.875Z"
                                          fill="#A9CC52"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_225_6124">
                                        <rect width="24" height="24" fill="white"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="row pt-16 pl-16 pr-16">
                    <div class="col-12 medium-h4 c-gray-dark-low">
                        이력 번호
                    </div>

                    <div class="col-12 bold-h2 c-brand-green mt-16">
                        ${trace.trace_code}
                    </div>
                </div>

                <div class="row pt-32 pl-16 pr-16">
                    <div class="col-12 medium-h4 c-gray-dark-low">
                        개체 정보
                    </div>
                </div>

                <div class="row p-16">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-bordered trace-details-table">
                                <thead>
                                <tr>
                                    <th scope="col">개체 축종</th>
                                    <th scope="col">출생 년 월일</th>
                                    <th scope="col">성별</th>
                                    <th scope="col">등급</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${trace.entity.entity_type.typeName}</td>
                                    <td><custom:numberDateFormat value="${trace.entity.birth eq null ? '-' : trace.entity.birth}"/></td>
                                    <td>${trace.entity.gender eq null ? '-' : trace.entity.gender}</td>
                                    <td>${trace.entity.rate eq null ? '-' : trace.entity.rate}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row row pt-16 pl-16 pr-16">
                    <div class="col-12 medium-h4 c-gray-dark-low">
                        사육 정보
                    </div>
                </div>

                <div class="row p-16">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-bordered trace-register-table">
                                <thead>
                                <tr>
                                    <th scope="col">신고 구분</th>
                                    <th scope="col">농장 경영자</th>
                                    <th scope="col">농장 명</th>
                                    <th scope="col">년 월일</th>
                                    <th scope="col">소재지</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${trace.breed.size() > 0}">
                                    <c:forEach var="breed" items="${trace.breed}">
                                        <tr>
                                            <td>${breed.type.keyword}</td>
                                            <td>${breed.breed_farmer_name eq null ? '-' : breed.breed_farmer_name}</td>
                                            <td>${breed.breed_farm_name eq null ? '-' : breed.breed_farm_name}
                                                <c:if test="${breed.breed_farm_name ne null && breed.breed_farm_url ne null}">
                                                    <svg style="padding-bottom: 2px;" width="20" height="20"
                                                         viewBox="0 0 20 20"
                                                         fill="none" class="cursor-pointer" data-href="${breed.breed_farm_url}"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <g clip-path="url(#clip0_375_14409)">
                                                            <path d="M10.9766 9.99865L6.85156 5.87365L8.0299 4.69531L13.3332 9.99865L8.0299 15.302L6.85156 14.1236L10.9766 9.99865Z"
                                                                  fill="#222222"/>
                                                        </g>
                                                        <defs>
                                                            <clipPath id="clip0_375_14409">
                                                                <rect width="20" height="20" fill="white"/>
                                                            </clipPath>
                                                        </defs>
                                                    </svg>
                                                </c:if>
                                            </td>
                                            <td><custom:numberDateFormat value="${breed.breed_issue_date eq null ? '-' : breed.breed_issue_date}"/></td>
                                            <td>${breed.breed_farm_addr eq null ? '-' : breed.breed_farm_addr}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${trace.breed.size() <= 0}">
                                    <tr data-type="empty">
                                        <td colspan="5">
                                            <span class="c-gray-light">사육 정보가 등록되지 않았습니다.</span>
                                        </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row row pt-16 pl-16 pr-16">
                    <div class="col-12 medium-h4 c-gray-dark-low">
                        도축 정보
                    </div>
                </div>

                <div class="row p-16">
                    <div class="col-12">
                        <table class="table table-bordered trace-register-table">
                            <thead>
                            <tr>
                                <th scope="col">도축 결과</th>
                                <th scope="col">도축장</th>
                                <th scope="col">년 월일</th>
                                <th scope="col">소재지</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${trace.butchery.size() > 0}">
                                <c:forEach var="butchery" items="${trace.butchery}">
                                    <tr>
                                        <td>${butchery.butchery_result == 'true' || butchery.butchery_result == 'Y' ? '합격' : '불합격'}</td>
                                        <td>${butchery.butchery_corp}
<%--                                            <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"--%>
<%--                                                 fill="none"--%>
<%--                                                 xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                <g clip-path="url(#clip0_375_14409)">--%>
<%--                                                    <path d="M10.9766 9.99865L6.85156 5.87365L8.0299 4.69531L13.3332 9.99865L8.0299 15.302L6.85156 14.1236L10.9766 9.99865Z"--%>
<%--                                                          fill="#222222"/>--%>
<%--                                                </g>--%>
<%--                                                <defs>--%>
<%--                                                    <clipPath id="clip0_375_14409">--%>
<%--                                                        <rect width="20" height="20" fill="white"/>--%>
<%--                                                    </clipPath>--%>
<%--                                                </defs>--%>
<%--                                            </svg>--%>
                                        </td>
                                        <td><custom:numberDateFormat value="${butchery.butchery_date}"/></td>
                                        <td>${butchery.butchery_addr}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${trace.butchery.size() <= 0}">
                                <tr data-type="empty">
                                    <td colspan="4">
                                        <span class="c-gray-light">도축 정보가 등록되지 않았습니다.</span>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row row pt-16 pl-16 pr-16">
                    <div class="col-12 medium-h4 c-gray-dark-low">
                        가공 정보
                    </div>
                </div>

                <div class="row p-16">
                    <div class="col-12">
                        <table class="table table-bordered trace-register-table">
                            <thead>
                            <tr>
                                <th scope="col">업소명</th>
                                <th scope="col">소재지</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${trace.process.size() > 0}">
                                <c:forEach var="process" items="${trace.process}">
                                    <tr>
                                        <td>${process.process_corp}
                                            <c:if test="${process.process_url ne null}">
                                                <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                                     fill="none" class="cursor-pointer" data-href="${process.process_url}"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <g clip-path="url(#clip0_375_14409)">
                                                        <path d="M10.9766 9.99865L6.85156 5.87365L8.0299 4.69531L13.3332 9.99865L8.0299 15.302L6.85156 14.1236L10.9766 9.99865Z"
                                                              fill="#222222"/>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_375_14409">
                                                            <rect width="20" height="20" fill="white"/>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                            </c:if>
                                        </td>
                                        <td>${process.process_addr}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${trace.process.size() <= 0}">
                                <tr data-type="empty">
                                    <td colspan="2">
                                        <span class="c-gray-light">가공 정보가 등록되지 않았습니다.</span>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


        </section>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/script.jsp"/>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');

        $('#trace-search').next().on('click', function () {
            let value = $('#trace-search').val();
            if (value.trim().length <= 0) {
                viewAlert({content: '검색할 이력 번호를 입력하세요.'});
            } else {
                searchByCode(value).then((result) => {
                    if(result.status === 'OK') {
                        if(result.data.status) {
                            let no = result.data.data.no;
                            if(result.data.type === 'trace') {
                                window.location.href = '/trace/single/' + no;
                            } else if (result.data.type === 'bundle'){
                                window.location.href = '/trace/package/' + no;
                            }
                        } else {
                            viewAlert({content: '일치하는 이력이 없습니다.'});
                        }
                    }
                })
            }
        })
    });
</script>
</body>

</html>

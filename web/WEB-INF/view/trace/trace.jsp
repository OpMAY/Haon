<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <input type="text" placeholder="이력 번호 또는 묶음 번호 입력"
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
                        1001 2645 4888
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
                                    <td>양 & 염소</td>
                                    <td>2023.12.12</td>
                                    <td>수컷</td>
                                    <td>1++</td>
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
                                <tr>
                                    <td>전산 등록</td>
                                    <td>유병준</td>
                                    <td>하은축산
                                        <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                             fill="none"
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
                                    </td>
                                    <td>2021.12.22</td>
                                    <td>서울특별시 남부순환로 1892</td>
                                </tr>
                                <tr>
                                    <td>전산 등록</td>
                                    <td>유병준</td>
                                    <td>하은축산
                                        <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                             fill="none"
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
                                    </td>
                                    <td>2021.12.22</td>
                                    <td>서울특별시 남부순환로 1892</td>
                                </tr>
                                <tr>
                                    <td>전산 등록</td>
                                    <td>유병준</td>
                                    <td>하은축산
                                        <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                             fill="none"
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
                                    </td>
                                    <td>2021.12.22</td>
                                    <td>서울특별시 남부순환로 1892</td>
                                </tr>
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
                            <tr>
                                <td>합격</td>
                                <td>하은축산
                                    <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                         fill="none"
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
                                </td>
                                <td>2021.12.22</td>
                                <td>서울특별시 남부순환로 1892</td>
                            </tr>
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
                            <tr>
                                <td>하은축산
                                    <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                         fill="none"
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
                                </td>
                                <td>서울특별시 남부순환로 1892</td>
                            </tr>
                            <tr>
                                <td>하은축산
                                    <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                         fill="none"
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
                                </td>
                                <td>서울특별시 남부순환로 1892</td>
                            </tr>
                            <tr>
                                <td>하은축산
                                    <svg style="padding-bottom: 2px;" width="20" height="20" viewBox="0 0 20 20"
                                         fill="none"
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
                                </td>
                                <td>서울특별시 남부순환로 1892</td>
                            </tr>
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
    });
</script>
</body>

</html>

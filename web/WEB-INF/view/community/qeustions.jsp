<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<jsp:include page="../common/head.jsp"/>

<body>

<jsp:include page="../common/header.jsp"/>

<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>

<div id="content-wrapper">
    <div class="container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40" style="min-height: calc(80vh);">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    궁금한 사항을 무엇이든 편하게 물어보세요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    질문과 답변
                </div>
            </div>
            <div class="filter-dropdown-container">
                <!--TODO Filter -->
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-green">
                        <input type="text" class="form-control input-box medium-h5 dropdown-input input-sm" disabled="disabled"
                               value="질문과 답변"
                               id="questions-filter1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_278_13355)">
                                <path d="M12 13.1727L16.95 8.22266L18.364 9.63666L12 16.0007L5.636 9.63666L7.05 8.22266L12 13.1727Z"
                                      fill="#222222"></path>
                            </g>
                            <defs>
                                <clipPath id="clip0_278_13355">
                                    <rect width="24" height="24" fill="white" transform="translate(24) rotate(90)"></rect>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                    <div class="dropdown-menu dropdown-md">
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 1</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 2</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 3</div>
                        </a>
                    </div>
                </div>
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-gray">
                        <input type="text"
                               class="form-control input-box medium-h5 dropdown-input input-sm"
                               disabled="disabled"
                               value="전체"
                               id="questions-filter2">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_278_13355)">
                                <path d="M12 13.1727L16.95 8.22266L18.364 9.63666L12 16.0007L5.636 9.63666L7.05 8.22266L12 13.1727Z"
                                      fill="#222222"></path>
                            </g>
                            <defs>
                                <clipPath id="clip0_278_13355">
                                    <rect width="24" height="24" fill="white" transform="translate(24) rotate(90)"></rect>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                    <div class="dropdown-menu dropdown-md">
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 1</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 2</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 3</div>
                        </a>
                    </div>
                </div>
                <div class="right-filter-dropdown-container">
                    <div class="dropdown input-dropdown">
                        <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                            <input type="text"
                                   class="form-control input-box medium-h5 dropdown-input"
                                   disabled="disabled"
                                   value="전체"
                                   id="questions-filter3">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_278_13355)">
                                    <path d="M12 13.1727L16.95 8.22266L18.364 9.63666L12 16.0007L5.636 9.63666L7.05 8.22266L12 13.1727Z"
                                          fill="#222222"></path>
                                </g>
                                <defs>
                                    <clipPath id="clip0_278_13355">
                                        <rect width="24" height="24" fill="white" transform="translate(24) rotate(90)"></rect>
                                    </clipPath>
                                </defs>
                            </svg>
                        </div>
                        <div class="dropdown-menu dropdown-sm">
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>최신 등록 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>뷰 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>댓글 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>추천 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>책갈피 많은 순</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion question-accordion" id="accordionExample1">
                <div class="row row-cols-2 accordion-deck-container">
                    <div class="col">
                        <div class="card">
                            <div class="card-header" id="headingOne12">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left medium-h4"
                                            type="button"
                                            data-toggle="collapse"
                                            data-target="#collapseOne12"
                                            aria-expanded="true"
                                            aria-controls="collapseOne12">
                                        <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                    </button>
                                </h2>
                                <div class="_arrow"
                                     data-toggle="collapse"
                                     data-target="#collapseOne12"
                                     aria-expanded="true"
                                     aria-controls="collapseOne12">
                                    <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                              fill="#A9CC52"></path>
                                    </svg>
                                </div>
                            </div>
                            <div id="collapseOne12"
                                 class="collapse show"
                                 aria-labelledby="headingOne12"
                                 data-parent="#accordionExample1"
                                 style="">
                                <div class="card-body pl-40 pt-0">
                                    <div class="_accordion-content">
                                        <span class="regular-h5">당연히 안되죠..</span>
                                    </div>
                                    <div class="_accordion-option mt-16">
                                        <div class="_more-comments">
                                            <a href="#">댓글 더 불러오기</a>
                                        </div>
                                        <div class="_date ml-auto">
                                            <span class="medium-h5 c-gray-light">2021.12.31</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-header" id="headingOne13">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                            type="button"
                                            data-toggle="collapse"
                                            data-target="#collapseOne13"
                                            aria-expanded="false"
                                            aria-controls="collapseOne13">
                                        <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                    </button>
                                </h2>
                                <div class="_arrow collapsed"
                                     data-toggle="collapse"
                                     data-target="#collapseOne13"
                                     aria-expanded="false"
                                     aria-controls="collapseOne13">
                                    <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                              fill="#A9CC52"></path>
                                    </svg>
                                </div>
                            </div>
                            <div id="collapseOne13"
                                 class="collapse"
                                 aria-labelledby="headingOne13"
                                 data-parent="#accordionExample1"
                                 style="">
                                <div class="card-body pl-40 pt-0">
                                    <div class="_accordion-content">
                                        <span class="regular-h5">당연히 안되죠..</span>
                                    </div>
                                    <div class="row _accordion-option mt-16">
                                        <div class="col-9 _more-comments">
                                            <a href="#">댓글 더 불러오기</a>
                                        </div>
                                        <div class="col-3 _date">
                                            <span class="medium-h5 c-gray-light">2021.12.31</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-header" id="headingOne14">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                            type="button"
                                            data-toggle="collapse"
                                            data-target="#collapseOne14"
                                            aria-expanded="false"
                                            aria-controls="collapseOne14">
                                        <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                    </button>
                                </h2>
                                <div class="_arrow collapsed"
                                     data-toggle="collapse"
                                     data-target="#collapseOne14"
                                     aria-expanded="false"
                                     aria-controls="collapseOne14">
                                    <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                              fill="#A9CC52"></path>
                                    </svg>
                                </div>
                            </div>
                            <div id="collapseOne14"
                                 class="collapse"
                                 aria-labelledby="headingOne14"
                                 data-parent="#accordionExample1"
                                 style="">
                                <div class="card-body pl-40 pt-0">
                                    <div class="_accordion-content">
                                        <span class="regular-h5">당연히 안되죠..</span>
                                    </div>
                                    <div class="row _accordion-option mt-16">
                                        <div class="col-9 _more-comments">
                                            <a href="#">댓글 더 불러오기</a>
                                        </div>
                                        <div class="col-3 _date">
                                            <span class="medium-h5 c-gray-light">2021.12.31</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="card-header" id="headingOne15">
                                <h2 class="mb-0">
                                    <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                            type="button"
                                            data-toggle="collapse"
                                            data-target="#collapseOne15"
                                            aria-expanded="false"
                                            aria-controls="collapseOne15">
                                        <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                    </button>
                                </h2>
                                <div class="_arrow collapsed"
                                     data-toggle="collapse"
                                     data-target="#collapseOne15"
                                     aria-expanded="false"
                                     aria-controls="collapseOne15">
                                    <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                              fill="#A9CC52"></path>
                                    </svg>
                                </div>
                            </div>
                            <div id="collapseOne15"
                                 class="collapse"
                                 aria-labelledby="headingOne15"
                                 data-parent="#accordionExample1"
                                 style="">
                                <div class="card-body pl-40 pt-0">
                                    <div class="_accordion-content">
                                        <span class="regular-h5">당연히 안되죠..</span>
                                    </div>
                                    <div class="row _accordion-option mt-16">
                                        <div class="col-9 _more-comments">
                                            <a href="#">댓글 더 불러오기</a>
                                        </div>
                                        <div class="col-3 _date">
                                            <span class="medium-h5 c-gray-light">2021.12.31</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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

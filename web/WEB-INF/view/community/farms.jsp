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
                    많은 농가 분들이 정보와 노하우를 공유하며 축산을 진행하고 있어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    다양한 축산 농가
                </div>
            </div>
            <div class="filter-dropdown-container">
                <!--TODO Filter -->
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-green">
                        <input type="text" class="form-control input-box medium-h5 dropdown-input input-sm" disabled="disabled"
                               value="전체"
                               id="farms-filter1">
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
                                   id="farms-filter3">
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
            <div class="row row-cols-4 card-container-deck">
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card farm-card">
                        <div class="background-image _thumbnail"
                             style="background-image: url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-basic-black">Name</h5>
                            <p class="card-text _farm-type bold-h5 c-brand-green">축산 농사</p>
                            <div class="_hashs">
                                <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                <span class="_hash c-gray-medium medium-p1">해시1</span>
                                <span class="_hash c-gray-medium medium-p1">해시</span>
                            </div>
                        </div>
                        <div class="_footer">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                농장 자세히 보기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card farm-card">
                        <div class="background-image _thumbnail"
                             style="background-image: url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-basic-black">Name</h5>
                            <p class="card-text _farm-type bold-h5 c-brand-green">축산 농사</p>
                            <div class="_hashs">
                                <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                <span class="_hash c-gray-medium medium-p1">해시1</span>
                                <span class="_hash c-gray-medium medium-p1">해시</span>
                            </div>
                        </div>
                        <div class="_footer">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                농장 자세히 보기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card farm-card">
                        <div class="background-image _thumbnail"
                             style="background-image: url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-basic-black">Name</h5>
                            <p class="card-text _farm-type bold-h5 c-brand-green">축산 농사</p>
                            <div class="_hashs">
                                <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                <span class="_hash c-gray-medium medium-p1">해시1</span>
                                <span class="_hash c-gray-medium medium-p1">해시</span>
                            </div>
                        </div>
                        <div class="_footer">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                농장 자세히 보기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card farm-card">
                        <div class="background-image _thumbnail"
                             style="background-image: url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-basic-black">Name</h5>
                            <p class="card-text _farm-type bold-h5 c-brand-green">축산 농사</p>
                            <div class="_hashs">
                                <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                <span class="_hash c-gray-medium medium-p1">해시1</span>
                                <span class="_hash c-gray-medium medium-p1">해시</span>
                            </div>
                        </div>
                        <div class="_footer">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                농장 자세히 보기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card farm-card">
                        <div class="background-image _thumbnail"
                             style="background-image: url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-basic-black">Name</h5>
                            <p class="card-text _farm-type bold-h5 c-brand-green">축산 농사</p>
                            <div class="_hashs">
                                <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                <span class="_hash c-gray-medium medium-p1">해시1</span>
                                <span class="_hash c-gray-medium medium-p1">해시</span>
                            </div>
                        </div>
                        <div class="_footer">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                농장 자세히 보기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card farm-card">
                        <div class="background-image _thumbnail"
                             style="background-image: url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-basic-black">Name</h5>
                            <p class="card-text _farm-type bold-h5 c-brand-green">축산 농사</p>
                            <div class="_hashs">
                                <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                <span class="_hash c-gray-medium medium-p1">해시1</span>
                                <span class="_hash c-gray-medium medium-p1">해시</span>
                            </div>
                        </div>
                        <div class="_footer">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                농장 자세히 보기
                            </button>
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

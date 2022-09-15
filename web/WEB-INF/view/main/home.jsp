<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<jsp:include page="../common/head.jsp"/>

<body>
<!-- General Header -->
<jsp:include page="../common/header.jsp"/>

<div id="header-desc" style="display: none;">
    <ul class="list-group">
        <li class="list-group-item regular-h5">양</li>
        <li class="list-group-item regular-h5">염소</li>
        <li class="list-group-item regular-h5">소</li>
        <li class="list-group-item regular-h5">돼지</li>
        <li class="list-group-item regular-h5">닭 & 계란</li>
        <li class="list-group-item regular-h5">토끼</li>
        <li class="list-group-item regular-h5">오리</li>
    </ul>
    <ul class="list-group">
        <li class="list-group-item regular-h5">자유 게시판</li>
        <li class="list-group-item regular-h5">팁과 노하우</li>
        <li class="list-group-item regular-h5">축산 메뉴얼</li>
        <li class="list-group-item regular-h5">최신 매거진</li>
        <li class="list-group-item regular-h5">질문과 답변</li>
    </ul>
    <ul class="list-group">
        <li class="list-group-item regular-h5">이력 안내</li>
        <li class="list-group-item regular-h5 _trace-search">이력 조회</li>
        <li class="list-group-item regular-h5">이력 등록</li>
    </ul>
</div>
<!-- Left Sidebar-->
<div id="header-left-sidebar" style="display: none;">
    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h2 class="mb-0">
                    <div class="btn btn-block text-left bold-h3 c-gray-dark-low"
                         type="button"
                         data-toggle="collapse"
                         data-target="#collapseOne"
                         aria-expanded="true"
                         aria-controls="collapseOne">
                        <span>농장</span>
                        <svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_279_20047)">
                                <path d="M13.3328 12.0313L7.83283 17.5312L6.26172 15.9601L13.3328 8.88903L20.4039 15.9601L18.8328 17.5312L13.3328 12.0313Z"
                                      fill="#222222"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_279_20047">
                                    <rect width="26.6667" height="26.6667" fill="white" transform="translate(0 26.666) rotate(-90)"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                </h2>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne">
                <div class="card-body">
                    <div class="regular-h5 c-gray-dark-low">양 & 염소</div>
                    <div class="regular-h5 c-gray-dark-low">말</div>
                    <div class="regular-h5 c-gray-dark-low">돼지</div>
                    <div class="regular-h5 c-gray-dark-low">소</div>
                    <div class="regular-h5 c-gray-dark-low">닭 & 계란</div>
                    <div class="regular-h5 c-gray-dark-low">토끼</div>
                    <div class="regular-h5 c-gray-dark-low">오리</div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingTwo">
                <h2 class="mb-0">
                    <div class="btn btn-block text-left bold-h3 c-gray-dark-low"
                         type="button"
                         data-toggle="collapse"
                         data-target="#collapseTwo"
                         aria-expanded="true"
                         aria-controls="collapseTwo">
                        <span>커뮤니티</span>
                        <svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_279_20047)">
                                <path d="M13.3328 12.0313L7.83283 17.5312L6.26172 15.9601L13.3328 8.88903L20.4039 15.9601L18.8328 17.5312L13.3328 12.0313Z"
                                      fill="#222222"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_279_20047">
                                    <rect width="26.6667" height="26.6667" fill="white" transform="translate(0 26.666) rotate(-90)"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                </h2>
            </div>
            <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo">
                <div class="card-body">
                    <div class="regular-h5 c-gray-dark-low">자유 게시판</div>
                    <div class="regular-h5 c-gray-dark-low">팁과 노하우</div>
                    <div class="regular-h5 c-gray-dark-low">축산 메뉴얼</div>
                    <div class="regular-h5 c-gray-dark-low">최신 매거진</div>
                    <div class="regular-h5 c-gray-dark-low">질문과 답변</div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingThree">
                <h2 class="mb-0">
                    <div class="btn btn-block text-left bold-h3 c-gray-dark-low"
                         type="button"
                         data-toggle="collapse"
                         data-target="#collapseThree"
                         aria-expanded="true"
                         aria-controls="collapseThree">
                        <span>QR 이력제</span>
                        <svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_279_20047)">
                                <path d="M13.3328 12.0313L7.83283 17.5312L6.26172 15.9601L13.3328 8.88903L20.4039 15.9601L18.8328 17.5312L13.3328 12.0313Z"
                                      fill="#222222"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_279_20047">
                                    <rect width="26.6667" height="26.6667" fill="white" transform="translate(0 26.666) rotate(-90)"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                </h2>
            </div>
            <div id="collapseThree" class="collapse show" aria-labelledby="headingThree">
                <div class="card-body">
                    <div class="regular-h5 c-gray-dark-low">이력 안내</div>
                    <div class="regular-h5 c-gray-dark-low _trace-search">이력 조회</div>
                    <div class="regular-h5 c-gray-dark-low">이력 등록</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Right Sidebar-->
<div id="header-right-sidebar" style="display: none;">
    <ul class="list-group">
        <li class="list-group-item medium-h4 c-gray-dark-low is-active">홈</li>
        <li class="list-group-item medium-h4 c-gray-dark-low">책갈피</li>
        <li class="list-group-item medium-h4 c-gray-dark-low">이력 관리</li>
        <li class="list-group-item medium-h4 c-gray-dark-low">알람 설정</li>
        <li class="list-group-item medium-h4 c-gray-dark-low">로그아웃</li>
        <li class="list-group-item medium-h4 c-gray-dark-low">회원탈퇴</li>
    </ul>
</div>
<!-- Overlay (header, header-back-theme, left sidebar, right-sidebar, tab-trace, tab-search, bottom tab)-->
<div id="tab-overlay" style="display: none;"></div>
<!--이력 조회-->
<div id="tab-trace" style="display: none;">
    <div class="container mt-48 mb-48">
        <div class="bold-h1 text-center">
            이력 조회
        </div>
        <div class="text-center  medium-h4 mt-32">
            축산물 이력제 적용 판매장에서 이력추적제를 적용한 축산물인 경우<br/>
            <span class="c-brand-green">묶음 또는 이력 번호를 입력</span>하여 축산 이력을 조회할 수 있습니다.
        </div>
        <div class="form-group form-inner-button text-center mt-60">
            <input type="text" placeholder="묶음 또는 이력 번호를 입력해주세요." class="form-control input-box medium-h5"
                   id="input8">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
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
        <div class="_traces mt-32">
            <div class="_trace">
                <div class="_bundle-header">
                    <span class="bold-h2" data-code="L-0-220819-9763-101">L-0-220819-9763-101</span>
                    <button type="button" class="_qr btn btn-brand-opacity btn-block bold-h5">
                        QR 코드 다운로드
                    </button>
                </div>
                <div class="_bundle-body d-flex">
                    <span class="_livestock regular-h5 p-2">양 & 염소</span>
                    <span class="regular-h5 p-2">1++</span>
                    <span class="regular-h5 p-2">수컷</span>
                    <span class="regular-h5 p-2">2022.12.22 출생</span>
                    <span class="regular-h5 _date ml-auto p-2">2023.12.12</span>
                </div>
            </div>
            <div class="_trace">
                <div class="_bundle-header">
                    <span class="bold-h2" data-code="L-0-220819-9763-101">L-0-220819-9763-101</span>
                    <button type="button" class="_qr btn btn-brand-opacity btn-block bold-h5">
                        QR 코드 다운로드
                    </button>
                </div>
                <div class="_bundle-body d-flex">
                    <span class="_livestock regular-h5 p-2">양 & 염소</span>
                    <span class="regular-h5 p-2">1++</span>
                    <span class="regular-h5 p-2">수컷</span>
                    <span class="regular-h5 p-2">2022.12.22 출생</span>
                    <span class="regular-h5 _date ml-auto p-2">2023.12.12</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--검색 창-->
<div id="tab-search" style="display: none;">
    <div class="form-group d-flex">
        <input type="text"
               placeholder="검색할 내용 입력"
               class="form-control input-underline input-brand-green medium-h4 mr-16"
               id="tab-search-input">
        <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g clip-path="url(#clip0_249_6871)">
                <path d="M18.031 16.617L22.314 20.899L20.899 22.314L16.617 18.031C15.0237 19.3082 13.042 20.0029 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20.0029 13.042 19.3082 15.0237 18.031 16.617ZM16.025 15.875C17.2941 14.5699 18.0029 12.8204 18 11C18 7.132 14.867 4 11 4C7.132 4 4 7.132 4 11C4 14.867 7.132 18 11 18C12.8204 18.0029 14.5699 17.2941 15.875 16.025L16.025 15.875Z"
                      fill="#222222"/>
            </g>
            <defs>
                <clipPath id="clip0_249_6871">
                    <rect width="24" height="24" fill="white"/>
                </clipPath>
            </defs>
        </svg>
    </div>
    <div class="mt-24">
        <label class="c-gray-dark-low bold-h5">최근 검색어</label>
        <ul class="list-group">
            <li class="list-group-item">
                <div>셰프</div>
                <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6 18L18 6M6 6L18 18"
                          stroke-width="1.5"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </li>
            <li class="list-group-item">
                <div>셰프</div>
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6 18L18 6M6 6L18 18"
                          stroke-width="1.5"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </li>
            <li class="list-group-item">
                <div>셰프</div>
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6 18L18 6M6 6L18 18"
                          stroke-width="1.5"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </li>
            <li class="list-group-item">
                <div>셰프</div>
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M6 18L18 6M6 6L18 18"
                          stroke-width="1.5"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </li>
        </ul>
    </div>
    <div class="mt-24">
        <label class="c-gray-dark-low bold-h5">추천 검색어</label>
        <div class="mt-16 _buttons">
            <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-p1">
                추천 검색어4
            </button>
            <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-p1">
                추천 검색어3
            </button>
            <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-p1">
                추천 검색어2
            </button>
            <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-p1">
                추천 검색어1
            </button>
        </div>
    </div>
</div>
<div id="content-wrapper">
    <div class="banner-section background-image _content-banner"
         style="background-image: url('../resources/assets/images/sample/background-wallpaper1.png')">
        <div class="_text-container">
            <div class="_text">
                <div class="_top-text bold-h1 c-brand-green">
                    Lorem ipsum dolor sit amet
                </div>
                <div class="_middle-text display-1 font-weight-bold">
                    Lorem <span class="c-brand-green">ipsum</span> dolor sit amet
                </div>
                <div class="_bottom-text bold-h4 font-weight-bold">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut autem explicabo, harum illo ipsam laudantium
                    maiores necessitatibus nisi nulla qui quo ratione recusandae reiciendis soluta temporibus totam vero? Iste,
                    tempore?
                </div>
            </div>
        </div>
        <div class="_recommend-container">
            <div class="_recommend bold-h4 c-basic-white">
                <span>추천 게시글</span>
                <span class="ellipsis-one-line">양 & 염소는 풀을 너무 많이 먹이면 안됩니다. 건강에 해로워요...양 & 염소는 풀을 너무 많이 먹이면 안됩니다. 건강에 해로워요...양 & 염소는 풀을 너무 많이 먹이면 안됩니다. 건강에 해로워요...양 & 염소는 풀을 너무 많이 먹이면 안됩니다. 건강에 해로워요...</span>
                <svg width="169" height="169" viewBox="0 0 169 169" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_289_14357)">
                        <path d="M98.5261 41.0924C93.0059 39.2484 90.0148 33.2565 91.8587 27.7363C93.7027 22.2161 99.6949 19.2251 105.215 21.069C110.735 22.9129 113.726 28.9049 111.882 34.4251C110.038 39.9453 104.046 42.9364 98.5261 41.0924ZM103.877 25.0737C100.565 23.9672 96.9699 25.7617 95.8634 29.0741C94.757 32.3864 96.5515 35.9813 99.8638 37.0877C103.176 38.1942 106.771 36.3997 107.877 33.0873C108.984 29.775 107.189 26.1802 103.877 25.0737Z"
                              fill="#EBAF4B"/>
                        <path d="M98.526 41.0923C102.246 42.3348 106.149 41.3454 108.884 38.9031C107.541 38.1174 106.159 37.3829 104.716 36.7334C103.261 37.4659 101.527 37.6434 99.8636 37.0878C98.2003 36.5322 96.9213 35.3482 96.1987 33.8884C94.6546 33.5399 93.1086 33.2965 91.5632 33.1174C92.2812 36.7128 94.8066 39.8498 98.526 41.0923Z"
                              fill="#E1A546"/>
                        <path d="M63.0735 147.217C69.7087 149.434 76.8843 145.852 79.1008 139.216C81.3173 132.581 77.7352 125.405 71.1 123.189C64.4648 120.973 57.2891 124.555 55.0727 131.19C52.8562 137.825 56.4383 145.001 63.0735 147.217Z"
                              fill="#FFC850"/>
                        <path d="M55.9223 129.248C55.5947 129.863 55.3017 130.506 55.0733 131.19C54.8441 131.876 54.6884 132.568 54.5801 133.259C54.5762 133.285 54.5701 133.31 54.5663 133.336C53.7202 138.974 56.7831 144.572 62.1183 146.843C61.2704 144.856 60.9194 142.65 61.176 140.425C61.3322 139.07 62.6634 138.177 63.9569 138.609L77.0651 142.988C77.9283 141.882 78.6313 140.623 79.1011 139.217C79.3298 138.532 79.4753 137.841 79.5825 137.152L55.9222 129.248L55.9223 129.248Z"
                              fill="#EBAF4B"/>
                        <path d="M116.845 123.683L125.395 85.483C129.848 65.5881 118.531 45.5494 99.1937 39.09C79.857 32.6306 58.7681 41.8442 50.3694 60.4211L34.2433 96.0906C32.2388 100.525 28.2617 103.754 23.5109 104.807C20.7372 105.421 18.4894 107.446 17.5894 110.14C16.1742 114.377 18.4613 118.958 22.6978 120.374L111.478 150.03C115.714 151.445 120.296 149.158 121.711 144.922C122.611 142.227 122.031 139.258 120.184 137.1C117.019 133.404 115.782 128.432 116.845 123.683Z"
                              fill="#FFDC64"/>
                        <path d="M102.928 127.142L64.1959 114.204C61.8504 113.421 60.6465 110.788 61.6583 108.531C62.0703 107.612 62.4656 106.645 62.8363 105.642L76.3399 69.0962C83.3724 50.0632 93.2438 37.1024 99.1936 39.0899C79.8569 32.6306 58.7677 41.8441 50.3692 60.4211L34.3158 95.9296C32.3264 100.33 28.4974 103.857 23.7533 104.757C20.2815 105.416 17.5794 108.271 17.2086 111.915C16.8181 115.754 19.4197 119.279 23.0792 120.502L53.4292 130.64C52.5708 130.353 52.6559 127.598 53.2185 124.539C53.684 122.009 56.2791 120.463 58.7197 121.278L100.467 135.224C102.899 136.036 105.55 134.512 105.98 131.866C106.317 129.79 104.923 127.809 102.928 127.142Z"
                              fill="#FFC850"/>
                    </g>
                    <defs>
                        <clipPath id="clip0_289_14357">
                            <rect width="133" height="133" fill="white" transform="translate(42.1406) rotate(18.4717)"/>
                        </clipPath>
                    </defs>
                </svg>
            </div>
        </div>
    </div>
    <div class="container">
        <!--테마별 키워드-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    축산에 관심있는 키워드로 정보를 검색해보세요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    테마 별 키워드
                </div>
            </div>
            <div class="theme-keyword">
                <button type="button" class="btn btn-md btn-brand bold-h4">
                    전체
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    기타
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    퀘스트
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    아이템
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    사료
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    도축&가공
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    기타
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    퀘스트
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    아이템
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    사료
                </button>
                <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                    도축&가공
                </button>
            </div>
        </section>
        <!--실시간 자유 게시판-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    다양하고 많은 농가들과 정보를 공유하고 대화를 진행할 수 있어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low cursor-pointer">
                    실시간 자유 게시판
                    <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14584)">
                            <path d="M13.1727 12.0007L8.22266 7.05072L9.63666 5.63672L16.0007 12.0007L9.63666 18.3647L8.22266 16.9507L13.1727 12.0007Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14584">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
            </div>
            <div class="owl-carousel free-board">
                <div>
                    <div class="_board-list">
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green d-none">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="_board-list">
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="_board-list">
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="_board-list">
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                        <div class="_board-container" data-no="1" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--검증된 팁과 노하우-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    숙력된 농가분들이 갖고 있는 팁과 노하우를 공유했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low cursor-pointer">
                    검증된 팁과 노하우
                    <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14584)">
                            <path d="M13.1727 12.0007L8.22266 7.05072L9.63666 5.63672L16.0007 12.0007L9.63666 18.3647L8.22266 16.9507L13.1727 12.0007Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14584">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
            </div>
            <div class="owl-carousel card-carousel">
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
            <span class="_views medium-p1 c-gray-light">
              <span class="_count">32</span>Views
            </span>
                        <span class="_bookmark is-active">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_224_6115)">
                  <path d="M21.179 12.7939L21.192 12.8079L12 21.9999L2.80803 12.8079L2.82103 12.7939C1.75359 11.5494 1.19587 9.94758 1.25962 8.30929C1.32337 6.67099 2.00388 5.1173 3.16478 3.95956C4.32569 2.80181 5.88123 2.12554 7.51969 2.06627C9.15815 2.00699 10.7585 2.56908 12 3.6399C13.2416 2.56908 14.8419 2.00699 16.4804 2.06627C18.1188 2.12554 19.6744 2.80181 20.8353 3.95956C21.9962 5.1173 22.6767 6.67099 22.7404 8.30929C22.8042 9.94758 22.2465 11.5494 21.179 12.7939Z"
                        fill="#A9CC52"></path>
                </g>
                <defs>
                  <clipPath id="clip0_224_6115">
                    <rect width="24" height="24" fill="white"></rect>
                  </clipPath>
                </defs>
              </svg>
            </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card is-empty">
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem explicabo fugit, laudantium
                            minus nam pariatur quibusdam quidem quod recusandae reiciendis sunt voluptate voluptatum. Aut,
                            cum.</p>
                    </div>
                    <div class="_footer">
            <span class="_views medium-p1 c-gray-light">
              <span class="_count">32</span>Views
            </span><span class="_bookmark">
            <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_204_2957)">
                <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
              </g>
              <defs>
                <clipPath id="clip0_204_2957">
                  <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                </clipPath>
              </defs>
            </svg>
          </span>
                    </div>
                </div>
            </div>
        </section>
        <!--숙련된 축산 매뉴얼-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    숙력된 농가분들이 경험하고 직접 겪은 메뉴얼을 공유했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low cursor-pointer">
                    숙련된 축산 메뉴얼
                    <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14584)">
                            <path d="M13.1727 12.0007L8.22266 7.05072L9.63666 5.63672L16.0007 12.0007L9.63666 18.3647L8.22266 16.9507L13.1727 12.0007Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14584">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
            </div>
            <div class="owl-carousel card-carousel">
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark is-active">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_224_6115)">
                        <path d="M21.179 12.7939L21.192 12.8079L12 21.9999L2.80803 12.8079L2.82103 12.7939C1.75359 11.5494 1.19587 9.94758 1.25962 8.30929C1.32337 6.67099 2.00388 5.1173 3.16478 3.95956C4.32569 2.80181 5.88123 2.12554 7.51969 2.06627C9.15815 2.00699 10.7585 2.56908 12 3.6399C13.2416 2.56908 14.8419 2.00699 16.4804 2.06627C18.1188 2.12554 19.6744 2.80181 20.8353 3.95956C21.9962 5.1173 22.6767 6.67099 22.7404 8.30929C22.8042 9.94758 22.2465 11.5494 21.179 12.7939Z"
                              fill="#A9CC52"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_224_6115">
                          <rect width="24" height="24" fill="white"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card is-empty">
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem explicabo fugit, laudantium
                            minus nam pariatur quibusdam quidem quod recusandae reiciendis sunt voluptate voluptatum. Aut,
                            cum.</p>
                    </div>
                    <div class="_footer">
            <span class="_views medium-p1 c-gray-light">
              <span class="_count">32</span>Views
            </span><span class="_bookmark">
            <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_204_2957)">
                <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
              </g>
              <defs>
                <clipPath id="clip0_204_2957">
                  <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                </clipPath>
              </defs>
            </svg>
          </span>
                    </div>
                </div>
            </div>
        </section>
        <!--최신 축산 매거진-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    축산에 대한 최신 정보 및 정책 등 다양한 소식을 준비했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low cursor-pointer">
                    최신 축산 매거진
                    <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14584)">
                            <path d="M13.1727 12.0007L8.22266 7.05072L9.63666 5.63672L16.0007 12.0007L9.63666 18.3647L8.22266 16.9507L13.1727 12.0007Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14584">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
            </div>
            <div class="owl-carousel card-carousel">
                <div class="card community-card">
                    <div class="background-image _thumbnail _thumbnail-lg"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark is-active">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_224_6115)">
                        <path d="M21.179 12.7939L21.192 12.8079L12 21.9999L2.80803 12.8079L2.82103 12.7939C1.75359 11.5494 1.19587 9.94758 1.25962 8.30929C1.32337 6.67099 2.00388 5.1173 3.16478 3.95956C4.32569 2.80181 5.88123 2.12554 7.51969 2.06627C9.15815 2.00699 10.7585 2.56908 12 3.6399C13.2416 2.56908 14.8419 2.00699 16.4804 2.06627C18.1188 2.12554 19.6744 2.80181 20.8353 3.95956C21.9962 5.1173 22.6767 6.67099 22.7404 8.30929C22.8042 9.94758 22.2465 11.5494 21.179 12.7939Z"
                              fill="#A9CC52"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_224_6115">
                          <rect width="24" height="24" fill="white"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail _thumbnail-lg"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail _thumbnail-lg"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card">
                    <div class="background-image _thumbnail _thumbnail-lg"
                         style="background-image:url('../resources/assets/images/sample/card-background-image.png')">
                        <div class="background-image _profile"
                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                    </div>
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                    </div>
                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                    </div>
                </div>
                <div class="card community-card is-empty">
                    <div class="card-body _body">
                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                        <p class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet, consectetur
                            adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem explicabo fugit, laudantium
                            minus nam pariatur quibusdam quidem quod recusandae reiciendis sunt voluptate voluptatum. Aut,
                            cum.</p>
                    </div>
                    <div class="_footer">
            <span class="_views medium-p1 c-gray-light">
              <span class="_count">32</span>Views
            </span><span class="_bookmark">
            <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <g clip-path="url(#clip0_204_2957)">
                <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
              </g>
              <defs>
                <clipPath id="clip0_204_2957">
                  <rect width="24.0923" height="24" transform="translate(0.0500488)"/>
                </clipPath>
              </defs>
            </svg>
          </span>
                    </div>
                </div>
            </div>
        </section>
        <!--질문과 답변-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    궁금한 사항을 무엇이든 편하게 물어보세요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low cursor-pointer">
                    <span class="my-auto">질문과 답변</span>
                    <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14584)">
                            <path d="M13.1727 12.0007L8.22266 7.05072L9.63666 5.63672L16.0007 12.0007L9.63666 18.3647L8.22266 16.9507L13.1727 12.0007Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14584">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                    <button type="button" class="ml-auto btn btn-md btn-brand bold-h4">
                        질문하기
                    </button>
                </div>
            </div>
            <div class="owl-carousel question-carousel">
                <div class="accordion question-accordion" id="accordionExample1">
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
                <div class="accordion question-accordion" id="accordionExample2">
                    <div class="card">
                        <div class="card-header" id="headingOne2">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseOne2"
                                        aria-expanded="false"
                                        aria-controls="collapseOne2">
                                    <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                </button>
                            </h2>
                            <div class="_arrow collapsed"
                                 data-toggle="collapse"
                                 data-target="#collapseOne2"
                                 aria-expanded="false"
                                 aria-controls="collapseOne2">
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                          fill="#A9CC52"></path>
                                </svg>
                            </div>
                        </div>
                        <div id="collapseOne2"
                             class="collapse"
                             aria-labelledby="headingOne2"
                             data-parent="#accordionExample2"
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
                    <div class="card">
                        <div class="card-header" id="headingOne3">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseOne3"
                                        aria-expanded="false"
                                        aria-controls="collapseOne3">
                                    <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                </button>
                            </h2>
                            <div class="_arrow collapsed"
                                 data-toggle="collapse"
                                 data-target="#collapseOne3"
                                 aria-expanded="false"
                                 aria-controls="collapseOne3">
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                          fill="#A9CC52"></path>
                                </svg>
                            </div>
                        </div>
                        <div id="collapseOne3"
                             class="collapse"
                             aria-labelledby="headingOne3"
                             data-parent="#accordionExample2"
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
                    <div class="card">
                        <div class="card-header" id="headingOne4">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseOne4"
                                        aria-expanded="false"
                                        aria-controls="collapseOne4">
                                    <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                </button>
                            </h2>
                            <div class="_arrow collapsed"
                                 data-toggle="collapse"
                                 data-target="#collapseOne4"
                                 aria-expanded="false"
                                 aria-controls="collapseOne4">
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                          fill="#A9CC52"></path>
                                </svg>
                            </div>
                        </div>
                        <div id="collapseOne4"
                             class="collapse"
                             aria-labelledby="headingOne4"
                             data-parent="#accordionExample2"
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
                    <div class="card">
                        <div class="card-header" id="headingOne5">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left medium-h4 collapsed"
                                        type="button"
                                        data-toggle="collapse"
                                        data-target="#collapseOne5"
                                        aria-expanded="false"
                                        aria-controls="collapseOne5">
                                    <span class="deco-text">Q. </span>양 &amp; 염소는 풀을 너무 많이 먹이면 안되나요?
                                </button>
                            </h2>
                            <div class="_arrow collapsed"
                                 data-toggle="collapse"
                                 data-target="#collapseOne5"
                                 aria-expanded="false"
                                 aria-controls="collapseOne5">
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                          fill="#A9CC52"></path>
                                </svg>
                            </div>
                        </div>
                        <div id="collapseOne5"
                             class="collapse"
                             aria-labelledby="headingOne5"
                             data-parent="#accordionExample2"
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
        </section>
        <!--다양한 축산 농가-->
        <section class="section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    많은 농가 분들이 정보와 노하우를 공유하며 축산을 진행하고 있어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low cursor-pointer">
                    다양한 축산 농가
                    <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14584)">
                            <path d="M13.1727 12.0007L8.22266 7.05072L9.63666 5.63672L16.0007 12.0007L9.63666 18.3647L8.22266 16.9507L13.1727 12.0007Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14584">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </div>
            </div>
            <div class="owl-carousel card-carousel">
                <div class="card farm-card">
                    <div class="background-image _thumbnail"
                         style="background-image: url('../resources/assets/images/sample/sample_profile_1.png')"></div>
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
                <div class="card farm-card">
                    <div class="background-image _thumbnail"
                         style="background-image: url('../resources/assets/images/sample/sample_profile_1.png')"></div>
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
                <div class="card farm-card">
                    <div class="background-image _thumbnail"
                         style="background-image: url('../resources/assets/images/sample/sample_profile_1.png')"></div>
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
                <div class="card farm-card">
                    <div class="background-image _thumbnail"
                         style="background-image: url('../resources/assets/images/sample/sample_profile_1.png')"></div>
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
                <div class="card farm-card">
                    <div class="background-image _thumbnail"
                         style="background-image: url('../resources/assets/images/sample/sample_profile_1.png')"></div>
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
                <div class="card farm-card">
                    <div class="background-image _thumbnail"
                         style="background-image: url('../resources/assets/images/sample/sample_profile_1.png')"></div>
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
        </section>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<jsp:include page="../common/bottom.jsp"/>

<jsp:include page="../common/script.jsp"/>

<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');

        $('.free-board').owlCarousel({
            loop: true,
            nav: false,
            dots: false,
            margin: 16,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 1,
                },
                768: {
                    items: 1,
                },
                960: {
                    items: 2,
                },
                1200: {
                    items: 2,
                },
            },
        });

        $('.question-carousel').owlCarousel({
            loop: false,
            nav: false,
            dots: false,
            margin: 16,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 1,
                },
                768: {
                    items: 1,
                },
                960: {
                    items: 2,
                },
                1200: {
                    items: 2,
                },
            },
        });

        $('.card-carousel').owlCarousel({
            loop: true,
            nav: false,
            dots: false,
            margin: 16,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 2,
                },
                768: {
                    items: 2,
                },
                960: {
                    items: 3,
                },
                1200: {
                    items: 4,
                },
            },
        });

        /** Modal Test */
        viewModal({
            vCenter: true,
            btnCount: 0,
            wCenter: true,
            title: 'Modal Center Test1',
            desc: 'Modal Desc Test1',
            onHidden: function (e) {
                viewAlert({content: 'Content Test'});
            }
        });
        viewModal({
            vCenter: true, btnCount: 2,
            wCenter: true,
            backDrop: true,
            title: 'Modal Center Test1', desc: 'Modal Desc Test1',
            confirm_text: '확인', cancel_text: '취소',
            onConfirm: function (e) {
                console.log('Confirm Button Click Callback', e.currentTarget);
            },
            onCancel: function (e) {
                console.log('Cancel Button Click Callback', e.currentTarget);
            },
            onShown: function (e) {
                console.log('Modal Show After Callback', e.currentTarget);
            },
            onHidden: function (e) {
                console.log('Modal Hide After Callback', e.currentTarget);
            },
            onShow: function (e) {
                console.log('Modal Show Before Callback', e.currentTarget);
            },
            onHide: function (e) {
                console.log('Modal Hide Before Callback', e.currentTarget);
            }
        });
        viewModal({
            vCenter: true, btnCount: 2,
            backDrop: true,
            title: 'Modal Test1', desc: 'Modal Desc Test1',
            confirm_text: '확인', cancel_text: '취소',
            onConfirm: function (e) {
                console.log('Confirm Button Click Callback', e.currentTarget);
            },
            onCancel: function (e) {
                console.log('Cancel Button Click Callback', e.currentTarget);
            },
        });

        viewModal({
            vCenter: true, btnCount: 1,
            backDrop: true,
            title: 'Modal Test2', desc: 'Modal Desc Test2',
            confirm_text: '확인', cancel_text: '취소',
            onConfirm: function (e) {
                console.log('Confirm Button Click Callback', e.currentTarget);
            },
            onCancel: function (e) {
                console.log('Cancel Button Click Callback', e.currentTarget);
            },
            onShown: function (e) {
                console.log('Modal Show After Callback', e.currentTarget);
            },
            onHidden: function (e) {
                console.log('Modal Hide After Callback', e.currentTarget);
            },
            onShow: function (e) {
                console.log('Modal Show Before Callback', e.currentTarget);
            },
            onHide: function (e) {
                console.log('Modal Hide Before Callback', e.currentTarget);
            }
        });
    });
</script>
<div class="bg-brand-green c-basic-white"></div>
</body>
</html>

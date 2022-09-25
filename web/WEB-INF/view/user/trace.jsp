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
            <div class="row">
                <div class="col-lg col-12 left-sidebar-container">
                    <div class="left-side-inner">
                        <div class="user-info">
                            <div class="_name">
                                <div class="bold-h4 c-gray-dark-low ellipsis-one-line">하은 축산</div>
                                <button type="button" class="ml-auto btn btn-sm btn-sm-xp btn-brand btn-icon">
                                    <span class="bold-h5 my-auto">농장 페이지 관리</span>
                                    <svg class="my-auto ml-8"
                                         width="16"
                                         height="16"
                                         viewBox="0 0 16 16"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_224_6192)">
                                            <path d="M3.55595 3.02988C4.24044 2.41674 5.04441 1.95188 5.91728 1.66455C6.16687 1.97723 6.48373 2.22964 6.8443 2.403C7.20486 2.57636 7.59987 2.66621 7.99995 2.66588C8.40003 2.66621 8.79504 2.57636 9.15561 2.403C9.51618 2.22964 9.83303 1.97723 10.0826 1.66455C10.9555 1.95188 11.7595 2.41674 12.444 3.02988C12.2983 3.40218 12.2384 3.80251 12.2686 4.20114C12.2988 4.59978 12.4185 4.98648 12.6186 5.33255C12.8183 5.67928 13.0937 5.97652 13.4241 6.20216C13.7546 6.42781 14.1316 6.57606 14.5273 6.63588C14.7143 7.53515 14.7143 8.46328 14.5273 9.36255C13.754 9.48122 13.0406 9.93588 12.6186 10.6659C12.4184 11.012 12.2987 11.3989 12.2684 11.7976C12.2382 12.1964 12.2982 12.5968 12.444 12.9692C11.7594 13.5821 10.9554 14.0468 10.0826 14.3339C9.83296 14.0213 9.51608 13.769 9.15552 13.5958C8.79495 13.4226 8.39998 13.3328 7.99995 13.3332C7.59987 13.3329 7.20486 13.4227 6.8443 13.5961C6.48373 13.7695 6.16687 14.0219 5.91728 14.3346C5.04446 14.0474 4.2405 13.5828 3.55595 12.9699C3.70172 12.5975 3.76171 12.197 3.73147 11.7983C3.70123 11.3995 3.58154 11.0127 3.38128 10.6666C3.18148 10.3199 2.90612 10.0228 2.57567 9.79731C2.24523 9.57178 1.8682 9.42363 1.47262 9.36388C1.28549 8.4644 1.28549 7.53603 1.47262 6.63655C1.86826 6.57673 2.24533 6.42848 2.57578 6.20283C2.90622 5.97718 3.18155 5.67994 3.38128 5.33322C3.58144 4.98715 3.70107 4.60045 3.73131 4.20181C3.76155 3.80318 3.70161 3.40285 3.55595 3.03055V3.02988ZM8.99995 9.73122C9.22924 9.60085 9.43048 9.42642 9.59209 9.21797C9.75369 9.00951 9.87246 8.77115 9.94157 8.5166C10.0107 8.26206 10.0288 7.99635 9.99476 7.7348C9.96076 7.47324 9.87536 7.22098 9.74348 6.99256C9.6116 6.76414 9.43583 6.56406 9.22631 6.40385C9.01679 6.24363 8.77764 6.12644 8.52264 6.05902C8.26764 5.9916 8.00183 5.97529 7.7405 6.01102C7.47917 6.04675 7.22749 6.13382 6.99995 6.26722C6.54434 6.53432 6.21287 6.97079 6.07788 7.48138C5.94288 7.99197 6.01533 8.53523 6.2794 8.99261C6.54348 9.44998 6.97774 9.78434 7.48742 9.92271C7.99711 10.0611 8.54083 9.99225 8.99995 9.73122Z"
                                                  fill="white"></path>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_224_6192">
                                                <rect width="16" height="16" fill="white"></rect>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </button>
                            </div>
                            <div class="_info">
                                <div class="media user-media">
                                    <div class="_profile background-image"
                                         style="background-image: url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                                    <div class="media-body">
                                        <div class="medium-h4 c-gray-dark-low">wljs11@naver.com</div>
                                        <div class="regular-h5 c-gray-dark-low">유병준</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="list-group _left-tabs">
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">홈</li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">책갈피</li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item is-active"
                                data-href="#">이력 관리
                            </li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">알림 설정
                            </li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">로그아웃
                            </li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">회원탈퇴
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8 col-12 right-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="_section pt-0">
                                <div class="_title-container">
                                    <span class="bold-h3">내가 작성한 이력</span>
                                    <div class="dropdown input-dropdown">
                                        <div data-toggle="dropdown" aria-expanded="false"
                                             class="form-group form-inner-button form-sm">
                                            <input type="text"
                                                   class="form-control input-box medium-h5 dropdown-input"
                                                   disabled="disabled"
                                                   value="축산 이력"
                                                   type="trace"
                                                   id="board-filter1">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip0_278_13355)">
                                                    <path d="M12 13.1727L16.95 8.22266L18.364 9.63666L12 16.0007L5.636 9.63666L7.05 8.22266L12 13.1727Z"
                                                          fill="#222222"></path>
                                                </g>
                                                <defs>
                                                    <clipPath id="clip0_278_13355">
                                                        <rect width="24" height="24" fill="white"
                                                              transform="translate(24) rotate(90)"></rect>
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </div>
                                        <div class="dropdown-menu dropdown-sm">
                                            <a data-type="trace" class="dropdown-item">
                                                <div>축산 이력</div>
                                            </a>
                                            <a data-type="bundle" class="dropdown-item">
                                                <div>묶음 이력</div>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="medium-h5 c-brand-green cursor-pointer _trace-make">
                                    이력 만들기
                                    <svg width="20"
                                         height="20"
                                         viewBox="0 0 20 20"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg"
                                         style="padding-bottom: 2px;">
                                        <g clip-path="url(#clip0_249_9073)">
                                            <path d="M9.16666 9.16602V4.16602H10.8333V9.16602H15.8333V10.8327H10.8333V15.8327H9.16666V10.8327H4.16666V9.16602H9.16666Z"
                                                  fill="#A9CC52"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_249_9073">
                                                <rect width="20" height="20" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </div>
                                <div class="_traces">
                                    <c:if test="${traces.size() > 0}">
                                        <div class="_trace mt-32">
                                            <div class="_bundle-header">
                                                <span class="bold-h2" data-code="L-0-220819-9763-101">L-0-220819-9763-101</span>
                                                <button type="button"
                                                        class="_qr btn btn-brand-opacity btn-block bold-h5">
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
                                    </c:if>
                                    <c:if test="${traces.size() <= 0}">
                                        <div class="bold-h2 c-gray-light" style="text-align: center">
                                            <span>등록된 이력이 없어요.</span>
                                        </div>
                                    </c:if>
                                </div>

                                <div class="medium-h5 c-brand-green cursor-pointer _bundle-make d-none">
                                    묶음 이력 만들기
                                    <svg width="20"
                                         height="20"
                                         viewBox="0 0 20 20"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg"
                                         style="padding-bottom: 2px;">
                                        <g clip-path="url(#clip0_249_9073)">
                                            <path d="M9.16666 9.16602V4.16602H10.8333V9.16602H15.8333V10.8327H10.8333V15.8327H9.16666V10.8327H4.16666V9.16602H9.16666Z"
                                                  fill="#A9CC52"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_249_9073">
                                                <rect width="20" height="20" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>

                                </div>
                                <div class="_bundles d-none">
                                    <div class="_bundle mt-32">
                                        <div class="_bundle-header">
                                            <span class="bold-h2"
                                                  data-code="L-0-220819-9763-101">L-0-220819-9763-101</span>
                                            <button type="button" class="_qr btn btn-brand-opacity btn-block bold-h5">
                                                QR 코드 다운로드
                                            </button>
                                        </div>
                                        <div class="_bundle-body">
                                            <span class="regular-h5" data-count="12">12개의 이력</span>
                                        </div>
                                        <div class="_bundle-bottom">
                                        <span class="medium-h5 c-brand-green cursor-pointer">이력 추가하기<svg
                                                style="padding-bottom: 1px;" width="20" height="20" viewBox="0 0 20 20"
                                                fill="none" xmlns="http://www.w3.org/2000/svg"><g
                                                clip-path="url(#clip0_249_9083)"><path
                                                d="M10.9767 10.0006L6.85165 5.8756L8.02999 4.69727L13.3333 10.0006L8.02999 15.3039L6.85165 14.1256L10.9767 10.0006Z"
                                                fill="#A9CC52"/></g><defs><clipPath id="clip0_249_9083"><rect width="20"
                                                                                                              height="20"
                                                                                                              fill="white"/></clipPath></defs></svg></span>
                                            <span class="regular-h5 _date">2023.12.12</span>
                                        </div>
                                    </div>
                                    <div class="bold-h2 c-gray-light" style="text-align: center">
                                        <span>등록된 묶음 이력이 없어요.</span>
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

<!-- Modal -->
<div class="modal fade" id="trace-created" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-md-max">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">이력 만들기</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">개체 축종</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 d-flex _animals">
                        <div class="_animal">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" data-category="${farmType}" type="radio" name="animal" checked>
                                <span class="design"></span>
                                <span class="ml-16">${farmType.korName}</span>
                            </label>
                        </div>
                    </div>
                </div>

                <c:if test="${farmType.manual_available eq false}">
                    <div class="row mt-32">
                        <div class="col-12">
                            <div class="form-group">
                                <label class="medium-h6 c-gray-dark-low">이력 번호 조회</label>
                                <div class="form-group form-inner-button">
                                    <input type="text" placeholder="이력 번호 입력" id="trace-search"
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
                    </div>
                </c:if>

                <c:if test="${farmType.manual_available}">
                    <div class="_self-create-area">
                        <div class="row mt-32">
                            <div class="col-6">
                                <div class="dropdown input-dropdown">
                                    <div data-toggle="dropdown" aria-expanded="false"
                                         class="form-group form-inner-button form-inner-label">
                                        <label class="medium-h6 c-gray-dark-low">등급</label>
                                        <input type="text"
                                               placeholder="등급을 선택해주세요."
                                               class="form-control input-box medium-h5 dropdown-input"
                                               disabled>
                                        <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_224_6214)">
                                                <path d="M15.3673 13.9999L9.59235 8.22489L11.242 6.57523L18.6667 13.9999L11.242 21.4246L9.59235 19.7749L15.3673 13.9999Z"
                                                      fill="#A9CC52"/>
                                            </g>
                                            <defs>
                                                <clipPath id="clip0_224_6214">
                                                    <rect width="28" height="28" fill="white"
                                                          transform="translate(0 28) rotate(-90)"/>
                                                </clipPath>
                                            </defs>
                                        </svg>
                                    </div>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item">
                                            <div>1++</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>1+</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>1등급</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>2등급</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>3등급</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group form-inner-button form-inner-label">
                                    <label class="medium-h6 c-gray-dark-low">출생 일자</label>
                                    <input type="text"
                                           data-provide="datepicker"
                                           readonly
                                           placeholder="Input Box + Icon"
                                           class="form-control input-box medium-h5 dropdown-input">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_224_6221)">
                                            <path d="M14.1667 2.49992H17.5C17.721 2.49992 17.933 2.58772 18.0893 2.744C18.2455 2.90028 18.3333 3.11224 18.3333 3.33325V16.6666C18.3333 16.8876 18.2455 17.0996 18.0893 17.2558C17.933 17.4121 17.721 17.4999 17.5 17.4999H2.5C2.27899 17.4999 2.06703 17.4121 1.91075 17.2558C1.75447 17.0996 1.66667 16.8876 1.66667 16.6666V3.33325C1.66667 3.11224 1.75447 2.90028 1.91075 2.744C2.06703 2.58772 2.27899 2.49992 2.5 2.49992H5.83333V0.833252H7.5V2.49992H12.5V0.833252H14.1667V2.49992ZM16.6667 7.49992V4.16659H14.1667V5.83325H12.5V4.16659H7.5V5.83325H5.83333V4.16659H3.33333V7.49992H16.6667ZM16.6667 9.16658H3.33333V15.8333H16.6667V9.16658ZM5 10.8333H9.16667V14.1666H5V10.8333Z"
                                                  fill="#A9CC52"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_224_6221">
                                                <rect width="20" height="20" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </div>

                            </div>

                        </div>

                        <div class="row mt-32">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="medium-h6 c-gray-dark-low">성별</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 d-flex flex-row">
                                <div class="mt-16">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" type="radio" name="radio1">
                                        <span class="design"></span>
                                        <span class="ml-16">수컷</span>
                                    </label>
                                </div>

                                <div class="mt-16 ml-24">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" type="radio" name="radio1">
                                        <span class="design"></span>
                                        <span class="ml-16">암컷</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-32">
                            <div class="col-12 p-20">
                                <ul class="nav nav-pills mb-3" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link mr-16 active" data-toggle="pill"
                                                data-target="#pills-breed" type="button" role="tab"
                                                aria-controls="pills-home"
                                                aria-selected="true">사육
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link mr-16" data-toggle="pill"
                                                data-target="#pills-slaughter"
                                                type="button" role="tab" aria-controls="pills-profile"
                                                aria-selected="false">도축
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" data-toggle="pill"
                                                data-target="#pills-processing"
                                                type="button" role="tab" aria-controls="pills-profile"
                                                aria-selected="false">가공
                                        </button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="pills-tabContent2">
                                    <!--사육 Tab-->
                                    <div class="tab-pane fade show active" id="pills-breed" role="tabpanel"
                                         aria-labelledby="pills-home-tab">

                                        <div class="row">
                                            <div class="col-12">
                                                <table class="table table-bordered trace-register-table">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">신고 구분</th>
                                                        <th scope="col">농장 경영자</th>
                                                        <th scope="col">농장 명</th>
                                                        <th scope="col">년 월일</th>
                                                        <th scope="col">소재지</th>
                                                        <th scope="col">삭제</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>전산 등록</td>
                                                        <td>유병준</td>
                                                        <td>오키위 축산</td>
                                                        <td>2012.02.12</td>
                                                        <td>서울특별시 남부순환로 1892 4층</td>
                                                        <td scope="row">
                                                            <svg class="_trace-breed-delete cursor-pointer" width="24"
                                                                 height="24" viewBox="0 0 24 24"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M12 1C5.925 1 1 5.925 1 12C1 18.075 5.925 23 12 23C18.075 23 23 18.075 23 12C23 5.925 18.075 1 12 1ZM15.707 9.707C15.8892 9.5184 15.99 9.2658 15.9877 9.0036C15.9854 8.7414 15.8802 8.49059 15.6948 8.30518C15.5094 8.11977 15.2586 8.0146 14.9964 8.01233C14.7342 8.01005 14.4816 8.11084 14.293 8.293L12 10.586L9.707 8.293C9.61475 8.19749 9.50441 8.12131 9.3824 8.0689C9.2604 8.01649 9.12918 7.9889 8.9964 7.98775C8.86362 7.9866 8.73194 8.0119 8.60905 8.06218C8.48615 8.11246 8.3745 8.18671 8.28061 8.28061C8.18671 8.3745 8.11246 8.48615 8.06218 8.60905C8.0119 8.73194 7.9866 8.86362 7.98775 8.9964C7.9889 9.12918 8.01649 9.2604 8.0689 9.3824C8.12131 9.50441 8.19749 9.61475 8.293 9.707L10.586 12L8.293 14.293C8.19749 14.3852 8.12131 14.4956 8.0689 14.6176C8.01649 14.7396 7.9889 14.8708 7.98775 15.0036C7.9866 15.1364 8.0119 15.2681 8.06218 15.391C8.11246 15.5139 8.18671 15.6255 8.28061 15.7194C8.3745 15.8133 8.48615 15.8875 8.60905 15.9378C8.73194 15.9881 8.86362 16.0134 8.9964 16.0123C9.12918 16.0111 9.2604 15.9835 9.3824 15.9311C9.50441 15.8787 9.61475 15.8025 9.707 15.707L12 13.414L14.293 15.707C14.4816 15.8892 14.7342 15.99 14.9964 15.9877C15.2586 15.9854 15.5094 15.8802 15.6948 15.6948C15.8802 15.5094 15.9854 15.2586 15.9877 14.9964C15.99 14.7342 15.8892 14.4816 15.707 14.293L13.414 12L15.707 9.707Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="row mt-24">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">신고 구분</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12 d-flex flex-row">
                                                <div class="mt-16">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" type="radio" name="radio1">
                                                        <span class="design"></span>
                                                        <span class="ml-16">등록</span>
                                                    </label>
                                                </div>

                                                <div class="mt-16 ml-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" type="radio" name="radio1">
                                                        <span class="design"></span>
                                                        <span class="ml-16">양도</span>
                                                    </label>
                                                </div>

                                                <div class="mt-16 ml-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" type="radio" name="radio1">
                                                        <span class="design"></span>
                                                        <span class="ml-16">출하</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장
                                                        경영자</label>
                                                    <input type="text"
                                                           placeholder="농장 경영자 명 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장
                                                        명</label>
                                                    <input type="text"
                                                           placeholder="농장 명 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 링크</label>
                                                    <input type="text"
                                                           placeholder="농장 링크 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <label class="medium-h6 c-gray-dark-low">소재지</label>
                                                <div class="form-group form-inner-button">
                                                    <input type="text" placeholder="주소를 입력해주세요."
                                                           class="form-control input-box medium-h5"
                                                           id="input20">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 23.7279L5.636 17.3639C4.37734 16.1052 3.52019 14.5016 3.17293 12.7558C2.82567 11.0099 3.00391 9.20035 3.6851 7.55582C4.36629 5.91129 5.51984 4.50569 6.99988 3.51677C8.47992 2.52784 10.22 2 12 2C13.78 2 15.5201 2.52784 17.0001 3.51677C18.4802 4.50569 19.6337 5.91129 20.3149 7.55582C20.9961 9.20035 21.1743 11.0099 20.8271 12.7558C20.4798 14.5016 19.6227 16.1052 18.364 17.3639L12 23.7279ZM16.95 15.9499C17.9289 14.9709 18.5955 13.7236 18.8656 12.3658C19.1356 11.0079 18.9969 9.60052 18.4671 8.32148C17.9373 7.04244 17.04 5.94923 15.8889 5.18009C14.7378 4.41095 13.3844 4.00043 12 4.00043C10.6156 4.00043 9.26222 4.41095 8.11109 5.18009C6.95996 5.94923 6.06275 7.04244 5.53292 8.32148C5.00308 9.60052 4.86442 11.0079 5.13445 12.3658C5.40449 13.7236 6.07111 14.9709 7.05 15.9499L12 20.8999L16.95 15.9499ZM12 12.9999C11.4696 12.9999 10.9609 12.7892 10.5858 12.4141C10.2107 12.0391 10 11.5304 10 10.9999C10 10.4695 10.2107 9.96078 10.5858 9.58571C10.9609 9.21064 11.4696 8.99992 12 8.99992C12.5304 8.99992 13.0391 9.21064 13.4142 9.58571C13.7893 9.96078 14 10.4695 14 10.9999C14 11.5304 13.7893 12.0391 13.4142 12.4141C13.0391 12.7892 12.5304 12.9999 12 12.9999Z"
                                                              fill="#A9CC52"/>
                                                    </svg>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">상세 주소</label>
                                                    <input type="text"
                                                           placeholder="상세주소 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                            <span class="card-text _farm-type bold-h5 c-brand-green">
                                                                사육 정보 추가 +
                                                            </span>
                                            </div>
                                        </div>


                                    </div>

                                    <!--도축 Tab-->
                                    <div class="tab-pane fade" id="pills-slaughter" role="tabpanel"
                                         aria-labelledby="pills-profile-tab">

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">도축 결과</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12 d-flex flex-row">
                                                <div class="mt-16">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" type="radio" name="radio1">
                                                        <span class="design"></span>
                                                        <span class="ml-16">합격</span>
                                                    </label>
                                                </div>

                                                <div class="mt-16 ml-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" type="radio" name="radio1">
                                                        <span class="design"></span>
                                                        <span class="ml-16">불합격</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 명</label>
                                                    <input type="text"
                                                           placeholder="농장 명 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group form-inner-button form-inner-label">
                                                    <label class="medium-h6 c-gray-dark-low">도축 일자</label>
                                                    <input type="text"
                                                           data-provide="datepicker"
                                                           readonly
                                                           value="2022-07-02"
                                                           placeholder="Input Box + Icon"
                                                           class="form-control input-box medium-h5 dropdown-input">
                                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <g clip-path="url(#clip0_224_6221)">
                                                            <path d="M14.1667 2.49992H17.5C17.721 2.49992 17.933 2.58772 18.0893 2.744C18.2455 2.90028 18.3333 3.11224 18.3333 3.33325V16.6666C18.3333 16.8876 18.2455 17.0996 18.0893 17.2558C17.933 17.4121 17.721 17.4999 17.5 17.4999H2.5C2.27899 17.4999 2.06703 17.4121 1.91075 17.2558C1.75447 17.0996 1.66667 16.8876 1.66667 16.6666V3.33325C1.66667 3.11224 1.75447 2.90028 1.91075 2.744C2.06703 2.58772 2.27899 2.49992 2.5 2.49992H5.83333V0.833252H7.5V2.49992H12.5V0.833252H14.1667V2.49992ZM16.6667 7.49992V4.16659H14.1667V5.83325H12.5V4.16659H7.5V5.83325H5.83333V4.16659H3.33333V7.49992H16.6667ZM16.6667 9.16658H3.33333V15.8333H16.6667V9.16658ZM5 10.8333H9.16667V14.1666H5V10.8333Z"
                                                                  fill="#A9CC52"/>
                                                        </g>
                                                        <defs>
                                                            <clipPath id="clip0_224_6221">
                                                                <rect width="20" height="20" fill="white"/>
                                                            </clipPath>
                                                        </defs>
                                                    </svg>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 링크</label>
                                                    <input type="text"
                                                           placeholder="농장 링크 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <label class="medium-h6 c-gray-dark-low">소재지</label>
                                                <div class="form-group form-inner-button">
                                                    <input type="text" placeholder="주소를 입력해주세요."
                                                           class="form-control input-box medium-h5"
                                                           id="input21">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 23.7279L5.636 17.3639C4.37734 16.1052 3.52019 14.5016 3.17293 12.7558C2.82567 11.0099 3.00391 9.20035 3.6851 7.55582C4.36629 5.91129 5.51984 4.50569 6.99988 3.51677C8.47992 2.52784 10.22 2 12 2C13.78 2 15.5201 2.52784 17.0001 3.51677C18.4802 4.50569 19.6337 5.91129 20.3149 7.55582C20.9961 9.20035 21.1743 11.0099 20.8271 12.7558C20.4798 14.5016 19.6227 16.1052 18.364 17.3639L12 23.7279ZM16.95 15.9499C17.9289 14.9709 18.5955 13.7236 18.8656 12.3658C19.1356 11.0079 18.9969 9.60052 18.4671 8.32148C17.9373 7.04244 17.04 5.94923 15.8889 5.18009C14.7378 4.41095 13.3844 4.00043 12 4.00043C10.6156 4.00043 9.26222 4.41095 8.11109 5.18009C6.95996 5.94923 6.06275 7.04244 5.53292 8.32148C5.00308 9.60052 4.86442 11.0079 5.13445 12.3658C5.40449 13.7236 6.07111 14.9709 7.05 15.9499L12 20.8999L16.95 15.9499ZM12 12.9999C11.4696 12.9999 10.9609 12.7892 10.5858 12.4141C10.2107 12.0391 10 11.5304 10 10.9999C10 10.4695 10.2107 9.96078 10.5858 9.58571C10.9609 9.21064 11.4696 8.99992 12 8.99992C12.5304 8.99992 13.0391 9.21064 13.4142 9.58571C13.7893 9.96078 14 10.4695 14 10.9999C14 11.5304 13.7893 12.0391 13.4142 12.4141C13.0391 12.7892 12.5304 12.9999 12 12.9999Z"
                                                              fill="#A9CC52"/>
                                                    </svg>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">상세 주소</label>
                                                    <input type="text"
                                                           placeholder="상세주소 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <!--가공 Tab-->
                                    <div class="tab-pane fade" id="pills-processing" role="tabpanel"
                                         aria-labelledby="pills-profile-tab">

                                        <div class="row">
                                            <div class="col-12">
                                                <table class="table table-bordered trace-register-table">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">업소 명</th>
                                                        <th scope="col">소재지</th>
                                                        <th scope="col">삭제</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>오키위 축산</td>
                                                        <td>서울특별시 남부순환로 1892 4층</td>
                                                        <td scope="row">
                                                            <svg width="24" height="24" viewBox="0 0 24 24"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M12 1C5.925 1 1 5.925 1 12C1 18.075 5.925 23 12 23C18.075 23 23 18.075 23 12C23 5.925 18.075 1 12 1ZM15.707 9.707C15.8892 9.5184 15.99 9.2658 15.9877 9.0036C15.9854 8.7414 15.8802 8.49059 15.6948 8.30518C15.5094 8.11977 15.2586 8.0146 14.9964 8.01233C14.7342 8.01005 14.4816 8.11084 14.293 8.293L12 10.586L9.707 8.293C9.61475 8.19749 9.50441 8.12131 9.3824 8.0689C9.2604 8.01649 9.12918 7.9889 8.9964 7.98775C8.86362 7.9866 8.73194 8.0119 8.60905 8.06218C8.48615 8.11246 8.3745 8.18671 8.28061 8.28061C8.18671 8.3745 8.11246 8.48615 8.06218 8.60905C8.0119 8.73194 7.9866 8.86362 7.98775 8.9964C7.9889 9.12918 8.01649 9.2604 8.0689 9.3824C8.12131 9.50441 8.19749 9.61475 8.293 9.707L10.586 12L8.293 14.293C8.19749 14.3852 8.12131 14.4956 8.0689 14.6176C8.01649 14.7396 7.9889 14.8708 7.98775 15.0036C7.9866 15.1364 8.0119 15.2681 8.06218 15.391C8.11246 15.5139 8.18671 15.6255 8.28061 15.7194C8.3745 15.8133 8.48615 15.8875 8.60905 15.9378C8.73194 15.9881 8.86362 16.0134 8.9964 16.0123C9.12918 16.0111 9.2604 15.9835 9.3824 15.9311C9.50441 15.8787 9.61475 15.8025 9.707 15.707L12 13.414L14.293 15.707C14.4816 15.8892 14.7342 15.99 14.9964 15.9877C15.2586 15.9854 15.5094 15.8802 15.6948 15.6948C15.8802 15.5094 15.9854 15.2586 15.9877 14.9964C15.99 14.7342 15.8892 14.4816 15.707 14.293L13.414 12L15.707 9.707Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="row mt-24">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 명</label>
                                                    <input type="text"
                                                           placeholder="농장 명 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group form-inner-button form-inner-label">
                                                    <label class="medium-h6 c-gray-dark-low">가공 일자</label>
                                                    <input type="text"
                                                           data-provide="datepicker"
                                                           readonly
                                                           value="2022-07-02"
                                                           placeholder="Input Box + Icon"
                                                           class="form-control input-box medium-h5 dropdown-input">
                                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <g clip-path="url(#clip0_224_6221)">
                                                            <path d="M14.1667 2.49992H17.5C17.721 2.49992 17.933 2.58772 18.0893 2.744C18.2455 2.90028 18.3333 3.11224 18.3333 3.33325V16.6666C18.3333 16.8876 18.2455 17.0996 18.0893 17.2558C17.933 17.4121 17.721 17.4999 17.5 17.4999H2.5C2.27899 17.4999 2.06703 17.4121 1.91075 17.2558C1.75447 17.0996 1.66667 16.8876 1.66667 16.6666V3.33325C1.66667 3.11224 1.75447 2.90028 1.91075 2.744C2.06703 2.58772 2.27899 2.49992 2.5 2.49992H5.83333V0.833252H7.5V2.49992H12.5V0.833252H14.1667V2.49992ZM16.6667 7.49992V4.16659H14.1667V5.83325H12.5V4.16659H7.5V5.83325H5.83333V4.16659H3.33333V7.49992H16.6667ZM16.6667 9.16658H3.33333V15.8333H16.6667V9.16658ZM5 10.8333H9.16667V14.1666H5V10.8333Z"
                                                                  fill="#A9CC52"/>
                                                        </g>
                                                        <defs>
                                                            <clipPath id="clip0_224_6221">
                                                                <rect width="20" height="20" fill="white"/>
                                                            </clipPath>
                                                        </defs>
                                                    </svg>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 링크</label>
                                                    <input type="text"
                                                           placeholder="농장 링크 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <label class="medium-h6 c-gray-dark-low">소재지</label>
                                                <div class="form-group form-inner-button">
                                                    <input type="text" placeholder="주소를 입력해주세요."
                                                           class="form-control input-box medium-h5"
                                                           id="input22">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 23.7279L5.636 17.3639C4.37734 16.1052 3.52019 14.5016 3.17293 12.7558C2.82567 11.0099 3.00391 9.20035 3.6851 7.55582C4.36629 5.91129 5.51984 4.50569 6.99988 3.51677C8.47992 2.52784 10.22 2 12 2C13.78 2 15.5201 2.52784 17.0001 3.51677C18.4802 4.50569 19.6337 5.91129 20.3149 7.55582C20.9961 9.20035 21.1743 11.0099 20.8271 12.7558C20.4798 14.5016 19.6227 16.1052 18.364 17.3639L12 23.7279ZM16.95 15.9499C17.9289 14.9709 18.5955 13.7236 18.8656 12.3658C19.1356 11.0079 18.9969 9.60052 18.4671 8.32148C17.9373 7.04244 17.04 5.94923 15.8889 5.18009C14.7378 4.41095 13.3844 4.00043 12 4.00043C10.6156 4.00043 9.26222 4.41095 8.11109 5.18009C6.95996 5.94923 6.06275 7.04244 5.53292 8.32148C5.00308 9.60052 4.86442 11.0079 5.13445 12.3658C5.40449 13.7236 6.07111 14.9709 7.05 15.9499L12 20.8999L16.95 15.9499ZM12 12.9999C11.4696 12.9999 10.9609 12.7892 10.5858 12.4141C10.2107 12.0391 10 11.5304 10 10.9999C10 10.4695 10.2107 9.96078 10.5858 9.58571C10.9609 9.21064 11.4696 8.99992 12 8.99992C12.5304 8.99992 13.0391 9.21064 13.4142 9.58571C13.7893 9.96078 14 10.4695 14 10.9999C14 11.5304 13.7893 12.0391 13.4142 12.4141C13.0391 12.7892 12.5304 12.9999 12 12.9999Z"
                                                              fill="#A9CC52"/>
                                                    </svg>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">상세 주소</label>
                                                    <input type="text"
                                                           placeholder="상세주소 입력"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                            <span class="card-text _farm-type bold-h5 c-brand-green">
                                                                가공 정보 추가 +
                                                            </span>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </c:if>


            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4">
                    만들기
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="package-trace-created" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">묶음 이력 만들기</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">개체 축종</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="mt-16">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">양 & 염소</span>
                            </label>
                        </div>
                        <div class="mt-16 ml-24">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">말</span>
                            </label>
                        </div>
                        <div class="mt-16 ml-24">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">돼지</span>
                            </label>
                        </div>
                        <div class="mt-16 ml-24">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">소</span>
                            </label>
                        </div>
                        <div class="mt-16 ml-24">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">닭 & 계란</span>
                            </label>
                        </div>
                        <div class="mt-16 ml-24">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">토끼</span>
                            </label>
                        </div>
                        <div class="mt-16 ml-24">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" type="radio" name="radio1">
                                <span class="design"></span>
                                <span class="ml-16">오리</span>
                            </label>
                        </div>
                    </div>


                </div>

                <div class="row mt-32">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">묶음 번호 조회</label>
                            <div class="form-group form-inner-button">
                                <input type="text" placeholder="묶음 번호 또는 이력번호 입력"
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
                </div>

                <div class="row mt-24">
                    <div class="col-12">
                        <div class="trace-register-item">
                            <span class="bold-h5">1001 2645 4999</span>
                            <span class="regular-h5">양 & 염소</span>
                            <span class="regular-h5">1++</span>
                            <span class="regular-h5">수컷</span>
                            <span class="regular-h5 mr-auto">2023.12.12 출생</span>
                            <button type="button"
                                    class="btn btn-sm btn-brand-opacity bold-h5 ml-auto">
                                이력 추가하기
                            </button>
                        </div>
                    </div>
                </div>


                <div class="row mt-24">
                    <div class="col-12">
                        <table class="table table-bordered trace-register-table">
                            <thead>
                            <tr>
                                <th scope="col">이력 번호</th>
                                <th scope="col">등급</th>
                                <th scope="col">사용자</th>
                                <th scope="col">소재지</th>
                                <th scope="col">삭제</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>01332323214</td>
                                <td>1++</td>
                                <td>오키위 축산</td>
                                <td>서울특별시 남부순환로 1892</td>
                                <td scope="row">
                                    <svg width="24" height="24" viewBox="0 0 24 24"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              clip-rule="evenodd"
                                              d="M12 1C5.925 1 1 5.925 1 12C1 18.075 5.925 23 12 23C18.075 23 23 18.075 23 12C23 5.925 18.075 1 12 1ZM15.707 9.707C15.8892 9.5184 15.99 9.2658 15.9877 9.0036C15.9854 8.7414 15.8802 8.49059 15.6948 8.30518C15.5094 8.11977 15.2586 8.0146 14.9964 8.01233C14.7342 8.01005 14.4816 8.11084 14.293 8.293L12 10.586L9.707 8.293C9.61475 8.19749 9.50441 8.12131 9.3824 8.0689C9.2604 8.01649 9.12918 7.9889 8.9964 7.98775C8.86362 7.9866 8.73194 8.0119 8.60905 8.06218C8.48615 8.11246 8.3745 8.18671 8.28061 8.28061C8.18671 8.3745 8.11246 8.48615 8.06218 8.60905C8.0119 8.73194 7.9866 8.86362 7.98775 8.9964C7.9889 9.12918 8.01649 9.2604 8.0689 9.3824C8.12131 9.50441 8.19749 9.61475 8.293 9.707L10.586 12L8.293 14.293C8.19749 14.3852 8.12131 14.4956 8.0689 14.6176C8.01649 14.7396 7.9889 14.8708 7.98775 15.0036C7.9866 15.1364 8.0119 15.2681 8.06218 15.391C8.11246 15.5139 8.18671 15.6255 8.28061 15.7194C8.3745 15.8133 8.48615 15.8875 8.60905 15.9378C8.73194 15.9881 8.86362 16.0134 8.9964 16.0123C9.12918 16.0111 9.2604 15.9835 9.3824 15.9311C9.50441 15.8787 9.61475 15.8025 9.707 15.707L12 13.414L14.293 15.707C14.4816 15.8892 14.7342 15.99 14.9964 15.9877C15.2586 15.9854 15.5094 15.8802 15.6948 15.6948C15.8802 15.5094 15.9854 15.2586 15.9877 14.9964C15.99 14.7342 15.8892 14.4816 15.707 14.293L13.414 12L15.707 9.707Z"
                                              fill="#A9CC52"/>
                                    </svg>
                                </td>
                            </tr>
                            <tr>
                                <td>01332323214</td>
                                <td>1++</td>
                                <td>오키위 축산</td>
                                <td>서울특별시 남부순환로 1892</td>
                                <td scope="row">
                                    <svg width="24" height="24" viewBox="0 0 24 24"
                                         fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              clip-rule="evenodd"
                                              d="M12 1C5.925 1 1 5.925 1 12C1 18.075 5.925 23 12 23C18.075 23 23 18.075 23 12C23 5.925 18.075 1 12 1ZM15.707 9.707C15.8892 9.5184 15.99 9.2658 15.9877 9.0036C15.9854 8.7414 15.8802 8.49059 15.6948 8.30518C15.5094 8.11977 15.2586 8.0146 14.9964 8.01233C14.7342 8.01005 14.4816 8.11084 14.293 8.293L12 10.586L9.707 8.293C9.61475 8.19749 9.50441 8.12131 9.3824 8.0689C9.2604 8.01649 9.12918 7.9889 8.9964 7.98775C8.86362 7.9866 8.73194 8.0119 8.60905 8.06218C8.48615 8.11246 8.3745 8.18671 8.28061 8.28061C8.18671 8.3745 8.11246 8.48615 8.06218 8.60905C8.0119 8.73194 7.9866 8.86362 7.98775 8.9964C7.9889 9.12918 8.01649 9.2604 8.0689 9.3824C8.12131 9.50441 8.19749 9.61475 8.293 9.707L10.586 12L8.293 14.293C8.19749 14.3852 8.12131 14.4956 8.0689 14.6176C8.01649 14.7396 7.9889 14.8708 7.98775 15.0036C7.9866 15.1364 8.0119 15.2681 8.06218 15.391C8.11246 15.5139 8.18671 15.6255 8.28061 15.7194C8.3745 15.8133 8.48615 15.8875 8.60905 15.9378C8.73194 15.9881 8.86362 16.0134 8.9964 16.0123C9.12918 16.0111 9.2604 15.9835 9.3824 15.9311C9.50441 15.8787 9.61475 15.8025 9.707 15.707L12 13.414L14.293 15.707C14.4816 15.8892 14.7342 15.99 14.9964 15.9877C15.2586 15.9854 15.5094 15.8802 15.6948 15.6948C15.8802 15.5094 15.9854 15.2586 15.9877 14.9964C15.99 14.7342 15.8892 14.4816 15.707 14.293L13.414 12L15.707 9.707Z"
                                              fill="#A9CC52"/>
                                    </svg>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4">
                    만들기
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/script.jsp"/>
<script src="/resources/js/page/user-trace.js"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');

        $('._trace-make').on('click', function () {
            $('#trace-created').modal('show');
        })

        $('._bundle-make').on('click', function () {
            $('#package-trace-created').modal('show');
        })
        /** Comment reply */
        $('._reply').on('click', '._do', function () {
            let t = this;
            let $t = $(this);
            $t.parent().append('<span class="medium-h5 c-basic-black _cancel">취소</span>');
            $(t.closest('.comment-container')).append('<div class="form-group form-inner-button">\n' +
                '                        <input type="text" placeholder="답글을 입력하세요." class="form-control input-box medium-h5"\n' +
                '                               id="input7">\n' +
                '                        <button type="button" class="btn btn-sm btn-brand bold-h5">\n' +
                '                            작성\n' +
                '                        </button>\n' +
                '                    </div>');
            $t.remove();
            // input show

        }).on('click', '._cancel', function () {
            let t = this;
            let $t = $(this);
            $t.parent().append('<span class="medium-h5 c-basic-black _do">답글</span>');
            $(t.closest('.comment-container')).find('.form-group.form-inner-button').remove();
            $t.remove();
            // input remove
        }).on('click', '._delete', function () {
            alert('삭제 버튼');
        });

        $('._comment ._transactions ._responds ._like').on('click', function () {
            let $number_span = $(this).find('span');
            if ($(this).hasClass('is-active')) {
                $(this).removeClass('is-active');
                $number_span.html(($number_span.html() * 1 - 1));
            } else {
                $(this).addClass('is-active');
                $number_span.html(($number_span.html() * 1 + 1));
            }
        });

        $('._comment ._transactions ._responds ._dislike').on('click', function () {
            let $number_span = $(this).find('span');
            if ($(this).hasClass('is-active')) {
                $(this).removeClass('is-active');
                $number_span.html(($number_span.html() * 1 - 1));
            } else {
                $(this).addClass('is-active');
                $number_span.html(($number_span.html() * 1 + 1));
            }
        });

        /** Dropdown */
        $('.dropdown-menu').on('click', 'a.dropdown-item', function (event) {
            let dropdown_item = this;
            let type = dropdown_item.dataset.type;
            let input = dropdown_item.closest('.dropdown').querySelector('input');
            if (input.type !== type) {
                if (type === 'trace') {
                    $('._trace-make').removeClass('d-none');
                    $('._traces').removeClass('d-none');
                    $('._bundles').addClass('d-none');
                    $('._bundle-make').addClass('d-none');
                    // TODO Call List FETCH
                } else if (type === 'bundle') {
                    $('._trace-make').addClass('d-none');
                    $('._traces').addClass('d-none');
                    $('._bundles').removeClass('d-none');
                    $('._bundle-make').removeClass('d-none');
                    // TODO Call List FETCH
                }
            }
        });

        $('input[data-provide="datepicker"]').datepicker({
            format: 'yyyy년 mm월 dd일',
            endDate: 'today',
            language: 'ko',
            todayHighlight: true,
            defaultViewDate: 'today',
            autoclose: true
        }).datepicker('setDate', 'now');
    });
</script>
</body>

</html>

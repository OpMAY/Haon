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
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item is-active" data-href="#">책갈피</li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">이력 관리</li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">알림 설정</li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">로그아웃</li>
                            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="#">회원탈퇴</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8 col-12 right-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="_section pt-0">
                                <div class="_title-container">
                                    <span class="bold-h3">내가 책갈피한 게시글</span>
                                    <div class="dropdown input-dropdown">
                                        <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                            <input type="text"
                                                   class="form-control input-box medium-h5 dropdown-input"
                                                   disabled="disabled"
                                                   value="자유게시판"
                                                   id="board-filter1">
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
                                            <a data-type="boards" class="dropdown-item">
                                                <div>자유 게시판</div>
                                            </a>
                                            <a data-type="tips" class="dropdown-item">
                                                <div>팁과 노하우</div>
                                            </a>
                                            <a data-type="manuals" class="dropdown-item">
                                                <div>축산 메뉴얼</div>
                                            </a>
                                            <a data-type="questions" class="dropdown-item">
                                                <div>질문과 답변</div>
                                            </a>
                                            <a data-type="magazines" class="dropdown-item">
                                                <div>최신 매거진</div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="boards" role="tabpanel" aria-labelledby="boards">
                                        <div class="_board-list _comment-board-list">
                                            <div class="_comment_board-item">
                                                <div class="_board-container" data-no="1" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">[축산 메뉴얼] 양 & 염소는 풀을 너무 많이 먹이고 하네요.</span>
                                                    </div>
                                                    <div class="_info d-flex">
                                                        <div data-href="#">
                                                            <svg width="32"
                                                                 height="32"
                                                                 viewBox="0 0 32 32"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="_paragraph regular-h5 c-brand-green">
                                                    새로운 댓글이 달렸어요!
                                                </div>
                                            </div>
                                            <div class="_comment_board-item">
                                                <div class="_board-container" data-no="1" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">[축산 메뉴얼] 양 & 염소는 풀을 너무 많이 먹이고 하네요.</span>
                                                    </div>
                                                    <div class="_info d-flex">
                                                        <div data-href="#">
                                                            <svg width="32"
                                                                 height="32"
                                                                 viewBox="0 0 32 32"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="_paragraph regular-h5 c-brand-green">
                                                    새로운 댓글이 달렸어요!
                                                </div>
                                            </div>
                                            <div class="_comment_board-item">
                                                <div class="_board-container" data-no="1" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">[축산 메뉴얼] 양 & 염소는 풀을 너무 많이 먹이고 하네요.</span>
                                                    </div>
                                                    <div class="_info d-flex">
                                                        <div data-href="#">
                                                            <svg width="32"
                                                                 height="32"
                                                                 viewBox="0 0 32 32"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="_paragraph regular-h5 c-brand-green">
                                                    새로운 댓글이 달렸어요!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tips" role="tabpanel" aria-labelledby="tips">
                                        <div class="row row-cols-3 community-container-deck">
                                            <div class="col p-8 d-flex align-items-stretch">
                                                <div class="card community-card">
                                                    <div class="_close">
                                                        <svg width="32"
                                                             height="32"
                                                             viewBox="0 0 32 32"
                                                             fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <circle cx="16" cy="16" r="14" fill="white"/>
                                                            <path fill-rule="evenodd"
                                                                  clip-rule="evenodd"
                                                                  d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                  fill="#A9CC52"/>
                                                        </svg>
                                                    </div>
                                                    <div class="background-image _thumbnail"
                                                         style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                                                        <div class="background-image _profile"
                                                             style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                                                    </div>
                                                    <div class="card-body _body">
                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                                        <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을
                                                            공유했어요!</div>
                                                    </div>
                                                    <div class="_footer">
                            <span class="_views medium-p1 c-gray-light">
                              <span class="_count">32</span>Views
                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col p-8 d-flex align-items-stretch">
                                                <div class="card community-card is-empty">
                                                    <div class="_close">
                                                        <svg width="32"
                                                             height="32"
                                                             viewBox="0 0 32 32"
                                                             fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <circle cx="16" cy="16" r="14" fill="white"></circle>
                                                            <path fill-rule="evenodd"
                                                                  clip-rule="evenodd"
                                                                  d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                  fill="#A9CC52"></path>
                                                        </svg>
                                                    </div>
                                                    <div class="card-body _body">
                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                                        <div class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem
                                                            explicabo fugit, laudantium minus nam pariatur quibusdam quidem quod recusandae reiciendis
                                                            sunt voluptate voluptatum. Aut, cum.</div>
                                                    </div>
                                                    <div class="_footer">
                            <span class="_views medium-p1 c-gray-light">
                              <span class="_count">32</span>Views
                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="manuals" role="tabpanel" aria-labelledby="manuals">
                                        <div class="row row-cols-3 community-container-deck">
                                            <div class="col p-8 d-flex align-items-stretch">
                                                <div class="card community-card">
                                                    <div class="_close">
                                                        <svg width="32"
                                                             height="32"
                                                             viewBox="0 0 32 32"
                                                             fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <circle cx="16" cy="16" r="14" fill="white"/>
                                                            <path fill-rule="evenodd"
                                                                  clip-rule="evenodd"
                                                                  d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                  fill="#A9CC52"/>
                                                        </svg>
                                                    </div>
                                                    <div class="background-image _thumbnail"
                                                         style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                                                        <div class="background-image _profile"
                                                             style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                                                    </div>
                                                    <div class="card-body _body">
                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                                        <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을
                                                            공유했어요!</div>
                                                    </div>
                                                    <div class="_footer">
                            <span class="_views medium-p1 c-gray-light">
                              <span class="_count">32</span>Views
                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col p-8 d-flex align-items-stretch">
                                                <div class="card community-card is-empty">
                                                    <div class="_close">
                                                        <svg width="32"
                                                             height="32"
                                                             viewBox="0 0 32 32"
                                                             fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <circle cx="16" cy="16" r="14" fill="white"></circle>
                                                            <path fill-rule="evenodd"
                                                                  clip-rule="evenodd"
                                                                  d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                  fill="#A9CC52"></path>
                                                        </svg>
                                                    </div>
                                                    <div class="card-body _body">
                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                                        <div class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem
                                                            explicabo fugit, laudantium minus nam pariatur quibusdam quidem quod recusandae reiciendis
                                                            sunt voluptate voluptatum. Aut, cum.</div>
                                                    </div>
                                                    <div class="_footer">
                            <span class="_views medium-p1 c-gray-light">
                              <span class="_count">32</span>Views
                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="questions" role="tabpanel" aria-labelledby="questions">
                                        <div class="_board-list _comment-board-list">
                                            <div class="_comment_board-item">
                                                <div class="_board-container" data-no="1" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">[질문과 답변] Q. 양 & 염소는 풀을 너무 많이 먹이고 하네요.</span>
                                                    </div>
                                                    <div class="_info d-flex">
                                                        <div data-href="#">
                                                            <svg width="32"
                                                                 height="32"
                                                                 viewBox="0 0 32 32"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="_paragraph regular-h5 c-brand-green">
                                                    새로운 댓글이 달렸어요!
                                                </div>
                                            </div>
                                            <div class="_comment_board-item">
                                                <div class="_board-container" data-no="1" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">[축산 메뉴얼] 양 & 염소는 풀을 너무 많이 먹이고 하네요.</span>
                                                    </div>
                                                    <div class="_info d-flex">
                                                        <div data-href="#">
                                                            <svg width="32"
                                                                 height="32"
                                                                 viewBox="0 0 32 32"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="_paragraph regular-h5 c-brand-green">
                                                    새로운 댓글이 달렸어요!
                                                </div>
                                            </div>
                                            <div class="_comment_board-item">
                                                <div class="_board-container" data-no="1" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">[축산 메뉴얼] 양 & 염소는 풀을 너무 많이 먹이고 하네요.</span>
                                                    </div>
                                                    <div class="_info d-flex">
                                                        <div data-href="#">
                                                            <svg width="32"
                                                                 height="32"
                                                                 viewBox="0 0 32 32"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="_paragraph regular-h5 c-brand-green">
                                                    새로운 댓글이 달렸어요!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="magazines" role="tabpanel" aria-labelledby="magazines">
                                        <div class="row row-cols-3 community-container-deck">
                                            <div class="col p-8 d-flex align-items-stretch">
                                                <div class="card community-card">
                                                    <div class="_close">
                                                        <svg width="32"
                                                             height="32"
                                                             viewBox="0 0 32 32"
                                                             fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <circle cx="16" cy="16" r="14" fill="white"/>
                                                            <path fill-rule="evenodd"
                                                                  clip-rule="evenodd"
                                                                  d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                  fill="#A9CC52"/>
                                                        </svg>
                                                    </div>
                                                    <div class="background-image _thumbnail _thumbnail-lg"
                                                         style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                                                        <div class="background-image _profile"
                                                             style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                                                    </div>
                                                    <div class="card-body _body">
                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                                        <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을
                                                            공유했어요!</div>
                                                    </div>
                                                    <div class="_footer">
                            <span class="_views medium-p1 c-gray-light">
                              <span class="_count">32</span>Views
                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col p-8 d-flex align-items-stretch">
                                                <div class="card community-card is-empty">
                                                    <div class="_close">
                                                        <svg width="32"
                                                             height="32"
                                                             viewBox="0 0 32 32"
                                                             fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <circle cx="16" cy="16" r="14" fill="white"></circle>
                                                            <path fill-rule="evenodd"
                                                                  clip-rule="evenodd"
                                                                  d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                  fill="#A9CC52"></path>
                                                        </svg>
                                                    </div>
                                                    <div class="card-body _body">
                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                                        <div class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet,
                                                            consectetur adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem
                                                            explicabo fugit, laudantium minus nam pariatur quibusdam quidem quod recusandae reiciendis
                                                            sunt voluptate voluptatum. Aut, cum.</div>
                                                    </div>
                                                    <div class="_footer">
                            <span class="_views medium-p1 c-gray-light">
                              <span class="_count">32</span>Views
                            </span>
                                                    </div>
                                                </div>
                                            </div>
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

            let tabs = $('#myTabContent .tab-pane');
            tabs.each(function (index, tab) {
                if (tab.id !== type) {
                    if (tab.classList.contains('show')) {
                        tab.classList.remove('show');
                        tab.classList.remove('active');
                    }
                } else {
                    if (!tab.classList.contains('show')) {
                        tab.classList.add('show');
                        tab.classList.add('active');
                    }
                }
            });
        });
    });
</script>
</body>

</html>

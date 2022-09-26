<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/mobile-header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/left-sidebar.jsp"/>
<jsp:include page="../common/right-sidebar.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-trace.jsp"/>
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
                                    <span class="bold-h3">이력 관리</span>
                                    <div class="dropdown input-dropdown">
                                        <div data-toggle="dropdown" aria-expanded="false"
                                             class="form-group form-inner-button form-sm">
                                            <input type="text"
                                                   class="form-control input-box medium-h5 dropdown-input"
                                                   disabled="disabled"
                                                   value="축산 이력"
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
                                            <a data-type="boards" class="dropdown-item">
                                                <div>축산 이력</div>
                                            </a>
                                            <a data-type="tips" class="dropdown-item">
                                                <div>묶음 이력</div>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="medium-h5 c-brand-green">
                                    묶음 이력 만들기
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                         xmlns="http://www.w3.org/2000/svg" style="padding-bottom: 2px;">
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

                                <div class="_bundle mt-32">
                                    <div class="_bundle-header">
                                        <span class="bold-h2" data-code="L-0-220819-9763-101">L-0-220819-9763-101</span>
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
                            </div>
                        </div>
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

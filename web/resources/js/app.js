'use strict';
//Response
let is_resize = true;
window.onload = function () {
    mobilePlaceHolderChanger('data-mobile-holder');
    zoomOutMobile();
};

function zoomOutMobile() {
    let viewport = document.querySelector('meta[name="viewport"]');
    if (isResponseSize(769)) {
        if (viewport) {
            viewport.content = "initial-scale=0.1";
            viewport.content = "width=769";
        }
    } else {
        viewport.content = "initial-scale=0.1";
        viewport.content = "width=device-width, shrink-to-fit=no";
    }
}

/*(function () {
    window.addEventListener("resize", resizeThrottler, false);
    let resizeTimeout;

    function resizeThrottler() {
        // ignore resize events as long as an actualResizeHandler execution is in the queue
        if (!resizeTimeout && is_resize) {
            resizeTimeout = setTimeout(function () {
                resizeTimeout = null;
                actualResizeHandler();
                // The actualResizeHandler will execute at a rate of 15fps
            }, 500);
        }
    }

    function actualResizeHandler() {
        // handle the resize event
        zoomOutMobile();
    }
}());*/

$(document).ready(function () {
    console.log('app.js execute');

    /** Header Description Section Control */
    let header_check = false;
    $('#navbarsExample04 .navbar-nav').on('mouseover', function (event) {
        header_check = true;
        if ($('#header-desc').css('display') === 'none') {
            $('#header-desc').slideDown(200);
        }
    });
    $('#navbarsExample04 .navbar-nav').on('mouseleave', function (event) {
        header_check = false;
        setTimeout(function () {
            if (!header_check) {
                $('#header-desc').slideUp(200);
            }
        }, 400);
    });
    $('#header-desc').on('mouseover', function (event) {
        $(this).slideDown(200);
        header_check = true;
    });
    $('#header-desc').on('mouseleave', function (event) {
        header_check = false;
        let header_desc = this;
        setTimeout(function () {
            if (!header_check) {
                $(header_desc).slideUp(200);
            }
        }, 400);
    });

    /** Search Control */
    $('#header ._search').click(function (event) {
        let trace_tab = $('#tab-trace');
        trace_tab.slideUp(200);

        $('#tab-overlay').show();

        let position = getPosition($(this));
        position.left -= $('#tab-search').outerWidth() - 40;
        updatePosition($('#tab-search'), position);
        $('#tab-search').slideDown(200);

        let left_sidebar = $('#header-left-sidebar');
        $(left_sidebar).hide();

        let right_sidebar = $('#header-right-sidebar');
        $(right_sidebar).hide();

        event.stopPropagation();
        event.preventDefault();
    });

    /** Header LeftSidebar Control */
    $('#header .navbar-toggler').click(function (event) {
        let left_sidebar = $('#header-left-sidebar');
        let right_sidebar = $('#header-right-sidebar');
        let trace_tab = $('#tab-trace');
        let search_tab = $('#tab-search');
        if (left_sidebar.css('display') === 'none') {
            trace_tab.slideUp(200);
            search_tab.slideUp(200);
            $(right_sidebar).hide();

            $(left_sidebar).show();
            $('#tab-overlay').show();
        } else {
            trace_tab.slideUp(200);
            search_tab.slideUp(200);
            $(right_sidebar).hide();

            $(left_sidebar).hide();
            $('#tab-overlay').hide();
        }

        event.stopPropagation();
        event.preventDefault();
    });

    /** Header RightSidebar Control */
    $('#header ._profile').click(function (event) {
        if (!isResponseSize(992)) {
            location.href = '/user/home';
            event.stopPropagation();
            event.preventDefault();
            return;
        }
        let right_sidebar = $('#header-right-sidebar');
        let left_sidebar = $('#header-left-sidebar');
        let trace_tab = $('#tab-trace');
        let search_tab = $('#tab-search');
        if (right_sidebar.css('display') === 'none') {
            trace_tab.slideUp(200);
            search_tab.slideUp(200);
            $(left_sidebar).hide();

            $(right_sidebar).show();
            $('#tab-overlay').show();
        } else {
            trace_tab.slideUp(200);
            search_tab.slideUp(200);
            $(left_sidebar).hide();

            $(right_sidebar).hide();
            $('#tab-overlay').hide();
        }

        event.stopPropagation();
        event.preventDefault();
    });

    /** Trace Control */
    $('#header-desc ._trace-search').click(function (event) {
        let search_tab = $('#tab-search');
        search_tab.slideUp(200);

        $('#tab-overlay').show();

        $('#tab-trace').slideDown(200);

        let left_sidebar = $('#header-left-sidebar');
        $(left_sidebar).hide();

        let right_sidebar = $('#header-right-sidebar');
        $(right_sidebar).hide();

        event.stopPropagation();
        event.preventDefault();
    });

    $('#header-left-sidebar ._trace-search').click(function (event) {
        let search_tab = $('#tab-search');
        search_tab.slideUp(200);

        $('#tab-overlay').show();

        $('#tab-trace').slideDown(200);

        let left_sidebar = $('#header-left-sidebar');
        $(left_sidebar).hide();

        let right_sidebar = $('#header-right-sidebar');
        $(right_sidebar).hide();

        event.stopPropagation();
        event.preventDefault();
    });

    $(document).click(function (event) {
        let search_tab = $('#tab-search');
        let trace_tab = $('#tab-trace');
        let left_sidebar = $('#header-left-sidebar');
        let right_sidebar = $('#header-right-sidebar');
        let tab_overlay = $('#tab-overlay');
        let check = tab_overlay.css('display') === 'block' ? true : false;

        if (check) {
            if ($(event.target.closest('#header-left-sidebar')).length === 0 && $(event.target.closest('#header-right-sidebar')).length === 0 && $(event.target.closest('#tab-search')).length === 0 && $(event.target.closest('#tab-trace')).length === 0) {
                tab_overlay.hide();
            }
            if ($(event.target.closest('#tab-search')).length === 0) {
                search_tab.slideUp(200);
            }
            if ($(event.target.closest('#tab-trace')).length === 0) {
                trace_tab.slideUp(200);
            }
            if ($(event.target.closest('#header-left-sidebar')).length === 0) {
                $(left_sidebar).hide();
            }
            if ($(event.target.closest('#header-right-sidebar')).length === 0) {
                $(right_sidebar).hide();
            }
        }
    });

    $('[data-href]').on('click', function () {
        location.href = this.dataset.href;
    });

    /** Dropdown */
    $('.dropdown-menu').on('click', 'a.dropdown-item', function (event) {
        let type = $(this).parent().data().type;
        let item = $(this).parent().data().item;
        let dropdown_item = this;
        if (type === 'to') {
            window.location.href = dropdown_item.querySelector('div').dataset.to;
        } else {
            let input = dropdown_item.closest('.dropdown').querySelector('[data-toggle="dropdown"] .dropdown-input');
            if (type === 'category') {
                if (input.value !== dropdown_item.querySelector('div').dataset.value) {
                    // 카테고리에 맞춰 새로 불러오기
                    let order = $('[data-type="order"]').closest('.dropdown').find('[data-toggle="dropdown"] .dropdown-input').data().type;
                    let category = dropdown_item.querySelector('div').dataset.value;
                    loadMoreContents(item, 0, order, category).then((result) => listFormatOnResult(result, item))
                }
            } else if (type === 'order') {
                if (input.value !== dropdown_item.textContent) {
                    // 순서에 맞춰 새로 불러오기
                    let category = $('[data-type="category"]').closest('.dropdown').find('[data-toggle="dropdown"] .dropdown-input').data().type;
                    let order = dropdown_item.querySelector('div').dataset.value;
                    loadMoreContents(item, 0, order, category).then((result) => listFormatOnResult(result, item))
                }
            }
            let text = dropdown_item.textContent.trim();
            if (input.disabled) {
                input.removeAttribute('disabled');
                input.value = text;
                $(input).data('type', dropdown_item.querySelector('div').dataset.value);
                input.setAttribute('disabled', 'disabled');
            } else if (input.readonly) {
                input.removeAttribute('readonly');
                input.value = text;
                $(input).data('type', dropdown_item.querySelector('div').dataset.value);
                input.setAttribute('readonly', 'readonly');
            } else {
                input.value = text;
            }
        }
    });

    function listFormatOnResult(result, item) {
        if (result.status === 'OK') {
            let contents_elem = $('._content-list');
            contents_elem.children().remove();
            let data = result.data.list;
            if (data !== undefined && data !== null && data.length > 0) {
                if (data.length < 4) {
                    $('._load').addClass('d-none');
                } else {
                    $('._load').removeClass('d-none');
                }
                switch (item) {
                    case 'board':
                        data.forEach((elem, idx) => {
                            contents_elem.append(`<div class="col" data-no="${elem.no}">
                        <div class="_board-container" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">${elem.title}</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green d-none">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">${elem.views} Views</span>
                            </div>
                        </div>
                    </div>`)
                        })
                        break;
                    case 'tip':
                        break;
                    case 'magazine':
                        break;
                    case 'manual':
                        break;
                    case 'question':
                        break;
                    case 'farm':
                        break;
                    default:
                        break;
                }
            } else {
                $('._load').addClass('d-none');
                viewAlert({content: '조건에 맞는 데이터가 없습니다.'});
            }
        }
    }

    $('._logout').click(function (event) {
        logout().then((result) => {
            if (result.status === 'OK') {
                viewModal({
                    vCenter: true,
                    btnCount: 1,
                    wCenter: true,
                    title: '로그아웃',
                    desc: '로그아웃에 성공하였습니다.',
                    onConfirm: function () {
                        location.reload();
                    },
                    onHidden: function (e) {
                        location.reload();
                    }
                });
            } else {
                viewModal({
                    vCenter: true,
                    btnCount: 1,
                    wCenter: true,
                    title: '로그아웃',
                    desc: '로그아웃에 실패하였습니다.',
                    onConfirm: function () {
                        location.reload();
                    },
                    onHidden: function (e) {
                        location.reload();
                    }
                });
            }
        });
    });

    $(document).on('click', '[data-bookmark]', function () {
        let no = this.dataset.no;
        let type = this.dataset.bookmark;

        loginCheck().then((result) => {
            if (result.status === 'OK') {
                if (result.data.status) {
                    updateBookmark(type, no).then((result) => {
                        console.log(result);
                        if (result.status === 'OK') {
                            if (result.data.status) {
                                if (result.data.type === 'insert') {
                                    if (!this.classList.contains('is-active')) {
                                        this.classList.add('is-active');
                                    }
                                    this.innerHTML = `<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                          <g clip-path="url(#clip0_249_10407)">
                                                              <path
                                                                  d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                                                  fill="#A9CC52"/>
                                                          </g>
                                                          <defs>
                                                              <clipPath id="clip0_249_10407">
                                                                  <rect width="24" height="24" fill="white"/>
                                                              </clipPath>
                                                          </defs>
                                                      </svg>`;
                                    viewAlert({content: '북마크를 등록했습니다.'});
                                } else {
                                    if (this.classList.contains('is-active')) {
                                        this.classList.remove('is-active');
                                    }
                                    this.innerHTML = `<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                          <g clip-path="url(#clip0_204_2957)">
                                                              <path
                                                                  d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"></path>
                                                          </g>
                                                          <defs>
                                                              <clipPath id="clip0_204_2957">
                                                                  <rect width="24.0923" height="24" transform="translate(0.0500488)"></rect>
                                                              </clipPath>
                                                          </defs>
                                                      </svg>`;
                                    viewAlert({content: '북마크를 해제했습니다.'});
                                }
                            }
                        }
                    });
                } else {
                    viewAlert({content: '로그인이 필요한 기능입니다.'});
                }
            }
        });
    });
});

const getPosition = ($target) => {
    return {left: $target.offset().left, top: $target.offset().top}
}

const updatePosition = ($target, position) => {
    $target.css('left', position.left);
}
'use strict';
//Response
let is_resize = true;
window.onload = function () {
    mobilePlaceHolderChanger('data-mobile-holder');
    zoomOutMobile();
};

function headerResponseControl() {
    let header = document.querySelector('#header');
    let mobile_header = document.querySelector('#header-back-theme');
    if (!isResponseSize(993)) {
        header.style.display = 'block';
        if (mobile_header !== null && mobile_header !== undefined) {
            mobile_header.style.display = 'none';
        }
    } else {
        header.style.display = 'none';
        if (mobile_header !== null && mobile_header !== undefined) {
            mobile_header.style.display = 'block';
        }
    }
    if (mobile_header === null || mobile_header === undefined) {
        header.style.display = 'block';
    }
}

function zoomOutMobile() {
    let viewport = document.querySelector('meta[name="viewport"]');
    if (isResponseSize(521)) {
        if (viewport) {
            viewport.content = "initial-scale=0.1";
            viewport.content = "width=520";
        }
    } else {
        viewport.content = "initial-scale=0.1";
        viewport.content = "width=device-width, shrink-to-fit=no";
    }
    headerResponseControl();
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
        setTimeout(function () {
            if (header_check) {
                if ($('#header-desc').css('display') === 'none') {
                    $('#header-desc').slideDown(200);
                }
            }
        }, 400);
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
        header_check = true;
        setTimeout(function () {
            if (header_check) {
                $(this).slideDown(200);
                header_check = true;
            }
        }, 400);
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
    $('#footer ._trace-search').click(function (event) {
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

    let register_buttons = document.querySelectorAll('._trace-register');
    register_buttons.forEach(function (register_button) {
        register_button.addEventListener('click', function (event) {
            loginCheck().then((result) => {
                if (result.status === 'OK') {
                    if (result.data.status) {
                        location.href = '/user/trace';
                    } else {
                        viewAlert({content: '로그인이 필요한 기능입니다.'});
                    }
                }
            });
        });
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

    $('[data-href]').on('click', function (event) {
        let target = this.getAttribute('target');
        if (target !== null && target !== undefined) {
            window.open(this.dataset.href);
        } else {
            location.href = this.dataset.href;
        }
        event.preventDefault();
        event.stopPropagation();
    });

    $('._load').on('click', function () {
        let $this = $(this);
        let type = $this.data().type;
        let $content_list = $('._content-list');
        let $contents = $content_list.find('.col');
        let category = type === 'farm' ? '' : $('[data-type="category"]').closest('.dropdown').find('[data-toggle="dropdown"] .dropdown-input').data().type;
        let order = $('[data-type="order"]').closest('.dropdown').find('[data-toggle="dropdown"] .dropdown-input').data().type;
        if ($contents.length > 0) {
            let last_elem = $contents[$contents.length - 1];
            loadMoreContents(type, last_elem.dataset.no, order, category).then((result) => listFormatOnResult(result, type, false))
        } else {
            loadMoreContents(type, 0, order, category).then((result) => listFormatOnResult(result, type, false))
        }
    })

    /** Dropdown */
    $('.dropdown-menu').on('click', 'a.dropdown-item', function (event) {
        let dropdown_item = this;
        let input = dropdown_item.closest('.dropdown').querySelector('[data-toggle="dropdown"] .dropdown-input');
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
    });

    $('.dropdown').on('show.bs.dropdown', function (event) {
        // do something...
        console.log($(event.target).width());
        let dropdown_menu = event.target.querySelector('.dropdown-menu');
        dropdown_menu.style.width = $(event.target).width() + 'px';
    });

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
        let size = this.dataset.size;
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
                                    if (size !== null && size !== undefined) {
                                        this.innerHTML = `<svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                               <g clip-path="url(#clip0_625_19335)">
                                                                   <path d="M28.2387 17.0592L28.256 17.0779L16 29.3339L3.74399 17.0779L3.76132 17.0592C2.33808 15.3999 1.59444 13.2641 1.67944 11.0797C1.76444 8.89531 2.67178 6.82372 4.21966 5.28006C5.76753 3.7364 7.84158 2.83471 10.0262 2.75567C12.2108 2.67663 14.3446 3.42609 16 4.85385C17.6554 3.42609 19.7892 2.67663 21.9738 2.75567C24.1584 2.83471 26.2324 3.7364 27.7803 5.28006C29.3282 6.82372 30.2355 8.89531 30.3205 11.0797C30.4055 13.2641 29.6619 15.3999 28.2387 17.0592V17.0592Z" fill="#A9CC52"/>
                                                               </g>
                                                               <defs>
                                                                   <clipPath id="clip0_625_19335">
                                                                       <rect width="32" height="32" fill="white"/>
                                                                   </clipPath>
                                                               </defs>
                                                           </svg>`;
                                    } else {
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
                                    }
                                    viewAlert({content: '북마크를 등록했습니다.'});
                                } else {
                                    if (this.classList.contains('is-active')) {
                                        this.classList.remove('is-active');
                                    }
                                    if (size !== null && size !== undefined) {
                                        this.innerHTML = `<svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                              <g clip-path="url(#clip0_249_6939)">
                                                                  <path d="M28.2387 17.0592L28.256 17.0779L16 29.3339L3.74399 17.0779L3.76132 17.0592C2.33808 15.3999 1.59444 13.2641 1.67944 11.0797C1.76444 8.89531 2.67178 6.82372 4.21966 5.28006C5.76753 3.7364 7.84158 2.83471 10.0262 2.75567C12.2108 2.67663 14.3446 3.42609 16 4.85385C17.6554 3.42609 19.7892 2.67663 21.9738 2.75567C24.1584 2.83471 26.2324 3.7364 27.7803 5.28006C29.3282 6.82372 30.2355 8.89531 30.3205 11.0797C30.4055 13.2641 29.6619 15.3999 28.2387 17.0592ZM6.09999 7.17785C5.54283 7.735 5.10087 8.39644 4.79933 9.1244C4.4978 9.85236 4.3426 10.6326 4.3426 11.4205C4.3426 12.2085 4.4978 12.9887 4.79933 13.7166C5.10087 14.4446 5.54283 15.106 6.09999 15.6632L16 25.5632L25.9 15.6632C27.0252 14.538 27.6574 13.0118 27.6574 11.4205C27.6574 9.82921 27.0252 8.30308 25.9 7.17785C24.7748 6.05263 23.2486 5.42048 21.6573 5.42048C20.066 5.42048 18.5399 6.05263 17.4147 7.17785L11.7573 12.8352L9.87199 10.9472L14.088 6.73118C12.9349 5.8103 11.483 5.34662 10.0096 5.42877C8.53626 5.51093 7.14484 6.13315 6.10132 7.17652L6.09999 7.17785Z" fill="#CCCCCC"/>
                                                              </g>
                                                              <defs>
                                                                  <clipPath id="clip0_249_6939">
                                                                      <rect width="32" height="32" fill="white"/>
                                                                  </clipPath>
                                                              </defs>
                                                          </svg>`;
                                    } else {
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
                                    }
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

    $('.theme-keyword button:not(.btn-brand)').on('click', function () {
        window.location.href = `/search/${$(this).text().trim()}`;
    })

    $('#tab-search').on('click', '.form-group > svg', function () {
        let input = $('#tab-search-input');
        if (input.val().trim().length > 0) {
            let searches = getCookie('searches');
            if (searches !== null) {
                let search_array = JSON.parse(searches);
                //중복 제거 후 push
                let is_duplicate = false;
                for (let index in search_array) {
                    if (search_array.hasOwnProperty(index)) {
                        // your code
                        if (input.val() === search_array[index]) {
                            is_duplicate = true;
                        }
                    }
                }
                if (!is_duplicate) {
                    search_array.push(input.val());
                    deleteCookie('searches');
                    setCookie({key: 'searches', value: JSON.stringify(search_array)});
                }
            } else {
                let search_array = new Array();
                search_array.push(input.val());
                setCookie({key: 'searches', value: JSON.stringify(search_array)});
            }
            window.location.href = `/search/${encodeURI(input.val())}`;
        } else {
            viewAlert({'content': '검색어를 입력하세요.'});
        }
    })

    $('.nav-link._search').on('click', function () {
        $('#tab-search-input').focus();
    })

    $('#tab-search-input').on('keypress', function (e) {
        if (e.keyCode === 10 || e.keyCode === 13) {
            $(this).next().click();
        }
    })

    //Recent Search Word
    let tab_search = document.querySelector('#tab-search');
    if (tab_search) {
        let list_container = tab_search.querySelector('.list-group');
        deleteChild(list_container);
        let searches = getCookie('searches');
        if (searches !== null) {
            searches = JSON.parse(searches);
            searches = searches.reverse();
            if (searches.length !== 0) {
                for (let index in searches) {
                    if (searches.hasOwnProperty(index) && index < 5) {
                        // your code
                        $(list_container).append(`<li class="list-group-item">
                                                  <div data-href="/search/${encodeURI(searches[index])}">${searches[index]}</div>
                                                  <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                      <path d="M6 18L18 6M6 6L18 18" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                  </svg>
                                              </li>`);
                    }
                }
            } else {
                list_container.parentElement.remove();
            }
        } else {
            list_container.parentElement.remove();
        }
        let latest_buttons = document.querySelectorAll('#tab-search .list-group .list-group-item');
        latest_buttons.forEach(function (latest_button) {
            latest_button.querySelector('svg').addEventListener('click', function (event) {
                let list_item = this.closest('.list-group-item');
                let searches = getCookie('searches');
                let text = list_item.querySelector('[data-href]').innerText.trim();
                if (searches !== null) {
                    searches = JSON.parse(searches);
                    searches = searches.filter(function (search) {
                        if (search === text) {
                            return false;
                        } else {
                            return true;
                        }
                    });
                    if (searches.length === 0) {
                        list_item.closest('.list-group').parentElement.remove();
                    }
                    list_item.remove();
                    deleteCookie('searches');
                    setCookie({key: 'searches', value: JSON.stringify(searches)});
                }
                event.stopPropagation();
                event.preventDefault();
            });
        });
    }
    if (!location.pathname.includes('/auth/register') && !location.pathname.includes('/auth/oauth')) {
        loginCheck().then((result) => {
            if (result.status === 'OK') {
                if (result.data.status) {
                    suspensionCheck().then((result) => {
                        console.log(result);
                        if (result.status === 'OK') {
                            if (result.data.status) {
                                viewModal({
                                    vCenter: true, btnCount: 1,
                                    backDrop: true,
                                    title: '회원 정지 알림',
                                    desc: `<div>회원님께서는 현재 [회원 자격 정지 상태]입니다.</div>
                                            <div>회원 자격 정지 사유 : ${result.data.user_ban.reason}</div>
                                            <div>회원 자격 정지 처리일: ${Time.formatLocalDatetime(result.data.user_ban.reg_datetime)}</div>
                                            <div>회원 자격 정지 기간 : ${result.data.user_ban.days}일</div>
                                            <div>보다 구체적인 회원 자격 정지 사유가 궁금하시면 관리자에게 문의해주세요.</div>`,
                                    confirm_text: '확인',
                                    onConfirm: function (e) {
                                        console.log('Confirm Button Click Callback', e.currentTarget);
                                        $('._logout').click();
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
                            }
                        }
                    });
                }
            }
        });
    }
});

const getPosition = ($target) => {
    return {left: $target.offset().left, top: $target.offset().top}
}

const updatePosition = ($target, position) => {
    $target.css('left', position.left);
}
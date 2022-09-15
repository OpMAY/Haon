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
            /*TODO You need location change*/
            alert('app.js 127번줄 location 변경해주세요.');
            location.href = '/web/view/user/mypage-home.html';
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
        let dropdown_item = this;
        let text = dropdown_item.textContent.trim();
        let input = dropdown_item.closest('.dropdown').querySelector('[data-toggle="dropdown"] .dropdown-input');
        if (input.disabled) {
            input.removeAttribute('disabled');
            input.value = text;
            input.setAttribute('disabled', 'disabled');
        } else if (input.readonly) {
            input.removeAttribute('readonly');
            input.value = text;
            input.setAttribute('readonly', 'readonly');
        } else {
            input.value = text;
        }
    });
});

const getPosition = ($target) => {
    return {left: $target.offset().left, top: $target.offset().top}
}

const updatePosition = ($target, position) => {
    $target.css('left', position.left);
}

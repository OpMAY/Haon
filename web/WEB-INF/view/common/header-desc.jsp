<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header-desc" style="display: none;">
    <ul class="list-group">
        <li class="list-group-item regular-h5" data-href="/community/farms?type=CATTLE">소</li>
        <li class="list-group-item regular-h5" data-href="/community/farms?type=PIG">돼지</li>
        <li class="list-group-item regular-h5" data-href="/community/farms?type=FOWL">닭</li>
        <li class="list-group-item regular-h5" data-href="/community/farms?type=DUCK">오리</li>
        <li class="list-group-item regular-h5" data-href="/community/farms?type=RABBIT">토끼</li>
        <li class="list-group-item regular-h5" data-href="/community/farms?type=HORSE">말</li>
        <li class="list-group-item regular-h5" data-href="/community/farms?type=SHEEP_GOAT">양 & 염소</li>
    </ul>
    <ul class="list-group">
        <li class="list-group-item regular-h5" data-href="/community/boards" data-reference="/community/board/detail">자유
            게시판
        </li>
        <li class="list-group-item regular-h5" data-href="/community/tips" data-reference="/community/tip/detail">팁과
            노하우
        </li>
        <li class="list-group-item regular-h5" data-href="/community/manuals" data-reference="/community/manual/detail">
            축산 메뉴얼
        </li>
        <li class="list-group-item regular-h5" data-href="/community/magazines"
            data-reference="/community/magazine/detail">최신 매거진
        </li>
        <li class="list-group-item regular-h5" data-href="/community/questions"
            data-reference="/community/question/detail">질문과 답변
        </li>
    </ul>
    <ul class="list-group">
        <li class="list-group-item regular-h5">이력 안내</li>
        <li class="list-group-item regular-h5 _trace-search">이력 조회</li>
        <li class="list-group-item regular-h5 _trace-register">이력 등록</li>
    </ul>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let pathname = location.pathname;
        let header_desc = document.querySelector('#header-desc');
        let items = header_desc.querySelectorAll('.list-group .list-group-item');
        items.forEach(function (e) {
            if (e.dataset.href !== null && e.dataset.href !== undefined) {
                if (getParameter('type').length != 0 && e.dataset.href.includes(getParameter('type'))) {
                    e.classList.add('is-active');
                } else {
                    if (pathname === e.dataset.href) {
                        e.classList.add('is-active');
                    } else {
                        e.classList.remove('is-active');
                    }
                    //detail active logic 미포함
                    /*if ((e.dataset.reference !== null && e.dataset.reference !== undefined)
                        && pathname.includes(getURLParamByPrevAndNext('community', 'detail'))) {
                        if (pathname.includes(e.dataset.reference)) {
                            e.classList.add('is-active');
                        } else {
                            e.classList.remove('is-active');
                        }
                    }*/
                }
            } else {
                if (pathname.includes('/user/trace')) {
                    if (e.classList.contains('_trace-register')) {
                        e.classList.add('is-active');
                    } else {
                        e.classList.remove('is-active');
                    }
                }
            }
        });
    });
</script>
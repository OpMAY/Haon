<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/left-sidebar.jsp"/>
<jsp:include page="../common/right-sidebar.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-trace.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>
<div id="content-wrapper">
    <div class="container community-mobile-container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40 mb-40"
                 <c:if test="${questions.size() eq 0}">style="min-height:calc(100vh - 40px - 40px);"</c:if>>
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    궁금한 사항을 무엇이든 편하게 물어보세요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    질문과 답변
                </div>
            </div>
            <div class="filter-dropdown-container">
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false"
                         class="form-group form-inner-button form-md form-green min-content">
                        <input type="text" class="form-control input-box medium-h5 dropdown-input input-sm"
                               disabled="disabled"
                               value="질문과 답변"
                               id="questions-filter1">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                    <div class="dropdown-menu dropdown-md" data-item="manual" data-type="to">
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-to="/community/boards">자유 게시판</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-to="/community/tips">팁과 노하우</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-to="/community/manuals">축산 메뉴얼</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-to="/community/magazines">축산 매거진</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-to="/community/farms">농가</div>
                        </a>
                    </div>
                </div>
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false"
                         class="form-group form-inner-button form-md form-gray">
                        <input type="text"
                               class="form-control input-box medium-h5 dropdown-input input-sm"
                               disabled="disabled"
                               value="전체"
                               data-type=""
                               id="questions-filter2">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                    <div class="dropdown-menu dropdown-md" data-item="question" data-type="category">
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div data-value="">전체</div>
                            </a>
                            <c:forEach var="category" items="${categories.categories}">
                                <a class="dropdown-item c-gray-light medium-h5">
                                    <div data-value="${category}">${category}</div>
                                </a>
                            </c:forEach>
                    </div>
                </div>
                <div class="right-filter-dropdown-container">
                    <div class="dropdown input-dropdown">
                        <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm min-content">
                            <input type="text"
                                   class="form-control input-box medium-h5 dropdown-input"
                                   disabled="disabled"
                                   data-type="RECENT"
                                   value="최신 등록 순"
                                   id="questions-filter3">
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
                        <div class="dropdown-menu dropdown-sm" data-item="question" data-type="order">
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div data-value="RECENT">최신 등록 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div data-value="VIEWS">뷰 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div data-value="COMMENTS">댓글 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div data-value="LIKES">추천 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div data-value="BOOKMARKS">책갈피 많은 순</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion question-accordion" id="accordionExample1">
                <div class="row row-cols-2 accordion-deck-container _content-list">
                    <c:forEach var="item" items="${questions}">
                        <div class="col" data-no="${item.question.no}">
                            <div class="card">
                                <div class="card-header" id="d-h-${item.question.no}">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link btn-block text-left medium-h4"
                                                type="button"
                                                data-toggle="collapse"
                                                data-target="#d-c-${item.question.no}"
                                                aria-expanded="true"
                                                aria-controls="d-c-${item.question.no}">
                                            <span class="deco-text">Q.</span> ${item.question.title}
                                        </button>
                                    </h2>
                                    <div class="_arrow collapsed"
                                         data-toggle="collapse"
                                         data-target="#d-c-${item.question.no}"
                                         aria-expanded="true"
                                         aria-controls="d-c-${item.question.no}">
                                        <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                                  fill="#A9CC52"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div id="d-c-${item.question.no}"
                                     class="collapse"
                                     aria-labelledby="d-h-${item.question.no}"
                                     data-parent="#accordionExample1"
                                     data-no="${item.question.no}"
                                     style="">
                                    <div class="card-body pl-40 pt-0">
                                        <div class="_accordion-content ellipsis-one-line">
                                            <span class="regular-h5"
                                                  data-comment-no="${item.best_comment_no}"><c:choose><c:when
                                                    test="${item.best_comment ne null}">
                                                [베스트] ${item.best_comment}
                                            </c:when><c:otherwise>등록된 답변이 없습니다. 지금 바로 답변을 등록해보세요.</c:otherwise></c:choose></span>
                                        </div>
                                        <div class="_accordion-option mt-16">
                                            <div class="_more-comments">
                                                <a href="#">댓글 더 불러오기</a>
                                            </div>
                                            <div class="_date ml-auto">
                                                <span class="medium-h5 c-gray-light">${item.reg_datetime.toLocalDate()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="mt-20 _load <c:if test="${questions.size() == 0}">d-none</c:if>" data-type="question">
                <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                    더 불러오기
                </button>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/bottom.jsp"/>
<jsp:include page="../common/script.jsp"/>
<script src="/resources/js/filter.js?vc=${RESOURCES_VERSION}"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');

        $('._content-list').on('click', '._accordion-content > span', function () {
            window.location.href = '/community/question/detail/' + $(this).parent().parent().parent().data().no;
        })

        $('._more-comments').on('click', function (e) {
            let $this = $(this);
            e.preventDefault();
            let question_no = $(this).parent().parent().parent().data().no;
            let comments_Div = $(this).parent().prev();
            let display_comment_list = comments_Div.find('span');
            let last_idx = display_comment_list.length - 1;
            let last_comment = display_comment_list[last_idx];
            console.log(question_no);
            console.log(last_comment);
            let last_comment_no = last_comment.dataset.commentNo * 1;
            console.log(last_comment_no);
            loadMoreComments('question', question_no, last_comment_no).then((result) => {
                setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        result.data.comments.forEach((element, index) => {
                            comments_Div.append(`<span class="regular-h5" data-comment-no="` + element.no + `">` + element.content + `</span>`);
                        })
                    } else {
                        viewAlert({content: '불러올 댓글이 없거나 댓글을 더 불러올 수 없습니다.'});
                        $this.remove();
                    }
                }
            })
        });
    });
</script>
</body>

</html>

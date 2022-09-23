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
                    축산에 대한 최신 정보 및 정책 등 다양한 소식을 준비했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    축산 매거진
                </div>
            </div>
            <div class="filter-dropdown-container">
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-green">
                        <input type="text" class="form-control input-box medium-h5 dropdown-input input-sm" disabled="disabled"
                               value="축산 매거진"
                               id="magazines-filter1">
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
                    <div class="dropdown-menu dropdown-md" data-item="magazine" data-type="to">
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
                            <div data-to="/community/questions">질문과 답변</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-to="/community/farms">농가</div>
                        </a>
                    </div>
                </div>
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-gray">
                        <input type="text"
                               class="form-control input-box medium-h5 dropdown-input input-sm"
                               disabled="disabled"
                               value="전체"
                               data-type=""
                               id="magazines-filter2">
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
                    <div class="dropdown-menu dropdown-md" data-item="magazine" data-type="category">
                        <%-- TODO 카테고리 삽입 --%>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-value="">전체</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-value="관리자가 선택한 카테고리 1">관리자가 선택한 카테고리 1</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div data-value="관리자가 선택한 카테고리 2">관리자가 선택한 카테고리 2</div>
                        </a>
                    </div>
                </div>
                <div class="right-filter-dropdown-container">
                    <div class="dropdown input-dropdown">
                        <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                            <input type="text"
                                   class="form-control input-box medium-h5 dropdown-input"
                                   disabled="disabled"
                                   data-type="RECENT"
                                   value="최신 등록 순"
                                   id="magazines-filter3">
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
                        <div class="dropdown-menu dropdown-sm" data-item="magazine" data-type="order">
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
            <div class="row row-cols-4 community-container-deck _content-list">
                <c:forEach var="item" items="${magazines}">
                    <c:if test="${item.thumbnail.url ne null}">
                        <div class="col p-8 d-flex align-items-stretch" data-no="${item.no}">
                            <div class="card community-card">
                                <div class="background-image _thumbnail"
                                     style="background-image:url('${item.thumbnail.url}')">
                                    <div class="background-image _profile"
                                         style="background-image:url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                                </div>
                                <div class="card-body _body">
                                    <h5 class="card-title _title bold-h4 c-gray-dark-low">${item.title}</h5>
                                    <div class="card-text _description medium-h5 c-gray-medium">${item.content}</div>
                                </div>
                                <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                      <span class="_count">${item.views}</span> Views
                                    </span>
                                    <c:choose>
                                        <c:when test="${item._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="TIPS"
                                                  data-no="${item.no}">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
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
                                                      </svg>
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="_bookmark" data-bookmark="TIPS" data-no="${item.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${item.thumbnail.url eq null}">
                        <div class="col p-8 d-flex align-items-stretch" data-no="${item.no}">
                            <div class="card community-card is-empty">
                                <div class="background-image _profile"
                                     style="background-image:url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                                <div class="card-body _body">
                                    <h5 class="card-title _title bold-h4 c-gray-dark-low">${item.title}</h5>
                                    <div class="card-text _description medium-h5 c-gray-medium">${item.content}</div>
                                </div>
                                <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                      <span class="_count">${item.views}</span> Views
                                    </span>
                                    <c:choose>
                                        <c:when test="${item._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="TIPS"
                                                  data-no="${item.no}">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
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
                                                      </svg>
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="_bookmark" data-bookmark="TIPS" data-no="${item.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="mt-20 _load" data-type="magazine">
                <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                    더 불러오기
                </button>
            </div>
        </section>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<jsp:include page="../common/script.jsp"/>
<script src="/resources/js/filter.js"></script>
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

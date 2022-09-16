<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
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
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut autem explicabo, harum illo ipsam
                    laudantium
                    maiores necessitatibus nisi nulla qui quo ratione recusandae reiciendis soluta temporibus totam
                    vero? Iste,
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
        <section class="section" id="board-section">
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
            <c:if test="${live_boards.size() > 0}">
                <div class="owl-carousel free-board">
                    <c:set var="fullMax" scope="application">
                        <custom:numberDivision value="${live_boards.size()}" share="true" divide="4"/>
                    </c:set>
                    <div class="_board-list">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 0}">
                                    3
                                </c:when>
                                <c:otherwise>
                                    ${live_boards.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <c:forEach var="i" begin="0" end="${endValue}">
                            <div class="_board-container" data-no="${live_boards[i].no}" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">${live_boards[i].title}</span>
                                </div>
                                <div class="_info">
                                    <c:set var="newDiff" scope="application">
                                        <custom:localDateTimeDiffer value="${live_boards[i].reg_datetime}"/>
                                    </c:set>
                                    <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">${live_boards[i].views} Views</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${live_boards.size() > 4}">
                        <div class="_board-list">
                            <c:set var="endValue" scope="application">
                                <c:choose>
                                    <c:when test="${fullMax > 1}">
                                        7
                                    </c:when>
                                    <c:otherwise>
                                        ${4 + live_boards.size() % 4 - 1}
                                    </c:otherwise>
                                </c:choose>
                            </c:set>
                            <c:forEach var="i" begin="4" end="${endValue}">
                                <div class="_board-container" data-no="${live_boards[i].no}" data-type="board">
                                    <div class="_content ellipsis-one-line">
                                        <span class="medium-h4">${live_boards[i].title}</span>
                                    </div>
                                    <div class="_info">
                                        <c:set var="newDiff" scope="application">
                                            <custom:localDateTimeDiffer value="${live_boards[i].reg_datetime}"/>
                                        </c:set>
                                        <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                        <span class="medium-h5 c-gray-light ml-8">${live_boards[i].views} Views</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${live_boards.size() > 8}">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 2}">
                                    11
                                </c:when>
                                <c:otherwise>
                                    ${8 + live_boards.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <div class="_board-list">
                            <c:forEach var="i" begin="8" end="${endValue}">
                                <div class="_board-container" data-no="${live_boards[i].no}" data-type="board">
                                    <div class="_content ellipsis-one-line">
                                        <span class="medium-h4">${live_boards[i].title}</span>
                                    </div>
                                    <div class="_info">
                                        <c:set var="newDiff" scope="application">
                                            <custom:localDateTimeDiffer value="${live_boards[i].reg_datetime}"/>
                                        </c:set>
                                        <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                        <span class="medium-h5 c-gray-light ml-8">${live_boards[i].views} Views</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${live_boards.size() > 12}">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 3}">
                                    15
                                </c:when>
                                <c:otherwise>
                                    ${12 + live_boards.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <div class="_board-list">
                            <c:forEach var="i" begin="12" end="${endValue}">
                                <div class="_board-container" data-no="${live_boards[i].no}" data-type="board">
                                    <div class="_content ellipsis-one-line">
                                        <span class="medium-h4">${live_boards[i].title}</span>
                                    </div>
                                    <div class="_info">
                                        <c:set var="newDiff" scope="application">
                                            <custom:localDateTimeDiffer value="${live_boards[i].reg_datetime}"/>
                                        </c:set>
                                        <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                        <span class="medium-h5 c-gray-light ml-8">${live_boards[i].views} Views</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${live_boards.size() <= 0}">
                <div class="regular-h5" style="text-align: center">
                    <span>등록된 자유 게시판이 없습니다. 지금 바로 등록해보세요.</span>
                </div>
            </c:if>
        </section>
        <!--검증된 팁과 노하우-->
        <section class="section" id="tips-section">
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
            <c:if test="${tips.size() > 0}">
                <div class="owl-carousel card-carousel">
                    <c:forEach var="tip" items="${tips}">
                        <c:choose>
                            <c:when test="${tip.thumbnail.url eq null}">
                                <div class="card community-card is-empty" data-no="${tip.no}">
                                    <div class="background-image _profile"
                                         style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${tip.title}</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">${tip.content}</p>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                    <span class="_count">${tip.views}</span> Views
                                    </span>
                                            <%-- TODO 좋아요 여부 --%>
                                        <span class="_bookmark">
                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_204_2957)"><path
                                            d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                            id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                      transform="translate(0.0500488)"/></clipPath></defs></svg>
                                    </span>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="card community-card" data-no="${tip.no}">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url(${tip.thumbnail.url})">
                                        <div class="background-image _profile"
                                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${tip.title}</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">${tip.content}</p>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light"><span
                                            class="_count">${tip.views}</span> Views</span>
                                            <%-- TODO 좋아요 여부 --%>
                                        <span class="_bookmark">
                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
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
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${tips.size() <= 0}">
                <div class="regular-h5" style="text-align: center">
                    <span>등록된 팁과 노하우가 없습니다. 지금 바로 등록해보세요.</span>
                </div>
            </c:if>
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
            <c:if test="${manuals.size() > 0}">
                <div class="owl-carousel card-carousel">
                    <c:forEach var="item" items="${manuals}">
                        <c:choose>
                            <c:when test="${item.thumbnail.url eq null}">
                                <div class="card community-card is-empty" data-no="${item.no}">
                                    <div class="background-image _profile"
                                         style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${item.title}</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">${item.content}</p>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                    <span class="_count">${item.views}</span> Views
                                    </span>
                                            <%-- TODO 좋아요 여부 --%>
                                        <span class="_bookmark">
                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_204_2957)"><path
                                            d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                            id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                      transform="translate(0.0500488)"/></clipPath></defs></svg>
                                    </span>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="card community-card" data-no="${item.no}">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url(${item.thumbnail.url})">
                                        <div class="background-image _profile"
                                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${item.title}</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">${item.content}</p>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light"><span
                                            class="_count">${item.views}</span> Views</span>
                                            <%-- TODO 좋아요 여부 --%>
                                        <span class="_bookmark">
                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
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
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${manuals.size() <= 0}">
                <div class="regular-h5" style="text-align: center">
                    <span>등록된 축산 메뉴얼이 없습니다. 지금 바로 등록해보세요.</span>
                </div>
            </c:if>
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
            <c:if test="${magazines.size() > 0}">
                <div class="owl-carousel card-carousel">
                    <c:forEach var="item" items="${magazines}">
                        <c:choose>
                            <c:when test="${item.thumbnail.url eq null}">
                                <div class="card community-card is-empty" data-no="${item.no}">
                                    <div class="background-image _profile"
                                         style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${item.title}</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">${item.content}</p>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                    <span class="_count">${item.views}</span> Views
                                    </span>
                                            <%-- TODO 좋아요 여부 --%>
                                        <span class="_bookmark">
                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_204_2957)"><path
                                            d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                            id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                      transform="translate(0.0500488)"/></clipPath></defs></svg>
                                    </span>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="card community-card" data-no="${item.no}">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url(${item.thumbnail.url})">
                                        <div class="background-image _profile"
                                             style="background-image:url('../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${item.title}</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">${item.content}</p>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light"><span
                                            class="_count">${item.views}</span> Views</span>
                                            <%-- TODO 좋아요 여부 --%>
                                        <span class="_bookmark">
                                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
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
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${magazines.size() <= 0}">
                <div class="regular-h5" style="text-align: center">
                    <span>등록된 매거진이 없습니다.</span>
                </div>
            </c:if>
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
                                <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
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
        /*viewModal({
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
        });*/
    });
</script>
<div class="bg-brand-green c-basic-white"></div>
</body>
</html>

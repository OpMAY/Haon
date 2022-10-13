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
    <div class="container community-mobile-container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40 mb-40"
                 <c:if test="${boards.size() eq 0}">style="min-height:calc(100vh - 40px - 40px);"</c:if>>
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    다양하고 많은 농가들과 정보를 공유하고 대화를 진행할 수 있어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    자유 게시판
                </div>
            </div>
            <div class="filter-dropdown-container">
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false"
                         class="form-group form-inner-button form-md form-green min-content">
                        <input type="text" class="form-control input-box medium-h5 dropdown-input input-sm"
                               disabled="disabled"
                               value="자유 게시판"
                               id="boards-filter1">
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
                    <div class="dropdown-menu dropdown-md" data-item="board" data-type="to">
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
                            <div data-to="/community/questions">질문과 답변</div>
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
                               id="boards-filter2">
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
                    <div class="dropdown-menu dropdown-md _category" data-item="board" data-type="category">
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
                        <div data-toggle="dropdown" aria-expanded="false"
                             class="form-group form-inner-button form-sm min-content">
                            <input type="text"
                                   class="form-control input-box medium-h5 dropdown-input"
                                   disabled="disabled"
                                   data-type="RECENT"
                                   value="최신 등록 순"
                                   id="boards-filter3">
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
                        <div class="dropdown-menu dropdown-sm" data-item="board" data-type="order">
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
            <div class="row row-cols-2 board-container-deck _content-list d-md-block d-none">
                <c:forEach var="board" items="${boards}">
                    <c:set var="newDiff" scope="application">
                        <custom:localDateTimeDiffer value="${board.reg_datetime}"/>
                    </c:set>
                    <div class="col" data-no="${board.no}">
                        <div class="_board-container" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">${board.title}</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">${board.views} Views</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row row-cols-2 board-container-deck mobile-container-deck _content-list d-block d-md-none">
                <div class="col mobile-card-col" data-no="1">
                    <div class="card mobile-card">
                        <div class="media">
                            <div class="background-image _profile mr-3"
                                 style="background-image: url('/resources/assets/images/sample/card-profile-image.png')"></div>
                            <div class="media-body">
                                <h5 class="mt-0 bold-h4 c-gray-dark-low">오키위</h5>
                                <p class="regular-h5 c-gray-light">2022.12.23</p>
                            </div>
                        </div>
                        <div class="card-body _description">
                            <h2 style="margin-top: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);">
                                What is Lorem Ipsum?</h2>
                            <p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">
                                <strong style="margin: 0px; padding: 0px;">Lorem Ipsum</strong>&nbsp;is simply dummy
                                text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                                and scrambled it to make a type specimen book. It has survived not only five centuries,
                                but also the leap into electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                                passages, and more recently with desktop publishing software like Aldus PageMaker
                                including versions of Lorem Ipsum</p>
                            <h2 style="font-family: DauphinPlain; margin-top: 0px; line-height: 24px; font-size: 24px; color: rgb(0, 0, 0); padding: 0px;">
                                What is Lorem Ipsum?</h2>
                            <p style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">
                                <span style="font-weight: bolder; margin: 0px; padding: 0px;">Lorem Ipsum</span>&nbsp;is
                                simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                industry's standard dummy text ever since the 1500s, when an unknown printer took a
                                galley of type and scrambled it to make a type specimen book. It has survived not only
                                five centuries, but also the leap into electronic typesetting, remaining essentially
                                unchanged. It was popularised in the 1960s with the release of Letraset sheets
                                containing Lorem Ipsum passages, and more recently with desktop publishing software like
                                Aldus PageMaker including versions of Lorem Ipsum</p>
                        </div>
                        <div class="_more c-brand-green medium-h5">자세히</div>
                        <div class="card-footer">
                            <span class="_views regular-h5 c-gray-light">
                                <span class="_count">3</span> Views
                            </span>
                            <span class="_bookmark is-active" data-bookmark="TIPS" data-no="25">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_249_10407)">
                                        <path d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                              fill="#A9CC52"></path>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_249_10407">
                                            <rect width="24" height="24" fill="white"></rect>
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col mobile-card-col" data-no="1">
                    <div class="card mobile-card">
                        <div class="media">
                            <div class="background-image _profile mr-3"
                                 style="background-image: url('/resources/assets/images/sample/card-profile-image.png')"></div>
                            <div class="media-body">
                                <h5 class="mt-0 bold-h4 c-gray-dark-low">오키위</h5>
                                <p class="regular-h5 c-gray-light">2022.12.23</p>
                            </div>
                        </div>
                        <div class="card-body _description">
                            <h2 style="margin-top: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);">
                                What is Lorem Ipsum?</h2>
                            <p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">
                                <strong style="margin: 0px; padding: 0px;">Lorem Ipsum</strong>&nbsp;is simply dummy
                                text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                                and scrambled it to make a type specimen book. It has survived not only five centuries,
                                but also the leap into electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                                passages, and more recently with desktop publishing software like Aldus PageMaker
                                including versions of Lorem Ipsum</p>
                            <h2 style="font-family: DauphinPlain; margin-top: 0px; line-height: 24px; font-size: 24px; color: rgb(0, 0, 0); padding: 0px;">
                                What is Lorem Ipsum?</h2>
                            <p style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">
                                <span style="font-weight: bolder; margin: 0px; padding: 0px;">Lorem Ipsum</span>&nbsp;is
                                simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                industry's standard dummy text ever since the 1500s, when an unknown printer took a
                                galley of type and scrambled it to make a type specimen book. It has survived not only
                                five centuries, but also the leap into electronic typesetting, remaining essentially
                                unchanged. It was popularised in the 1960s with the release of Letraset sheets
                                containing Lorem Ipsum passages, and more recently with desktop publishing software like
                                Aldus PageMaker including versions of Lorem Ipsum</p>
                        </div>
                        <div class="card-footer">
                            <span class="_views regular-h5 c-gray-light">
                                <span class="_count">3</span> Views
                            </span>
                            <span class="_bookmark is-active" data-bookmark="TIPS" data-no="25">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_249_10407)">
                                        <path d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                              fill="#A9CC52"></path>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_249_10407">
                                            <rect width="24" height="24" fill="white"></rect>
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col mobile-card-col" data-no="1">
                    <div class="card mobile-card">
                        <div class="media">
                            <div class="background-image _profile mr-3"
                                 style="background-image: url('/resources/assets/images/sample/card-profile-image.png')"></div>
                            <div class="media-body">
                                <h5 class="mt-0 bold-h4 c-gray-dark-low">오키위</h5>
                                <p class="regular-h5 c-gray-light">2022.12.23</p>
                            </div>
                        </div>
                        <div class="background-image _background"
                             style="background-image: url('/resources/assets/images/sample/background-wallpaper1.png')">
                        </div>
                        <div class="card-body _description">
                            <h2 style="margin-top: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);">
                                What is Lorem Ipsum?</h2>
                            <p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">
                                <strong style="margin: 0px; padding: 0px;">Lorem Ipsum</strong>&nbsp;is simply dummy
                                text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                                and scrambled it to make a type specimen book. It has survived not only five centuries,
                                but also the leap into electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                                passages, and more recently with desktop publishing software like Aldus PageMaker
                                including versions of Lorem Ipsum</p>
                            <h2 style="font-family: DauphinPlain; margin-top: 0px; line-height: 24px; font-size: 24px; color: rgb(0, 0, 0); padding: 0px;">
                                What is Lorem Ipsum?</h2>
                            <p style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">
                                <span style="font-weight: bolder; margin: 0px; padding: 0px;">Lorem Ipsum</span>&nbsp;is
                                simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                industry's standard dummy text ever since the 1500s, when an unknown printer took a
                                galley of type and scrambled it to make a type specimen book. It has survived not only
                                five centuries, but also the leap into electronic typesetting, remaining essentially
                                unchanged. It was popularised in the 1960s with the release of Letraset sheets
                                containing Lorem Ipsum passages, and more recently with desktop publishing software like
                                Aldus PageMaker including versions of Lorem Ipsum</p>
                        </div>
                        <div class="_more c-brand-green medium-h5">자세히</div>
                        <div class="card-footer">
                            <span class="_views regular-h5 c-gray-light">
                                <span class="_count">3</span> Views
                            </span>
                            <span class="_bookmark is-active" data-bookmark="TIPS" data-no="25">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_249_10407)">
                                        <path d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                              fill="#A9CC52"></path>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_249_10407">
                                            <rect width="24" height="24" fill="white"></rect>
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col mobile-card-col" data-no="1">
                    <div class="card mobile-card">
                        <div class="media">
                            <div class="background-image _profile mr-3"
                                 style="background-image: url('/resources/assets/images/sample/card-profile-image.png')"></div>
                            <div class="media-body">
                                <h5 class="mt-0 bold-h4 c-gray-dark-low">오키위</h5>
                                <p class="regular-h5 c-gray-light">2022.12.23</p>
                            </div>
                        </div>
                        <div class="background-image _background"
                             style="background-image: url('/resources/assets/images/sample/background-wallpaper1.png')">
                        </div>
                        <div class="card-body _description">
                            <h2 style="margin-top: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);">
                                What is Lorem Ipsum?</h2>
                            <p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">
                                <strong style="margin: 0px; padding: 0px;">Lorem Ipsum</strong>&nbsp;is simply dummy
                                text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                                and scrambled it to make a type specimen book. It has survived not only five centuries,
                                but also the leap into electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                                passages, and more recently with desktop publishing software like Aldus PageMaker
                                including versions of Lorem Ipsum</p>
                            <h2 style="font-family: DauphinPlain; margin-top: 0px; line-height: 24px; font-size: 24px; color: rgb(0, 0, 0); padding: 0px;">
                                What is Lorem Ipsum?</h2>
                            <p style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">
                                <span style="font-weight: bolder; margin: 0px; padding: 0px;">Lorem Ipsum</span>&nbsp;is
                                simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                industry's standard dummy text ever since the 1500s, when an unknown printer took a
                                galley of type and scrambled it to make a type specimen book. It has survived not only
                                five centuries, but also the leap into electronic typesetting, remaining essentially
                                unchanged. It was popularised in the 1960s with the release of Letraset sheets
                                containing Lorem Ipsum passages, and more recently with desktop publishing software like
                                Aldus PageMaker including versions of Lorem Ipsum</p>
                        </div>
                        <div class="card-footer">
                            <span class="_views regular-h5 c-gray-light">
                                <span class="_count">3</span> Views
                            </span>
                            <span class="_bookmark is-active" data-bookmark="TIPS" data-no="25">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_249_10407)">
                                        <path d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                              fill="#A9CC52"></path>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_249_10407">
                                            <rect width="24" height="24" fill="white"></rect>
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col mobile-card-col" data-no="1">
                    <div class="card mobile-card">
                        <div class="media">
                            <div class="background-image _profile mr-3"
                                 style="background-image: url('/resources/assets/images/sample/card-profile-image.png')"></div>
                            <div class="media-body">
                                <h5 class="mt-0 bold-h4 c-gray-dark-low">오키위</h5>
                                <p class="regular-h5 c-gray-light">2022.12.23</p>
                            </div>
                        </div>
                        <div class="background-image _background"
                             style="background-image: url('/resources/assets/images/sample/background-wallpaper1.png')">
                        </div>
                        <div class="card-body _description">
                            <h2 style="margin-top: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);">
                                What is Lorem Ipsum?</h2>
                            <p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">
                                <strong style="margin: 0px; padding: 0px;">Lorem Ipsum</strong>&nbsp;is simply dummy
                                text of the printing and typesetting industry. Lorem Ipsum has been the industry's
                                standard dummy text ever since the 1500s, when an unknown printer took a galley of type
                                and scrambled it to make a type specimen book. It has survived not only five centuries,
                                but also the leap into electronic typesetting, remaining essentially unchanged. It was
                                popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
                                passages, and more recently with desktop publishing software like Aldus PageMaker
                                including versions of Lorem Ipsum</p>
                            <h2 style="font-family: DauphinPlain; margin-top: 0px; line-height: 24px; font-size: 24px; color: rgb(0, 0, 0); padding: 0px;">
                                What is Lorem Ipsum?</h2>
                            <p style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0);">
                                <span style="font-weight: bolder; margin: 0px; padding: 0px;">Lorem Ipsum</span>&nbsp;is
                                simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                                industry's standard dummy text ever since the 1500s, when an unknown printer took a
                                galley of type and scrambled it to make a type specimen book. It has survived not only
                                five centuries, but also the leap into electronic typesetting, remaining essentially
                                unchanged. It was popularised in the 1960s with the release of Letraset sheets
                                containing Lorem Ipsum passages, and more recently with desktop publishing software like
                                Aldus PageMaker including versions of Lorem Ipsum</p>
                        </div>
                        <div class="card-footer">
                            <span class="_views regular-h5 c-gray-light">
                                <span class="_count">3</span> Views
                            </span>
                            <span class="_bookmark is-active" data-bookmark="TIPS" data-no="25">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_249_10407)">
                                        <path d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                              fill="#A9CC52"></path>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_249_10407">
                                            <rect width="24" height="24" fill="white"></rect>
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mt-20 _load <c:if test="${boards.size() == 0}">d-none</c:if>" data-type="board">
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
        $('.board-container-deck').on('click', '._board-container', function () {
            let no = $(this).parent().data().no;
            window.location.href = '/community/board/detail/' + no;
        })
    });
</script>
</body>

</html>

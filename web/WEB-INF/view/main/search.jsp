<%@ page import="com.model.content.board.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.content.question.QuestionSummary" %>
<%@ page import="com.model.content.magazine.Magazine" %>
<%@ page import="com.model.content.manual.Manual" %>
<%@ page import="com.model.content.tips.Tips" %>
<%@ page import="com.model.global.Banner" %>
<%@ page import="com.model.farm.Farm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    List<Banner> banners = (List<Banner>) request.getAttribute("banners");--%>
<%--    request.setAttribute("banners", banners);--%>

<%--    List<Board> live_boards = (List<Board>) request.getAttribute("live_boards");--%>
<%--    request.setAttribute("live_boards", live_boards);--%>

<%--    List<Tips> tips = (List<Tips>) request.getAttribute("tips");--%>
<%--    request.setAttribute("tips", tips);--%>

<%--    List<Manual> manuals = (List<Manual>) request.getAttribute("manuals");--%>
<%--    request.setAttribute("manuals", manuals);--%>

<%--    List<Magazine> magazines = (List<Magazine>) request.getAttribute("magazines");--%>
<%--    request.setAttribute("magazines", magazines);--%>

<%--    List<QuestionSummary> questions = (List<QuestionSummary>) request.getAttribute("questions");--%>
<%--    request.setAttribute("questions", questions);--%>

<%--    List<Farm> farms = (List<Farm>) request.getAttribute("farms");--%>
<%--    request.setAttribute("farms", farms);--%>

<%--%>--%>
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
                <c:forEach var="keyword" items="${keywords.get(1).keywords}">
                    <button type="button" class="btn btn-md btn-gray-high-light medium-h4">
                        ${keyword}
                    </button>
                </c:forEach>
            </div>
        </section>
        <!--실시간 자유 게시판-->
        <section class="section" id="board-section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    다양하고 많은 농가들과 정보를 공유하고 대화를 진행할 수 있어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    <span class="my-auto cursor-pointer">실시간 자유 게시판</span>
                    <svg class="my-auto cursor-pointer" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
            <c:if test="${boards.size() > 0}">
                <div class="owl-carousel free-board">
                    <c:set var="fullMax" scope="application">
                        <custom:numberDivision value="${boards.size()}" share="true" divide="4"/>
                    </c:set>
                    <div class="_board-list">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 0}">
                                    3
                                </c:when>
                                <c:otherwise>
                                    ${boards.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <c:forEach var="i" begin="0" end="${endValue}">
                            <div class="_board-container" data-no="${boards[i].no}" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">${boards[i].title}</span>
                                </div>
                                <div class="_info">
                                    <c:set var="newDiff" scope="application">
                                        <custom:localDateTimeDiffer value="${boards[i].reg_datetime}"/>
                                    </c:set>
                                    <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">${boards[i].views} Views</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${boards.size() > 4}">
                        <div class="_board-list">
                            <c:set var="endValue" scope="application">
                                <c:choose>
                                    <c:when test="${fullMax > 1}">
                                        7
                                    </c:when>
                                    <c:otherwise>
                                        ${4 + boards.size() % 4 - 1}
                                    </c:otherwise>
                                </c:choose>
                            </c:set>
                            <c:forEach var="i" begin="4" end="${endValue}">
                                <div class="_board-container" data-no="${boards[i].no}" data-type="board">
                                    <div class="_content ellipsis-one-line">
                                        <span class="medium-h4">${boards[i].title}</span>
                                    </div>
                                    <div class="_info">
                                        <c:set var="newDiff" scope="application">
                                            <custom:localDateTimeDiffer value="${boards[i].reg_datetime}"/>
                                        </c:set>
                                        <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                        <span class="medium-h5 c-gray-light ml-8">${boards[i].views} Views</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${boards.size() > 8}">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 2}">
                                    11
                                </c:when>
                                <c:otherwise>
                                    ${8 + boards.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <div class="_board-list">
                            <c:forEach var="i" begin="8" end="${endValue}">
                                <div class="_board-container" data-no="${boards[i].no}" data-type="board">
                                    <div class="_content ellipsis-one-line">
                                        <span class="medium-h4">${boards[i].title}</span>
                                    </div>
                                    <div class="_info">
                                        <c:set var="newDiff" scope="application">
                                            <custom:localDateTimeDiffer value="${boards[i].reg_datetime}"/>
                                        </c:set>
                                        <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                        <span class="medium-h5 c-gray-light ml-8">${boards[i].views} Views</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${boards.size() > 12}">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 3}">
                                    15
                                </c:when>
                                <c:otherwise>
                                    ${12 + boards.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <div class="_board-list">
                            <c:forEach var="i" begin="12" end="${endValue}">
                                <div class="_board-container" data-no="${boards[i].no}" data-type="board">
                                    <div class="_content ellipsis-one-line">
                                        <span class="medium-h4">${boards[i].title}</span>
                                    </div>
                                    <div class="_info">
                                        <c:set var="newDiff" scope="application">
                                            <custom:localDateTimeDiffer value="${boards[i].reg_datetime}"/>
                                        </c:set>
                                        <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                        <span class="medium-h5 c-gray-light ml-8">${boards[i].views} Views</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${boards.size() <= 0}">
                <div class="bold-h4 c-gray-light" style="text-align: center">
                    <span>'${query}'에 맞는 검색 결과가 없어요.</span>
                </div>
            </c:if>
        </section>
        <!--검증된 팁과 노하우-->
        <section class="section" id="tips-section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    숙력된 농가분들이 갖고 있는 팁과 노하우를 공유했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    <span class="my-auto cursor-pointer">검증된 팁과 노하우</span>
                    <svg class="my-auto cursor-pointer" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
                                        <div class="card-text _description medium-h5 c-gray-medium">${tip.content}</div>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                    <span class="_count">${tip.views}</span> Views
                                    </span>
                                        <c:choose>
                                            <c:when test="${tip._bookmark eq true}">
                                                    <span class="_bookmark is-active" data-bookmark="TIP"
                                                          data-no="${tip.no}">
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
                                                    <span class="_bookmark" data-bookmark="TIP" data-no="${tip.no}">
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
                                        <div class="card-text _description medium-h5 c-gray-medium">${tip.content}</div>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light"><span
                                            class="_count">${tip.views}</span> Views</span>
                                        <c:choose>
                                            <c:when test="${tip._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="TIP" data-no="${tip.no}">
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
                                            <span class="_bookmark" data-bookmark="TIP" data-no="${tip.no}">
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
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${tips.size() <= 0}">
                <div class="bold-h4 c-gray-light" style="text-align: center">
                    <span>'${query}'에 맞는 검색 결과가 없어요.</span>
                </div>
            </c:if>
        </section>
        <!--숙련된 축산 매뉴얼-->
        <section class="section" id="manual-section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    숙력된 농가분들이 경험하고 직접 겪은 메뉴얼을 공유했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    <span class="my-auto cursor-pointer">숙련된 축산 메뉴얼</span>
                    <svg class="my-auto cursor-pointer" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
                                        <div class="card-text _description medium-h5 c-gray-medium">${item.content}</div>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                    <span class="_count">${item.views}</span> Views
                                    </span>
                                        <c:choose>
                                            <c:when test="${item._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="MANUAL"
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
                                            <span class="_bookmark" data-bookmark="MANUAL" data-no="${item.no}">
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
                                        <div class="card-text _description medium-h5 c-gray-medium">${item.content}</div>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light"><span
                                            class="_count">${item.views}</span> Views</span>
                                        <c:choose>
                                            <c:when test="${item._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="MANUAL"
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
                                            <span class="_bookmark" data-bookmark="MANUAL" data-no="${item.no}">
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
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${manuals.size() <= 0}">
                <div class="bold-h4 c-gray-light" style="text-align: center">
                    <span>'${query}'에 맞는 검색 결과가 없어요.</span>
                </div>
            </c:if>
        </section>
        <!--최신 축산 매거진-->
        <section class="section" id="magazine-section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    축산에 대한 최신 정보 및 정책 등 다양한 소식을 준비했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    <span class="my-auto cursor-pointer">최신 축산 매거진</span>
                    <svg class="my-auto cursor-pointer" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
                                        <div class="card-text _description medium-h5 c-gray-medium">${item.content}</div>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                    <span class="_count">${item.views}</span> Views
                                    </span>
                                        <c:choose>
                                            <c:when test="${item._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="MAGAZINE"
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
                                            <span class="_bookmark" data-bookmark="MAGAZINE" data-no="${item.no}">
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
                                        <div class="card-text _description medium-h5 c-gray-medium">${item.content}</div>
                                    </div>
                                    <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light"><span
                                            class="_count">${item.views}</span> Views</span>
                                        <c:choose>
                                            <c:when test="${item._bookmark eq true}">
                                            <span class="_bookmark is-active" data-bookmark="MAGAZINE"
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
                                            <span class="_bookmark" data-bookmark="MAGAZINE" data-no="${item.no}">
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
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${magazines.size() <= 0}">
                <div class="bold-h4 c-gray-light" style="text-align: center">
                    <span>'${query}'에 맞는 검색 결과가 없어요.</span>
                </div>
            </c:if>
        </section>
        <!--질문과 답변-->
        <section class="section" id="question-section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    궁금한 사항을 무엇이든 편하게 물어보세요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    <span class="my-auto cursor-pointer">질문과 답변</span>
                    <svg class="my-auto cursor-pointer" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
            <c:if test="${questions.size() > 0}">
                <div class="owl-carousel question-carousel">
                    <c:set var="fullMax" scope="application">
                        <custom:numberDivision value="${questions.size()}" share="true" divide="4"/>
                    </c:set>
                    <div class="accordion question-accordion" id="question-accordions-1">
                        <c:set var="endValue" scope="application">
                            <c:choose>
                                <c:when test="${fullMax > 0}">
                                    3
                                </c:when>
                                <c:otherwise>
                                    ${questions.size() % 4 - 1}
                                </c:otherwise>
                            </c:choose>
                        </c:set>
                        <c:forEach var="i" begin="0" end="${endValue}">
                            <div class="card">
                                <div class="card-header" id="d-h-${questions[i].question.no}">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link btn-block text-left medium-h4"
                                                type="button"
                                                data-toggle="collapse"
                                                data-target="#d-c-${questions[i].question.no}"
                                                aria-expanded="true"
                                                aria-controls="d-c-${questions[i].question.no}">
                                            <span class="deco-text">Q.</span> ${questions[i].question.title}
                                        </button>
                                    </h2>
                                    <div class="_arrow collapsed"
                                         data-toggle="collapse"
                                         data-target="#d-c-${questions[i].question.no}"
                                         aria-expanded="true"
                                         aria-controls="d-c-${questions[i].question.no}">
                                        <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                                  fill="#A9CC52"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div id="d-c-${questions[i].question.no}"
                                     class="collapse"
                                     aria-labelledby="d-h-${questions[i].question.no}"
                                     data-parent="#question-accordions-1"
                                     data-no="${questions[i].question.no}"
                                     style="">
                                    <div class="card-body pl-40 pt-0">
                                        <div class="_accordion-content ellipsis-one-line">
                                            <span class="regular-h5"
                                                  data-comment-no="${questions[i].best_comment_no}"><c:choose><c:when
                                                    test="${questions[i].best_comment ne null}">
                                                [베스트] ${questions[i].best_comment}
                                            </c:when><c:otherwise>등록된 답변이 없습니다. 지금 바로 답변을 등록해보세요.</c:otherwise></c:choose></span>
                                        </div>
                                        <div class="_accordion-option mt-16">
                                            <div class="_more-comments">
                                                <a href="#">댓글 더 불러오기</a>
                                            </div>
                                            <div class="_date ml-auto">
                                                <span class="medium-h5 c-gray-light">${questions[i].reg_datetime.toLocalDate()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${questions.size() > 4}">
                        <div class="accordion question-accordion" id="question-accordions-2">
                            <c:set var="endValue" scope="application">
                                <c:choose>
                                    <c:when test="${fullMax > 1}">
                                        7
                                    </c:when>
                                    <c:otherwise>
                                        ${4 + questions.size() % 4 - 1}
                                    </c:otherwise>
                                </c:choose>
                            </c:set>
                            <c:forEach var="i" begin="4" end="${endValue}">
                                <div class="card">
                                    <div class="card-header" id="d-h-${questions[i].question.no}">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left medium-h4"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-target="#d-c-${questions[i].question.no}"
                                                    aria-expanded="true"
                                                    aria-controls="d-c-${questions[i].question.no}">
                                                <span class="deco-text">Q.</span> ${questions[i].question.title}
                                            </button>
                                        </h2>
                                        <div class="_arrow collapsed"
                                             data-toggle="collapse"
                                             data-target="#d-c-${questions[i].question.no}"
                                             aria-expanded="true"
                                             aria-controls="d-c-${questions[i].question.no}">
                                            <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                                      fill="#A9CC52"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <div id="d-c-${questions[i].question.no}"
                                         class="collapse"
                                         aria-labelledby="d-h-${questions[i].question.no}"
                                         data-parent="#question-accordions-2"
                                         data-no="${questions[i].question.no}"
                                         style="">
                                        <div class="card-body pl-40 pt-0">
                                            <div class="_accordion-content">
                                            <span class="regular-h5"
                                                  data-comment-no="${questions[i].best_comment_no}"><c:choose><c:when
                                                    test="${questions[i].best_comment ne null}">
                                                [베스트] ${questions[i].best_comment}
                                            </c:when><c:otherwise>등록된 답변이 없습니다. 지금 바로 답변을 등록해보세요.</c:otherwise></c:choose></span>
                                            </div>
                                            <div class="_accordion-option mt-16">
                                                <div class="_more-comments">
                                                    <a href="#">댓글 더 불러오기</a>
                                                </div>
                                                <div class="_date ml-auto">
                                                    <span class="medium-h5 c-gray-light">${questions[i].reg_datetime.toLocalDate()}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${questions.size() > 8}">
                        <div class="accordion question-accordion" id="question-accordions-3">
                            <c:set var="endValue" scope="application">
                                <c:choose>
                                    <c:when test="${fullMax > 2}">
                                        11
                                    </c:when>
                                    <c:otherwise>
                                        ${8 + questions.size() % 4 - 1}
                                    </c:otherwise>
                                </c:choose>
                            </c:set>
                            <c:forEach var="i" begin="8" end="${endValue}">
                                <div class="card">
                                    <div class="card-header" id="d-h-${questions[i].question.no}">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left medium-h4"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-target="#d-c-${questions[i].question.no}"
                                                    aria-expanded="true"
                                                    aria-controls="d-c-${questions[i].question.no}">
                                                <span class="deco-text">Q.</span> ${questions[i].question.title}
                                            </button>
                                        </h2>
                                        <div class="_arrow collapsed"
                                             data-toggle="collapse"
                                             data-target="#d-c-${questions[i].question.no}"
                                             aria-expanded="true"
                                             aria-controls="d-c-${questions[i].question.no}">
                                            <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                                      fill="#A9CC52"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <div id="d-c-${questions[i].question.no}"
                                         class="collapse"
                                         aria-labelledby="d-h-${questions[i].question.no}"
                                         data-parent="#question-accordions-3"
                                         data-no="${questions[i].question.no}"
                                         style="">
                                        <div class="card-body pl-40 pt-0">
                                            <div class="_accordion-content">
                                            <span class="regular-h5"
                                                  data-comment-no="${questions[i].best_comment_no}"><c:choose><c:when
                                                    test="${questions[i].best_comment ne null}">
                                                [베스트] ${questions[i].best_comment}
                                            </c:when><c:otherwise>등록된 답변이 없습니다. 지금 바로 답변을 등록해보세요.</c:otherwise></c:choose></span>
                                            </div>
                                            <div class="_accordion-option mt-16">
                                                <div class="_more-comments">
                                                    <a href="#">댓글 더 불러오기</a>
                                                </div>
                                                <div class="_date ml-auto">
                                                    <span class="medium-h5 c-gray-light">${questions[i].reg_datetime.toLocalDate()}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${questions.size() > 12}">
                        <div class="accordion question-accordion" id="question-accordions-4">
                            <c:set var="endValue" scope="application">
                                <c:choose>
                                    <c:when test="${fullMax > 3}">
                                        15
                                    </c:when>
                                    <c:otherwise>
                                        ${12 + questions.size() % 4 - 1}
                                    </c:otherwise>
                                </c:choose>
                            </c:set>
                            <c:forEach var="i" begin="12" end="${endValue}">
                                <div class="card">
                                    <div class="card-header" id="d-h-${questions[i].question.no}">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left medium-h4"
                                                    type="button"
                                                    data-toggle="collapse"
                                                    data-target="#d-c-${questions[i].question.no}"
                                                    aria-expanded="true"
                                                    aria-controls="d-c-${questions[i].question.no}">
                                                <span class="deco-text">Q.</span> ${questions[i].question.title}
                                            </button>
                                        </h2>
                                        <div class="_arrow collapsed"
                                             data-toggle="collapse"
                                             data-target="#d-c-${questions[i].question.no}"
                                             aria-expanded="true"
                                             aria-controls="d-c-${questions[i].question.no}">
                                            <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                                      fill="#A9CC52"></path>
                                            </svg>
                                        </div>
                                    </div>
                                    <div id="d-c-${questions[i].question.no}"
                                         class="collapse"
                                         aria-labelledby="d-h-${questions[i].question.no}"
                                         data-parent="#question-accordions-4"
                                         data-no="${questions[i].question.no}"
                                         style="">
                                        <div class="card-body pl-40 pt-0">
                                            <div class="_accordion-content">
                                            <span class="regular-h5"
                                                  data-comment-no="${questions[i].best_comment_no}"><c:choose><c:when
                                                    test="${questions[i].best_comment ne null}">
                                                [베스트] ${questions[i].best_comment}
                                            </c:when><c:otherwise>등록된 답변이 없습니다. 지금 바로 답변을 등록해보세요.</c:otherwise></c:choose></span>
                                            </div>
                                            <div class="_accordion-option mt-16">
                                                <div class="_more-comments">
                                                    <a href="#">댓글 더 불러오기</a>
                                                </div>
                                                <div class="_date ml-auto">
                                                    <span class="medium-h5 c-gray-light">${questions[i].reg_datetime.toLocalDate()}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${questions.size() <= 0}">
                <div class="bold-h4 c-gray-light" style="text-align: center">
                    <span>'${query}'에 맞는 검색 결과가 없어요.</span>
                </div>
            </c:if>
        </section>
        <!--다양한 축산 농가-->
        <section class="section" id="farm-section">
            <div class="section-title">
                <div class="_desc medium-h5 c-gray-medium">
                    많은 농가 분들이 정보와 노하우를 공유하며 축산을 진행하고 있어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    <span class="my-auto cursor-pointer">다양한 축산 농가</span>
                    <svg class="my-auto cursor-pointer" width="24" height="24" viewBox="0 0 24 24" fill="none"
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
            <c:if test="${farms.size() > 0}">
                <div class="owl-carousel card-carousel">
                    <c:forEach var="item" items="${farms}">
                        <div class="card farm-card">
                            <div class="background-image _thumbnail"
                                 style="background-image: url('${item.profile_image.url}')">

                                <c:choose>
                                    <c:when test="${item._bookmark eq true}">
                                        <div class="_bookmark is-active" data-bookmark="FARM" data-no="${item.no}">
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
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="_bookmark" data-bookmark="FARM" data-no="${item.no}">
                                            <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <g
                                                        clip-path="url(#clip0_204_2957)">
                                                    <path
                                                            d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                                                </g>
                                                <defs>
                                                    <clipPath
                                                            id="clip0_204_2957">
                                                        <rect width="24.0923" height="24"
                                                              transform="translate(0.0500488)"/>
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="card-body _body">
                                <h5 class="card-title _title bold-h4 c-basic-black">${item.name}</h5>
                                <p class="card-text _farm-type bold-h5 c-brand-green">${item.type.korName}</p>
                                <div class="_hashs">
                                    <c:forEach var="hash" items="${item.hashtag}">
                                        <span class="_hash c-gray-medium medium-p1">${hash}</span>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="_footer">
                                <button type="button" class="btn btn-brand-opacity btn-block bold-h5" data-no="${item.no}">
                                    농장 자세히 보기
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${farms.size() <= 0}">
                <div class="bold-h4 c-gray-light" style="text-align: center">
                    <span>'${query}'에 맞는 검색 결과가 없어요.</span>
                </div>
            </c:if>
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
        let free_board_dragging = false;
        let question_board_dragging = false;
        let card_board_dragging = false;

        $('.free-board').owlCarousel({
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
            onDragged: function (e) {
                setTimeout(() => {
                    free_board_dragging = false;
                }, 10)
            },
            onDrag: function (e) {
                free_board_dragging = true;
            }
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
            }, onDragged: function (e) {
                setTimeout(() => {
                    question_board_dragging = false;
                }, 10)
            },
            onDrag: function (e) {
                question_board_dragging = true;
            }
        });

        $('.card-carousel').owlCarousel({
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
            }, onDragged: function (e) {
                setTimeout(() => {
                    card_board_dragging = false;
                }, 10)
            },
            onDrag: function (e) {
                card_board_dragging = true;
            }
        });

        $('._more-comments').on('click', function (e) {
            let $this = $(this);
            e.preventDefault();
            let question_no = $(this).parent().parent().parent().data().no;
            let comments_Div = $(this).parent().prev();
            let display_comment_list = comments_Div.find('span');
            let last_idx = display_comment_list.length - 1;
            let last_comment = display_comment_list[last_idx];
            let last_comment_no = last_comment.dataset.commentNo * 1;
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

        $('._board-list ._board-container').on('click', function (e) {
            if (!free_board_dragging) {
                let no = $(this).data().no;
                window.location.href = `/community/board/detail/` + no;
            }
        })

        $('#tips-section').find('.card').on('click', function (e) {
            let path = e.originalEvent.path;
            if (!path.includes($(this).find('._bookmark')[0])) {
                window.open('/community/tip/detail/' + $(this).data().no, '_blank');
                // window.location.href = '/community/tip/detail/' + $(this).data().no;
            }
        })

        $('#manual-section').find('.card').on('click', function (e) {
            let path = e.originalEvent.path;
            if (!path.includes($(this).find('._bookmark')[0])) {
                window.open('/community/manual/detail/' + $(this).data().no, '_blank');
                // window.location.href = '/community/tips/detail/' + $(this).data().no;
            }
        })

        $('#magazine-section').find('.card').on('click', function (e) {
            let path = e.originalEvent.path;
            if (!path.includes($(this).find('._bookmark')[0])) {
                window.open('/community/magazine/detail/' + $(this).data().no, '_blank');
                // window.location.href = '/community/tips/detail/' + $(this).data().no;
            }
        })

        $('.farm-card').find('._footer button').on('click', function () {
            window.open('/community/farm/detail/' + $(this).data().no, '_blank');
            // window.location.href = '/community/farm/detail/' + $(this).data().no;
        })

        $('#question-section ._accordion-content > span').on('click', function () {
            window.open('/community/question/detail/' + $(this).parent().parent().parent().data().no, '_blank');
            // window.location.href = '/community/question/detail/' + $(this).parent().parent().parent().data().no;
        })

        $('#question-section .section-title ._title button').on('click', function () {
            loginCheck().then((result) => {
            setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        location.href='/user/board/write?type=QUESTION';
                    } else {
                        viewAlert({content: '로그인이 필요한 기능입니다.'});
                    }
                }
            })
        })

        $('.section-title ._title > span, svg').on('click', function () {
            let id = $(this).parent().parent().parent().attr('id');
            switch (id) {
                case 'board-section' :
                    window.location.href = '/community/boards';
                    break;
                case 'tips-section' :
                    window.location.href = '/community/tips';
                    break;
                case 'manual-section' :
                    window.location.href = '/community/manuals';
                    break;
                case 'magazine-section' :
                    window.location.href = '/community/magazines';
                    break;
                case 'question-section' :
                    window.location.href = '/community/questions';
                    break;
                case 'farm-section' :
                    window.location.href = '/community/farms';
                    break;
                default:
                    break;
            }
        })

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

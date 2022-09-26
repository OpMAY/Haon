<%@ page import="com.model.farm.Farm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Farm farm = (Farm) request.getAttribute("farm");
    request.setAttribute("farm", farm);
%>
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
    <div class="_detail-banner background-image"
         style="background-image: url('${farm.farm_image.url}')">
        <div class="_profile-image background-image"
             style="background-image: url('${farm.profile_image.url}')"></div>
    </div>
    <div class="container mt-96 mb-auto">
        <div class="row section farm-detail">
            <div class="col-12 col-lg-6 mx-auto">
                <div class="_info-container">
                    <div class="bold-subtitle c-gray-dark-low">
                        ${farm.name}
                    </div>
                    <div class="medium-h3 c-gray-dark-low mt-8">
                        ${farm.type.korName} 농가
                    </div>
                    <c:choose>
                        <c:when test="${farm.hashtag.size() ne 0}">
                            <div class="_recommends">
                                <c:forEach items="${farm.hashtag}" var="hash">
                                    <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                                            ${hash}
                                    </button>
                                </c:forEach>
                            </div>
                        </c:when>
                    </c:choose>
                    <div class="_out-container">
                        <c:choose>
                            <c:when test="${farm._bookmark eq true}">
                                <span class="_item _bookmark is-active" data-size="32" data-bookmark="FARM"
                                      data-no="${farm.no}">
                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_625_19335)">
                                            <path d="M28.2387 17.0592L28.256 17.0779L16 29.3339L3.74399 17.0779L3.76132 17.0592C2.33808 15.3999 1.59444 13.2641 1.67944 11.0797C1.76444 8.89531 2.67178 6.82372 4.21966 5.28006C5.76753 3.7364 7.84158 2.83471 10.0262 2.75567C12.2108 2.67663 14.3446 3.42609 16 4.85385C17.6554 3.42609 19.7892 2.67663 21.9738 2.75567C24.1584 2.83471 26.2324 3.7364 27.7803 5.28006C29.3282 6.82372 30.2355 8.89531 30.3205 11.0797C30.4055 13.2641 29.6619 15.3999 28.2387 17.0592V17.0592Z"
                                                  fill="#A9CC52"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_625_19335">
                                                <rect width="32" height="32" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="_item _bookmark" data-size="32" data-bookmark="FARM" data-no="${farm.no}">
                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_249_6939)">
                                            <path d="M28.2387 17.0592L28.256 17.0779L16 29.3339L3.74399 17.0779L3.76132 17.0592C2.33808 15.3999 1.59444 13.2641 1.67944 11.0797C1.76444 8.89531 2.67178 6.82372 4.21966 5.28006C5.76753 3.7364 7.84158 2.83471 10.0262 2.75567C12.2108 2.67663 14.3446 3.42609 16 4.85385C17.6554 3.42609 19.7892 2.67663 21.9738 2.75567C24.1584 2.83471 26.2324 3.7364 27.7803 5.28006C29.3282 6.82372 30.2355 8.89531 30.3205 11.0797C30.4055 13.2641 29.6619 15.3999 28.2387 17.0592ZM6.09999 7.17785C5.54283 7.735 5.10087 8.39644 4.79933 9.1244C4.4978 9.85236 4.3426 10.6326 4.3426 11.4205C4.3426 12.2085 4.4978 12.9887 4.79933 13.7166C5.10087 14.4446 5.54283 15.106 6.09999 15.6632L16 25.5632L25.9 15.6632C27.0252 14.538 27.6574 13.0118 27.6574 11.4205C27.6574 9.82921 27.0252 8.30308 25.9 7.17785C24.7748 6.05263 23.2486 5.42048 21.6573 5.42048C20.066 5.42048 18.5399 6.05263 17.4147 7.17785L11.7573 12.8352L9.87199 10.9472L14.088 6.73118C12.9349 5.8103 11.483 5.34662 10.0096 5.42877C8.53626 5.51093 7.14484 6.13315 6.10132 7.17652L6.09999 7.17785Z"
                                                  fill="#CCCCCC"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_249_6939">
                                                <rect width="32" height="32" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </span>
                            </c:otherwise>
                        </c:choose>
                        <span class="_item" data-href="${farm.sns.instagram}">
                            <img src="/resources/assets/images/icon/instagram.png"/>
                        </span>
                        <span class="_item" data-href="${farm.sns.blog}">
                            <img src="/resources/assets/images/icon/blog.png"/>
                        </span>
                        <span class="_item" data-href="${farm.sns.homepage}">
                            <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M1.77778 0H30.2222C30.6937 0 31.1459 0.187301 31.4793 0.520699C31.8127 0.854097 32 1.30628 32 1.77778V30.2222C32 30.6937 31.8127 31.1459 31.4793 31.4793C31.1459 31.8127 30.6937 32 30.2222 32H1.77778C1.30628 32 0.854097 31.8127 0.520699 31.4793C0.187301 31.1459 0 30.6937 0 30.2222V1.77778C0 1.30628 0.187301 0.854097 0.520699 0.520699C0.854097 0.187301 1.30628 0 1.77778 0V0ZM7.08978 19.6711C6.98311 20.1458 6.92978 20.6578 6.92978 21.0756C6.92978 22.7236 7.78667 23.8169 9.61067 23.8169C11.1236 23.8169 12.3502 22.8818 13.2338 21.3724L12.6951 23.6249H15.6996L17.4169 16.4587C17.8453 14.6453 18.6791 13.7031 19.9396 13.7031C20.9316 13.7031 21.5484 14.3431 21.5484 15.4044C21.5484 15.712 21.5218 16.0462 21.4151 16.4089L20.5298 19.7031C20.4032 20.1574 20.3398 20.627 20.3413 21.0987C20.3413 22.6631 21.2267 23.8062 23.0791 23.8062C24.6613 23.8062 25.9236 22.7467 26.6204 20.2062L25.44 19.7316C24.8498 21.4347 24.3378 21.7404 23.936 21.7404C23.5342 21.7404 23.3191 21.4631 23.3191 20.9049C23.3191 20.6542 23.3724 20.3751 23.4542 20.0391L24.3129 16.8302C24.5262 16.0764 24.608 15.408 24.608 14.7947C24.608 12.3947 23.2124 11.1413 21.5218 11.1413C19.9396 11.1413 18.3289 12.6258 17.5253 14.1902L18.1138 11.3831H13.5271L12.8818 13.8542H15.0293L13.7067 19.3618C12.6702 21.7618 10.7627 21.8009 10.5244 21.744C10.1298 21.6533 9.87911 21.4969 9.87911 20.9653C9.87911 20.6596 9.93244 20.2187 10.0676 19.6889L12.08 11.3831H6.98133L6.33778 13.8542H8.45689L7.088 19.6711H7.08978ZM10 10C10.5304 10 11.0391 9.78929 11.4142 9.41421C11.7893 9.03914 12 8.53043 12 8C12 7.46957 11.7893 6.96086 11.4142 6.58579C11.0391 6.21071 10.5304 6 10 6C9.46957 6 8.96086 6.21071 8.58579 6.58579C8.21071 6.96086 8 7.46957 8 8C8 8.53043 8.21071 9.03914 8.58579 9.41421C8.96086 9.78929 9.46957 10 10 10V10Z"
                                      fill="#A9CC52"/>
                            </svg>
                        </span>
                    </div>
                    <div class="_desc regular-h4 c-gray-dark-low">
                        <div class="summernote-container ellipsis">
                            ${farm.description}
                        </div>
                    </div>
                    <div>
                        <a href="javascript:void(0);" data-action="more" data-type="open"
                           class="_more c-brand-green medium-h4">더보기</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 col-12 mx-auto">
                <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active medium-h4"
                                id="board-tab"
                                data-toggle="tab"
                                data-target="#board"
                                type="button"
                                role="tab"
                                aria-controls="board"
                                aria-selected="true">게시글
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link medium-h4"
                                id="manual-tab"
                                data-toggle="tab"
                                data-target="#manual"
                                type="button"
                                role="tab"
                                aria-controls="manual"
                                aria-selected="false">노하우 & 메뉴얼
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link medium-h4"
                                id="comment-tab"
                                data-toggle="tab"
                                data-target="#comment"
                                type="button"
                                role="tab"
                                aria-controls="comment"
                                aria-selected="false">댓글
                        </button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="board" role="tabpanel" aria-labelledby="board-tab">
                        <div class="_dropdowns">
                            <!--TODO Dropdown Setting-->
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false"
                                     class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="자유게시판" data-type="board"
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
                                <div class="dropdown-menu dropdown-md" data-type="switch" data-item="boards">
                                    <a class="dropdown-item">
                                        <div data-type="board">자유 게시판</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div data-type="question">질문과 답변</div>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false"
                                     class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="전체"
                                           data-type=""
                                           id="board-filter2">
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
                                <div class="dropdown-menu dropdown-md" data-type="category" data-item="boards">
                                    <a class="dropdown-item">
                                        <div data-value="">전체</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div data-value="관리자가 선택한 카테고리 1">관리자가 선택한 카테고리 1</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div data-value="관리자가 선택한 카테고리 2">관리자가 선택한 카테고리 2</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="_board-list">
                            <c:if test="${boards.size() > 0}">
                                <c:forEach var="item" items="${boards}">
                                    <div class="_board-container" data-no="${item.no}" data-type="board">
                                        <div class="_content ellipsis-one-line">
                                            <span class="medium-h4">${item.title}</span>
                                        </div>
                                        <div class="_info">
                                            <c:set var="newDiff" scope="application">
                                                <custom:localDateTimeDiffer value="${item.reg_datetime}"/>
                                            </c:set>
                                            <span class="bold-h5 c-brand-green<c:if test="${newDiff eq true}"> d-none</c:if>">New!</span>
                                            <span class="medium-h5 c-gray-light ml-8">${item.views} Views</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${boards.size() <= 0}">
                                <div class="regular-h5" style="text-align: center">
                                    <span>등록된 게시글이 없습니다.</span>
                                </div>
                            </c:if>
                        </div>
                        <div class="accordion question-accordion d-none">
                            <div class="row row-cols-1 accordion-deck-container pt-8" id="accordionExample1">

                            </div>
                        </div>
                        <div class="mt-20 _farmload" data-type="board">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                더 불러오기
                            </button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="manual" role="tabpanel" aria-labelledby="manual-tab">
                        <div class="_dropdowns">
                            <!--TODO Dropdown Setting-->
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false"
                                     class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="팁과 노하우"
                                           data-type="tip"
                                           id="manual-filter1">
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
                                <div class="dropdown-menu dropdown-sm" data-type="switch" data-item="tips">
                                    <a class="dropdown-item">
                                        <div data-type="tip">팁과 노하우</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div data-type="manual">메뉴얼</div>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false"
                                     class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="전체"
                                           data-type=""
                                           id="manual-filter2">
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
                                <div class="dropdown-menu dropdown-sm" data-type="category" data-item="tips">
                                    <a class="dropdown-item">
                                        <div data-value="">전체</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div data-value="관리자가 선택한 카테고리 1">관리자가 선택한 카테고리 1</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div data-value="관리자가 선택한 카테고리 2">관리자가 선택한 카테고리 2</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row row-cols-2 _manual-deck">
                            <c:forEach var="item" items="${tips}">
                                <c:if test="${item.thumbnail.url ne null}">
                                    <div class="col p-8 d-flex align-items-stretch" data-no="${item.no}" data-type="tip">
                                        <div class="card community-card">
                                            <div class="background-image _thumbnail"
                                                 style="background-image:url('${item.thumbnail.url}')">
                                                <div class="background-image _profile"
                                                     style="background-image:url('${item.profile_image.url}')"></div>
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
                                    <div class="col p-8 d-flex align-items-stretch" data-no="${item.no}" data-type="tip">
                                        <div class="card community-card is-empty">
                                            <div class="background-image _profile"
                                                 style="background-image:url('${item.profile_image.url}')"></div>
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
                        <div class="mt-20 _farmload" data-type="tip">
                            <button type="button" class="btn btn-brand-opacity btn-block bold-h5">
                                더 불러오기
                            </button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="comment-tab">
                        <div class="_comments mt-24">
                            <div class="form-group form-inner-button">
                                <input data-type="FARM" data-no="${farm.no}" type="text" placeholder="댓글을 입력하세요."
                                       class="form-control input-box medium-h5">
                                <button onclick="writeComment(this);" type="button"
                                        class="btn btn-sm btn-brand bold-h5">작성
                                </button>
                            </div>
                            <c:forEach items="${comments}" var="comment" varStatus="status">
                                <div class="comment-container">
                                    <div class="_comment">
                                        <div class="_profile-img">
                                            <img alt=""
                                                 src="${comment.user.profile_img.url}">
                                        </div>
                                        <div class="_media">
                                            <div class="_comment-text">
                                                <c:if test="${comment._best}">
                                                    <span class="bold-h5 c-brand-green _best">BEST</span>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${comment._blocked eq true}">
                                                        <span class="medium-h5 _content ellipsis-one-line">비공개된 댓글입니다.</span>
                                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <g clip-path="url(#clip0_249_10580)">
                                                                <path d="M18 8H20C20.2652 8 20.5196 8.10536 20.7071 8.29289C20.8946 8.48043 21 8.73478 21 9V21C21 21.2652 20.8946 21.5196 20.7071 21.7071C20.5196 21.8946 20.2652 22 20 22H4C3.73478 22 3.48043 21.8946 3.29289 21.7071C3.10536 21.5196 3 21.2652 3 21V9C3 8.73478 3.10536 8.48043 3.29289 8.29289C3.48043 8.10536 3.73478 8 4 8H6V7C6 5.4087 6.63214 3.88258 7.75736 2.75736C8.88258 1.63214 10.4087 1 12 1C13.5913 1 15.1174 1.63214 16.2426 2.75736C17.3679 3.88258 18 5.4087 18 7V8ZM11 15.732V18H13V15.732C13.3813 15.5119 13.6793 15.1721 13.8478 14.7653C14.0162 14.3586 14.0458 13.9076 13.9319 13.4823C13.8179 13.057 13.5668 12.6813 13.2175 12.4132C12.8682 12.1452 12.4403 11.9999 12 11.9999C11.5597 11.9999 11.1318 12.1452 10.7825 12.4132C10.4332 12.6813 10.1821 13.057 10.0681 13.4823C9.9542 13.9076 9.98376 14.3586 10.1522 14.7653C10.3207 15.1721 10.6187 15.5119 11 15.732ZM16 8V7C16 5.93913 15.5786 4.92172 14.8284 4.17157C14.0783 3.42143 13.0609 3 12 3C10.9391 3 9.92172 3.42143 9.17157 4.17157C8.42143 4.92172 8 5.93913 8 7V8H16Z"
                                                                      fill="#F2F2F2"></path>
                                                            </g>
                                                            <defs>
                                                                <clipPath id="clip0_249_10580">
                                                                    <rect width="24" height="24" fill="white"></rect>
                                                                </clipPath>
                                                            </defs>
                                                        </svg>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="medium-h5 _content ellipsis-one-line">${comment.content}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:set var="newDiff" scope="application">
                                                    <custom:localDateTimeDiffer value="${recomment.reg_datetime}"/>
                                                </c:set>
                                                <c:if test="${newDiff eq false}">
                                                    <span class="bold-p1 c-brand-green _new">New!</span>
                                                </c:if>
                                            </div>
                                            <div class="_info">
                                                <span class="regular-h5 c-gray-medium _name">${comment.user.name}</span>
                                                <span class="regular-h6 c-gray-light ml-8"><custom:formatDatetime
                                                        value="${comment.reg_datetime}" pattern="yyyy-MM-dd"/></span>
                                            </div>
                                        </div>
                                        <div class="_transactions">
                                            <div class="_responds">
                                                <c:choose>
                                                    <c:when test="${comment._like eq true}">
                                                        <div class="_like is-active" data-comment-like="FARM"
                                                             data-no="${comment.no}">
                                                            <svg width="16"
                                                                 height="14"
                                                                 viewBox="0 0 16 14"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M9.73301 5.33333H13.9997C14.3533 5.33333 14.6924 5.47381 14.9425 5.72386C15.1925 5.97391 15.333 6.31304 15.333 6.66667V8.06933C15.3332 8.24357 15.2992 8.41616 15.233 8.57733L13.169 13.5867C13.1188 13.7088 13.0335 13.8133 12.9238 13.8869C12.8141 13.9605 12.6851 13.9999 12.553 14L1.33301 14C1.1562 14 0.986625 13.9298 0.861601 13.8047C0.736577 13.6797 0.666339 13.5101 0.666339 13.3333L0.666339 6.66667C0.666339 6.48986 0.736577 6.32029 0.861601 6.19526C0.986625 6.07024 1.1562 6 1.33301 6H3.65434C3.76107 6.00003 3.86625 5.97443 3.96103 5.92536C4.05581 5.87628 4.13742 5.80517 4.19901 5.718L7.83434 0.567333C7.8803 0.502208 7.94807 0.455707 8.02536 0.43626C8.10266 0.416813 8.18437 0.425708 8.25567 0.461333L9.46501 1.06667C9.80534 1.23677 10.0772 1.51821 10.2355 1.86421C10.3938 2.21021 10.4289 2.59995 10.335 2.96867L9.73301 5.33333ZM4.66634 7.05867V12.6667L12.1063 12.6667L13.9997 8.06933V6.66667L9.73301 6.66667C9.52994 6.66664 9.32956 6.62023 9.14716 6.53097C8.96476 6.44172 8.80515 6.31198 8.68052 6.15166C8.55589 5.99133 8.46953 5.80466 8.42802 5.60588C8.38651 5.4071 8.39095 5.20147 8.44101 5.00467L9.04301 2.63933C9.06185 2.56555 9.05486 2.48754 9.0232 2.41829C8.99154 2.34903 8.93713 2.2927 8.86901 2.25867L8.42834 2.03867L5.28834 6.48667C5.12167 6.72267 4.90834 6.916 4.66634 7.05867V7.05867ZM3.33301 7.33333H1.99967V12.6667H3.33301V7.33333Z"
                                                                      fill="#969696"></path>
                                                            </svg>
                                                            <span class="regular-h5">${comment.like_count}</span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="_like" data-comment-like="FARM"
                                                             data-no="${comment.no}">
                                                            <svg width="16"
                                                                 height="14"
                                                                 viewBox="0 0 16 14"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M9.73301 5.33333H13.9997C14.3533 5.33333 14.6924 5.47381 14.9425 5.72386C15.1925 5.97391 15.333 6.31304 15.333 6.66667V8.06933C15.3332 8.24357 15.2992 8.41616 15.233 8.57733L13.169 13.5867C13.1188 13.7088 13.0335 13.8133 12.9238 13.8869C12.8141 13.9605 12.6851 13.9999 12.553 14L1.33301 14C1.1562 14 0.986625 13.9298 0.861601 13.8047C0.736577 13.6797 0.666339 13.5101 0.666339 13.3333L0.666339 6.66667C0.666339 6.48986 0.736577 6.32029 0.861601 6.19526C0.986625 6.07024 1.1562 6 1.33301 6H3.65434C3.76107 6.00003 3.86625 5.97443 3.96103 5.92536C4.05581 5.87628 4.13742 5.80517 4.19901 5.718L7.83434 0.567333C7.8803 0.502208 7.94807 0.455707 8.02536 0.43626C8.10266 0.416813 8.18437 0.425708 8.25567 0.461333L9.46501 1.06667C9.80534 1.23677 10.0772 1.51821 10.2355 1.86421C10.3938 2.21021 10.4289 2.59995 10.335 2.96867L9.73301 5.33333ZM4.66634 7.05867V12.6667L12.1063 12.6667L13.9997 8.06933V6.66667L9.73301 6.66667C9.52994 6.66664 9.32956 6.62023 9.14716 6.53097C8.96476 6.44172 8.80515 6.31198 8.68052 6.15166C8.55589 5.99133 8.46953 5.80466 8.42802 5.60588C8.38651 5.4071 8.39095 5.20147 8.44101 5.00467L9.04301 2.63933C9.06185 2.56555 9.05486 2.48754 9.0232 2.41829C8.99154 2.34903 8.93713 2.2927 8.86901 2.25867L8.42834 2.03867L5.28834 6.48667C5.12167 6.72267 4.90834 6.916 4.66634 7.05867V7.05867ZM3.33301 7.33333H1.99967V12.6667H3.33301V7.33333Z"
                                                                      fill="#969696"></path>
                                                            </svg>
                                                            <span class="regular-h5">${comment.like_count}</span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${comment._dislike eq true}">
                                                        <div class="_dislike is-active" data-comment-dislike="FARM"
                                                             data-no="${comment.no}">
                                                            <svg width="16"
                                                                 height="14"
                                                                 viewBox="0 0 16 14"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M6.26699 8.66667H2.00033C1.6467 8.66667 1.30757 8.52619 1.05752 8.27614C0.807469 8.02609 0.666993 7.68696 0.666993 7.33333V5.93067C0.666813 5.75643 0.700787 5.58384 0.766993 5.42267L2.83099 0.413333C2.88118 0.291169 2.96652 0.186663 3.07619 0.113075C3.18586 0.0394861 3.31492 0.000130314 3.44699 0H14.667C14.8438 0 15.0134 0.0702379 15.1384 0.195262C15.2634 0.320286 15.3337 0.489856 15.3337 0.666667V7.33333C15.3337 7.51014 15.2634 7.67971 15.1384 7.80474C15.0134 7.92976 14.8438 8 14.667 8H12.3457C12.2389 7.99997 12.1338 8.02557 12.039 8.07464C11.9442 8.12372 11.8626 8.19483 11.801 8.282L8.16566 13.4327C8.1197 13.4978 8.05193 13.5443 7.97464 13.5637C7.89734 13.5832 7.81563 13.5743 7.74433 13.5387L6.53499 12.9333C6.19466 12.7632 5.92277 12.4818 5.76451 12.1358C5.60624 11.7898 5.57112 11.4001 5.66499 11.0313L6.26699 8.66667ZM11.3337 6.94133V1.33333H3.89366L2.00033 5.93067V7.33333H6.26699C6.47006 7.33336 6.67044 7.37977 6.85284 7.46903C7.03524 7.55828 7.19485 7.68802 7.31948 7.84834C7.44411 8.00867 7.53047 8.19534 7.57198 8.39412C7.61349 8.5929 7.60905 8.79853 7.55899 8.99533L6.95699 11.3607C6.93815 11.4344 6.94514 11.5125 6.9768 11.5817C7.00846 11.651 7.06287 11.7073 7.13099 11.7413L7.57166 11.9613L10.7117 7.51333C10.8783 7.27733 11.0917 7.084 11.3337 6.94133V6.94133ZM12.667 6.66667H14.0003V1.33333H12.667V6.66667Z"
                                                                      fill="#969696"></path>
                                                            </svg>
                                                            <span class="regular-h5 c-gray-medium">${comment.dislike_count}</span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="_dislike" data-comment-dislike="FARM"
                                                             data-no="${comment.no}">
                                                            <svg width="16"
                                                                 height="14"
                                                                 viewBox="0 0 16 14"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M6.26699 8.66667H2.00033C1.6467 8.66667 1.30757 8.52619 1.05752 8.27614C0.807469 8.02609 0.666993 7.68696 0.666993 7.33333V5.93067C0.666813 5.75643 0.700787 5.58384 0.766993 5.42267L2.83099 0.413333C2.88118 0.291169 2.96652 0.186663 3.07619 0.113075C3.18586 0.0394861 3.31492 0.000130314 3.44699 0H14.667C14.8438 0 15.0134 0.0702379 15.1384 0.195262C15.2634 0.320286 15.3337 0.489856 15.3337 0.666667V7.33333C15.3337 7.51014 15.2634 7.67971 15.1384 7.80474C15.0134 7.92976 14.8438 8 14.667 8H12.3457C12.2389 7.99997 12.1338 8.02557 12.039 8.07464C11.9442 8.12372 11.8626 8.19483 11.801 8.282L8.16566 13.4327C8.1197 13.4978 8.05193 13.5443 7.97464 13.5637C7.89734 13.5832 7.81563 13.5743 7.74433 13.5387L6.53499 12.9333C6.19466 12.7632 5.92277 12.4818 5.76451 12.1358C5.60624 11.7898 5.57112 11.4001 5.66499 11.0313L6.26699 8.66667ZM11.3337 6.94133V1.33333H3.89366L2.00033 5.93067V7.33333H6.26699C6.47006 7.33336 6.67044 7.37977 6.85284 7.46903C7.03524 7.55828 7.19485 7.68802 7.31948 7.84834C7.44411 8.00867 7.53047 8.19534 7.57198 8.39412C7.61349 8.5929 7.60905 8.79853 7.55899 8.99533L6.95699 11.3607C6.93815 11.4344 6.94514 11.5125 6.9768 11.5817C7.00846 11.651 7.06287 11.7073 7.13099 11.7413L7.57166 11.9613L10.7117 7.51333C10.8783 7.27733 11.0917 7.084 11.3337 6.94133V6.94133ZM12.667 6.66667H14.0003V1.33333H12.667V6.66667Z"
                                                                      fill="#969696"></path>
                                                            </svg>
                                                            <span class="regular-h5 c-gray-medium">${comment.dislike_count}</span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="_reply">
                                                <c:if test="${comment.owner_checked eq true}">
                                                    <span class="medium-h5 c-gray-dark-low _delete"
                                                          data-no="${comment.no}" data-type="FARM"
                                                          data-parent="parent">삭제</span>
                                                </c:if>
                                                <span class="medium-h5 c-gray-dark-low _do"
                                                      data-comment-no="${comment.no}" data-type="FARM"
                                                      data-no="${farm.no}">답글</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="reply-comment-container">
                                        <c:forEach items="${comment.comments}" var="recomment" varStatus="reStatus">
                                            <c:set var="reply_new" value="false"/>
                                            <c:choose>
                                                <c:when test="${recomment._blocked eq true}">
                                                    <div class="_comment">
                                                        <div class="_profile-img">
                                                            <img alt=""
                                                                 src="${recomment.user.profile_img.url}">
                                                        </div>
                                                        <div class="_media">
                                                            <div class="_comment-text">
                                                                <span class="medium-p1 _content ellipsis-one-line">비공개된 댓글입니다.</span>
                                                                <svg width="16" height="16" viewBox="0 0 24 24"
                                                                     fill="none"
                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                    <g clip-path="url(#clip0_249_10580)">
                                                                        <path d="M18 8H20C20.2652 8 20.5196 8.10536 20.7071 8.29289C20.8946 8.48043 21 8.73478 21 9V21C21 21.2652 20.8946 21.5196 20.7071 21.7071C20.5196 21.8946 20.2652 22 20 22H4C3.73478 22 3.48043 21.8946 3.29289 21.7071C3.10536 21.5196 3 21.2652 3 21V9C3 8.73478 3.10536 8.48043 3.29289 8.29289C3.48043 8.10536 3.73478 8 4 8H6V7C6 5.4087 6.63214 3.88258 7.75736 2.75736C8.88258 1.63214 10.4087 1 12 1C13.5913 1 15.1174 1.63214 16.2426 2.75736C17.3679 3.88258 18 5.4087 18 7V8ZM11 15.732V18H13V15.732C13.3813 15.5119 13.6793 15.1721 13.8478 14.7653C14.0162 14.3586 14.0458 13.9076 13.9319 13.4823C13.8179 13.057 13.5668 12.6813 13.2175 12.4132C12.8682 12.1452 12.4403 11.9999 12 11.9999C11.5597 11.9999 11.1318 12.1452 10.7825 12.4132C10.4332 12.6813 10.1821 13.057 10.0681 13.4823C9.9542 13.9076 9.98376 14.3586 10.1522 14.7653C10.3207 15.1721 10.6187 15.5119 11 15.732ZM16 8V7C16 5.93913 15.5786 4.92172 14.8284 4.17157C14.0783 3.42143 13.0609 3 12 3C10.9391 3 9.92172 3.42143 9.17157 4.17157C8.42143 4.92172 8 5.93913 8 7V8H16Z"
                                                                              fill="#F2F2F2"></path>
                                                                    </g>
                                                                    <defs>
                                                                        <clipPath id="clip0_249_10580">
                                                                            <rect width="24" height="24"
                                                                                  fill="white"></rect>
                                                                        </clipPath>
                                                                    </defs>
                                                                </svg>
                                                                <c:set var="newDiff" scope="application">
                                                                    <custom:localDateTimeDiffer
                                                                            value="${recomment.reg_datetime}"/>
                                                                </c:set>
                                                                <c:if test="${newDiff eq false}">
                                                                    <span class="bold-p1 c-brand-green _new">New!</span>
                                                                </c:if>
                                                            </div>
                                                            <div class="_info">
                                                                <span class="regular-p1 c-gray-medium _name">${recomment.user.name}</span>
                                                                <span class="regular-p1 c-gray-light ml-8"><custom:formatDatetime
                                                                        value="${recomment.reg_datetime}"
                                                                        pattern="yyyy-MM-dd"/></span>
                                                            </div>
                                                        </div>
                                                        <div class="_transactions">
                                                            <div class="_reply">
                                                                <c:if test="${recomment.owner_checked eq true}">
                                                                    <span class="medium-h5 c-gray-dark-low _delete mr-0"
                                                                          data-no="${recomment.no}" data-type="FARM"
                                                                          data-parent="self">삭제</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="_comment">
                                                        <div class="_profile-img">
                                                            <img alt=""
                                                                 src="${recomment.user.profile_img.url}">
                                                        </div>
                                                        <div class="_media">
                                                            <div class="_comment-text">
                                                                <span class="medium-p1 _content ellipsis-one-line">${recomment.content}</span>
                                                                <c:set var="newDiff" scope="application">
                                                                    <custom:localDateTimeDiffer
                                                                            value="${recomment.reg_datetime}"/>
                                                                </c:set>
                                                                <c:if test="${newDiff eq false}">
                                                                    <span class="bold-p1 c-brand-green _new">New!</span>
                                                                </c:if>
                                                            </div>
                                                            <div class="_info">
                                                                <span class="regular-p1 c-gray-medium _name">${recomment.user.name}</span>
                                                                <span class="regular-p1 c-gray-light ml-8"><custom:formatDatetime
                                                                        value="${recomment.reg_datetime}"
                                                                        pattern="yyyy-MM-dd"/></span>
                                                            </div>
                                                        </div>
                                                        <div class="_transactions">
                                                            <div class="_reply">
                                                                <c:if test="${recomment.owner_checked eq true}">
                                                                    <span class="medium-h5 c-gray-dark-low _delete mr-0"
                                                                          data-no="${recomment.no}" data-type="FARM"
                                                                          data-parent="self">삭제</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/script.jsp"/>
<script src="/resources/js/module/comment.js"></script>
<script src="/resources/js/page/farm-detail.js"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
        $('[data-action="more"]').click(function () {
            let description = document.querySelector('.farm-detail ._desc .summernote-container');
            if (this.dataset.type === 'open') {
                this.innerHTML = '줄이기';
                this.setAttribute('data-type', 'close');
                description.classList.remove('ellipsis');
            } else {
                this.innerHTML = '더보기';
                this.setAttribute('data-type', 'open');
                description.classList.add('ellipsis');
            }
        });
        $('[data-comment-like]').on('click', function () {
            let no = this.dataset.no;
            let type = this.dataset.commentLike;
            loginCheck().then((result) => {
                if (result.status === 'OK') {
                    if (result.data.status) {
                        updateCommentLike(type, no).then((result) => {
                            console.log(result);
                            if (result.status === 'OK') {
                                if (result.data.status) {
                                    let count = this.querySelector('span').textContent * 1;
                                    if (result.data.type === 'insert') {
                                        if (!this.classList.contains('is-active')) {
                                            this.classList.add('is-active');
                                        }
                                        console.log(this);
                                        this.querySelector('span').innerHTML = ++count;
                                        viewAlert({content: '좋아요를 표시했습니다.'});
                                    } else {
                                        if (this.classList.contains('is-active')) {
                                            this.classList.remove('is-active');
                                        }
                                        this.querySelector('span').innerHTML = --count;
                                        viewAlert({content: '좋아요 표시를 해제했습니다.'});
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
        $('[data-comment-dislike]').on('click', function () {
            let no = this.dataset.no;
            let type = this.dataset.commentDislike;
            loginCheck().then((result) => {
                if (result.status === 'OK') {
                    if (result.data.status) {
                        updateCommentDislike(type, no).then((result) => {
                            console.log(result);
                            if (result.status === 'OK') {
                                if (result.data.status) {
                                    let count = this.querySelector('span').textContent * 1;
                                    if (result.data.type === 'insert') {
                                        if (!this.classList.contains('is-active')) {
                                            this.classList.add('is-active');
                                        }
                                        console.log(this);
                                        this.querySelector('span').innerHTML = ++count;
                                        viewAlert({content: '싫어요를 표시했습니다.'});
                                    } else {
                                        if (this.classList.contains('is-active')) {
                                            this.classList.remove('is-active');
                                        }
                                        this.querySelector('span').innerHTML = --count;
                                        viewAlert({content: '싫어요 표시를 해제했습니다.'});
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
</script>
</body>

</html>

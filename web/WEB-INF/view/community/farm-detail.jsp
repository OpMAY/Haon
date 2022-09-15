<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<jsp:include page="../common/head.jsp"/>

<body>

<jsp:include page="../common/header.jsp"/>

<jsp:include page="../common/header-desc.jsp"/>

<div id="content-wrapper">
    <div class="_detail-banner background-image"
         style="background-image: url('../../../resources/assets/images/sample/background-wallpaper1.png')">
        <div class="_profile-image background-image"
             style="background-image: url('../../../resources/assets/images/sample/card-profile-image.png')"></div>
    </div>
    <div class="container mt-96 mb-auto">
        <div class="row section farm-detail">
            <div class="col-12 col-lg-6 mx-auto">
                <div class="_info-container">
                    <div class="bold-subtitle c-gray-dark-low">
                        하은축산
                    </div>
                    <div class="medium-h3 c-gray-dark-low mt-8">
                        양&염소 농가
                    </div>
                    <div class="_recommends">
                        <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                            추천 검색어1
                        </button>
                        <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                            추천 검색어2
                        </button>
                        <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                            추천 검색어3
                        </button>
                        <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                            추천 검색어4
                        </button>
                    </div>
                    <div class="_out-container">
            <span class="_item _bookmark">
              <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                        <span class="_item">
              <img src="../../resources/assets/images/icon/instagram.png"/>
            </span>
                        <span class="_item">
              <img src="../../resources/assets/images/icon/blog.png"/>
            </span>
                    </div>
                    <div class="_desc regular-h4 c-gray-dark-low">
                        양 & 염소는 풀을 너무 많이 먹이면 안된다고 하네요.
                        양 & 염소는 풀을 너무 많이 먹
                        양 & 염소는 풀을 너무 많이 먹이면 안된다고소개
                        소개 설명 부분입니다.
                        ....
                    </div>
                    <a href="#" class="_more c-brand-green medium-h4">더보기</a>
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
                                <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="자유게시판"
                                           id="board-filter1">
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
                                <div class="dropdown-menu dropdown-sm">
                                    <a class="dropdown-item">
                                        <div>List 1</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 2</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 3</div>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="기타"
                                           id="board-filter2">
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
                                <div class="dropdown-menu dropdown-sm">
                                    <a class="dropdown-item">
                                        <div>List 1</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 2</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 3</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="_board-list">
                            <div class="_board-container" data-no="1" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                                </div>
                                <div class="_info">
                                    <span class="bold-h5 c-brand-green">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                                </div>
                            </div>
                            <div class="_board-container" data-no="1" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                                </div>
                                <div class="_info">
                                    <span class="bold-h5 c-brand-green">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                                </div>
                            </div>
                            <div class="_board-container" data-no="1" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                                </div>
                                <div class="_info">
                                    <span class="bold-h5 c-brand-green">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                                </div>
                            </div>
                            <div class="_board-container" data-no="1" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                                </div>
                                <div class="_info">
                                    <span class="bold-h5 c-brand-green">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                                </div>
                            </div>
                            <div class="_board-container" data-no="1" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                                </div>
                                <div class="_info">
                                    <span class="bold-h5 c-brand-green">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                                </div>
                            </div>
                            <div class="_board-container" data-no="1" data-type="board">
                                <div class="_content ellipsis-one-line">
                                    <span class="medium-h4">양 &amp; 염소는 풀을 너무 많이 먹이면 안된다고 하네요.</span>
                                </div>
                                <div class="_info">
                                    <span class="bold-h5 c-brand-green d-none">New!</span>
                                    <span class="medium-h5 c-gray-light ml-8">32 Views</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="manual" role="tabpanel" aria-labelledby="manual-tab">
                        <div class="_dropdowns">
                            <!--TODO Dropdown Setting-->
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="팁과 노하우"
                                           id="manual-filter1">
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
                                <div class="dropdown-menu dropdown-sm">
                                    <a class="dropdown-item">
                                        <div>List 1</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 2</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 3</div>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="전체"
                                           id="manual-filter2">
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
                                <div class="dropdown-menu dropdown-sm">
                                    <a class="dropdown-item">
                                        <div>List 1</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 2</div>
                                    </a>
                                    <a class="dropdown-item">
                                        <div>List 3</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row row-cols-2 _manual-deck">
                            <div class="col p-8 d-flex align-items-stretch">
                                <div class="card community-card">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url('../../../resources/assets/images/sample/card-background-image.png')">
                                        <div class="background-image _profile"
                                             style="background-image:url('../../../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                                    </div>
                                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                                        <span class="_bookmark is-active">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_224_6115)">
                        <path d="M21.179 12.7939L21.192 12.8079L12 21.9999L2.80803 12.8079L2.82103 12.7939C1.75359 11.5494 1.19587 9.94758 1.25962 8.30929C1.32337 6.67099 2.00388 5.1173 3.16478 3.95956C4.32569 2.80181 5.88123 2.12554 7.51969 2.06627C9.15815 2.00699 10.7585 2.56908 12 3.6399C13.2416 2.56908 14.8419 2.00699 16.4804 2.06627C18.1188 2.12554 19.6744 2.80181 20.8353 3.95956C21.9962 5.1173 22.6767 6.67099 22.7404 8.30929C22.8042 9.94758 22.2465 11.5494 21.179 12.7939Z"
                              fill="#A9CC52"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_224_6115">
                          <rect width="24" height="24" fill="white"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col p-8 d-flex align-items-stretch">
                                <div class="card community-card">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url('../../../resources/assets/images/sample/card-background-image.png')">
                                        <div class="background-image _profile"
                                             style="background-image:url('../../../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                                    </div>
                                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col p-8 d-flex align-items-stretch">
                                <div class="card community-card">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url('../../../resources/assets/images/sample/card-background-image.png')">
                                        <div class="background-image _profile"
                                             style="background-image:url('../../../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                                    </div>
                                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col p-8 d-flex align-items-stretch">
                                <div class="card community-card is-empty">
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet, consectetur
                                            adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem explicabo fugit,
                                            laudantium
                                            minus nam pariatur quibusdam quidem quod recusandae reiciendis sunt voluptate voluptatum. Aut,
                                            cum.</p>
                                    </div>
                                    <div class="_footer">
                    <span class="_views medium-p1 c-gray-light">
                      <span class="_count">32</span>Views
                    </span><span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col p-8 d-flex align-items-stretch">
                                <div class="card community-card">
                                    <div class="background-image _thumbnail"
                                         style="background-image:url('../../../resources/assets/images/sample/card-background-image.png')">
                                        <div class="background-image _profile"
                                             style="background-image:url('../../../resources/assets/images/sample/card-profile-image.png')"></div>
                                    </div>
                                    <div class="card-body _body">
                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                                        <p class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</p>
                                    </div>
                                    <div class="_footer">
                  <span class="_views medium-p1 c-gray-light">
                    <span class="_count">32</span>Views
                  </span>
                                        <span class="_bookmark">
                    <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <g clip-path="url(#clip0_204_2957)">
                        <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"></path>
                      </g>
                      <defs>
                        <clipPath id="clip0_204_2957">
                          <rect width="24.0923" height="24" transform="translate(0.0500488)"></rect>
                        </clipPath>
                      </defs>
                    </svg>
                  </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="comment-tab">
                        <div class="_comment-list">
                            <div class="comment-container">
                                <div class="_comment">
                                    <div class="_profile-img">
                                        <img alt="" src="../../resources/assets/images/sample/background-wallpaper1.png">
                                    </div>
                                    <div class="_media">
                                        <div class="_comment-text">
                                            <span class="bold-h5 c-brand-green _best">BEST</span>
                                            <div class="medium-h5 _content ellipsis-one-line">Lorem ipsum dolor sit amet, consectetur
                                                adipisicing elit. A blanditiis debitis est facilis numquam pariatur rem reprehenderit sequi
                                                soluta totam? Accusamus beatae, enim est impedit mollitia quis recusandae totam ut.
                                            </div>
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
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
                                            <span class="bold-h5 c-brand-green _new">New!</span>
                                        </div>
                                        <div class="_info">
                                            <span class="regular-h5 c-gray-medium _name">유*준</span>
                                            <span class="medium-h5 c-gray-light ml-8">2021.12.22</span>
                                        </div>
                                    </div>
                                    <div class="_transactions">
                                        <div class="_responds">
                                            <div class="_like is-active">
                                                <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M9.73301 5.33333H13.9997C14.3533 5.33333 14.6924 5.47381 14.9425 5.72386C15.1925 5.97391 15.333 6.31304 15.333 6.66667V8.06933C15.3332 8.24357 15.2992 8.41616 15.233 8.57733L13.169 13.5867C13.1188 13.7088 13.0335 13.8133 12.9238 13.8869C12.8141 13.9605 12.6851 13.9999 12.553 14L1.33301 14C1.1562 14 0.986625 13.9298 0.861601 13.8047C0.736577 13.6797 0.666339 13.5101 0.666339 13.3333L0.666339 6.66667C0.666339 6.48986 0.736577 6.32029 0.861601 6.19526C0.986625 6.07024 1.1562 6 1.33301 6H3.65434C3.76107 6.00003 3.86625 5.97443 3.96103 5.92536C4.05581 5.87628 4.13742 5.80517 4.19901 5.718L7.83434 0.567333C7.8803 0.502208 7.94807 0.455707 8.02536 0.43626C8.10266 0.416813 8.18437 0.425708 8.25567 0.461333L9.46501 1.06667C9.80534 1.23677 10.0772 1.51821 10.2355 1.86421C10.3938 2.21021 10.4289 2.59995 10.335 2.96867L9.73301 5.33333ZM4.66634 7.05867V12.6667L12.1063 12.6667L13.9997 8.06933V6.66667L9.73301 6.66667C9.52994 6.66664 9.32956 6.62023 9.14716 6.53097C8.96476 6.44172 8.80515 6.31198 8.68052 6.15166C8.55589 5.99133 8.46953 5.80466 8.42802 5.60588C8.38651 5.4071 8.39095 5.20147 8.44101 5.00467L9.04301 2.63933C9.06185 2.56555 9.05486 2.48754 9.0232 2.41829C8.99154 2.34903 8.93713 2.2927 8.86901 2.25867L8.42834 2.03867L5.28834 6.48667C5.12167 6.72267 4.90834 6.916 4.66634 7.05867V7.05867ZM3.33301 7.33333H1.99967V12.6667H3.33301V7.33333Z"
                                                          fill="#2C2C2C"></path>
                                                </svg>
                                                <span class="regular-h5 c-gray-dark-low">12</span>
                                            </div>
                                            <div class="_dislike">
                                                <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M6.26699 8.66667H2.00033C1.6467 8.66667 1.30757 8.52619 1.05752 8.27614C0.807469 8.02609 0.666993 7.68696 0.666993 7.33333V5.93067C0.666813 5.75643 0.700787 5.58384 0.766993 5.42267L2.83099 0.413333C2.88118 0.291169 2.96652 0.186663 3.07619 0.113075C3.18586 0.0394861 3.31492 0.000130314 3.44699 0H14.667C14.8438 0 15.0134 0.0702379 15.1384 0.195262C15.2634 0.320286 15.3337 0.489856 15.3337 0.666667V7.33333C15.3337 7.51014 15.2634 7.67971 15.1384 7.80474C15.0134 7.92976 14.8438 8 14.667 8H12.3457C12.2389 7.99997 12.1338 8.02557 12.039 8.07464C11.9442 8.12372 11.8626 8.19483 11.801 8.282L8.16566 13.4327C8.1197 13.4978 8.05193 13.5443 7.97464 13.5637C7.89734 13.5832 7.81563 13.5743 7.74433 13.5387L6.53499 12.9333C6.19466 12.7632 5.92277 12.4818 5.76451 12.1358C5.60624 11.7898 5.57112 11.4001 5.66499 11.0313L6.26699 8.66667ZM11.3337 6.94133V1.33333H3.89366L2.00033 5.93067V7.33333H6.26699C6.47006 7.33336 6.67044 7.37977 6.85284 7.46903C7.03524 7.55828 7.19485 7.68802 7.31948 7.84834C7.44411 8.00867 7.53047 8.19534 7.57198 8.39412C7.61349 8.5929 7.60905 8.79853 7.55899 8.99533L6.95699 11.3607C6.93815 11.4344 6.94514 11.5125 6.9768 11.5817C7.00846 11.651 7.06287 11.7073 7.13099 11.7413L7.57166 11.9613L10.7117 7.51333C10.8783 7.27733 11.0917 7.084 11.3337 6.94133V6.94133ZM12.667 6.66667H14.0003V1.33333H12.667V6.66667Z"
                                                          fill="#2C2C2C"></path>
                                                </svg>
                                                <span class="regular-h5 c-gray-dark-low">1</span>
                                            </div>
                                        </div>
                                        <div class="_reply">
                                            <span class="medium-h5 c-gray-dark-low _do">답글</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="reply-comment-container">
                                    <div class="_comment">
                                        <div class="_profile-img">
                                            <img alt="" src="../../resources/assets/images/sample/background-wallpaper1.png">
                                        </div>
                                        <div class="_media">
                                            <div class="_comment-text">
                                                <div class="medium-p1 _content ellipsis-one-line">Lorem ipsum dolor sit amet, consectetur
                                                    adipisicing elit. Fuga harum quam quasi rerum saepe sit ut. Consectetur dolores ducimus, enim
                                                    maxime minima nulla omnis, placeat possimus quidem, reprehenderit ullam velit.
                                                </div>
                                                <svg class="is-active" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <g clip-path="url(#clip0_249_10581)">
                                                        <path d="M18 8H20C20.2652 8 20.5196 8.10536 20.7071 8.29289C20.8946 8.48043 21 8.73478 21 9V21C21 21.2652 20.8946 21.5196 20.7071 21.7071C20.5196 21.8946 20.2652 22 20 22H4C3.73478 22 3.48043 21.8946 3.29289 21.7071C3.10536 21.5196 3 21.2652 3 21V9C3 8.73478 3.10536 8.48043 3.29289 8.29289C3.48043 8.10536 3.73478 8 4 8H6V7C6 5.4087 6.63214 3.88258 7.75736 2.75736C8.88258 1.63214 10.4087 1 12 1C13.5913 1 15.1174 1.63214 16.2426 2.75736C17.3679 3.88258 18 5.4087 18 7V8ZM11 15.732V18H13V15.732C13.3813 15.5119 13.6793 15.1721 13.8478 14.7653C14.0162 14.3586 14.0458 13.9076 13.9319 13.4823C13.8179 13.057 13.5668 12.6813 13.2175 12.4132C12.8682 12.1452 12.4403 11.9999 12 11.9999C11.5597 11.9999 11.1318 12.1452 10.7825 12.4132C10.4332 12.6813 10.1821 13.057 10.0681 13.4823C9.9542 13.9076 9.98376 14.3586 10.1522 14.7653C10.3207 15.1721 10.6187 15.5119 11 15.732ZM16 8V7C16 5.93913 15.5786 4.92172 14.8284 4.17157C14.0783 3.42143 13.0609 3 12 3C10.9391 3 9.92172 3.42143 9.17157 4.17157C8.42143 4.92172 8 5.93913 8 7V8H16Z"
                                                              fill="#F2F2F2"></path>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_249_10581">
                                                            <rect width="24" height="24" fill="white"></rect>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                                <span class="bold-p1 c-brand-green _new">New!</span>
                                            </div>
                                            <div class="_info">
                                                <span class="regular-p1 c-gray-medium _name">유*준</span>
                                                <span class="medium-p1 c-gray-light ml-8">2021.12.22</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="_comment">
                                        <div class="_profile-img">
                                            <img alt="" src="../../resources/assets/images/sample/background-wallpaper1.png">
                                        </div>
                                        <div class="_media">
                                            <div class="_comment-text">
                                                <div class="medium-p1 _content ellipsis-one-line">Lorem ipsum dolor sit amet, consectetur
                                                    adipisicing elit. Fuga harum quam quasi rerum saepe sit ut. Consectetur dolores ducimus, enim
                                                    maxime minima nulla omnis, placeat possimus quidem, reprehenderit ullam velit.
                                                </div>
                                                <span class="bold-p1 c-brand-green _new">New!</span>
                                            </div>
                                            <div class="_info">
                                                <span class="regular-p1 c-gray-medium _name">유*준</span>
                                                <span class="medium-p1 c-gray-light ml-8">2021.12.22</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="comment-container">
                                <div class="_comment">
                                    <div class="_profile-img">
                                        <img alt="" src="../../resources/assets/images/sample/background-wallpaper1.png">
                                    </div>
                                    <div class="_media">
                                        <div class="_comment-text">
                                            <div class="medium-h5 _content ellipsis-one-line">Lorem
                                                ipsum dolor sit amet, consectetur adipisicing elit. Aperiam consectetur consequatur culpa
                                                cupiditate debitis dignissimos doloribus eum fuga, labore molestiae nisi nobis, nulla quo
                                                reiciendis sapiente sed similique suscipit ullam?
                                            </div>
                                            <span class="bold-h5 c-brand-green _new d-none">New!</span>
                                        </div>
                                        <div class="_info">
                                            <span class="regular-h5 c-gray-medium _name">유*준</span>
                                            <span class="medium-h5 c-gray-light ml-8">2021.12.22</span>
                                        </div>
                                    </div>
                                    <div class="_transactions">
                                        <div class="_responds">
                                            <div class="_like">
                                                <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M9.73301 5.33333H13.9997C14.3533 5.33333 14.6924 5.47381 14.9425 5.72386C15.1925 5.97391 15.333 6.31304 15.333 6.66667V8.06933C15.3332 8.24357 15.2992 8.41616 15.233 8.57733L13.169 13.5867C13.1188 13.7088 13.0335 13.8133 12.9238 13.8869C12.8141 13.9605 12.6851 13.9999 12.553 14L1.33301 14C1.1562 14 0.986625 13.9298 0.861601 13.8047C0.736577 13.6797 0.666339 13.5101 0.666339 13.3333L0.666339 6.66667C0.666339 6.48986 0.736577 6.32029 0.861601 6.19526C0.986625 6.07024 1.1562 6 1.33301 6H3.65434C3.76107 6.00003 3.86625 5.97443 3.96103 5.92536C4.05581 5.87628 4.13742 5.80517 4.19901 5.718L7.83434 0.567333C7.8803 0.502208 7.94807 0.455707 8.02536 0.43626C8.10266 0.416813 8.18437 0.425708 8.25567 0.461333L9.46501 1.06667C9.80534 1.23677 10.0772 1.51821 10.2355 1.86421C10.3938 2.21021 10.4289 2.59995 10.335 2.96867L9.73301 5.33333ZM4.66634 7.05867V12.6667L12.1063 12.6667L13.9997 8.06933V6.66667L9.73301 6.66667C9.52994 6.66664 9.32956 6.62023 9.14716 6.53097C8.96476 6.44172 8.80515 6.31198 8.68052 6.15166C8.55589 5.99133 8.46953 5.80466 8.42802 5.60588C8.38651 5.4071 8.39095 5.20147 8.44101 5.00467L9.04301 2.63933C9.06185 2.56555 9.05486 2.48754 9.0232 2.41829C8.99154 2.34903 8.93713 2.2927 8.86901 2.25867L8.42834 2.03867L5.28834 6.48667C5.12167 6.72267 4.90834 6.916 4.66634 7.05867V7.05867ZM3.33301 7.33333H1.99967V12.6667H3.33301V7.33333Z"
                                                          fill="#2C2C2C"></path>
                                                </svg>
                                                <span class="regular-h5 c-gray-dark-low">8</span>
                                            </div>
                                            <div class="_dislike">
                                                <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M6.26699 8.66667H2.00033C1.6467 8.66667 1.30757 8.52619 1.05752 8.27614C0.807469 8.02609 0.666993 7.68696 0.666993 7.33333V5.93067C0.666813 5.75643 0.700787 5.58384 0.766993 5.42267L2.83099 0.413333C2.88118 0.291169 2.96652 0.186663 3.07619 0.113075C3.18586 0.0394861 3.31492 0.000130314 3.44699 0H14.667C14.8438 0 15.0134 0.0702379 15.1384 0.195262C15.2634 0.320286 15.3337 0.489856 15.3337 0.666667V7.33333C15.3337 7.51014 15.2634 7.67971 15.1384 7.80474C15.0134 7.92976 14.8438 8 14.667 8H12.3457C12.2389 7.99997 12.1338 8.02557 12.039 8.07464C11.9442 8.12372 11.8626 8.19483 11.801 8.282L8.16566 13.4327C8.1197 13.4978 8.05193 13.5443 7.97464 13.5637C7.89734 13.5832 7.81563 13.5743 7.74433 13.5387L6.53499 12.9333C6.19466 12.7632 5.92277 12.4818 5.76451 12.1358C5.60624 11.7898 5.57112 11.4001 5.66499 11.0313L6.26699 8.66667ZM11.3337 6.94133V1.33333H3.89366L2.00033 5.93067V7.33333H6.26699C6.47006 7.33336 6.67044 7.37977 6.85284 7.46903C7.03524 7.55828 7.19485 7.68802 7.31948 7.84834C7.44411 8.00867 7.53047 8.19534 7.57198 8.39412C7.61349 8.5929 7.60905 8.79853 7.55899 8.99533L6.95699 11.3607C6.93815 11.4344 6.94514 11.5125 6.9768 11.5817C7.00846 11.651 7.06287 11.7073 7.13099 11.7413L7.57166 11.9613L10.7117 7.51333C10.8783 7.27733 11.0917 7.084 11.3337 6.94133V6.94133ZM12.667 6.66667H14.0003V1.33333H12.667V6.66667Z"
                                                          fill="#2C2C2C"></path>
                                                </svg>
                                                <span class="regular-h5 c-gray-dark-low">1</span>
                                            </div>
                                        </div>
                                        <div class="_reply">
                                            <span class="medium-h5 c-gray-dark-low _delete">삭제</span>
                                            <span class="medium-h5 c-gray-dark-low _do">답글</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="reply-comment-container">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
        /** Comment reply */
        $('._reply').on('click', '._do', function () {
            let t = this;
            let $t = $(this);
            $t.parent().append('<span class="medium-h5 c-basic-black _cancel">취소</span>');
            $(t.closest('.comment-container')).append('<div class="form-group form-inner-button">\n' +
                '                        <input type="text" placeholder="답글을 입력하세요." class="form-control input-box medium-h5"\n' +
                '                               id="input7">\n' +
                '                        <button type="button" class="btn btn-sm btn-brand bold-h5">\n' +
                '                            작성\n' +
                '                        </button>\n' +
                '                    </div>');
            $t.remove();
            // input show

        }).on('click', '._cancel', function () {
            let t = this;
            let $t = $(this);
            $t.parent().append('<span class="medium-h5 c-basic-black _do">답글</span>');
            $(t.closest('.comment-container')).find('.form-group.form-inner-button').remove();
            $t.remove();
            // input remove
        }).on('click', '._delete', function () {
            alert('삭제 버튼');
        });

        $('._comment ._transactions ._responds ._like').on('click', function () {
            let $number_span = $(this).find('span')
            if ($(this).hasClass('is-active')) {
                $(this).removeClass('is-active');
                $number_span.html(($number_span.html() * 1 - 1));
            } else {
                $(this).addClass('is-active');
                $number_span.html(($number_span.html() * 1 + 1));
            }
        });

        $('._comment ._transactions ._responds ._dislike').on('click', function () {
            let $number_span = $(this).find('span')
            if ($(this).hasClass('is-active')) {
                $(this).removeClass('is-active');
                $number_span.html(($number_span.html() * 1 - 1));
            } else {
                $(this).addClass('is-active');
                $number_span.html(($number_span.html() * 1 + 1));
            }
        });
    });
</script>
</body>

</html>

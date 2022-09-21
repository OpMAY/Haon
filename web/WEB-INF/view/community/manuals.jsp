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
                    숙력된 농가분들이 경험하고 직접 겪은 메뉴얼을 공유했어요!
                </div>
                <div class="_title bold-h2 c-gray-dark-low">
                    숙련된 축산 메뉴얼
                </div>
            </div>
            <div class="filter-dropdown-container">
                <!--TODO Filter -->
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-green">
                        <input type="text" class="form-control input-box medium-h5 dropdown-input input-sm" disabled="disabled"
                               value="축산 메뉴얼"
                               id="manuals-filter1">
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
                    <div class="dropdown-menu dropdown-md">
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 1</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 2</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 3</div>
                        </a>
                    </div>
                </div>
                <div class="dropdown input-dropdown">
                    <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-md form-gray">
                        <input type="text"
                               class="form-control input-box medium-h5 dropdown-input input-sm"
                               disabled="disabled"
                               value="전체"
                               id="manuals-filter2">
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
                    <div class="dropdown-menu dropdown-md">
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 1</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 2</div>
                        </a>
                        <a class="dropdown-item c-gray-light medium-h5">
                            <div>List 3</div>
                        </a>
                    </div>
                </div>
                <div class="right-filter-dropdown-container">
                    <div class="dropdown input-dropdown">
                        <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                            <input type="text"
                                   class="form-control input-box medium-h5 dropdown-input"
                                   disabled="disabled"
                                   value="전체"
                                   id="manuals-filter3">
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
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>최신 등록 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>뷰 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>댓글 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>추천 많은 순</div>
                            </a>
                            <a class="dropdown-item c-gray-light medium-h5">
                                <div>책갈피 많은 순</div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row row-cols-4 community-container-deck">
                <div class="col p-8 d-flex align-items-stretch">
                    <div class="card community-card">
                        <div class="background-image _thumbnail"
                             style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                            <div class="background-image _profile"
                                 style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                        </div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                            <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</div>
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
                             style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                            <div class="background-image _profile"
                                 style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                        </div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                            <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</div>
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
                             style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                            <div class="background-image _profile"
                                 style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                        </div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                            <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</div>
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
                             style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                            <div class="background-image _profile"
                                 style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                        </div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                            <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</div>
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
                            <div class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem explicabo fugit, laudantium
                                minus nam pariatur quibusdam quidem quod recusandae reiciendis sunt voluptate voluptatum. Aut,
                                cum.</div>
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
                             style="background-image:url('../../resources/assets/images/sample/card-background-image.png')">
                            <div class="background-image _profile"
                                 style="background-image:url('../../resources/assets/images/sample/card-profile-image.png')"></div>
                        </div>
                        <div class="card-body _body">
                            <h5 class="card-title _title bold-h4 c-gray-dark-low">양소 잘 키우는 법</h5>
                            <div class="card-text _description medium-h5 c-gray-medium">숙력된 농가분들이 갖고 있는 노하우와 메뉴얼을 공유했어요!</div>
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
                            <div class="card-text _description medium-h5 c-gray-medium">Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit. Adipisci aliquid aperiam at doloremque exercitationem explicabo fugit, laudantium
                                minus nam pariatur quibusdam quidem quod recusandae reiciendis sunt voluptate voluptatum. Aut,
                                cum.</div>
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
            </div>
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
    });
</script>
</body>

</html>

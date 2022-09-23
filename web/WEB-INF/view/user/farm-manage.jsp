<%@ page import="com.model.farm.Farm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Farm farm = (Farm) request.getAttribute("farm");
    request.setAttribute("farm", farm);
%>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>
<div id="content-wrapper">
    <div class="_detail-banner background-image"
         style="background-image: url('${farm.farm_image.url}')">
        <div class="_profile-image background-image"
             style="background-image: url('${farm.profile_image.url}')">
            <div class="position-relative h-100">
                <div class="_edit" data-modal-id="mypage-image-changed">
                    <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="20" cy="20" r="20" fill="#A9CC52"></circle>
                        <path d="M15.0448 26.25H10.625V21.8302L22.5365 9.91876C22.7318 9.72347 22.9967 9.61377 23.2729 9.61377C23.5491 9.61377 23.814 9.72347 24.0094 9.91876L26.9562 12.8656C27.1515 13.061 27.2612 13.3259 27.2612 13.6021C27.2612 13.8783 27.1515 14.1432 26.9562 14.3385L15.0448 26.25ZM10.625 28.3333H29.375V30.4167H10.625V28.3333Z"
                              fill="white"></path>
                    </svg>
                </div>
            </div>
        </div>
        <div class="_edit" data-modal-id="mypage-banner-changed">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="20" cy="20" r="20" fill="#A9CC52"/>
                <path d="M15.0448 26.25H10.625V21.8302L22.5365 9.91876C22.7318 9.72347 22.9967 9.61377 23.2729 9.61377C23.5491 9.61377 23.814 9.72347 24.0094 9.91876L26.9562 12.8656C27.1515 13.061 27.2612 13.3259 27.2612 13.6021C27.2612 13.8783 27.1515 14.1432 26.9562 14.3385L15.0448 26.25ZM10.625 28.3333H29.375V30.4167H10.625V28.3333Z"
                      fill="white"/>
            </svg>
        </div>
    </div>
    <div class="container mt-96 mb-auto">
        <div class="row section farm-detail">
            <div class="col-8 col-lg-6 mx-auto">
                <div class="_info-container">
                    <div class="_title bold-subtitle c-gray-dark-low">
                        <div class="d-inline-block _text">
                            ${farm.name}
                        </div>
                        <div class="_edit" data-modal-id="mypage-name-changed">
                            <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <circle cx="20" cy="20" r="20" fill="#A9CC52"/>
                                <path d="M15.0448 26.25H10.625V21.8302L22.5365 9.91876C22.7318 9.72347 22.9967 9.61377 23.2729 9.61377C23.5491 9.61377 23.814 9.72347 24.0094 9.91876L26.9562 12.8656C27.1515 13.061 27.2612 13.3259 27.2612 13.6021C27.2612 13.8783 27.1515 14.1432 26.9562 14.3385L15.0448 26.25ZM10.625 28.3333H29.375V30.4167H10.625V28.3333Z"
                                      fill="white"/>
                            </svg>
                        </div>
                    </div>
                    <div class="_farm-type medium-h3 c-gray-dark-low mt-8">
                        ${farm.type.korName} 농장
                    </div>
                    <c:choose>
                        <c:when test="${farm.hashtag ne null && farm.hashtag.size() ne 0}">
                            <div class="_recommends">
                                <div class="d-inline-block">
                                    <c:forEach items="${farm.hashtag}" var="hashtag">
                                        <button type="button"
                                                class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                                                ${hashtag}
                                        </button>
                                    </c:forEach>
                                </div>
                                <div class="_edit" data-modal-id="mypage-hashtag-changed">
                                    <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="20" cy="20" r="20" fill="#A9CC52"/>
                                        <path d="M15.0448 26.25H10.625V21.8302L22.5365 9.91876C22.7318 9.72347 22.9967 9.61377 23.2729 9.61377C23.5491 9.61377 23.814 9.72347 24.0094 9.91876L26.9562 12.8656C27.1515 13.061 27.2612 13.3259 27.2612 13.6021C27.2612 13.8783 27.1515 14.1432 26.9562 14.3385L15.0448 26.25ZM10.625 28.3333H29.375V30.4167H10.625V28.3333Z"
                                              fill="white"/>
                                    </svg>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="_recommends">
                                <div class="d-inline-block">
                                    <button type="button" class="btn btn-gray-high-light btn-md btn-hashtag medium-h5">
                                        해시태그 미설정
                                    </button>
                                </div>
                                <div class="_edit" data-modal-id="mypage-hashtag-changed">
                                    <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="20" cy="20" r="20" fill="#A9CC52"/>
                                        <path d="M15.0448 26.25H10.625V21.8302L22.5365 9.91876C22.7318 9.72347 22.9967 9.61377 23.2729 9.61377C23.5491 9.61377 23.814 9.72347 24.0094 9.91876L26.9562 12.8656C27.1515 13.061 27.2612 13.3259 27.2612 13.6021C27.2612 13.8783 27.1515 14.1432 26.9562 14.3385L15.0448 26.25ZM10.625 28.3333H29.375V30.4167H10.625V28.3333Z"
                                              fill="white"/>
                                    </svg>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="_out-container">
                        <span class="_item" data-modal-id="mypage-sns-changed">
                            <img src="/resources/assets/images/icon/instagram.png"/>
                        </span>
                        <span class="_item" data-modal-id="mypage-sns-changed">
                            <img src="/resources/assets/images/icon/blog.png"/>
                        </span>
                        <span class="_item" data-modal-id="mypage-sns-changed">
                            <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M1.77778 0H30.2222C30.6937 0 31.1459 0.187301 31.4793 0.520699C31.8127 0.854097 32 1.30628 32 1.77778V30.2222C32 30.6937 31.8127 31.1459 31.4793 31.4793C31.1459 31.8127 30.6937 32 30.2222 32H1.77778C1.30628 32 0.854097 31.8127 0.520699 31.4793C0.187301 31.1459 0 30.6937 0 30.2222V1.77778C0 1.30628 0.187301 0.854097 0.520699 0.520699C0.854097 0.187301 1.30628 0 1.77778 0V0ZM7.08978 19.6711C6.98311 20.1458 6.92978 20.6578 6.92978 21.0756C6.92978 22.7236 7.78667 23.8169 9.61067 23.8169C11.1236 23.8169 12.3502 22.8818 13.2338 21.3724L12.6951 23.6249H15.6996L17.4169 16.4587C17.8453 14.6453 18.6791 13.7031 19.9396 13.7031C20.9316 13.7031 21.5484 14.3431 21.5484 15.4044C21.5484 15.712 21.5218 16.0462 21.4151 16.4089L20.5298 19.7031C20.4032 20.1574 20.3398 20.627 20.3413 21.0987C20.3413 22.6631 21.2267 23.8062 23.0791 23.8062C24.6613 23.8062 25.9236 22.7467 26.6204 20.2062L25.44 19.7316C24.8498 21.4347 24.3378 21.7404 23.936 21.7404C23.5342 21.7404 23.3191 21.4631 23.3191 20.9049C23.3191 20.6542 23.3724 20.3751 23.4542 20.0391L24.3129 16.8302C24.5262 16.0764 24.608 15.408 24.608 14.7947C24.608 12.3947 23.2124 11.1413 21.5218 11.1413C19.9396 11.1413 18.3289 12.6258 17.5253 14.1902L18.1138 11.3831H13.5271L12.8818 13.8542H15.0293L13.7067 19.3618C12.6702 21.7618 10.7627 21.8009 10.5244 21.744C10.1298 21.6533 9.87911 21.4969 9.87911 20.9653C9.87911 20.6596 9.93244 20.2187 10.0676 19.6889L12.08 11.3831H6.98133L6.33778 13.8542H8.45689L7.088 19.6711H7.08978ZM10 10C10.5304 10 11.0391 9.78929 11.4142 9.41421C11.7893 9.03914 12 8.53043 12 8C12 7.46957 11.7893 6.96086 11.4142 6.58579C11.0391 6.21071 10.5304 6 10 6C9.46957 6 8.96086 6.21071 8.58579 6.58579C8.21071 6.96086 8 7.46957 8 8C8 8.53043 8.21071 9.03914 8.58579 9.41421C8.96086 9.78929 9.46957 10 10 10V10Z"
                                      fill="#A9CC52"/>
                            </svg>
                        </span>
                    </div>
                    <div class="_desc">
                        <div class="summernote-container">
                            ${farm.description}
                        </div>
                        <div class="summernote-inner-container">
                            <div class="_edit" data-modal-id="mypage-intro-changed">
                                <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <circle cx="20" cy="20" r="20" fill="#A9CC52"/>
                                    <path d="M15.0448 26.25H10.625V21.8302L22.5365 9.91876C22.7318 9.72347 22.9967 9.61377 23.2729 9.61377C23.5491 9.61377 23.814 9.72347 24.0094 9.91876L26.9562 12.8656C27.1515 13.061 27.2612 13.3259 27.2612 13.6021C27.2612 13.8783 27.1515 14.1432 26.9562 14.3385L15.0448 26.25ZM10.625 28.3333H29.375V30.4167H10.625V28.3333Z"
                                          fill="white"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<!-- Modal -->
<div class="modal fade" modal-title="농장 배너 변경" id="mypage-banner-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">농장 배너 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group form-inner-button form-inner-label">
                            <label for="banner-upload" class="medium-h6 c-gray-dark-low">농장 배너 이미지</label>
                            <input id="banner-upload" onchange="loadFile(event, this);" type="file" class="d-none"/>
                            <input type="text"
                                   name="banner_upload"
                                   readonly
                                   placeholder="이미지를 업로드해주세요."
                                   class="form-control input-box medium-h5 dropdown-input">
                            <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_224_6214)">
                                    <path d="M15.3673 13.9999L9.59235 8.22489L11.242 6.57523L18.6667 13.9999L11.242 21.4246L9.59235 19.7749L15.3673 13.9999Z"
                                          fill="#A9CC52"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_224_6214">
                                        <rect width="28" height="28" fill="white"
                                              transform="translate(0 28) rotate(-90)"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </div>
                    </div>
                    <div class="col-12 ">
                        <div class="modal-name-change _preview-img background-image"
                             style="background-image: url('${farm.farm_image.url}')">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4" data-action="change-banner">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" modal-title="농장 이미지 변경" id="mypage-image-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">농장 프로필 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group form-inner-button form-inner-label">
                            <label for="profile-upload" class="medium-h6 c-gray-dark-low">농장 프로필 이미지</label>
                            <input id="profile-upload" type="file" onchange="loadFile(event, this);" class="d-none"/>
                            <input type="text"
                                   readonly
                                   name="profile_upload"
                                   placeholder="이미지를 업로드해주세요."
                                   class="form-control input-box medium-h5 dropdown-input"
                                   id="input13">
                            <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_224_6214)">
                                    <path d="M15.3673 13.9999L9.59235 8.22489L11.242 6.57523L18.6667 13.9999L11.242 21.4246L9.59235 19.7749L15.3673 13.9999Z"
                                          fill="#A9CC52"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_224_6214">
                                        <rect width="28" height="28" fill="white"
                                              transform="translate(0 28) rotate(-90)"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </div>
                    </div>

                    <div class="col-12 ">
                        <div class="modal-name-change _preview-img background-image"
                             style="background-image: url('${farm.profile_image.url}')">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4" data-action="change-profile">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" modal-title="해쉬 태그 변경" id="mypage-hashtag-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">해쉬 태그 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label for="input-hashtag" class="medium-h6 c-gray-dark-low">해쉬 태그</label>
                            <input type="text"
                                   id="input-hashtag"
                                   placeholder="입력 후 Enter"
                                   class="form-control input-underline input-brand-green medium-h4">
                        </div>
                    </div>
                    <div class="col-12 btn-hashtag-container">
                        <c:forEach items="${farm.hashtag}" var="hashtag">
                            <span class="btn btn-brand-opacity btn-md btn-hashtag btn-icon default-pointer">
                                <span class="bold-h5 my-auto">${hashtag}</span>
                                <span class="_close cursor-pointer my-auto p-8 pl-16">
                                    <svg
                                            width="25"
                                            height="25"
                                            viewBox="0 0 25 25"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd"
                                              clip-rule="evenodd"
                                              d="M12.5 1.04175C6.17183 1.04175 1.04163 6.17196 1.04163 12.5001C1.04163 18.8282 6.17183 23.9584 12.5 23.9584C18.8281 23.9584 23.9583 18.8282 23.9583 12.5001C23.9583 6.17196 18.8281 1.04175 12.5 1.04175ZM16.3614 10.1115C16.5512 9.91508 16.6562 9.65195 16.6538 9.37883C16.6514 9.10571 16.5419 8.84445 16.3487 8.65131C16.1556 8.45818 15.8943 8.34863 15.6212 8.34626C15.3481 8.34388 15.085 8.44888 14.8885 8.63862L12.5 11.0272L10.1114 8.63862C10.0153 8.53913 9.90038 8.45978 9.7733 8.40518C9.64621 8.35059 9.50952 8.32186 9.37121 8.32065C9.2329 8.31945 9.09573 8.34581 8.96772 8.39818C8.8397 8.45056 8.7234 8.52791 8.62559 8.62571C8.52779 8.72352 8.45044 8.83982 8.39806 8.96784C8.34569 9.09586 8.31933 9.23302 8.32053 9.37133C8.32173 9.50964 8.35047 9.64633 8.40506 9.77342C8.45965 9.90051 8.53901 10.0154 8.6385 10.1115L11.027 12.5001L8.6385 14.8886C8.53901 14.9847 8.45965 15.0997 8.40506 15.2267C8.35047 15.3538 8.32173 15.4905 8.32053 15.6288C8.31933 15.7671 8.34569 15.9043 8.39806 16.0323C8.45044 16.1603 8.52779 16.2766 8.62559 16.3745C8.7234 16.4723 8.8397 16.5496 8.96772 16.602C9.09573 16.6544 9.2329 16.6807 9.37121 16.6795C9.50952 16.6783 9.64621 16.6496 9.7733 16.595C9.90038 16.5404 10.0153 16.461 10.1114 16.3615L12.5 13.973L14.8885 16.3615C15.085 16.5513 15.3481 16.6563 15.6212 16.6539C15.8943 16.6515 16.1556 16.542 16.3487 16.3489C16.5419 16.1557 16.6514 15.8945 16.6538 15.6213C16.6562 15.3482 16.5512 15.0851 16.3614 14.8886L13.9729 12.5001L16.3614 10.1115Z"
                                              fill="#A9CC52"/>
                                    </svg>
                                </span>
                            </span>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4" data-action="change-hashtag">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" modal-title="농장 이름 변경" id="mypage-name-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">농장 이름 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">농장 이름</label>
                            <input type="text"
                                   name="name"
                                   placeholder="농장 이름 입력"
                                   value="${farm.name}"
                                   class="form-control input-underline input-brand-green medium-h4">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4" data-action="change-name">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" modal-title="SNS 변경" id="mypage-sns-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">SNS 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">인스타그램</label>
                            <input type="text"
                                   name="instagram"
                                   placeholder="인스타그램 링크 입력"
                                   value="${farm.sns.instagram}"
                                   class="form-control input-underline input-brand-green medium-h4">
                        </div>
                    </div>

                    <div class="col-12 mt-32">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">블로그</label>
                            <input type="text"
                                   name="blog"
                                   placeholder="블로그 링크 입력"
                                   value="${farm.sns.blog}"
                                   class="form-control input-underline input-brand-green medium-h4">
                        </div>
                    </div>
                    <div class="col-12 mt-32">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">홈페이지</label>
                            <input type="text"
                                   name="homepage"
                                   placeholder="홈페이지 링크 입력"
                                   value="${farm.sns.homepage}"
                                   class="form-control input-underline input-brand-green medium-h4">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4" data-action="change-sns">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" modal-title="농장 종류 변경" id="mypage-category-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">농장 종류 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">양 & 염소</span>
                        </label>
                    </div>

                    <div class="col-12 mt-16">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">말</span>
                        </label>
                    </div>

                    <div class="col-12 mt-16">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">소</span>
                        </label>
                    </div>

                    <div class="col-12 mt-16">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">닭 & 계란</span>
                        </label>
                    </div>

                    <div class="col-12 mt-16">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">토끼</span>
                        </label>
                    </div>

                    <div class="col-12 mt-16">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">오리</span>
                        </label>
                    </div>

                    <div class="col-12 mt-16">
                        <label data-label="checkbox" class="radio-item">
                            <input data-type="radio" type="radio" name="radio1">
                            <span class="design"></span>
                            <span class="ml-16">해당 없음</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" modal-title="농장 소개 변경" id="mypage-intro-changed" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title bold-h3">농장 소개 변경</div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div id="summernote">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" type="button"
                        class="btn btn-gray-high-light medium-h4">
                    취소
                </button>
                <button type="button" class="btn btn-brand medium-h4" data-action="change-description">
                    수정
                </button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/script.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/plugin/summernote/custom_summernote-bs4.js"></script>
<script src="/resources/js/plugin/summernote/summernote-ko-KR.js"></script>
<script src="/resources/js/page/farm-manage.js"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
        $('[data-modal-id]').click(function (event) {
            let modal_id = this.dataset.modalId;
            console.log(modal_id);
            $('#' + modal_id).modal('show');
        });

        let hashtag_input = document.querySelector('#input-hashtag');
        hashtag_input.addEventListener('keypress', function (event) {
            let hash_container = document.querySelector('#mypage-hashtag-changed .btn-hashtag-container');
            if (event.keyCode === 13) {
                $(hash_container).append(createHashtagElement(this.value));
                this.value = '';
            }
        });

        $('#mypage-hashtag-changed .btn-hashtag-container').on('click', '.btn-hashtag span._close', function (event) {
            let target = event.target;
            target.closest('.btn-hashtag').remove();
        });

        $('#summernote').summernote({
            popover: {
                image: [
                    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
                    ['float', ['floatLeft', 'floatRight', 'floatNone']],
                    ['remove', ['removeMedia']]
                ],
                table: [
                    ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
                    ['delete', ['deleteRow', 'deleteCol', 'deleteTable']]
                ],
            },
            toolbar: [
                ['insert', ['picture', 'video', 'table', 'link', 'hr']],
                ['font', ['bold', 'underline', 'forecolor', 'backcolor']],
                ['fontsize', ['fontsize']],
                ['para', ['ul', 'ol', 'paragraph']],
            ],
            minHeight: 400,             // set minimum height of editor
            maxHeight: 600,             // set maximum height of editor
            focus: false,
            lang: 'ko-KR',
            tabDisable: false,
            shortcuts: false,
            placeholder: '농장 소개를 입력해주세요.'
        });
        $('#summernote').summernote('code', '${farm.description}'.replaceAll('&#39;', '\''));
        $('[name="profile_upload"]').click(function () {
            $('#profile-upload').click();
        });
        $('[name="banner_upload"]').click(function () {
            $('#banner-upload').click();
        });
    });
</script>
</body>
</html>

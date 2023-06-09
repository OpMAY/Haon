<%@ page import="com.model.content.tips.Tips" %>
<%@ page import="com.model.content.tips.TipsTransaction" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.content.tips.TipsComment" %>
<%@ page import="com.model.farm.Farm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Tips tips = (Tips) request.getAttribute("tips");
    request.setAttribute("tips", tips);

    ArrayList<TipsTransaction> likes = (ArrayList<TipsTransaction>) request.getAttribute("likes");
    request.setAttribute("likes", likes);

    boolean is_like = (boolean) request.getAttribute("is_like");
    request.setAttribute("is_like", is_like);

    boolean is_bookmark = (boolean) request.getAttribute("is_bookmark");
    request.setAttribute("is_bookmark", is_bookmark);

    ArrayList<TipsComment> comments = (ArrayList<TipsComment>) request.getAttribute("comments");
    request.setAttribute("comments", comments);

    Farm farm = (Farm) request.getAttribute("farm");
    request.setAttribute("farm", farm);
    ArrayList<Tips> other_tips = (ArrayList<Tips>) request.getAttribute("other_tips");
    request.setAttribute("other_tips", other_tips);
%>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body style="background-color: var(--gray-bg);">
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/mobile-header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/left-sidebar.jsp"/>
<jsp:include page="../common/right-sidebar.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-trace.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>
<div id="content-wrapper">
    <div class="container community-detail-container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40 mb-40" style="min-height: calc(80vh);">
            <div class="row">
                <div class="col-xl-9 col-12">
                    <div class="community-container thumbnail">
                        <c:if test="${tips.thumbnail.url ne null}">
                            <div class="_thumbnail background-image"
                                 style="padding-top: 32%; background-image: url('${tips.thumbnail.url}')"></div>
                        </c:if>
                        <div class="_detail">
                            <div class="_title bold-h2 c-gray-dark-low">
                                <span>${tips.title}</span>
                                <div class="_right-option">
                                    <svg id="kakao-share" width="32" height="32" viewBox="0 0 32 32" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_261_12485)">
                                            <path d="M27 1.99965C26.2044 1.99965 25.4413 2.31572 24.8787 2.87833C24.3161 3.44094 24 4.204 24 4.99965C24 5.7953 24.3161 6.55836 24.8787 7.12097C25.4413 7.68358 26.2044 7.99965 27 7.99965C27.7957 7.99965 28.5588 7.68358 29.1214 7.12097C29.684 6.55836 30 5.7953 30 4.99965C30 4.204 29.684 3.44094 29.1214 2.87833C28.5588 2.31572 27.7957 1.99965 27 1.99965ZM22 4.99965C21.9999 3.82652 22.4123 2.69068 23.165 1.79087C23.9177 0.891064 24.9628 0.284578 26.1176 0.0775257C27.2723 -0.129527 28.463 0.0760382 29.4815 0.658256C30.5 1.24047 31.2813 2.16227 31.6888 3.26237C32.0962 4.36247 32.1039 5.57081 31.7104 6.676C31.317 7.78118 30.5474 8.71283 29.5364 9.30794C28.5255 9.90305 27.3374 10.1237 26.1802 9.93135C25.0229 9.73899 23.9701 9.14583 23.206 8.25565L9.77004 14.4957C10.0789 15.4745 10.0789 16.5248 9.77004 17.5037L23.206 23.7437C24.0137 22.8043 25.1414 22.1983 26.3704 22.043C27.5995 21.8876 28.8424 22.1941 29.8584 22.903C30.8744 23.6119 31.591 24.6728 31.8694 25.8799C32.1478 27.087 31.9681 28.3546 31.3652 29.4368C30.7623 30.519 29.7791 31.3389 28.6062 31.7376C27.4333 32.1362 26.1541 32.0852 25.0166 31.5945C23.8791 31.1037 22.9643 30.2082 22.4495 29.0814C21.9346 27.9546 21.8564 26.6768 22.23 25.4957L8.79404 19.2557C8.12891 20.0308 7.24234 20.5836 6.2536 20.8398C5.26486 21.096 4.22137 21.0432 3.26352 20.6886C2.30566 20.334 1.47939 19.6945 0.895857 18.8562C0.31232 18.0179 -0.000488281 17.021 -0.000488281 15.9997C-0.000488281 14.9783 0.31232 13.9814 0.895857 13.1431C1.47939 12.3048 2.30566 11.6653 3.26352 11.3107C4.22137 10.9561 5.26486 10.9033 6.2536 11.1595C7.24234 11.4157 8.12891 11.9685 8.79404 12.7437L22.23 6.50365C22.0771 6.01699 21.9995 5.50978 22 4.99965V4.99965ZM5.00004 12.9997C4.20439 12.9997 3.44133 13.3157 2.87872 13.8783C2.31611 14.4409 2.00004 15.204 2.00004 15.9997C2.00004 16.7953 2.31611 17.5584 2.87872 18.121C3.44133 18.6836 4.20439 18.9997 5.00004 18.9997C5.79569 18.9997 6.55875 18.6836 7.12136 18.121C7.68397 17.5584 8.00004 16.7953 8.00004 15.9997C8.00004 15.204 7.68397 14.4409 7.12136 13.8783C6.55875 13.3157 5.79569 12.9997 5.00004 12.9997ZM27 23.9997C26.2044 23.9997 25.4413 24.3157 24.8787 24.8783C24.3161 25.4409 24 26.204 24 26.9997C24 27.7953 24.3161 28.5584 24.8787 29.121C25.4413 29.6836 26.2044 29.9997 27 29.9997C27.7957 29.9997 28.5588 29.6836 29.1214 29.121C29.684 28.5584 30 27.7953 30 26.9997C30 26.204 29.684 25.4409 29.1214 24.8783C28.5588 24.3157 27.7957 23.9997 27 23.9997Z"
                                                  fill="#222222"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_261_12485">
                                                <rect width="32" height="32" fill="white"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                    <c:choose>
                                        <c:when test="${is_bookmark eq true}">
                                            <svg class="bookmark is-active" data-no="${tips.no}"
                                                 data-detail-bookmark="TIP"
                                                 width="32" height="32" viewBox="0 0 32 32"
                                                 fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M4 4C4 2.93913 4.42143 1.92172 5.17157 1.17157C5.92172 0.421427 6.93913 0 8 0L24 0C25.0609 0 26.0783 0.421427 26.8284 1.17157C27.5786 1.92172 28 2.93913 28 4V31C27.9999 31.1809 27.9508 31.3584 27.8578 31.5135C27.7648 31.6687 27.6315 31.7957 27.472 31.8811C27.3125 31.9665 27.1329 32.007 26.9522 31.9983C26.7715 31.9897 26.5966 31.9322 26.446 31.832L16 26.202L5.554 31.832C5.40341 31.9322 5.22846 31.9897 5.04778 31.9983C4.86711 32.007 4.68747 31.9665 4.528 31.8811C4.36853 31.7957 4.23521 31.6687 4.14223 31.5135C4.04925 31.3584 4.00009 31.1809 4 31V4ZM8 2C7.46957 2 6.96086 2.21071 6.58579 2.58579C6.21071 2.96086 6 3.46957 6 4V29.132L15.446 24.168C15.6101 24.0588 15.8029 24.0005 16 24.0005C16.1971 24.0005 16.3899 24.0588 16.554 24.168L26 29.132V4C26 3.46957 25.7893 2.96086 25.4142 2.58579C25.0391 2.21071 24.5304 2 24 2H8Z"
                                                      fill="#222222"/>
                                            </svg>
                                        </c:when>
                                        <c:otherwise>
                                            <svg class="bookmark" data-no="${tips.no}"
                                                 data-detail-bookmark="TIP"
                                                 width="32"
                                                 height="32" viewBox="0 0 32 32"
                                                 fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M4 4C4 2.93913 4.42143 1.92172 5.17157 1.17157C5.92172 0.421427 6.93913 0 8 0L24 0C25.0609 0 26.0783 0.421427 26.8284 1.17157C27.5786 1.92172 28 2.93913 28 4V31C27.9999 31.1809 27.9508 31.3584 27.8578 31.5135C27.7648 31.6687 27.6315 31.7957 27.472 31.8811C27.3125 31.9665 27.1329 32.007 26.9522 31.9983C26.7715 31.9897 26.5966 31.9322 26.446 31.832L16 26.202L5.554 31.832C5.40341 31.9322 5.22846 31.9897 5.04778 31.9983C4.86711 32.007 4.68747 31.9665 4.528 31.8811C4.36853 31.7957 4.23521 31.6687 4.14223 31.5135C4.04925 31.3584 4.00009 31.1809 4 31V4ZM8 2C7.46957 2 6.96086 2.21071 6.58579 2.58579C6.21071 2.96086 6 3.46957 6 4V29.132L15.446 24.168C15.6101 24.0588 15.8029 24.0005 16 24.0005C16.1971 24.0005 16.3899 24.0588 16.554 24.168L26 29.132V4C26 3.46957 25.7893 2.96086 25.4142 2.58579C25.0391 2.21071 24.5304 2 24 2H8Z"
                                                      fill="#222222"/>
                                            </svg>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="_breadcrumb">
                                <span data-href="#" class="c-brand-green medium-h5">팁과 노하우</span>
                                <span data-href="#" class="c-brand-green medium-h5">${tips.category}</span>
                            </div>
                            <div class="_desc summernote-container">
                                ${tips.content}
                            </div>
                            <div class="_detail-footer">
                                <c:choose>
                                    <c:when test="${is_like eq true}">
                                        <div data-no="${tips.no}" data-detail-like="TIP"
                                             class="_like is-active">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip0_261_12739)">
                                                    <path d="M9.7335 5.33333H14.0002C14.3538 5.33333 14.6929 5.47381 14.943 5.72386C15.193 5.97391 15.3335 6.31304 15.3335 6.66667V8.06933C15.3337 8.24357 15.2997 8.41616 15.2335 8.57733L13.1695 13.5867C13.1193 13.7088 13.034 13.8133 12.9243 13.8869C12.8146 13.9605 12.6856 13.9999 12.5535 14L1.33349 14C1.15668 14 0.987114 13.9298 0.862089 13.8047C0.737065 13.6797 0.666828 13.5101 0.666828 13.3333L0.666828 6.66667C0.666828 6.48986 0.737065 6.32029 0.862089 6.19526C0.987114 6.07024 1.15668 6 1.33349 6H3.65483C3.76156 6.00003 3.86674 5.97443 3.96152 5.92536C4.0563 5.87628 4.13791 5.80517 4.19949 5.718L7.83483 0.567333C7.88078 0.502208 7.94856 0.455707 8.02585 0.43626C8.10315 0.416813 8.18486 0.425708 8.25616 0.461333L9.4655 1.06667C9.80583 1.23677 10.0777 1.51821 10.236 1.86421C10.3942 2.21021 10.4294 2.59995 10.3355 2.96867L9.7335 5.33333ZM4.66683 7.05867V12.6667L12.1068 12.6667L14.0002 8.06933V6.66667L9.7335 6.66667C9.53043 6.66664 9.33005 6.62023 9.14765 6.53097C8.96525 6.44172 8.80564 6.31198 8.68101 6.15166C8.55638 5.99133 8.47002 5.80466 8.42851 5.60588C8.387 5.4071 8.39144 5.20147 8.4415 5.00467L9.04349 2.63933C9.06234 2.56555 9.05535 2.48754 9.02369 2.41829C8.99203 2.34903 8.93762 2.2927 8.8695 2.25867L8.42883 2.03867L5.28883 6.48667C5.12216 6.72267 4.90883 6.916 4.66683 7.05867V7.05867ZM3.33349 7.33333H2.00016V12.6667H3.33349V7.33333Z"/>
                                                </g>
                                                <defs>
                                                    <clipPath id="clip0_261_12739">
                                                        <rect width="16" height="16" fill="white"
                                                              transform="translate(16 16) rotate(-180)"/>
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                            <span class="ml-1 regular-h5">${likes.size()}</span>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div data-no="${tips.no}" data-detail-like="TIP" class="_like">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip0_261_12739)">
                                                    <path d="M9.7335 5.33333H14.0002C14.3538 5.33333 14.6929 5.47381 14.943 5.72386C15.193 5.97391 15.3335 6.31304 15.3335 6.66667V8.06933C15.3337 8.24357 15.2997 8.41616 15.2335 8.57733L13.1695 13.5867C13.1193 13.7088 13.034 13.8133 12.9243 13.8869C12.8146 13.9605 12.6856 13.9999 12.5535 14L1.33349 14C1.15668 14 0.987114 13.9298 0.862089 13.8047C0.737065 13.6797 0.666828 13.5101 0.666828 13.3333L0.666828 6.66667C0.666828 6.48986 0.737065 6.32029 0.862089 6.19526C0.987114 6.07024 1.15668 6 1.33349 6H3.65483C3.76156 6.00003 3.86674 5.97443 3.96152 5.92536C4.0563 5.87628 4.13791 5.80517 4.19949 5.718L7.83483 0.567333C7.88078 0.502208 7.94856 0.455707 8.02585 0.43626C8.10315 0.416813 8.18486 0.425708 8.25616 0.461333L9.4655 1.06667C9.80583 1.23677 10.0777 1.51821 10.236 1.86421C10.3942 2.21021 10.4294 2.59995 10.3355 2.96867L9.7335 5.33333ZM4.66683 7.05867V12.6667L12.1068 12.6667L14.0002 8.06933V6.66667L9.7335 6.66667C9.53043 6.66664 9.33005 6.62023 9.14765 6.53097C8.96525 6.44172 8.80564 6.31198 8.68101 6.15166C8.55638 5.99133 8.47002 5.80466 8.42851 5.60588C8.387 5.4071 8.39144 5.20147 8.4415 5.00467L9.04349 2.63933C9.06234 2.56555 9.05535 2.48754 9.02369 2.41829C8.99203 2.34903 8.93762 2.2927 8.8695 2.25867L8.42883 2.03867L5.28883 6.48667C5.12216 6.72267 4.90883 6.916 4.66683 7.05867V7.05867ZM3.33349 7.33333H2.00016V12.6667H3.33349V7.33333Z"/>
                                                </g>
                                                <defs>
                                                    <clipPath id="clip0_261_12739">
                                                        <rect width="16" height="16" fill="white"
                                                              transform="translate(16 16) rotate(-180)"/>
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                            <span class="ml-1 regular-h5">${likes.size()}</span>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <div class="_views medium-h5 c-gray-light">
                                    <span class="mr-1">${tips.views}</span>Views
                                </div>
                            </div>
                        </div>
                        <div class="_comments">
                            <div class="form-group form-inner-button">
                                <input data-type="TIP" data-no="${tips.no}" type="text"
                                       placeholder="댓글을 입력하세요." class="form-control input-box medium-h5">
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
                                                        <div class="_like is-active" data-comment-like="TIP"
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
                                                        <div class="_like" data-comment-like="TIP"
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
                                                        <div class="_dislike is-active" data-comment-dislike="TIP"
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
                                                        <div class="_dislike" data-comment-dislike="TIP"
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
                                                          data-no="${comment.no}" data-type="TIP"
                                                          data-parent="parent">삭제</span>
                                                </c:if>
                                                <span class="medium-h5 c-gray-dark-low _do"
                                                      data-comment-no="${comment.no}" data-type="TIP"
                                                      data-no="${tips.no}">답글</span>
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
                                                                          data-no="${recomment.no}" data-type="TIP"
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
                                                                          data-no="${recomment.no}" data-type="TIP"
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
                <div class="col-xl-3 col-12">
                    <div class="community-sub-container">
                        <div class="row">
                            <div class="col-xl-12 col-lg-6 col-sm-6 col-12" style="height: fit-content;">
                                <div class="_community-module mb-32">
                                    <div class="card farm-card">
                                        <div class="background-image _thumbnail"
                                             style="background-image: url('${farm.profile_image.url}')">
                                            <c:choose>
                                                <c:when test="${farm._bookmark eq true}">
                                                    <div class="_bookmark is-active" data-bookmark="FARM"
                                                         data-no="${farm.no}">
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
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="_bookmark" data-bookmark="FARM" data-no="${farm.no}">
                                                        <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <g clip-path="url(#clip0_204_2957)">
                                                                <path d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"></path>
                                                            </g>
                                                            <defs>
                                                                <clipPath id="clip0_204_2957">
                                                                    <rect width="24.0923" height="24"
                                                                          transform="translate(0.0500488)"></rect>
                                                                </clipPath>
                                                            </defs>
                                                        </svg>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="card-body _body">
                                            <h5 class="card-title _title bold-h4 c-basic-black">${farm.name}</h5>
                                            <p class="card-text _farm-type bold-h5 c-brand-green">${farm.type.korName}</p>
                                            <c:choose>
                                                <c:when test="${farm.hashtag.size() ne 0}">
                                                    <c:forEach items="${farm.hashtag}" var="hash" varStatus="status">
                                                        <c:if test="${status.first}">
                                                            <div class="_hashs">
                                                        </c:if>
                                                        <span class="_hash c-gray-medium medium-p1">해시태그1</span>
                                                        <c:if test="${status.last}">
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="_footer">
                                            <button data-href="/community/farm/detail/${farm.no}" type="button"
                                                    class="btn btn-brand-opacity btn-block bold-h5">
                                                농장 자세히 보기
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${other_tips.size() ne 0}">
                                    <div class="col-xl-12 col-lg-6 col-sm-6 col-12">
                                        <div class="_community-module">
                                            <div class="_title bold-h5 c-gray-dark-low">
                                                    ${farm.name}님이 작성한 팁과 노하우
                                            </div>
                                            <div class="row row-cols-1 community-container-deck">
                                                <c:forEach items="${other_tips}" var="other_tip" end="3"
                                                           varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${other_tip.thumbnail.url ne null}">
                                                            <div class="col p-8"
                                                                 data-href="/community/tip/detail/${other_tip.no}">
                                                                <div class="card community-card">
                                                                    <div class="background-image _thumbnail _thumbnail-lg"
                                                                         style="background-image:url('${other_tip.thumbnail.url}')">
                                                                        <div class="background-image _profile"
                                                                             style="background-image:url('${farm.profile_image.url}')"></div>
                                                                    </div>
                                                                    <div class="card-body _body">
                                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${other_tip.title}</h5>
                                                                        <div class="card-text _description medium-h5 c-gray-medium">${other_tip.content}</div>
                                                                    </div>
                                                                    <div class="_footer">
                                                                        <span class="_views medium-p1 c-gray-light">
                                                                            <span class="_count">${other_tip.views}</span>Views
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="col p-8"
                                                                 data-href="/community/tip/detail/${other_tip.no}">
                                                                <div class="card community-card is-empty">
                                                                    <div class="background-image _profile"
                                                                         style="background-image:url('${farm.profile_image.url}')"></div>
                                                                    <div class="card-body _body">
                                                                        <h5 class="card-title _title bold-h4 c-gray-dark-low">${other_tip.title}</h5>
                                                                        <div class="card-text _description medium-h5 c-gray-medium">${other_tip.content}</div>
                                                                    </div>
                                                                    <div class="_footer">
                                                                        <span class="_views medium-p1 c-gray-light">
                                                                            <span class="_count">${other_tip.views}</span>Views
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/script.jsp"/>
<script src="/resources/js/module/comment.js?vc=${RESOURCES_VERSION}"></script>
<script src="/resources/js/module/api/kakao/kakao-link.js?vc=${RESOURCES_VERSION}"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
        $('[data-detail-bookmark]').on('click', function () {
            let no = this.dataset.no;
            let type = this.dataset.detailBookmark;
            loginCheck().then((result) => {
            setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        updateBookmark(type, no).then((result) => {
            setLoading(false);
                            console.log(result);
                            if (result.status === 'OK') {
                                if (result.data.status) {
                                    if (result.data.type === 'insert') {
                                        if (!this.classList.contains('is-active')) {
                                            this.classList.add('is-active');
                                        }
                                        viewAlert({content: '북마크를 등록했습니다.'});
                                    } else {
                                        if (this.classList.contains('is-active')) {
                                            this.classList.remove('is-active');
                                        }
                                        viewAlert({content: '북마크를 해제했습니다.'});
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
        $('[data-detail-like]').on('click', function () {
            let no = this.dataset.no;
            let type = this.dataset.detailLike;
            loginCheck().then((result) => {
            setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        updateLike(type, no).then((result) => {
            setLoading(false);
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
        $('[data-comment-like]').on('click', function () {
            let no = this.dataset.no;
            let type = this.dataset.commentLike;
            loginCheck().then((result) => {
            setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        updateCommentLike(type, no).then((result) => {
            setLoading(false);
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
            setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        updateCommentDislike(type, no).then((result) => {
            setLoading(false);
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
        loginCheck().then((result) => {
            setLoading(false);
            console.log('Login Check', result);
            if (result.status === 'OK') {
                if (result.data.status) {
                    if (typeof Kakao === 'undefined') {
                        // CALL naver login script
                        $.getScript('https://developers.kakao.com/sdk/js/kakao.js', function () {
                            // Stuff to do after someScript has loaded
                            getKakaoKey().then((result) => {
                                setLoading(false);
                                console.log('Kakao Key', result);
                                if (result.status === 'OK') {
                                    if (result.data.status) {
                                        console.log('Kakao Object', Kakao);
                                        if (Kakao !== null && Kakao !== undefined) {
                                            let templateArgs = {
                                                community_thumbnail: '${tips.thumbnail.url}',
                                                title: `${tips.title}`,
                                                description: `<custom:formatHTMLToString value="${tips.content}"/>`,
                                                likes: ${likes.size()},
                                                comments: ${comments.size()},
                                                views: ${tips.views},
                                                profile_image: '${farm.profile_image.url}',
                                                profile_title: `${farm.name}`,
                                                btn_text: '자세히 보기',
                                                type: 'TIP'.toLowerCase(),
                                                no: '${tips.no}',
                                            };
                                            let kakaoLink = new KakaoLink(result.data.key, Kakao, {
                                                container: '#kakao-share', // 카카오 공유하기 btn element ID
                                                templateId: 84087,// TEMPLATE ID 기본 세팅 값
                                                // 디자인 페이지에서 해당 값들에 맞게 가지고오면 됩니다 (제목, 사진 등)
                                                templateArgs,
                                                callback: () => {
                                                    kakaoLink.linkSendCallback({});
                                                }
                                            });
                                        } else {
                                            viewAlert({content: '현재 카카오 링크를 사용할 수 없습니다.'});
                                        }
                                    } else {
                                        $('#kakao-share').click(function () {
                                            viewAlert({content: '로그인이 필요한 기능입니다.'});
                                        });
                                    }
                                } else {
                                    $('#kakao-share').click(function () {
                                        viewAlert({content: '로그인이 필요한 기능입니다.'});
                                    });
                                }
                            });
                        });
                    }
                } else {
                    $('#kakao-share').click(function () {
                        viewAlert({content: '로그인이 필요한 기능입니다.'});
                    });
                }
            } else {
                $('#kakao-share').click(function () {
                    viewAlert({content: '로그인이 필요한 기능입니다.'});
                });
            }
        });
    });
</script>
</body>

</html>

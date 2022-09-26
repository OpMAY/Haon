<%@ page import="com.model.content.board.Board" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.content.tips.Tips" %>
<%@ page import="com.model.content.manual.Manual" %>
<%@ page import="com.model.content.question.Question" %>
<%@ page import="com.model.content.magazine.Magazine" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Board> boards = (ArrayList<Board>) request.getAttribute("boards");
    request.setAttribute("boards", boards);
    ArrayList<Tips> tips = (ArrayList<Tips>) request.getAttribute("tips");
    request.setAttribute("tips", tips);
    ArrayList<Manual> manuals = (ArrayList<Manual>) request.getAttribute("manuals");
    request.setAttribute("manuals", manuals);
    ArrayList<Question> questions = (ArrayList<Question>) request.getAttribute("questions");
    request.setAttribute("questions", questions);
    ArrayList<Magazine> magazines = (ArrayList<Magazine>) request.getAttribute("magazines");
    request.setAttribute("magazines", magazines);
%>
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
    <div class="container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40" style="min-height: calc(80vh);">
            <div class="row">
                <jsp:include page="../common/mypage-left-sidebar.jsp"/>
                <div class="col-lg-8 col-12 right-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="_section pt-0">
                                <div class="_title-container">
                                    <span class="bold-h3">내가 책갈피한 게시글</span>
                                    <div class="dropdown input-dropdown">
                                        <div data-toggle="dropdown" aria-expanded="false"
                                             class="form-group form-inner-button form-sm">
                                            <input type="text"
                                                   class="form-control input-box medium-h5 dropdown-input"
                                                   disabled="disabled"
                                                   value="자유게시판"
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
                                        <div class="dropdown-menu dropdown-sm">
                                            <a data-type="boards" class="dropdown-item">
                                                <div>자유 게시판</div>
                                            </a>
                                            <a data-type="tips" class="dropdown-item">
                                                <div>팁과 노하우</div>
                                            </a>
                                            <a data-type="manuals" class="dropdown-item">
                                                <div>축산 메뉴얼</div>
                                            </a>
                                            <a data-type="questions" class="dropdown-item">
                                                <div>질문과 답변</div>
                                            </a>
                                            <a data-type="magazines" class="dropdown-item">
                                                <div>최신 매거진</div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="boards" role="tabpanel"
                                         aria-labelledby="boards">
                                        <c:choose>
                                            <c:when test="${boards.size() ne 0}">
                                                <div class="_board-list _comment-board-list">
                                                    <c:forEach items="${boards}" var="board" varStatus="status">
                                                        <div class="_comment_board-item">
                                                            <div class="_board-container" data-no="${board.no}"
                                                                 data-type="BOARD">
                                                                <div class="_content ellipsis-one-line">
                                                                    <span class="medium-h4">[자유게시판] ${board.title}</span>
                                                                </div>
                                                                <div class="_info d-flex">
                                                                    <div class="_close" data-no="${board.no}"
                                                                         data-type="BOARD">
                                                                        <svg width="32"
                                                                             height="32"
                                                                             viewBox="0 0 32 32"
                                                                             fill="none"
                                                                             xmlns="http://www.w3.org/2000/svg">
                                                                            <path fill-rule="evenodd"
                                                                                  clip-rule="evenodd"
                                                                                  d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                                  fill="#A9CC52"/>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row row-cols-1 community-container-deck">
                                                    <div class="bold-h2 c-gray-light mt-32" style="text-align: center">
                                                        <span>북마크한 게시물이 없습니다.</span>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="tips" role="tabpanel" aria-labelledby="tips">
                                        <c:choose>
                                            <c:when test="${tips.size() ne 0}">
                                                <div class="row row-cols-3 community-container-deck">
                                                    <c:forEach items="${tips}" var="tip" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${tip.thumbnail.url ne null}">
                                                                <div class="col p-8 d-flex align-items-stretch">
                                                                    <div class="card community-card" data-no="${tip.no}"
                                                                         data-type="TIP">
                                                                        <div class="_close" data-no="${tip.no}"
                                                                             data-type="TIP">
                                                                            <svg width="32"
                                                                                 height="32"
                                                                                 viewBox="0 0 32 32"
                                                                                 fill="none"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <circle cx="16" cy="16" r="14"
                                                                                        fill="white"/>
                                                                                <path fill-rule="evenodd"
                                                                                      clip-rule="evenodd"
                                                                                      d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                                      fill="#A9CC52"/>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="background-image _thumbnail"
                                                                             style="background-image:url('${tip.thumbnail.url}')">
                                                                            <div class="background-image _profile"
                                                                                 style="background-image:url('${tip.profile_image.url}')"></div>
                                                                        </div>
                                                                        <div class="card-body _body">
                                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${tip.title}</h5>
                                                                            <div class="card-text _description medium-h5 c-gray-medium">${tip.content}</div>
                                                                        </div>
                                                                        <div class="_footer">
                                                                    <span class="_views medium-p1 c-gray-light">
                                                                        <span class="_count">${tip.views}</span>Views
                                                                    </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col p-8 d-flex align-items-stretch">
                                                                    <div class="card community-card is-empty"
                                                                         data-no="${tip.no}" data-type="TIP">
                                                                        <div class="_close" data-no="${tip.no}"
                                                                             data-type="TIP">
                                                                            <svg width="32"
                                                                                 height="32"
                                                                                 viewBox="0 0 32 32"
                                                                                 fill="none"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <circle cx="16" cy="16" r="14"
                                                                                        fill="white"></circle>
                                                                                <path fill-rule="evenodd"
                                                                                      clip-rule="evenodd"
                                                                                      d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                                      fill="#A9CC52"></path>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="background-image _profile"
                                                                             style="background-image:url('${tip.profile_image.url}')"></div>
                                                                        <div class="card-body _body">
                                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${tip.title}</h5>
                                                                            <div class="card-text _description medium-h5 c-gray-medium">${tip.content}</div>
                                                                        </div>
                                                                        <div class="_footer">
                                                                    <span class="_views medium-p1 c-gray-light">
                                                                        <span class="_count">${tip.views}</span>Views
                                                                    </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row row-cols-1 community-container-deck">
                                                    <div class="bold-h2 c-gray-light mt-32" style="text-align: center">
                                                        <span>북마크한 게시물이 없습니다.</span>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="manuals" role="tabpanel" aria-labelledby="manuals">
                                        <c:choose>
                                            <c:when test="${manuals.size() ne 0}">
                                                <div class="row row-cols-3 community-container-deck">
                                                    <c:forEach items="${manuals}" var="manual" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${manual.thumbnail.url ne null}">
                                                                <div class="col p-8 d-flex align-items-stretch">
                                                                    <div class="card community-card"
                                                                         data-no="${manual.no}"
                                                                         data-type="MANUAL">
                                                                        <div class="_close" data-no="${manual.no}"
                                                                             data-type="MANUAL">
                                                                            <svg width="32"
                                                                                 height="32"
                                                                                 viewBox="0 0 32 32"
                                                                                 fill="none"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <circle cx="16" cy="16" r="14"
                                                                                        fill="white"/>
                                                                                <path fill-rule="evenodd"
                                                                                      clip-rule="evenodd"
                                                                                      d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                                      fill="#A9CC52"/>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="background-image _thumbnail"
                                                                             style="background-image:url('${manual.thumbnail.url}')">
                                                                            <div class="background-image _profile"
                                                                                 style="background-image:url('${manual.profile_image.url}')"></div>
                                                                        </div>
                                                                        <div class="card-body _body">
                                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${manual.title}</h5>
                                                                            <div class="card-text _description medium-h5 c-gray-medium">${manual.content}</div>
                                                                        </div>
                                                                        <div class="_footer">
                                                                    <span class="_views medium-p1 c-gray-light">
                                                                        <span class="_count">${manual.views}</span>Views
                                                                    </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col p-8 d-flex align-items-stretch"
                                                                     data-no="${manual.no}" data-type="MANUAL">
                                                                    <div class="card community-card is-empty">
                                                                        <div class="_close" data-no="${manual.no}"
                                                                             data-type="MANUAL">
                                                                            <svg width="32"
                                                                                 height="32"
                                                                                 viewBox="0 0 32 32"
                                                                                 fill="none"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <circle cx="16" cy="16" r="14"
                                                                                        fill="white"></circle>
                                                                                <path fill-rule="evenodd"
                                                                                      clip-rule="evenodd"
                                                                                      d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                                      fill="#A9CC52"></path>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="background-image _profile"
                                                                             style="background-image:url('${manual.profile_image.url}')"></div>
                                                                        <div class="card-body _body">
                                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${manual.title}</h5>
                                                                            <div class="card-text _description medium-h5 c-gray-medium">${manual.content}</div>
                                                                        </div>
                                                                        <div class="_footer">
                                                                    <span class="_views medium-p1 c-gray-light">
                                                                        <span class="_count">${manual.views}</span>Views
                                                                    </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row row-cols-1 community-container-deck">
                                                    <div class="bold-h2 c-gray-light mt-32" style="text-align: center">
                                                        <span>북마크한 게시물이 없습니다.</span>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="questions" role="tabpanel"
                                         aria-labelledby="questions">
                                        <c:choose>
                                            <c:when test="${questions.size() ne 0}">
                                                <div class="_board-list _comment-board-list">
                                                    <c:forEach items="${questions}" var="question" varStatus="status">
                                                        <div class="_comment_board-item">
                                                            <div class="_board-container" data-no="${question.no}"
                                                                 data-type="QUESTION">
                                                                <div class="_content ellipsis-one-line">
                                                                    <span class="medium-h4">[질문과 답변] ${question.title}</span>
                                                                </div>
                                                                <div class="_info d-flex">
                                                                    <div class="_close" data-no="${question.no}"
                                                                         data-type="QUESTION">
                                                                        <svg width="32"
                                                                             height="32"
                                                                             viewBox="0 0 32 32"
                                                                             fill="none"
                                                                             xmlns="http://www.w3.org/2000/svg">
                                                                            <path fill-rule="evenodd"
                                                                                  clip-rule="evenodd"
                                                                                  d="M15.9999 1.33325C7.89992 1.33325 1.33325 7.89992 1.33325 15.9999C1.33325 24.0999 7.89992 30.6666 15.9999 30.6666C24.0999 30.6666 30.6666 24.0999 30.6666 15.9999C30.6666 7.89992 24.0999 1.33325 15.9999 1.33325ZM20.9426 12.9426C21.1855 12.6911 21.3199 12.3543 21.3168 12.0047C21.3138 11.6551 21.1736 11.3207 20.9263 11.0735C20.6791 10.8263 20.3447 10.6861 19.9951 10.683C19.6455 10.68 19.3087 10.8144 19.0573 11.0573L15.9999 14.1146L12.9426 11.0573C12.8196 10.9299 12.6725 10.8283 12.5098 10.7584C12.3471 10.6886 12.1722 10.6518 11.9951 10.6503C11.8181 10.6487 11.6425 10.6824 11.4786 10.7495C11.3148 10.8165 11.1659 10.9155 11.0407 11.0407C10.9155 11.1659 10.8165 11.3148 10.7495 11.4786C10.6824 11.6425 10.6487 11.8181 10.6503 11.9951C10.6518 12.1722 10.6886 12.3471 10.7584 12.5098C10.8283 12.6725 10.9299 12.8196 11.0573 12.9426L14.1146 15.9999L11.0573 19.0573C10.9299 19.1802 10.8283 19.3274 10.7584 19.49C10.6886 19.6527 10.6518 19.8277 10.6503 20.0047C10.6487 20.1818 10.6824 20.3573 10.7495 20.5212C10.8165 20.6851 10.9155 20.8339 11.0407 20.9591C11.1659 21.0843 11.3148 21.1833 11.4786 21.2503C11.6425 21.3174 11.8181 21.3511 11.9951 21.3496C12.1722 21.348 12.3471 21.3113 12.5098 21.2414C12.6725 21.1715 12.8196 21.0699 12.9426 20.9426L15.9999 17.8853L19.0573 20.9426C19.3087 21.1855 19.6455 21.3199 19.9951 21.3168C20.3447 21.3138 20.6791 21.1736 20.9263 20.9263C21.1736 20.6791 21.3138 20.3447 21.3168 19.9951C21.3199 19.6455 21.1855 19.3087 20.9426 19.0573L17.8853 15.9999L20.9426 12.9426Z"
                                                                                  fill="#A9CC52"/>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row row-cols-1 community-container-deck">
                                                    <div class="bold-h2 c-gray-light mt-32" style="text-align: center">
                                                        <span>북마크한 게시물이 없습니다.</span>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="magazines" role="tabpanel"
                                         aria-labelledby="magazines">
                                        <c:choose>
                                            <c:when test="${magazines.size() ne 0}">
                                                <div class="row row-cols-3 community-container-deck">
                                                    <c:forEach items="${magazines}" var="magazine" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${magazine.thumbnail.url ne null}">
                                                                <div class="col p-8 d-flex align-items-stretch">
                                                                    <div class="card community-card"
                                                                         data-no="${magazine.no}"
                                                                         data-type="MAGAZINE">
                                                                        <div class="_close" data-type="MAGAZINE"
                                                                             data-no="${magazine.no}">
                                                                            <svg width="32"
                                                                                 height="32"
                                                                                 viewBox="0 0 32 32"
                                                                                 fill="none"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <circle cx="16" cy="16" r="14"
                                                                                        fill="white"/>
                                                                                <path fill-rule="evenodd"
                                                                                      clip-rule="evenodd"
                                                                                      d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                                      fill="#A9CC52"/>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="background-image _thumbnail _thumbnail-lg"
                                                                             style="background-image:url('${magazine.thumbnail.url}')">
                                                                            <div class="background-image _profile"
                                                                                 style="background-image:url('/resources/assets/images/sample/card-profile-image.png')"></div>
                                                                        </div>
                                                                        <div class="card-body _body">
                                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${magazine.title}</h5>
                                                                            <div class="card-text _description medium-h5 c-gray-medium">${magazine.content}</div>
                                                                        </div>
                                                                        <div class="_footer">
                                                                   <span class="_views medium-p1 c-gray-light">
                                                                       <span class="_count">${magazine.views}</span>Views
                                                                   </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="col p-8 d-flex align-items-stretch">
                                                                    <div class="card community-card is-empty"
                                                                         data-no="${magazine.no}" data-type="MAGAZINE">
                                                                        <div class="_close" data-type="MAGAZINE"
                                                                             data-no="${magazine.no}">
                                                                            <svg width="32"
                                                                                 height="32"
                                                                                 viewBox="0 0 32 32"
                                                                                 fill="none"
                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                <circle cx="16" cy="16" r="14"
                                                                                        fill="white"></circle>
                                                                                <path fill-rule="evenodd"
                                                                                      clip-rule="evenodd"
                                                                                      d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                                                                      fill="#A9CC52"></path>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="background-image _profile"
                                                                             style="background-image:url('${magazine.profile_image.url}')"></div>
                                                                        <div class="card-body _body">
                                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${magazine.title}</h5>
                                                                            <div class="card-text _description medium-h5 c-gray-medium">${magazine.content}</div>
                                                                        </div>
                                                                        <div class="_footer">
                                                                   <span class="_views medium-p1 c-gray-light">
                                                                       <span class="_count">${magazine.views}</span>Views
                                                                   </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="row row-cols-1 community-container-deck">
                                                    <div class="col bold-h2 c-gray-light mt-32"
                                                         style="text-align: center">
                                                        <span>북마크한 게시물이 없습니다.</span>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
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
        /** Dropdown */
        $('.dropdown-menu').on('click', 'a.dropdown-item', function (event) {
            let dropdown_item = this;
            let type = dropdown_item.dataset.type;

            let tabs = $('#myTabContent .tab-pane');
            tabs.each(function (index, tab) {
                if (tab.id !== type) {
                    if (tab.classList.contains('show')) {
                        tab.classList.remove('show');
                        tab.classList.remove('active');
                    }
                } else {
                    if (!tab.classList.contains('show')) {
                        tab.classList.add('show');
                        tab.classList.add('active');
                    }
                }
            });
        });

        /** Click Event*/
        $('[data-no][data-type]').on('click', '._close', function (event) {
            console.log(this);
            let type = this.dataset.type;
            let no = this.dataset.no;
            updateBookmark(type, no).then((result) => {
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        if (result.data.type === 'delete') {
                            let parent = this.closest('.align-items-stretch, ._comment_board-item')
                            let root = parent.closest('._comment-board-list, .community-container-deck');
                            parent.remove();
                            if (root.querySelectorAll('.align-items-stretch, ._comment_board-item').length === 0) {
                                let container = root.closest('.tab-pane');
                                deleteChild(container);
                                $(container).append(createEmptyTextElement());
                            }
                            viewAlert({content: '해당 게시글의 북마크를 해제했습니다.'});
                        }
                    }
                }
            });
            event.stopPropagation();
            event.preventDefault();
        });
        $('[data-no][data-type]').on('click', function (event) {
            console.log(this, event);
        });
    });

    const createEmptyTextElement = () => {
        return `<div class="row row-cols-1 community-container-deck">
                    <div class="bold-h2 c-gray-light mt-32" style="text-align: center">
                        <span>북마크한 게시물이 없습니다.</span>
                    </div>
                </div>`;
    }
</script>
</body>
</html>

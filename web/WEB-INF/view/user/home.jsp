<%@ page import="com.model.content.board.Board" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.content.tips.Tips" %>
<%@ page import="com.model.content.manual.Manual" %>
<%@ page import="com.model.content.question.Question" %>
<%@ page import="com.model.content.common.COMMENT_TYPE" %>
<%@ page import="com.model.content.common.Comment" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
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
    ArrayList<Comment> commentsMadeMe = (ArrayList<Comment>) request.getAttribute("commentsMadeMe");
    request.setAttribute("commentsMadeMe", commentsMadeMe);
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
    <div class="container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40" style="min-height: calc(80vh);">
            <div class="row">
                <jsp:include page="../common/mypage-left-sidebar.jsp"/>
                <div class="col-lg-8 col-12 right-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="_section _writer-board pt-0">
                                <div class="_title-container">
                                    <span class="bold-h3">내가 작성한 게시글</span>
                                    <button type="button" data-href="/user/board/write?type=BOARD"
                                            class="btn btn-md btn-brand bold-h5">
                                        게시글 작성
                                    </button>
                                    <div class="dropdown input-dropdown">
                                        <div data-toggle="dropdown" aria-expanded="false"
                                             class="form-group form-inner-button form-sm">
                                            <input type="text"
                                                   class="form-control input-box medium-h5 dropdown-input"
                                                   disabled="disabled"
                                                   data-type="BOARD"
                                                   value="자유 게시판"
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
                                            <a data-type="BOARD" class="dropdown-item">
                                                <div>자유 게시판</div>
                                            </a>
                                            <a data-type="TIP" class="dropdown-item">
                                                <div>팁과 노하우</div>
                                            </a>
                                            <a data-type="MANUAL" class="dropdown-item">
                                                <div>축산 메뉴얼</div>
                                            </a>
                                            <a data-type="QUESTION" class="dropdown-item">
                                                <div>질문과 답변</div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="BOARD" role="tabpanel"
                                         aria-labelledby="BOARD">
                                        <c:choose>
                                            <c:when test="${boards.size() ne 0}">
                                                <div class="_board-list _comment-board-list">
                                                    <c:forEach items="${boards}" var="board" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${status.count <= 4}">
                                                                <div class="_comment_board-item">
                                                                    <div class="_board-container" data-no="${board.no}"
                                                                         data-type="BOARD">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[자유 게시판] ${board.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/BOARD/${board.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete" data-type="BOARD"
                                                                                 data-no="${board.no}">
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
                                                                    <c:if test="${board._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="_comment_board-item" style="display: none;">
                                                                    <div class="_board-container" data-no="${board.no}"
                                                                         data-type="BOARD">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[자유 게시판] ${board.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/BOARD/${board.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete" data-type="BOARD"
                                                                                 data-no="${board.no}">
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
                                                                    <c:if test="${board._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${boards.size() > 4}">
                                                    <div class="_more medium-h4 c-brand-green">
                                                        더보기
                                                    </div>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="regular-h5 mt-48" style="text-align: center">
                                                    <span>등록된 ${COMMENT_TYPE.BOARD.korName}이 없습니다.</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="TIP" role="tabpanel" aria-labelledby="TIP">
                                        <c:choose>
                                            <c:when test="${tips.size() ne 0}">
                                                <div class="_board-list _comment-board-list">
                                                    <c:forEach items="${tips}" var="tip" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${status.count <= 4}">
                                                                <div class="_comment_board-item">
                                                                    <div class="_board-container" data-no="${tip.no}"
                                                                         data-type="TIP">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[팁과 노하우] ${tip.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/TIP/${tip.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete" data-type="TIP"
                                                                                 data-no="${tip.no}">
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
                                                                    <c:if test="${tip._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="_comment_board-item" style="display: none;">
                                                                    <div class="_board-container" data-no="${tip.no}"
                                                                         data-type="TIP">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[팁과 노하우] ${tip.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/TIP/${tip.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete" data-type="TIP"
                                                                                 data-no="${tip.no}">
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
                                                                    <c:if test="${tip._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${tips.size() > 4}">
                                                    <div class="_more medium-h4 c-brand-green">
                                                        더보기
                                                    </div>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="regular-h5 mt-48" style="text-align: center">
                                                    <span>등록된 ${COMMENT_TYPE.TIP.korName}가 없습니다.</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="MANUAL" role="tabpanel" aria-labelledby="MANUAL">
                                        <c:choose>
                                            <c:when test="${manuals.size() ne 0}">
                                                <div class="_board-list _comment-board-list">
                                                    <c:forEach items="${manuals}" var="manual" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${status.count <= 4}">
                                                                <div class="_comment_board-item">
                                                                    <div class="_board-container" data-no="${manual.no}"
                                                                         data-type="MANUAL">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[축산 매뉴얼] ${manual.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/MANUAL/${manual.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete" data-type="MANUAL"
                                                                                 data-no="${manual.no}">
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
                                                                    <c:if test="${manual._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="_comment_board-item" style="display: none;">
                                                                    <div class="_board-container" data-no="${manual.no}"
                                                                         data-type="MANUAL">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[축산 메뉴얼] ${manual.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/MANUAL/${manual.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete" data-type="MANUAL"
                                                                                 data-no="${manual.no}">
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
                                                                    <c:if test="${manual._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${manuals.size() > 4}">
                                                    <div class="_more medium-h4 c-brand-green">
                                                        더보기
                                                    </div>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="regular-h5 mt-48" style="text-align: center">
                                                    <span>등록된 ${COMMENT_TYPE.MANUAL.korName}이 없습니다.</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="tab-pane fade" id="QUESTION" role="tabpanel"
                                         aria-labelledby="QUESTION">
                                        <c:choose>
                                            <c:when test="${questions.size() ne 0}">
                                                <div class="_board-list _comment-board-list">
                                                    <c:forEach items="${questions}" var="question" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${status.count <= 4}">
                                                                <div class="_comment_board-item">
                                                                    <div class="_board-container"
                                                                         data-no="${question.no}" data-type="QUESTION">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[질문과 답변] ${question.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/QUESTION/${question.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete"
                                                                                 data-type="QUESTION"
                                                                                 data-no="${question.no}">
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
                                                                    <c:if test="${question._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="_comment_board-item" style="display: none;">
                                                                    <div class="_board-container"
                                                                         data-no="${question.no}" data-type="QUESTION">
                                                                        <div class="_content ellipsis-one-line">
                                                                            <span class="medium-h4">[질문과 답변] ${question.title}</span>
                                                                        </div>
                                                                        <div class="_info d-flex">
                                                                            <div data-href="/user/board/update/QUESTION/${question.no}">
                                                                                <svg width="32"
                                                                                     height="32"
                                                                                     viewBox="0 0 32 32"
                                                                                     fill="none"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                    <circle cx="16" cy="16" r="16"
                                                                                            fill="#6CBE03"
                                                                                            fill-opacity="0.1"/>
                                                                                    <g clip-path="url(#clip0_388_9621)">
                                                                                        <path d="M12.0358 20.9999H8.5V17.4641L18.0292 7.93491C18.1854 7.77868 18.3974 7.69092 18.6183 7.69092C18.8393 7.69092 19.0512 7.77868 19.2075 7.93491L21.565 10.2924C21.7212 10.4487 21.809 10.6606 21.809 10.8816C21.809 11.1025 21.7212 11.3145 21.565 11.4707L12.0358 20.9999ZM8.5 22.6666H23.5V24.3332H8.5V22.6666Z"
                                                                                              fill="#A9CC52"/>
                                                                                    </g>
                                                                                    <defs>
                                                                                        <clipPath id="clip0_388_9621">
                                                                                            <rect width="20" height="20"
                                                                                                  fill="white"
                                                                                                  transform="translate(6 6)"/>
                                                                                        </clipPath>
                                                                                    </defs>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="ml-8 _delete"
                                                                                 data-type="QUESTION"
                                                                                 data-no="${question.no}">
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
                                                                    <c:if test="${question._new_comment eq true}">
                                                                        <div class="_paragraph regular-h5 c-brand-green">
                                                                            새로운 댓글이 달렸어요!
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${manuals.size() > 4}">
                                                    <div class="_more medium-h4 c-brand-green">
                                                        더보기
                                                    </div>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="regular-h5 mt-48" style="text-align: center">
                                                    <span>등록된 ${COMMENT_TYPE.QUESTION.korName}이 없습니다.</span>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="_section">
                                <div class="_title-container">
                                    <span class="bold-h3">내가 작성한 댓글</span>
                                </div>
                                <div class="comment-made-me-container">
                                    <c:choose>
                                        <c:when test="${commentsMadeMe.size() ne 0}">
                                            <div class="_board-list _comment-board-list">
                                                <c:forEach items="${commentsMadeMe}" var="comment" varStatus="status">
                                                    <c:choose>
                                                        <c:when test="${status.count <= 4}">
                                                            <c:choose>
                                                                <c:when test="${comment.farm ne null}">
                                                                    <div class="_comment_board-item">
                                                                        <div class="_board-container"
                                                                             data-no="${comment.farm.no}"
                                                                             data-type="FARM">
                                                                            <div class="_content ellipsis-one-line">
                                                                                <span class="medium-h4">[농장] ${comment.farm.name}님의 농장</span>
                                                                                <div class="_view-comment">
                                                                                    <svg class="mr-1" width="24"
                                                                                         height="24"
                                                                                         viewBox="0 0 24 24"
                                                                                         fill="none"
                                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                                        <path d="M19 15L13 21L11.58 19.58L15.17 16H4V4H6V14H15.17L11.58 10.42L13 9L19 15Z"
                                                                                              fill="#222222"/>
                                                                                    </svg>
                                                                                    <div class="medium-h5 c-gray-dark-low ellipsis-one-line mr-auto">${comment.content}</div>
                                                                                    <div class="ml-8 regular-h5 c-gray-dark-low">
                                                                                        <custom:formatDatetime
                                                                                                value="${comment.reg_datetime}"
                                                                                                pattern="yyyy.MM.dd"/>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="_comment_board-item">
                                                                        <div class="_board-container"
                                                                             data-no="${comment.community_no}"
                                                                             data-type="${comment.type}">
                                                                            <div class="_content ellipsis-one-line">
                                                                                <span class="medium-h4">[${comment.type.korName}] ${comment.contentForm.title}</span>
                                                                                <div class="_view-comment">
                                                                                    <c:choose>
                                                                                        <c:when test="${comment.recomments.size() > 0}">
                                                                                            <div class="_comments mr-auto">
                                                                                                <div class="_main-comment c-gray-medium _comment-content">
                                                                                                    <svg class="mr-1" width="24"
                                                                                                         height="24"
                                                                                                         viewBox="0 0 24 24"
                                                                                                         fill="none"
                                                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                                                        <path d="M19 15L13 21L11.58 19.58L15.17 16H4V4H6V14H15.17L11.58 10.42L13 9L19 15Z"
                                                                                                              fill="#7D7D7D"/>
                                                                                                    </svg>
                                                                                                    <div class="medium-h5 ellipsis-one-line mr-auto">${comment.content}</div>
                                                                                                </div>
                                                                                                <div class="_my-recomment _comment-content ml-16">
                                                                                                    <svg class="mr-1" width="24"
                                                                                                         height="24"
                                                                                                         viewBox="0 0 24 24"
                                                                                                         fill="none"
                                                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                                                        <path d="M19 15L13 21L11.58 19.58L15.17 16H4V4H6V14H15.17L11.58 10.42L13 9L19 15Z"
                                                                                                              fill="#222222"/>
                                                                                                    </svg>
                                                                                                    <div class="medium-h5 c-gray-dark-low ellipsis-one-line mr-auto">${comment.recomments.get(0).content}</div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <svg class="mr-1" width="24"
                                                                                                 height="24"
                                                                                                 viewBox="0 0 24 24"
                                                                                                 fill="none"
                                                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                                                <path d="M19 15L13 21L11.58 19.58L15.17 16H4V4H6V14H15.17L11.58 10.42L13 9L19 15Z"
                                                                                                      fill="#222222"/>
                                                                                            </svg>
                                                                                            <div class="medium-h5 c-gray-dark-low ellipsis-one-line mr-auto">${comment.content}</div>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                    <div class="ml-8 regular-h5 c-gray-dark-low align-self-end">
                                                                                        <custom:formatDatetime
                                                                                                value="${comment.reg_datetime}"
                                                                                                pattern="yyyy.MM.dd"/>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${comment.farm ne null}">
                                                                    <div class="_comment_board-item"
                                                                         style="display: none;">
                                                                        <div class="_board-container"
                                                                             data-no="${comment.farm.no}"
                                                                             data-type="FARM">
                                                                            <div class="_content ellipsis-one-line">
                                                                                <span class="medium-h4">[농장] ${comment.farm.name}님의 농장</span>
                                                                                <div class="_view-comment">
                                                                                    <svg class="mr-1" width="24"
                                                                                         height="24"
                                                                                         viewBox="0 0 24 24"
                                                                                         fill="none"
                                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                                        <path d="M19 15L13 21L11.58 19.58L15.17 16H4V4H6V14H15.17L11.58 10.42L13 9L19 15Z"
                                                                                              fill="#222222"/>
                                                                                    </svg>
                                                                                    <div class="medium-h5 c-gray-dark-low ellipsis-one-line mr-auto">${comment.content}</div>
                                                                                    <div class="ml-8 regular-h5 c-gray-dark-low">
                                                                                        <custom:formatDatetime
                                                                                                value="${comment.reg_datetime}"
                                                                                                pattern="yyyy.MM.dd"/>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="_comment_board-item"
                                                                         style="display: none;">
                                                                        <div class="_board-container"
                                                                             data-no="${comment.community_no}"
                                                                             data-type="${comment.type}">
                                                                            <div class="_content ellipsis-one-line">
                                                                                <span class="medium-h4">[${comment.type.korName}] ${comment.contentForm.title}</span>
                                                                                <div class="_view-comment">
                                                                                    <svg class="mr-1" width="24"
                                                                                         height="24"
                                                                                         viewBox="0 0 24 24"
                                                                                         fill="none"
                                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                                        <path d="M19 15L13 21L11.58 19.58L15.17 16H4V4H6V14H15.17L11.58 10.42L13 9L19 15Z"
                                                                                              fill="#222222"/>
                                                                                    </svg>
                                                                                    <div class="medium-h5 c-gray-dark-low ellipsis-one-line mr-auto">${comment.content}</div>
                                                                                    <div class="ml-8 regular-h5 c-gray-dark-low">
                                                                                        <custom:formatDatetime
                                                                                                value="${comment.reg_datetime}"
                                                                                                pattern="yyyy.MM.dd"/>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${commentsMadeMe.size() > 4}">
                                                <div class="_more medium-h4 c-brand-green">
                                                    더보기
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="regular-h5 mt-48" style="text-align: center">
                                                <span>작성한 댓글이 없습니다.</span>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="_section _my-comment">
                                <div class="_title-container">
                                    <span class="bold-h3">나에게 온 댓글</span>
                                    <div class="dropdown input-dropdown">
                                        <div data-toggle="dropdown" aria-expanded="false"
                                             class="form-group form-inner-button form-sm">
                                            <input type="text"
                                                   class="form-control input-box medium-h5 dropdown-input"
                                                   disabled="disabled"
                                                   value="전체"
                                                   data-type="ALL"
                                                   id="secret-filter">
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
                                            <a data-type="ALL" class="dropdown-item">
                                                <div>전체</div>
                                            </a>
                                            <a data-type="PUBLIC" class="dropdown-item">
                                                <div>공개</div>
                                            </a>
                                            <a data-type="SECRET" class="dropdown-item">
                                                <div>비공개</div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="_comments">
                                    <c:choose>
                                        <c:when test="${comments.size() ne 0}">
                                            <c:forEach items="${comments}" var="comment" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${status.count <= 4}">
                                                        <div class="comment-container" data-more="showing"
                                                             data-blocked="${comment._blocked}">
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
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="medium-h5 _content ellipsis-one-line">${comment.content}</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:set var="newDiff" scope="application">
                                                                            <custom:localDateTimeDiffer
                                                                                    value="${recomment.reg_datetime}"/>
                                                                        </c:set>
                                                                        <c:if test="${newDiff eq false}">
                                                                            <span class="bold-p1 c-brand-green _new">New!</span>
                                                                        </c:if>
                                                                    </div>
                                                                    <div class="_info">
                                                                        <span class="regular-h5 c-gray-medium _name">${comment.user.name}</span>
                                                                        <span class="regular-h6 c-gray-light ml-8"><custom:formatDatetime
                                                                                value="${comment.reg_datetime}"
                                                                                pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                </div>
                                                                <div class="_transactions">
                                                                    <div class="_responds">
                                                                        <c:choose>
                                                                            <c:when test="${comment._like eq true}">
                                                                                <div class="_like is-active"
                                                                                     data-comment-like="${comment.type.name()}"
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
                                                                                <div class="_like"
                                                                                     data-comment-like="${comment.type.name()}"
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
                                                                                <div class="_dislike is-active"
                                                                                     data-comment-dislike="${comment.type.name()}"
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
                                                                                <div class="_dislike"
                                                                                     data-comment-dislike="${comment.type.name()}"
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
                                                                          data-no="${comment.no}"
                                                                          data-type="${comment.type.name()}"
                                                                          data-parent="parent">삭제</span>
                                                                        </c:if>
                                                                        <span class="medium-h5 c-gray-dark-low _do"
                                                                              data-comment-no="${comment.no}"
                                                                              data-type="${comment.type.name()}"
                                                                              data-no="${comment.community_no}">답글</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="reply-comment-container">
                                                                <c:forEach items="${comment.recomments}" var="recomment"
                                                                           varStatus="reStatus">
                                                                    <c:set var="reply_new" value="false"/>
                                                                    <c:choose>
                                                                        <c:when test="${recomment._blocked eq true}">
                                                                            <div class="_comment"
                                                                                 data-blocked="${recomment._blocked}">
                                                                                <div class="_profile-img">
                                                                                    <img alt=""
                                                                                         src="${recomment.user.profile_img.url}">
                                                                                </div>
                                                                                <div class="_media">
                                                                                    <div class="_comment-text">
                                                                                        <span class="medium-p1 _content ellipsis-one-line">비공개된 댓글입니다.</span>
                                                                                        <svg width="16" height="16"
                                                                                             viewBox="0 0 24 24"
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
                                                                                        <c:set var="newDiff"
                                                                                               scope="application">
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
                                                                          data-no="${recomment.no}"
                                                                          data-type="${recomment.type.name()}"
                                                                          data-parent="self">삭제</span>
                                                                                        </c:if>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <div class="_comment"
                                                                                 data-blocked="${recomment._blocked}">
                                                                                <div class="_profile-img">
                                                                                    <img alt=""
                                                                                         src="${recomment.user.profile_img.url}">
                                                                                </div>
                                                                                <div class="_media">
                                                                                    <div class="_comment-text">
                                                                                        <span class="medium-p1 _content ellipsis-one-line">${recomment.content}</span>
                                                                                        <c:set var="newDiff"
                                                                                               scope="application">
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
                                                                                          data-no="${recomment.no}"
                                                                                          data-type="${recomment.type.name()}"
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
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="comment-container" data-more="hiding"
                                                             data-blocked="${comment._blocked}"
                                                             style="display: none;">
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
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="medium-h5 _content ellipsis-one-line">${comment.content}</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <c:set var="newDiff" scope="application">
                                                                            <custom:localDateTimeDiffer
                                                                                    value="${recomment.reg_datetime}"/>
                                                                        </c:set>
                                                                        <c:if test="${newDiff eq false}">
                                                                            <span class="bold-p1 c-brand-green _new">New!</span>
                                                                        </c:if>
                                                                    </div>
                                                                    <div class="_info">
                                                                        <span class="regular-h5 c-gray-medium _name">${comment.user.name}</span>
                                                                        <span class="regular-h6 c-gray-light ml-8"><custom:formatDatetime
                                                                                value="${comment.reg_datetime}"
                                                                                pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                </div>
                                                                <div class="_transactions">
                                                                    <div class="_responds">
                                                                        <c:choose>
                                                                            <c:when test="${comment._like eq true}">
                                                                                <div class="_like is-active"
                                                                                     data-comment-like="${comment.type.name()}"
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
                                                                                <div class="_like"
                                                                                     data-comment-like="${comment.type.name()}"
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
                                                                                <div class="_dislike is-active"
                                                                                     data-comment-dislike="${comment.type.name()}"
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
                                                                                <div class="_dislike"
                                                                                     data-comment-dislike="${comment.type.name()}"
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
                                                                          data-no="${comment.no}"
                                                                          data-type="${comment.type.name()}"
                                                                          data-parent="parent">삭제</span>
                                                                        </c:if>
                                                                        <span class="medium-h5 c-gray-dark-low _do"
                                                                              data-comment-no="${comment.no}"
                                                                              data-type="${comment.type.name()}"
                                                                              data-no="${comment.community_no}">답글</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="reply-comment-container">
                                                                <c:forEach items="${comment.recomments}" var="recomment"
                                                                           varStatus="reStatus">
                                                                    <c:set var="reply_new" value="false"/>
                                                                    <c:choose>
                                                                        <c:when test="${recomment._blocked eq true}">
                                                                            <div class="_comment"
                                                                                 data-blocked="${recomment._blocked}">
                                                                                <div class="_profile-img">
                                                                                    <img alt=""
                                                                                         src="${recomment.user.profile_img.url}">
                                                                                </div>
                                                                                <div class="_media">
                                                                                    <div class="_comment-text">
                                                                                        <span class="medium-p1 _content ellipsis-one-line">비공개된 댓글입니다.</span>
                                                                                        <svg width="16" height="16"
                                                                                             viewBox="0 0 24 24"
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
                                                                                        <c:set var="newDiff"
                                                                                               scope="application">
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
                                                                          data-no="${recomment.no}"
                                                                          data-type="${recomment.type.name()}"
                                                                          data-parent="self">삭제</span>
                                                                                        </c:if>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <div class="_comment"
                                                                                 data-blocked="${recomment._blocked}">
                                                                                <div class="_profile-img">
                                                                                    <img alt=""
                                                                                         src="${recomment.user.profile_img.url}">
                                                                                </div>
                                                                                <div class="_media">
                                                                                    <div class="_comment-text">
                                                                                        <span class="medium-p1 _content ellipsis-one-line">${recomment.content}</span>
                                                                                        <c:set var="newDiff"
                                                                                               scope="application">
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
                                                                          data-no="${recomment.no}"
                                                                          data-type="${recomment.type.name()}"
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
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${comments.size() > 4}">
                                                <div class="_more medium-h4 c-brand-green">
                                                    더보기
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="regular-h5 mt-48" style="text-align: center">
                                                <span>나에게 온 댓글이 없습니다.</span>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
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
<script src="/resources/js/module/comment.js?vc=${RESOURCES_VERSION}"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
        /** Dropdown */
        /*
        * Dropdown Logic
        * */
        $('._writer-board .dropdown-menu').on('click', 'a.dropdown-item', function (event) {
            let dropdown_item = this;
            let input = dropdown_item.closest('.dropdown').querySelector('input');
            let write_button = this.closest('._writer-board').querySelector('._title-container > button[data-href]');
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

            switch (type) {
                case'BOARD':
                    input.value = '자유 게시판';
                    write_button.setAttribute('data-href', '/user/board/write?type=BOARD');
                    break;
                case'TIP':
                    input.value = '팁과 노하우';
                    write_button.setAttribute('data-href', '/user/board/write?type=TIP');
                    break;
                case'MANUAL':
                    input.value = '축산 메뉴얼';
                    write_button.setAttribute('data-href', '/user/board/write?type=MANUAL');
                    break;
                case'QUESTION':
                    input.value = '질문과 답변';
                    write_button.setAttribute('data-href', '/user/board/write?type=QUESTION');
                    break;
            }
            input.setAttribute('data-type', type);
        });
        $('._my-comment .dropdown-menu').on('click', 'a.dropdown-item', function (event) {
            let dropdown_item = this;
            let type = dropdown_item.dataset.type;
            let container = dropdown_item.closest('._my-comment');
            container.querySelector('.dropdown input').setAttribute('data-type', type);
            let comments = container.querySelectorAll('.comment-container[data-blocked]');
            let recomments = container.querySelectorAll('.reply-comment-container ._comment[data-blocked]');
            switch (type) {
                case'ALL':
                    comments.forEach(function (comment) {
                        if (!comment.dataset.blocked) {
                            if (comment.dataset.more === 'showing') {
                                $(comment).show();
                            }
                        } else {
                            if (comment.dataset.more === 'showing') {
                                $(comment).show();
                            }
                        }
                    });
                    recomments.forEach(function (comment) {
                        if (!comment.dataset.blocked) {
                            $(comment).show();
                        } else {
                            $(comment).show();
                        }
                    });
                    break;
                case'PUBLIC':
                    comments.forEach(function (comment) {
                        if (!comment.dataset.blocked) {
                            if (comment.dataset.more === 'showing') {
                                $(comment).hide();
                            }
                        } else {
                            if (comment.dataset.more === 'showing') {
                                $(comment).show();
                            }
                        }
                    });
                    recomments.forEach(function (comment) {
                        if (!comment.dataset.blocked) {
                            $(comment).hide();
                        } else {
                            $(comment).show();
                        }
                    });
                    break;
                case'SECRET':
                    comments.forEach(function (comment) {
                        if (!comment.dataset.blocked) {
                            if (comment.dataset.more === 'showing') {
                                $(comment).show();
                            }
                        } else {
                            if (comment.dataset.more === 'showing') {
                                $(comment).hide();
                            }
                        }
                    });
                    recomments.forEach(function (comment) {
                        if (!comment.dataset.blocked) {
                            $(comment).show();
                        } else {
                            $(comment).hide();
                        }
                    });
                    break;
            }
        });

        /*
        * More Logic
        * */
        $('#myTabContent .tab-pane ._more').click(function () {
            let container = this.closest('.tab-pane');
            let board_comments = container.querySelectorAll('._comment-board-list ._comment_board-item');
            let count = 4;
            board_comments.forEach(function (board_comment) {
                if (count === 0) {
                    return;
                }
                if (board_comment.style.display === 'none') {
                    board_comment.style.display = 'block';
                    count--;
                }
            });
            let check = false;
            board_comments.forEach(function (board_comment) {
                if (board_comment.style.display === 'none') {
                    check = true;
                }
            });
            if (!check) {
                this.remove();
            }
        });
        $('.comment-made-me-container ._more').click(function () {
            let container = this.closest('.comment-made-me-container');
            let board_comments = container.querySelectorAll('._comment-board-list ._comment_board-item');
            let count = 4;
            board_comments.forEach(function (board_comment) {
                if (count === 0) {
                    return;
                }
                if (board_comment.style.display === 'none') {
                    board_comment.style.display = 'block';
                    count--;
                }
            });
            let check = false;
            board_comments.forEach(function (board_comment) {
                if (board_comment.style.display === 'none') {
                    check = true;
                }
            });
            if (!check) {
                this.remove();
            }
        });
        $('._my-comment ._more').click(function () {
            let container = this.closest('._my-comment');
            let comments = container.querySelectorAll('._comments .comment-container');
            let type = container.querySelector('.dropdown input').dataset.type;
            let count = 4;
            comments.forEach(function (comment) {
                if (count === 0) {
                    return;
                }
                if (comment.style.display === 'none') {
                    console.log(type);
                    switch (type) {
                        case'ALL':
                            comment.style.display = 'block';
                            comment.setAttribute('data-more', 'showing');
                            count--;
                            break;
                        case'PUBLIC':
                            if (!comment.dataset.blocked) {
                                comment.style.display = 'block';
                                comment.setAttribute('data-more', 'showing');
                                count--;
                            }
                            break;
                        case'SECRET':
                            if (comment.dataset.blocked) {
                                comment.style.display = 'block';
                                comment.setAttribute('data-more', 'showing');
                                count--;
                            }
                            break;
                    }
                }
            });
            let check = false;
            comments.forEach(function (comment) {
                if (comment.style.display === 'none') {
                    check = true;
                }
            });
            if (!check) {
                this.remove();
            }
        });
        /*
        * Delete Logic
        * */
        let delete_items = document.querySelectorAll('#myTabContent .tab-pane ._comment-board-list ._comment_board-item ._delete');
        delete_items.forEach(function (delete_item) {
            delete_item.addEventListener('click', function (event) {
                let container = this.closest('.tab-pane');
                let button = document.querySelector('._writer-board').querySelector('._title-container .dropdown input[data-type]');
                let item = this.closest('._comment_board-item');
                deleteMyContent(item.querySelector('._board-container').dataset.type, item.querySelector('._board-container').dataset.no).then((result) => {
                    console.log(result);
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            item.remove();
                            let board_comments = container.querySelectorAll('._comment-board-list ._comment_board-item');
                            let type_text = '';
                            switch (button.dataset.type) {
                                case'BOARD':
                                    type_text = '자유 게시판이';
                                    break;
                                case'TIP':
                                    type_text = '팁과 노하우가';
                                    break;
                                case'MANUAL':
                                    type_text = '축산 메뉴얼이';
                                    break;
                                case'QUESTION':
                                    type_text = '질문과 답변이';
                                    break;
                            }
                            if (board_comments.length === 0) {
                                deleteChild(container);
                                $(container).append(`<div class="regular-h5 mt-48" style="text-align: center">
                                         <span>등록된 \${type_text} 없습니다.</span>
                                     </div>`);
                            }
                            viewAlert({content: '해당 게시글을 삭제하였습니다.'});
                        } else {
                            viewAlert({content: '해당 게시글을 삭제할 수 없습니다.'});
                        }
                    } else {
                        viewAlert({content: '해당 게시글을 삭제할 수 없습니다.'});
                    }
                });
                event.stopPropagation();
                event.preventDefault();
            });
        });
        /*
        * Click Logic
        * */
        let board_items = document.querySelectorAll('#myTabContent ._comment-board-list ._comment_board-item');
        board_items.forEach(function (board_item) {
            board_item.addEventListener('click', function (event) {
                let type = this.querySelector('._board-container').dataset.type;
                let no = this.querySelector('._board-container').dataset.no;
                switch (type) {
                    case'BOARD':
                        location.href = '/community/board/detail/' + no;
                        break;
                    case'TIP':
                        location.href = '/community/tip/detail/' + no;
                        break;
                    case'MANUAL':
                        location.href = '/community/manual/detail/' + no;
                        break;
                    case'QUESTION':
                        location.href = '/community/question/detail/' + no;
                        break;
                    case 'FARM':
                        location.href = '/community/farm/detail/' + no;
                        break;
                    case 'MAGAZINE':
                        location.href = '/community/magazine/detail/' + no;
                        break;
                }
                event.stopPropagation();
                event.preventDefault();
            });
        });
        let made_me_items = document.querySelectorAll('.comment-made-me-container ._comment-board-list ._comment_board-item');
        made_me_items.forEach(function (item) {
            item.addEventListener('click', function (event) {
                let type = this.querySelector('._board-container').dataset.type;
                let no = this.querySelector('._board-container').dataset.no;
                switch (type) {
                    case'BOARD':
                        location.href = '/community/board/detail/' + no;
                        break;
                    case'TIP':
                        location.href = '/community/tip/detail/' + no;
                        break;
                    case'MANUAL':
                        location.href = '/community/manual/detail/' + no;
                        break;
                    case'QUESTION':
                        location.href = '/community/question/detail/' + no;
                        break;
                    case 'FARM':
                        location.href = '/community/farm/detail/' + no;
                        break;
                    case 'MAGAZINE':
                        location.href = '/community/magazine/detail/' + no;
                        break;
                }

                event.preventDefault();
                event.stopPropagation();
            });
        });

        /*
        * Comment Logic
        * */

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

package com.service;

import com.dao.*;
import com.model.content.board.Board;
import com.model.content.common.ORDER_TYPE;
import com.model.content.tips.Tips;
import com.response.Message;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentService {
    // user Part
    private final UserDao userDao;
    private final FarmDao farmDao;

    // content part
    private final ContentDao contentDao;
    private final BookmarkDao bookmarkDao;
    private final LikeDao likeDao;
    private final DislikeDao dislikeDao;

    // comment part
    private final CommentDao commentDao;
    private final CommentDislikeDao commentDislikeDao;
    private final CommentLikeDao commentLikeDao;

    // traces & bundle part
    private final BundleDao bundleDao;
    private final BundleTracesDao bundleTracesDao;
    private final TraceDao traceDao;

    // Other services
    private final EncryptionService encryptionService;


    public Board getBoard(int board_no) {
        return contentDao.getBoard(board_no);
    }

    @Transactional
    public void updateBoardViews(int board_no) {
        contentDao.updateBoardViews(board_no);
    }

    public List<Board> getCommunityBoardsPage(String category, ORDER_TYPE order_type) {
        // 카테고리 전체 선택 시 category => null
        // 리로딩이 아닌 필터 선택 or 페이지 첫 진입 시 사용하는 함수
        // 페이지 첫 진입 시 category null, order_type = ALL
        List<Board> boards;
        switch (order_type) {
            case RECENT:
                boards = contentDao.getCommunityBoardsOrderByRecent(category);
                break;
            case VIEWS:
                boards = contentDao.getCommunityBoardsOrderByViews(category);
                break;
            case COMMENTS:
                boards = contentDao.getCommunityBoardsOrderByComments(category);
                break;
            case LIKES:
                boards = contentDao.getCommunityBoardsOrderByLikes(category);
                break;
            case BOOKMARKS:
                boards = contentDao.getCommunityBoardsOrderByBookmarks(category);
                break;
            default:
                throw new RuntimeException();
        }
        return boards;
    }

    public List<Tips> getCommunityTipsPage(String category, ORDER_TYPE order_type, HttpServletRequest request) {
        // 카테고리 전체 선택 시 category => null
        // 리로딩이 아닌 필터 선택 or 페이지 첫 진입 시 사용하는 함수
        // 페이지 첫 진입 시 category null, order_type = ALL
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        List<Tips> tips;
        switch (order_type) {
            case RECENT:
                tips = contentDao.getCommunityTipsOrderByRecent(category);
                break;
            case VIEWS:
                tips = contentDao.getCommunityTipsOrderByViews(category);
                break;
            case COMMENTS:
                tips = contentDao.getCommunityTipsOrderByComments(category);
                break;
            case LIKES:
                tips = contentDao.getCommunityTipsOrderByLikes(category);
                break;
            case BOOKMARKS:
                tips = contentDao.getCommunityTipsOrderByBookmarks(category);
                break;
            default:
                throw new RuntimeException();
        }
        for (Tips tip : tips) {
            if (userNo != null)
                tip.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(tip.getNo(), userNo));
            tip.setProfile_image(farmDao.getFarmByNo(tip.getFarm_no()).getProfile_image());
        }
        return tips;
    }

    public Message getContentList(String type, int content_no, ORDER_TYPE order_type, String category, HttpServletRequest request) {
        Message message = new Message();
        boolean is_reload = content_no > 0;
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        switch (type) {
            case "board":
                List<Board> boards;
                switch (order_type) {
                    case RECENT:
                        if (is_reload) {
                            boards = contentDao.getCommunityBoardsOrderByRecentReload(category, content_no);
                        } else {
                            boards = contentDao.getCommunityBoardsOrderByRecent(category);
                        }
                        break;
                    case VIEWS:
                        if (is_reload) {
                            boards = contentDao.getCommunityBoardsOrderByViewsReload(category, content_no);
                        } else {
                            boards = contentDao.getCommunityBoardsOrderByViews(category);
                        }
                        break;
                    case COMMENTS:
                        if (is_reload) {
                            boards = contentDao.getCommunityBoardsOrderByCommentsReload(category, content_no);
                        } else {
                            boards = contentDao.getCommunityBoardsOrderByComments(category);
                        }
                        break;
                    case LIKES:
                        if (is_reload) {
                            boards = contentDao.getCommunityBoardsOrderByLikesReload(category, content_no);
                        } else {
                            boards = contentDao.getCommunityBoardsOrderByLikes(category);
                        }
                        break;
                    case BOOKMARKS:
                        if (is_reload) {
                            boards = contentDao.getCommunityBoardsOrderByBookmarksReload(category, content_no);
                        } else {
                            boards = contentDao.getCommunityBoardsOrderByBookmarks(category);
                        }
                        break;
                    default:
                        throw new RuntimeException();
                }
                message.put("list", boards);
                break;
            case "tip":
                List<Tips> tips;
                switch (order_type) {
                    case RECENT:
                        if (is_reload) {
                            tips = contentDao.getCommunityTipsOrderByRecentReload(category, content_no);
                        } else {
                            tips = contentDao.getCommunityTipsOrderByRecent(category);
                        }
                        break;
                    case VIEWS:
                        if (is_reload) {
                            tips = contentDao.getCommunityTipsOrderByViewsReload(category, content_no);
                        } else {
                            tips = contentDao.getCommunityTipsOrderByViews(category);
                        }
                        break;
                    case COMMENTS:
                        if (is_reload) {
                            tips = contentDao.getCommunityTipsOrderByCommentsReload(category, content_no);
                        } else {
                            tips = contentDao.getCommunityTipsOrderByComments(category);
                        }
                        break;
                    case LIKES:
                        if (is_reload) {
                            tips = contentDao.getCommunityTipsOrderByLikesReload(category, content_no);
                        } else {
                            tips = contentDao.getCommunityTipsOrderByLikes(category);
                        }
                        break;
                    case BOOKMARKS:
                        if (is_reload) {
                            tips = contentDao.getCommunityTipsOrderByBookmarksReload(category, content_no);
                        } else {
                            tips = contentDao.getCommunityTipsOrderByBookmarks(category);
                        }
                        break;
                    default:
                        throw new RuntimeException();
                }

                for (Tips tip : tips) {
                    if (userNo != null) {
                        tip.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(tip.getNo(), userNo));
                    }
                    tip.setProfile_image(farmDao.getFarmByNo(tip.getFarm_no()).getProfile_image());
                }
                message.put("list", tips);
                break;
            case "manual":
                break;
            case "magazine":
                break;
            case "question":
                break;
            case "farm":
                break;
            default:
                throw new RuntimeException();
        }
        return message;
    }
}

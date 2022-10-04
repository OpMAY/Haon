package com.service;

import com.dao.*;
import com.model.common.MFile;
import com.model.content.board.Board;
import com.model.content.common.COMMENT_TYPE;
import com.model.content.common.ContentForm;
import com.model.content.magazine.Magazine;
import com.model.content.question.Question;
import com.model.content.common.ORDER_TYPE;
import com.model.content.manual.Manual;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import com.model.farm.FARM_TYPE;
import com.model.farm.Farm;
import com.response.Message;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

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

    @Transactional
    public void updateMagazineViews(int magazine_no) {
        contentDao.updateMagazineViews(magazine_no);
    }
    @Transactional
    public void updateManualViews(int manual_no) {
        contentDao.updateManualViews(manual_no);
    }
    @Transactional
    public void updateTipViews(int tip_no) {
        contentDao.updateTipViews(tip_no);
    }
    @Transactional
    public void updateQuestionViews(int question_no) {
        contentDao.updateQuestionViews(question_no);
    }

    public ArrayList<Board> getBoards(int farm_no) {
        return contentDao.getBoards(farm_no);
    }

    public ArrayList<Board> getFameBoards(int farm_no) {
        return contentDao.getFameBoards(farm_no);
    }

    public Magazine getMagazine(int magazine_no) {
        return contentDao.getMagazine(magazine_no);
    }

    public ArrayList<Magazine> getFameMagazines() {
        return contentDao.getFameMagazines();
    }

    public Question getQuestion(int question_no) {
        return contentDao.getQuestion(question_no);
    }

    public ArrayList<Question> getFameQuestions(int farm_no) {
        return contentDao.getFameQuestions(farm_no);
    }

    public ArrayList<Question> getQuestions(int farm_no) {
        return contentDao.getQuestions(farm_no);
    }

    public Manual getManual(int manual_no) {
        return contentDao.getManual(manual_no);
    }

    public ArrayList<Manual> getManuals(int farm_no) {
        return contentDao.getManuals(farm_no);
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

    public List<Manual> getCommunityManualsPage(String category, ORDER_TYPE order_type, HttpServletRequest request) {
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        List<Manual> manuals;
        switch (order_type) {
            case RECENT:
                manuals = contentDao.getCommunityManualsOrderByRecent(category);
                break;
            case VIEWS:
                manuals = contentDao.getCommunityManualsOrderByViews(category);
                break;
            case COMMENTS:
                manuals = contentDao.getCommunityManualsOrderByComments(category);
                break;
            case LIKES:
                manuals = contentDao.getCommunityManualsOrderByLikes(category);
                break;
            case BOOKMARKS:
                manuals = contentDao.getCommunityManualsOrderByBookmarks(category);
                break;
            default:
                throw new RuntimeException();
        }
        for (Manual manual : manuals) {
            if (userNo != null)
                manual.set_bookmark(bookmarkDao.isManualBookmarkByUserNo(manual.getNo(), userNo));
            manual.setProfile_image(farmDao.getFarmByNo(manual.getFarm_no()).getProfile_image());
        }
        return manuals;
    }

    public List<Magazine> getCommunityMagazinesPage(String category, ORDER_TYPE order_type, HttpServletRequest request) {
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        List<Magazine> magazines;
        switch (order_type) {
            case RECENT:
                magazines = contentDao.getCommunityMagazinesOrderByRecent(category);
                break;
            case VIEWS:
                magazines = contentDao.getCommunityMagazinesOrderByViews(category);
                break;
            case COMMENTS:
                magazines = contentDao.getCommunityMagazinesOrderByComments(category);
                break;
            case LIKES:
                magazines = contentDao.getCommunityMagazinesOrderByLikes(category);
                break;
            case BOOKMARKS:
                magazines = contentDao.getCommunityMagazinesOrderByBookmarks(category);
                break;
            default:
                throw new RuntimeException();
        }
        for (Magazine magazine : magazines) {
            if (userNo != null)
                magazine.set_bookmark(bookmarkDao.isMagazineBookmarkByUserNo(magazine.getNo(), userNo));
        }
        return magazines;
    }

    public List<QuestionSummary> getCommunityQuestionsPage(String category, ORDER_TYPE order_type) {
        List<QuestionSummary> questions;
        switch (order_type) {
            case RECENT:
                questions = contentDao.getCommunityQuestionsOrderByRecent(category);
                break;
            case VIEWS:
                questions = contentDao.getCommunityQuestionsOrderByViews(category);
                break;
            case COMMENTS:
                questions = contentDao.getCommunityQuestionsOrderByComments(category);
                break;
            case LIKES:
                questions = contentDao.getCommunityQuestionsOrderByLikes(category);
                break;
            case BOOKMARKS:
                questions = contentDao.getCommunityQuestionsOrderByBookmarks(category);
                break;
            default:
                throw new RuntimeException();
        }
        return questions;
    }

    public List<Farm> getCommunityFarmsPage(FARM_TYPE farm_type, ORDER_TYPE order_type, HttpServletRequest request) {
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        List<Farm> farms;
        switch (order_type) {
            case RECENT:
                farms = farmDao.getCommunityFarmsOrderByRecent(farm_type);
                break;
            case VIEWS:
                farms = farmDao.getCommunityFarmsOrderByViews(farm_type);
                break;
            case BOOKMARKS:
                farms = farmDao.getCommunityFarmsOrderByBookmarks(farm_type);
                break;
            default:
                throw new RuntimeException();
        }
        for (Farm farm : farms) {
            if (userNo != null)
                farm.set_bookmark(bookmarkDao.isFarmBookmarkByUserNo(farm.getNo(), userNo));
        }
        return farms;
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
                List<Manual> manuals;
                switch (order_type) {
                    case RECENT:
                        if (is_reload) {
                            manuals = contentDao.getCommunityManualsOrderByRecentReload(category, content_no);
                        } else {
                            manuals = contentDao.getCommunityManualsOrderByRecent(category);
                        }
                        break;
                    case VIEWS:
                        if (is_reload) {
                            manuals = contentDao.getCommunityManualsOrderByViewsReload(category, content_no);
                        } else {
                            manuals = contentDao.getCommunityManualsOrderByViews(category);
                        }
                        break;
                    case COMMENTS:
                        if (is_reload) {
                            manuals = contentDao.getCommunityManualsOrderByCommentsReload(category, content_no);
                        } else {
                            manuals = contentDao.getCommunityManualsOrderByComments(category);
                        }
                        break;
                    case LIKES:
                        if (is_reload) {
                            manuals = contentDao.getCommunityManualsOrderByLikesReload(category, content_no);
                        } else {
                            manuals = contentDao.getCommunityManualsOrderByLikes(category);
                        }
                        break;
                    case BOOKMARKS:
                        if (is_reload) {
                            manuals = contentDao.getCommunityManualsOrderByBookmarksReload(category, content_no);
                        } else {
                            manuals = contentDao.getCommunityManualsOrderByBookmarks(category);
                        }
                        break;
                    default:
                        throw new RuntimeException();
                }

                for (Manual manual : manuals) {
                    if (userNo != null) {
                        manual.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(manual.getNo(), userNo));
                    }
                    manual.setProfile_image(farmDao.getFarmByNo(manual.getFarm_no()).getProfile_image());
                }
                message.put("list", manuals);
                break;
            case "magazine":
                List<Magazine> magazines;
                switch (order_type) {
                    case RECENT:
                        if (is_reload) {
                            magazines = contentDao.getCommunityMagazinesOrderByRecentReload(category, content_no);
                        } else {
                            magazines = contentDao.getCommunityMagazinesOrderByRecent(category);
                        }
                        break;
                    case VIEWS:
                        if (is_reload) {
                            magazines = contentDao.getCommunityMagazinesOrderByViewsReload(category, content_no);
                        } else {
                            magazines = contentDao.getCommunityMagazinesOrderByViews(category);
                        }
                        break;
                    case COMMENTS:
                        if (is_reload) {
                            magazines = contentDao.getCommunityMagazinesOrderByCommentsReload(category, content_no);
                        } else {
                            magazines = contentDao.getCommunityMagazinesOrderByComments(category);
                        }
                        break;
                    case LIKES:
                        if (is_reload) {
                            magazines = contentDao.getCommunityMagazinesOrderByLikesReload(category, content_no);
                        } else {
                            magazines = contentDao.getCommunityMagazinesOrderByLikes(category);
                        }
                        break;
                    case BOOKMARKS:
                        if (is_reload) {
                            magazines = contentDao.getCommunityMagazinesOrderByBookmarksReload(category, content_no);
                        } else {
                            magazines = contentDao.getCommunityMagazinesOrderByBookmarks(category);
                        }
                        break;
                    default:
                        throw new RuntimeException();
                }

                for (Magazine magazine : magazines) {
                    if (userNo != null) {
                        magazine.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(magazine.getNo(), userNo));
                    }
                }
                message.put("list", magazines);
                break;
            case "question":
                List<QuestionSummary> questions;
                switch (order_type) {
                    case RECENT:
                        if (is_reload) {
                            questions = contentDao.getCommunityQuestionsOrderByRecentReload(category, content_no);
                        } else {
                            questions = contentDao.getCommunityQuestionsOrderByRecent(category);
                        }
                        break;
                    case VIEWS:
                        if (is_reload) {
                            questions = contentDao.getCommunityQuestionsOrderByViewsReload(category, content_no);
                        } else {
                            questions = contentDao.getCommunityQuestionsOrderByViews(category);
                        }
                        break;
                    case COMMENTS:
                        if (is_reload) {
                            questions = contentDao.getCommunityQuestionsOrderByCommentsReload(category, content_no);
                        } else {
                            questions = contentDao.getCommunityQuestionsOrderByComments(category);
                        }
                        break;
                    case LIKES:
                        if (is_reload) {
                            questions = contentDao.getCommunityQuestionsOrderByLikesReload(category, content_no);
                        } else {
                            questions = contentDao.getCommunityQuestionsOrderByLikes(category);
                        }
                        break;
                    case BOOKMARKS:
                        if (is_reload) {
                            questions = contentDao.getCommunityQuestionsOrderByBookmarksReload(category, content_no);
                        } else {
                            questions = contentDao.getCommunityQuestionsOrderByBookmarks(category);
                        }
                        break;
                    default:
                        throw new RuntimeException();
                }
                message.put("list", questions);
                break;
            case "farm":
                List<Farm> farms;
                FARM_TYPE farm_type;
                if(!Objects.equals(category, "")) {
                    try {
                        farm_type = FARM_TYPE.valueOf(category);
                    } catch (IllegalArgumentException e) {
                        farm_type = null;
                        message.put("status", false);
                    }
                } else {
                    farm_type = null;
                }
                switch (order_type) {
                    case RECENT:
                        if (is_reload) {
                            farms = farmDao.getCommunityFarmsOrderByRecentReload(farm_type, content_no);
                        } else {
                            farms = farmDao.getCommunityFarmsOrderByRecent(farm_type);
                        }
                        break;
                    case VIEWS:
                        if (is_reload) {
                            farms = farmDao.getCommunityFarmsOrderByViewsReload(farm_type, content_no);
                        } else {
                            farms = farmDao.getCommunityFarmsOrderByViews(farm_type);
                        }
                        break;
                    case BOOKMARKS:
                        if (is_reload) {
                            farms = farmDao.getCommunityFarmsOrderByBookmarksReload(farm_type, content_no);
                        } else {
                            farms = farmDao.getCommunityFarmsOrderByBookmarks(farm_type);
                        }
                        break;
                    default:
                        throw new RuntimeException();
                }

                for (Farm farm : farms) {
                    if (userNo != null) {
                        farm.set_bookmark(bookmarkDao.isFarmBookmarkByUserNo(farm.getNo(), userNo));
                    }
                }
                message.put("list", farms);
                break;
            default:
                throw new RuntimeException();
        }
        return message;
    }

    public Tips getTip(int tip_no) {
        return contentDao.getTip(tip_no);
    }

    public ArrayList<Tips> getTips(int farm_no) {
        return contentDao.getTips(farm_no);
    }

    public void insertCommunity(ContentForm contentForm) {
        switch (contentForm.getCommunity_type()) {
            case BOARD:
                Board board = new Board();
                board.setFarm_no(contentForm.getFarm_no());
                board.setTitle(contentForm.getTitle());
                board.setContent(contentForm.getContent());
                board.setCategory(contentForm.getCategory());
                contentDao.insertBoard(board);
                break;
            case QUESTION:
                Question question = new Question();
                question.setFarm_no(contentForm.getFarm_no());
                question.setTitle(contentForm.getTitle());
                question.setContent(contentForm.getContent());
                question.setCategory(contentForm.getCategory());
                log.info("question -> {}", question);
                contentDao.insertQuestion(question);
                break;
            default:
        }
    }

    public void updateCommunity(ContentForm contentForm) {
        switch (contentForm.getCommunity_type()) {
            case BOARD:
                Board board = new Board();
                board.setNo(contentForm.getNo());
                board.setFarm_no(contentForm.getFarm_no());
                board.setTitle(contentForm.getTitle());
                board.setContent(contentForm.getContent());
                board.setCategory(contentForm.getCategory());
                contentDao.updateBoard(board);
                break;
            case QUESTION:
                Question question = new Question();
                question.setNo(contentForm.getNo());
                question.setFarm_no(contentForm.getFarm_no());
                question.setTitle(contentForm.getTitle());
                question.setContent(contentForm.getContent());
                question.setCategory(contentForm.getCategory());
                log.info("question -> {}", question);
                contentDao.updateQuestion(question);
                break;
            default:
        }
    }

    public void insertCommunityThumbnail(ContentForm contentForm, MFile thumbnail) {
        switch (contentForm.getCommunity_type()) {
            case TIP:
                Tips tips = new Tips();
                tips.setThumbnail(thumbnail);
                tips.setFarm_no(contentForm.getFarm_no());
                tips.setTitle(contentForm.getTitle());
                tips.setContent(contentForm.getContent());
                tips.setCategory(contentForm.getCategory());
                contentDao.insertTips(tips);
                break;
            case MANUAL:
                Manual manual = new Manual();
                manual.setThumbnail(thumbnail);
                manual.setFarm_no(contentForm.getFarm_no());
                manual.setTitle(contentForm.getTitle());
                manual.setContent(contentForm.getContent());
                manual.setCategory(contentForm.getCategory());
                contentDao.insertManual(manual);
                break;
            case MAGAZINE:
                Magazine magazine = new Magazine();
                magazine.setThumbnail(thumbnail);
                magazine.setFarm_no(contentForm.getFarm_no());
                magazine.setTitle(contentForm.getTitle());
                magazine.setContent(contentForm.getContent());
                magazine.setCategory(contentForm.getCategory());
                contentDao.insertMagazine(magazine);
                break;
            default:
        }
    }

    public List<Board> getBoardSearchResult(String query, int last_content_no) {
        return contentDao.getBoardSearchResult(query, last_content_no);
    }

    public List<Tips> getTipsSearchResult(String query, int last_content_no) {
        return contentDao.getTipsSearchResult(query, last_content_no);
    }

    public List<Manual> getManualSearchResult(String query, int last_content_no) {
        return contentDao.getManualSearchResult(query, last_content_no);
    }

    public List<Magazine> getMagazineSearchResult(String query, int last_content_no) {
        return contentDao.getMagazineSearchResult(query, last_content_no);
    }


    public List<Farm> getFarmSearchResult(String query, int last_content_no) {
        return farmDao.getFarmSearchResult(query, last_content_no);
    }

    public List<QuestionSummary> getQuestionSearchResult(String query, int last_content_no) {
        return contentDao.getQuestionSearchResult(query, last_content_no);
    }

    public ArrayList<Board> getBookmarkBoards(int user_no) {
        return contentDao.getBookmarkBoards(user_no);
    }

    public ArrayList<Tips> getBookmarkTips(int user_no) {
        return contentDao.getBookmarkTips(user_no);
    }

    public ArrayList<Manual> getBookmarkManuals(int user_no) {
        return contentDao.getBookmarkManuals(user_no);
    }

    public ArrayList<Question> getBookmarkQuestions(int user_no) {
        return contentDao.getBookmarkQuestions(user_no);
    }

    public ArrayList<Magazine> getBookmarkMagazines(int user_no) {
        return contentDao.getBookmarkMagazines(user_no);
    }

    public List<Board> getFarmBoards(int farm_no, int content_no, String category) {
        return contentDao.getFarmBoards(farm_no, content_no, category);
    }

    public List<Tips> getFarmTips(int farm_no, int content_no, String category) {
        return contentDao.getFarmTips(farm_no, content_no, category);
    }

    public List<QuestionSummary> getFarmQuestions(int farm_no, int content_no, String category) {
        return contentDao.getFarmQuestions(farm_no, content_no, category);
    }

    public List<Manual> getFarmManuals(int farm_no, int content_no, String category) {
        return contentDao.getFarmManuals(farm_no, content_no, category);
    }

    public Message getFarmContentList(String type, int content_no, int farm_no, String category, HttpServletRequest request) {
        Message message = new Message();
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        switch (type) {
            case "board":
                List<Board> boards = contentDao.getFarmBoards(farm_no, content_no, category);
                message.put("list", boards);
                break;
            case "tip":
                List<Tips> tips = contentDao.getFarmTips(farm_no, content_no, category);
                for (Tips tip : tips) {
                    if (userNo != null) {
                        tip.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(tip.getNo(), userNo));
                    }
                    tip.setProfile_image(farmDao.getFarmByNo(tip.getFarm_no()).getProfile_image());
                }
                message.put("list", tips);
                break;
            case "question":
                List<QuestionSummary> questions = contentDao.getFarmQuestions(farm_no, content_no, category);
                message.put("list", questions);
                break;
            case "manual":
                List<Manual> manuals = contentDao.getFarmManuals(farm_no, content_no, category);
                for (Manual manual : manuals) {
                    if (userNo != null) {
                        manual.set_bookmark(bookmarkDao.isManualBookmarkByUserNo(manual.getNo(), userNo));
                    }
                    manual.setProfile_image(farmDao.getFarmByNo(manual.getFarm_no()).getProfile_image());
                }
                message.put("list", manuals);
                break;
            default:
                throw new RuntimeException();
        }
        return message;
    }

    public ContentForm getContentFormByBoardNo(int board_no) {
        return contentDao.getContentFormByBoardNo(board_no);
    }

    public ContentForm getContentFormByQuestionNo(int question_no) {
        return contentDao.getContentFormByQuestionNo(question_no);
    }

    public ContentForm getContentFormByMagazineNo(int magazine_no) {
        return contentDao.getContentFormByMagazineNo(magazine_no);
    }

    public ContentForm getContentFormByManualNo(int manual_no) {
        return contentDao.getContentFormByManualNo(manual_no);
    }

    public ContentForm getContentFormByTipNo(int tips_no) {
        return contentDao.getContentFormByTipNo(tips_no);
    }

    public void updateCommunityThumbnail(ContentForm contentForm, MFile thumbnail) {
        switch (contentForm.getCommunity_type()) {
            case TIP:
                Tips tips = new Tips();
                tips.setNo(contentForm.getNo());
                tips.setThumbnail(thumbnail);
                tips.setFarm_no(contentForm.getFarm_no());
                tips.setTitle(contentForm.getTitle());
                tips.setContent(contentForm.getContent());
                tips.setCategory(contentForm.getCategory());
                contentDao.updateTips(tips);
                break;
            case MANUAL:
                Manual manual = new Manual();
                manual.setNo(contentForm.getNo());
                manual.setThumbnail(thumbnail);
                manual.setFarm_no(contentForm.getFarm_no());
                manual.setTitle(contentForm.getTitle());
                manual.setContent(contentForm.getContent());
                manual.setCategory(contentForm.getCategory());
                contentDao.updateManual(manual);
                break;
            case MAGAZINE:
                Magazine magazine = new Magazine();
                magazine.setNo(contentForm.getNo());
                magazine.setThumbnail(thumbnail);
                magazine.setFarm_no(contentForm.getFarm_no());
                magazine.setTitle(contentForm.getTitle());
                magazine.setContent(contentForm.getContent());
                magazine.setCategory(contentForm.getCategory());
                contentDao.updateMagazine(magazine);
                break;
            default:
        }
    }

    public void deleteContent(COMMENT_TYPE type, int community_no) {
        switch (type) {
            case BOARD:
                contentDao.deleteBoard(community_no);
                break;
            case QUESTION:
                contentDao.deleteQuestion(community_no);
                break;
            case TIP:
                contentDao.deleteTip(community_no);
                break;
            case MANUAL:
                contentDao.deleteManual(community_no);
                break;
            default:
        }
    }

    public Magazine getMagazineExcludeShow(int magazine_no) {
        return contentDao.getMagazineExcludeShow(magazine_no);
    }
}

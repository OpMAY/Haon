package com.controller;

import com.dao.CommunityCategoryDao;
import com.model.FarmComment;
import com.model.User;
import com.model.common.MFile;
import com.model.content.board.Board;
import com.model.content.board.BoardComment;
import com.model.content.board.BoardTransaction;
import com.model.content.magazine.Magazine;
import com.model.content.magazine.MagazineComment;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.manual.Manual;
import com.model.content.manual.ManualComment;
import com.model.content.manual.ManualTransaction;
import com.model.content.question.Question;
import com.model.content.question.QuestionComment;
import com.model.content.question.QuestionTransaction;
import com.model.content.tips.TipsComment;
import com.model.content.tips.TipsTransaction;
import com.model.farm.FARM_TYPE;
import com.model.content.common.ORDER_TYPE;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import com.model.farm.Farm;
import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
import com.model.queue.ServerTokenType;
import com.model.queue.Token;
import com.service.*;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.Format;
import com.util.TokenGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.parser.TokenQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
    @Value("${DEFAULT.PROFILE.IMAGE.URL}")
    private String SAMPLE_PROFILE_URL;
    @Value("${DEFAULT.PROFILE.IMAGE.NAME}")
    private String SAMPLE_PROFILE_NAME;
    @Value("${DEFAULT.PROFILE.IMAGE.SIZE}")
    private long SAMPLE_PROFILE_SIZE;
    @Value("${DEFAULT.PROFILE.IMAGE.TYPE}")
    private String SAMPLE_PROFILE_TYPE;

    private final ContentService contentService;
    private final EncryptionService encryptionService;
    private final LikeService likeService;
    private final BookmarkService bookmarkService;
    private final CommentService commentService;
    private final UserService userService;
    private final FarmService farmService;
    private final GlobalService globalService;
    private final ServerTokenService serverTokenService;
    private final CommunityCategoryDao categoryDao;

    @RequestMapping(value = "/board/detail/{board_no}", method = RequestMethod.GET)
    public ModelAndView getBoardDetail(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        ModelAndView VIEW = new ModelAndView("community/board-detail");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Board board = contentService.getBoard(board_no);
        //Auto Increment View Count
        String str_token = "user" + request.getSession().getId() + "community" + board.getNo() + "BOARD";
        Token token = serverTokenService.pop(str_token);
        if (token != null) {
            Duration duration = Duration.between(token.getReg_datetime(), LocalDateTime.now());
            long result = duration.getSeconds();
            log.info("token -> {}, time -> {}", token, result);
            if (result > 30) {
                //VIEW COUNT
                contentService.updateBoardViews(board_no);
                serverTokenService.remove(str_token);
            }
        } else {
            serverTokenService.put(str_token, Token.builder()
                    .user_no(user_no)
                    .community_no(board.getNo())
                    .token(str_token)
                    .type(ServerTokenType.BOARD)
                    .reg_datetime(LocalDateTime.now())
                    .update_datetime(LocalDateTime.now())
                    .build());
            contentService.updateBoardViews(board_no);
        }
        //Get Board Like Bookmark Data
        ArrayList<BoardTransaction> likes = likeService.getLikesByBoardNo(board_no);
        boolean is_like = false;
        boolean is_bookmark = false;
        if (user_no != null) {
            for (BoardTransaction like : likes) {
                if (like.getUser_no().intValue() == user_no.intValue()) {
                    is_like = true;
                }
            }
            is_bookmark = bookmarkService.isBoardBookmarkByUserNo(board_no, user_no);
        }

        //Get Comment
        ArrayList<BoardComment> comments = commentService.getBoardComments(board_no);
        for (BoardComment comment : comments) {
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    comment.setUser(commented_user);
                }
            } else {
                commented_user = new User();
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                commented_user.setName("관리자");
                commented_user.setProfile_img(profile);
                comment.setContent("삭제된 메세지입니다.");
                comment.setUser(commented_user);
            }

            if (user_no != null) {
                comment.set_like(likeService.isCommentBoardLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentBoardDislikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<BoardComment> recomments = commentService.getBoardRecommentByCommentNo(comment.getNo());
            for (BoardComment recomment : recomments) {
                User recommented_user = null;
                if (recomment.getUser_no() != null) {
                    recommented_user = userService.getUserByNo(recomment.getUser_no());
                    if (globalService.checkFarm(recommented_user.getNo())) {
                        Farm farm = farmService.getFarmByUserNo(recommented_user.getNo());
                        recommented_user.setProfile_img(farm.getProfile_image());
                        recommented_user.setName(farm.getName());
                        recomment.setUser(recommented_user);
                    } else {
                        MFile profile = new MFile();
                        profile.setUrl(SAMPLE_PROFILE_URL);
                        profile.setName(SAMPLE_PROFILE_NAME);
                        profile.setSize(SAMPLE_PROFILE_SIZE);
                        profile.setType(SAMPLE_PROFILE_TYPE);

                        recommented_user.setProfile_img(profile);
                        recomment.setUser(recommented_user);
                    }
                } else {
                    recommented_user = new User();
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);
                    recommented_user.setName("관리자");
                    recommented_user.setProfile_img(profile);
                    recomment.setUser(recommented_user);
                    recomment.setContent("삭제된 메세지입니다.");
                }
                if (user_no != null && (user_no.intValue() == recommented_user.getNo())) {
                    recomment.setOwner_checked(true);
                } else {
                    recomment.setOwner_checked(false);
                }
            }

            comment.setComments(recomments);

            if (user_no != null && user_no.intValue() == commented_user.getNo()) {
                comment.setOwner_checked(true);
            } else {
                comment.setOwner_checked(false);
            }
            comment.set_best(commentService.isBestBoardComment(comment.getBoard_no(), comment.getNo()));
        }

        //Get Farm Data
        Farm farm = farmService.getFarmByFarmNo(board.getFarm_no());
        if (user_no != null) {
            farm.set_bookmark(farmService.isFarmBookmark(farm.getNo(), user_no));
        }
        //Get Farm Other Boards
        ArrayList<Board> other_boards = contentService.getBoards(board.getFarm_no());
        //Get Farm Favorite Boards
        ArrayList<Board> fame_boards = contentService.getFameBoards(board.getFarm_no());

        VIEW.addObject("board", board);
        VIEW.addObject("likes", likes);
        VIEW.addObject("is_like", is_like);
        VIEW.addObject("is_bookmark", is_bookmark);
        VIEW.addObject("comments", comments);
        VIEW.addObject("farm", farm);
        VIEW.addObject("fame_boards", fame_boards);
        VIEW.addObject("other_boards", other_boards);
        return VIEW;
    }

    @RequestMapping(value = "/boards", method = RequestMethod.GET)
    public ModelAndView communityBoardsPage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("community/boards");
        List<Board> boards = contentService.getCommunityBoardsPage(null, ORDER_TYPE.RECENT);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());

        for (Board board : boards) {
            board.setFarm(farmService.getFarmByFarmNo(board.getFarm_no()));
            if (user_no != null) {
                board.set_bookmark(bookmarkService.isBoardBookmarkByUserNo(board.getNo(), user_no));
            }
            board.setContent(Format.summernoteHTMLToString(board.getContent()));
        }
        VIEW.addObject("boards",boards);
        VIEW.addObject("categories",categoryDao.getCommunityCategory(CATEGORY_TYPE.BOARD));
        return VIEW;
}

    @RequestMapping(value = "/farm/detail/{farm_no}", method = RequestMethod.GET)
    public ModelAndView getFarmDetail(HttpServletRequest request, @PathVariable("farm_no") int farm_no) {
        ModelAndView VIEW = new ModelAndView("community/farm-detail");
        Farm farm = farmService.getFarmByFarmNo(farm_no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        if (user_no != null) {
            farm.set_bookmark(farmService.isFarmBookmark(farm.getNo(), user_no));
        }

        CommunityCategory board_categories = categoryDao.getCommunityCategory(CATEGORY_TYPE.BOARD);
        CommunityCategory tip_categories = categoryDao.getCommunityCategory(CATEGORY_TYPE.TIP);
        CommunityCategory manual_categories = categoryDao.getCommunityCategory(CATEGORY_TYPE.MANUAL);
        CommunityCategory question_categories = categoryDao.getCommunityCategory(CATEGORY_TYPE.QUESTION);

        VIEW.addObject("board_categories", board_categories);
        VIEW.addObject("tip_categories", tip_categories);
        VIEW.addObject("manual_categories", manual_categories);
        VIEW.addObject("question_categories", question_categories);

        // GET BOARDS
        List<Board> boards = contentService.getFarmBoards(farm_no, 0, null);

        // GET TIPS
        List<Tips> tips = contentService.getFarmTips(farm_no, 0, null);
        for (Tips tip : tips) {
            if (user_no != null) {
                tip.set_bookmark(bookmarkService.isTipBookmarkByUserNo(tip.getNo(), user_no));
            }
            tip.setProfile_image(farmService.getFarmByFarmNo(tip.getFarm_no()).getProfile_image());
        }

        //Get Comment
        ArrayList<FarmComment> comments = commentService.getFarmComments(farm_no);
        for (FarmComment comment : comments) {
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm check_farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(check_farm.getProfile_image());
                    commented_user.setName(check_farm.getName());
                    comment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    comment.setUser(commented_user);
                }
            } else {
                commented_user = new User();
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                commented_user.setName("관리자");
                commented_user.setProfile_img(profile);
                comment.setContent("삭제된 메세지입니다.");
                comment.setUser(commented_user);
            }

            if (user_no != null) {
                comment.set_like(likeService.isCommentFarmLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentFarmDislikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<FarmComment> recomments = commentService.getFarmRecommentByCommentNo(comment.getNo());
            for (FarmComment recomment : recomments) {
                User recommented_user = null;
                if (recomment.getUser_no() != null) {
                    recommented_user = userService.getUserByNo(recomment.getUser_no());
                    if (globalService.checkFarm(recommented_user.getNo())) {
                        Farm check_farm = farmService.getFarmByUserNo(recommented_user.getNo());
                        recommented_user.setProfile_img(check_farm.getProfile_image());
                        recommented_user.setName(check_farm.getName());
                        recomment.setUser(recommented_user);
                    } else {
                        MFile profile = new MFile();
                        profile.setUrl(SAMPLE_PROFILE_URL);
                        profile.setName(SAMPLE_PROFILE_NAME);
                        profile.setSize(SAMPLE_PROFILE_SIZE);
                        profile.setType(SAMPLE_PROFILE_TYPE);

                        recommented_user.setProfile_img(profile);
                        recomment.setUser(recommented_user);
                    }
                } else {
                    recommented_user = new User();
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);
                    recommented_user.setName("관리자");
                    recommented_user.setProfile_img(profile);
                    recomment.setUser(recommented_user);
                    recomment.setContent("삭제된 메세지입니다.");
                }
                if (user_no != null && (user_no.intValue() == recommented_user.getNo())) {
                    recomment.setOwner_checked(true);
                } else {
                    recomment.setOwner_checked(false);
                }
            }

            comment.setComments(recomments);

            if (user_no != null && user_no.intValue() == commented_user.getNo()) {
                comment.setOwner_checked(true);
            } else {
                comment.setOwner_checked(false);
            }
            comment.set_best(commentService.isBestFarmComment(comment.getFarm_no(), comment.getNo()));
        }

        VIEW.addObject("farm", farm);
        VIEW.addObject("boards", boards);
        VIEW.addObject("tips", tips);
        VIEW.addObject("comments", comments);
        return VIEW;
    }

    @RequestMapping(value = "/farms", method = RequestMethod.GET)
    public ModelAndView communityFarmsPage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("community/farms");
        List<Farm> farms = contentService.getCommunityFarmsPage(null, ORDER_TYPE.RECENT, request);
        VIEW.addObject("farms", farms);
        return VIEW;
    }

    @RequestMapping(value = "/magazine/detail/{magazine_no}", method = RequestMethod.GET)
    public ModelAndView getMagazineDetail(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        ModelAndView VIEW = new ModelAndView("community/magazine-detail");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Magazine magazine = contentService.getMagazine(magazine_no);
        //Auto Increment View Count
        String str_token = "user" + request.getSession().getId() + "community" + magazine.getNo() + "MAGAZINE";
        Token token = serverTokenService.pop(str_token);
        if (token != null) {
            Duration duration = Duration.between(token.getReg_datetime(), LocalDateTime.now());
            long result = duration.getSeconds();
            log.info("token -> {}, time -> {}", token, result);
            if (result > 30) {
                //VIEW COUNT
                contentService.updateMagazineViews(magazine_no);
                serverTokenService.remove(str_token);
            }
        } else {
            serverTokenService.put(str_token, Token.builder()
                    .user_no(user_no)
                    .community_no(magazine.getNo())
                    .token(str_token)
                    .type(ServerTokenType.MAGAZINE)
                    .reg_datetime(LocalDateTime.now())
                    .update_datetime(LocalDateTime.now())
                    .build());
            contentService.updateMagazineViews(magazine_no);
        }
        //Get Board Like Bookmark Data
        ArrayList<MagazineTransaction> likes = likeService.getLikesByMagazineNo(magazine_no);
        boolean is_like = false;
        boolean is_bookmark = false;
        if (user_no != null) {
            for (MagazineTransaction like : likes) {
                if (like.getUser_no() != null && like.getUser_no().intValue() == user_no.intValue()) {
                    is_like = true;
                }
            }
            is_bookmark = bookmarkService.isMagazineBookmarkByUserNo(magazine_no, user_no);
        }

        //Get Comment
        ArrayList<MagazineComment> comments = commentService.getMagazineComments(magazine_no);
        for (MagazineComment comment : comments) {
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    comment.setUser(commented_user);
                }
            } else {
                commented_user = new User();
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                commented_user.setName("관리자");
                commented_user.setProfile_img(profile);
                comment.setContent("삭제된 메세지입니다.");
                comment.setUser(commented_user);
            }

            if (user_no != null) {
                comment.set_like(likeService.isCommentMagazineLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentMagazineDislikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<MagazineComment> recomments = commentService.getMagazineRecommentByCommentNo(comment.getNo());
            for (MagazineComment recomment : recomments) {
                User recommented_user = null;
                if (recomment.getUser_no() != null) {
                    recommented_user = userService.getUserByNo(recomment.getUser_no());
                    if (globalService.checkFarm(recommented_user.getNo())) {
                        Farm farm = farmService.getFarmByUserNo(recommented_user.getNo());
                        recommented_user.setProfile_img(farm.getProfile_image());
                        recommented_user.setName(farm.getName());
                        recomment.setUser(recommented_user);
                    } else {
                        MFile profile = new MFile();
                        profile.setUrl(SAMPLE_PROFILE_URL);
                        profile.setName(SAMPLE_PROFILE_NAME);
                        profile.setSize(SAMPLE_PROFILE_SIZE);
                        profile.setType(SAMPLE_PROFILE_TYPE);

                        recommented_user.setProfile_img(profile);
                        recomment.setUser(recommented_user);
                    }
                } else {
                    recommented_user = new User();
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);
                    recommented_user.setName("관리자");
                    recommented_user.setProfile_img(profile);
                    recomment.setUser(recommented_user);
                    recomment.setContent("삭제된 메세지입니다.");
                }
                if (user_no != null && (user_no.intValue() == recommented_user.getNo())) {
                    recomment.setOwner_checked(true);
                } else {
                    recomment.setOwner_checked(false);
                }
            }

            comment.setComments(recomments);

            if (user_no != null && user_no.intValue() == commented_user.getNo()) {
                comment.setOwner_checked(true);
            } else {
                comment.setOwner_checked(false);
            }
            comment.set_best(commentService.isBestMagazineComment(comment.getMagazine_no(), comment.getNo()));
        }

        //Get Farm Data
        Farm farm = farmService.getFarmByFarmNo(0);
        if (user_no != null) {
            farm.set_bookmark(farmService.isFarmBookmark(farm.getNo(), user_no));
        }
        //Get Favorite Magazines
        ArrayList<Magazine> fame_magazines = contentService.getFameMagazines();

        VIEW.addObject("magazine", magazine);
        VIEW.addObject("likes", likes);
        VIEW.addObject("is_like", is_like);
        VIEW.addObject("is_bookmark", is_bookmark);
        VIEW.addObject("comments", comments);
        VIEW.addObject("farm", farm);
        VIEW.addObject("fame_magazines", fame_magazines);
        return VIEW;
    }

    @RequestMapping(value = "/magazines", method = RequestMethod.GET)
    public ModelAndView communityMagazinesPage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("community/magazines");
        List<Magazine> magazines = contentService.getCommunityMagazinesPage(null, ORDER_TYPE.RECENT, request);
        for (Magazine magazine : magazines) {
            magazine.setProfile_image(farmService.getFarmByFarmNo(0).getProfile_image());
        }
        VIEW.addObject("magazines", magazines);
        VIEW.addObject("categories", categoryDao.getCommunityCategory(CATEGORY_TYPE.MAGAZINE));
        return VIEW;
    }

    @RequestMapping(value = "/question/detail/{question_no}", method = RequestMethod.GET)
    public ModelAndView getQuestionDetail(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        ModelAndView VIEW = new ModelAndView("community/question-detail");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Question question = contentService.getQuestion(question_no);
//Auto Increment View Count
        String str_token = "user" + request.getSession().getId() + "community" + question.getNo() + "QUESTION";
        Token token = serverTokenService.pop(str_token);
        if (token != null) {
            Duration duration = Duration.between(token.getReg_datetime(), LocalDateTime.now());
            long result = duration.getSeconds();
            log.info("token -> {}, time -> {}", token, result);
            if (result > 30) {
                //VIEW COUNT
                contentService.updateQuestionViews(question_no);
                serverTokenService.remove(str_token);
            }
        } else {
            serverTokenService.put(str_token, Token.builder()
                    .user_no(user_no)
                    .community_no(question.getNo())
                    .token(str_token)
                    .type(ServerTokenType.QUESTION)
                    .reg_datetime(LocalDateTime.now())
                    .update_datetime(LocalDateTime.now())
                    .build());
            contentService.updateQuestionViews(question_no);
        }
        //Get Board Like Bookmark Data
        ArrayList<QuestionTransaction> likes = likeService.getLikesByQuestionNo(question_no);
        boolean is_like = false;
        boolean is_bookmark = false;
        if (user_no != null) {
            for (QuestionTransaction like : likes) {
                if (like.getUser_no().intValue() == user_no.intValue()) {
                    is_like = true;
                }
            }
            is_bookmark = bookmarkService.isQuestionBookmarkByUserNo(question_no, user_no);
        }

        //Get Comment
        ArrayList<QuestionComment> comments = commentService.getQuestionComments(question_no);
        for (QuestionComment comment : comments) {
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    comment.setUser(commented_user);
                }
            } else {
                commented_user = new User();
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                commented_user.setName("관리자");
                commented_user.setProfile_img(profile);
                comment.setContent("삭제된 메세지입니다.");
                comment.setUser(commented_user);
            }

            if (user_no != null) {
                comment.set_like(likeService.isCommentQuestionLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentQuestionDislikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<QuestionComment> recomments = commentService.getQuestionRecommentByCommentNo(comment.getNo());
            for (QuestionComment recomment : recomments) {
                User recommented_user = null;
                if (recomment.getUser_no() != null) {
                    recommented_user = userService.getUserByNo(recomment.getUser_no());
                    if (globalService.checkFarm(recommented_user.getNo())) {
                        Farm farm = farmService.getFarmByUserNo(recommented_user.getNo());
                        recommented_user.setProfile_img(farm.getProfile_image());
                        recommented_user.setName(farm.getName());
                        recomment.setUser(recommented_user);
                    } else {
                        MFile profile = new MFile();
                        profile.setUrl(SAMPLE_PROFILE_URL);
                        profile.setName(SAMPLE_PROFILE_NAME);
                        profile.setSize(SAMPLE_PROFILE_SIZE);
                        profile.setType(SAMPLE_PROFILE_TYPE);

                        recommented_user.setProfile_img(profile);
                        recomment.setUser(recommented_user);
                    }
                } else {
                    recommented_user = new User();
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);
                    recommented_user.setName("관리자");
                    recommented_user.setProfile_img(profile);
                    recomment.setUser(recommented_user);
                    recomment.setContent("삭제된 메세지입니다.");
                }
                if (user_no != null && (user_no.intValue() == recommented_user.getNo())) {
                    recomment.setOwner_checked(true);
                } else {
                    recomment.setOwner_checked(false);
                }
            }

            comment.setComments(recomments);

            if (user_no != null && user_no.intValue() == commented_user.getNo()) {
                comment.setOwner_checked(true);
            } else {
                comment.setOwner_checked(false);
            }
            comment.set_best(commentService.isBestQuestionComment(comment.getQuestion_no(), comment.getNo()));
        }

        //Get Farm Data
        Farm farm = farmService.getFarmByFarmNo(question.getFarm_no());
        if (user_no != null) {
            farm.set_bookmark(farmService.isFarmBookmark(farm.getNo(), user_no));
        }
        //Get Other Questions
        ArrayList<Question> other_questions = contentService.getQuestions(farm.getNo());
        //Get Fame Questions
        ArrayList<Question> fame_questions = contentService.getFameQuestions(farm.getNo());

        VIEW.addObject("question", question);
        VIEW.addObject("likes", likes);
        VIEW.addObject("is_like", is_like);
        VIEW.addObject("is_bookmark", is_bookmark);
        VIEW.addObject("comments", comments);
        VIEW.addObject("farm", farm);
        VIEW.addObject("other_questions", other_questions);
        VIEW.addObject("fame_questions", fame_questions);
        return VIEW;
    }

    @RequestMapping(value = "/questions", method = RequestMethod.GET)
    public ModelAndView communityQuestionsPage() {
        ModelAndView VIEW = new ModelAndView("community/questions");
        List<QuestionSummary> questions = contentService.getCommunityQuestionsPage(null, ORDER_TYPE.RECENT);
        VIEW.addObject("questions", questions);
        VIEW.addObject("categories", categoryDao.getCommunityCategory(CATEGORY_TYPE.QUESTION));
        return VIEW;
    }

    @RequestMapping(value = "/tip/detail/{tip_no}", method = RequestMethod.GET)
    public ModelAndView getTipsDetail(HttpServletRequest request, @PathVariable("tip_no") int tip_no) {
        ModelAndView VIEW = new ModelAndView("community/tip-detail");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Tips tip = contentService.getTip(tip_no);
        //Auto Increment View Count
        String str_token = "user" + request.getSession().getId() + "community" + tip.getNo() + "TIP";
        Token token = serverTokenService.pop(str_token);
        if (token != null) {
            Duration duration = Duration.between(token.getReg_datetime(), LocalDateTime.now());
            long result = duration.getSeconds();
            log.info("token -> {}, time -> {}", token, result);
            if (result > 30) {
                //VIEW COUNT
                contentService.updateTipViews(tip_no);
                serverTokenService.remove(str_token);
            }
        } else {
            serverTokenService.put(str_token, Token.builder()
                    .user_no(user_no)
                    .community_no(tip.getNo())
                    .token(str_token)
                    .type(ServerTokenType.TIP)
                    .reg_datetime(LocalDateTime.now())
                    .update_datetime(LocalDateTime.now())
                    .build());
            contentService.updateTipViews(tip_no);
        }
        //Get Board Like Bookmark Data
        ArrayList<TipsTransaction> likes = likeService.getLikesByTipsNo(tip_no);
        boolean is_like = false;
        boolean is_bookmark = false;
        if (user_no != null) {
            for (TipsTransaction like : likes) {
                if (like.getUser_no().intValue() == user_no.intValue()) {
                    is_like = true;
                }
            }
            is_bookmark = bookmarkService.isTipBookmarkByUserNo(tip_no, user_no);
        }

        //Get Comment
        ArrayList<TipsComment> comments = commentService.getTipsComments(tip_no);
        for (TipsComment comment : comments) {
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    comment.setUser(commented_user);
                }
            } else {
                commented_user = new User();
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                commented_user.setName("관리자");
                commented_user.setProfile_img(profile);
                comment.setContent("삭제된 메세지입니다.");
                comment.setUser(commented_user);
            }

            if (user_no != null) {
                comment.set_like(likeService.isCommentTipsLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentTipsDislikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<TipsComment> recomments = commentService.getTipsRecommentByCommentNo(comment.getNo());
            for (TipsComment recomment : recomments) {
                User recommented_user = null;
                if (recomment.getUser_no() != null) {
                    recommented_user = userService.getUserByNo(recomment.getUser_no());
                    if (globalService.checkFarm(recommented_user.getNo())) {
                        Farm farm = farmService.getFarmByUserNo(recommented_user.getNo());
                        recommented_user.setProfile_img(farm.getProfile_image());
                        recommented_user.setName(farm.getName());
                        recomment.setUser(recommented_user);
                    } else {
                        MFile profile = new MFile();
                        profile.setUrl(SAMPLE_PROFILE_URL);
                        profile.setName(SAMPLE_PROFILE_NAME);
                        profile.setSize(SAMPLE_PROFILE_SIZE);
                        profile.setType(SAMPLE_PROFILE_TYPE);

                        recommented_user.setProfile_img(profile);
                        recomment.setUser(recommented_user);
                    }
                } else {
                    recommented_user = new User();
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);
                    recommented_user.setName("관리자");
                    recommented_user.setProfile_img(profile);
                    recomment.setUser(recommented_user);
                    recomment.setContent("삭제된 메세지입니다.");
                }
                if (user_no != null && (user_no.intValue() == recommented_user.getNo())) {
                    recomment.setOwner_checked(true);
                } else {
                    recomment.setOwner_checked(false);
                }
            }

            comment.setComments(recomments);

            if (user_no != null && user_no.intValue() == commented_user.getNo()) {
                comment.setOwner_checked(true);
            } else {
                comment.setOwner_checked(false);
            }
            comment.set_best(commentService.isBestTipsComment(comment.getTips_no(), comment.getNo()));
        }

        //Get Farm Data
        Farm farm = farmService.getFarmByFarmNo(tip.getFarm_no());
        if (user_no != null) {
            farm.set_bookmark(farmService.isFarmBookmark(farm.getNo(), user_no));
        }
        //Get Farm Other Boards
        ArrayList<Tips> other_tips = contentService.getTips(tip.getFarm_no());

        VIEW.addObject("tips", tip);
        VIEW.addObject("likes", likes);
        VIEW.addObject("is_like", is_like);
        VIEW.addObject("is_bookmark", is_bookmark);
        VIEW.addObject("comments", comments);
        VIEW.addObject("farm", farm);
        VIEW.addObject("other_tips", other_tips);
        return VIEW;
    }

    @RequestMapping(value = "/tips", method = RequestMethod.GET)
    public ModelAndView communityTipsPage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("community/tips");
        List<Tips> tips = contentService.getCommunityTipsPage(null, ORDER_TYPE.RECENT, request);
        VIEW.addObject("tips", tips);
        VIEW.addObject("categories", categoryDao.getCommunityCategory(CATEGORY_TYPE.TIP));
        return VIEW;
    }

    @RequestMapping(value = "/manuals", method = RequestMethod.GET)
    public ModelAndView communityManualsPage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("community/manuals");
        List<Manual> manuals = contentService.getCommunityManualsPage(null, ORDER_TYPE.RECENT, request);
        VIEW.addObject("manuals", manuals);
        VIEW.addObject("categories", categoryDao.getCommunityCategory(CATEGORY_TYPE.MANUAL));
        return VIEW;
    }

    @RequestMapping(value = "/manual/detail/{manual_no}", method = RequestMethod.GET)
    public ModelAndView getManualDetail(HttpServletRequest request, @PathVariable("manual_no") int manual_no) {
        ModelAndView VIEW = new ModelAndView("community/manual-detail");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Manual manual = contentService.getManual(manual_no);
        //Auto Increment View Count
        String str_token = "user" + request.getSession().getId() + "community" + manual.getNo() + "MANUAL";
        Token token = serverTokenService.pop(str_token);
        if (token != null) {
            Duration duration = Duration.between(token.getReg_datetime(), LocalDateTime.now());
            long result = duration.getSeconds();
            log.info("token -> {}, time -> {}", token, result);
            if (result > 30) {
                //VIEW COUNT
                contentService.updateManualViews(manual_no);
                serverTokenService.remove(str_token);
            }
        } else {
            serverTokenService.put(str_token, Token.builder()
                    .user_no(user_no)
                    .community_no(manual.getNo())
                    .token(str_token)
                    .type(ServerTokenType.MANUAL)
                    .reg_datetime(LocalDateTime.now())
                    .update_datetime(LocalDateTime.now())
                    .build());
            contentService.updateManualViews(manual_no);
        }
        //Get Board Like Bookmark Data
        ArrayList<ManualTransaction> likes = likeService.getLikesByManualNo(manual_no);
        boolean is_like = false;
        boolean is_bookmark = false;
        if (user_no != null) {
            for (ManualTransaction like : likes) {
                if (like.getUser_no().intValue() == user_no.intValue()) {
                    is_like = true;
                }
            }
            is_bookmark = bookmarkService.isManualBookmarkByUserNo(manual_no, user_no);
        }

        //Get Comment
        ArrayList<ManualComment> comments = commentService.getManualComments(manual_no);
        for (ManualComment comment : comments) {
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    comment.setUser(commented_user);
                }
            } else {
                commented_user = new User();
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                commented_user.setName("관리자");
                commented_user.setProfile_img(profile);
                comment.setContent("삭제된 메세지입니다.");
                comment.setUser(commented_user);
            }

            if (user_no != null) {
                comment.set_like(likeService.isCommentManualLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentManualDislikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<ManualComment> recomments = commentService.getManualRecommentByCommentNo(comment.getNo());
            for (ManualComment recomment : recomments) {
                User recommented_user = null;
                if (recomment.getUser_no() != null) {
                    recommented_user = userService.getUserByNo(recomment.getUser_no());
                    if (globalService.checkFarm(recommented_user.getNo())) {
                        Farm farm = farmService.getFarmByUserNo(recommented_user.getNo());
                        recommented_user.setProfile_img(farm.getProfile_image());
                        recommented_user.setName(farm.getName());
                        recomment.setUser(recommented_user);
                    } else {
                        MFile profile = new MFile();
                        profile.setUrl(SAMPLE_PROFILE_URL);
                        profile.setName(SAMPLE_PROFILE_NAME);
                        profile.setSize(SAMPLE_PROFILE_SIZE);
                        profile.setType(SAMPLE_PROFILE_TYPE);

                        recommented_user.setProfile_img(profile);
                        recomment.setUser(recommented_user);
                    }
                } else {
                    recommented_user = new User();
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);
                    recommented_user.setName("관리자");
                    recommented_user.setProfile_img(profile);
                    recomment.setUser(recommented_user);
                    recomment.setContent("삭제된 메세지입니다.");
                }
                if (user_no != null && (user_no.intValue() == recommented_user.getNo())) {
                    recomment.setOwner_checked(true);
                } else {
                    recomment.setOwner_checked(false);
                }
            }

            comment.setComments(recomments);

            if (user_no != null && user_no.intValue() == commented_user.getNo()) {
                comment.setOwner_checked(true);
            } else {
                comment.setOwner_checked(false);
            }
            comment.set_best(commentService.isBestManualComment(comment.getManual_no(), comment.getNo()));
        }

        //Get Farm Data
        Farm farm = farmService.getFarmByFarmNo(manual.getFarm_no());
        if (user_no != null) {
            farm.set_bookmark(farmService.isFarmBookmark(farm.getNo(), user_no));
        }
        //Get Other Questions
        ArrayList<Manual> other_manuals = contentService.getManuals(farm.getNo());

        VIEW.addObject("manual", manual);
        VIEW.addObject("likes", likes);
        VIEW.addObject("is_like", is_like);
        VIEW.addObject("is_bookmark", is_bookmark);
        VIEW.addObject("comments", comments);
        VIEW.addObject("farm", farm);
        VIEW.addObject("other_manuals", other_manuals);
        return VIEW;
    }
}

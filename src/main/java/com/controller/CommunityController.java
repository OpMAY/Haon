package com.controller;

import com.model.User;
import com.model.common.MFile;
import com.model.content.board.Board;
import com.model.content.board.BoardComment;
import com.model.content.board.BoardTransaction;
import com.model.content.magazine.Magazine;
import com.model.content.magazine.MagazineComment;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.question.Question;
import com.model.content.question.QuestionComment;
import com.model.content.question.QuestionTransaction;
import com.model.farm.FARM_TYPE;
import com.model.farm.Farm;
import com.service.*;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

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

    @RequestMapping(value = "/board/detail/{board_no}", method = RequestMethod.GET)
    public ModelAndView getBoardDetail(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        ModelAndView VIEW = new ModelAndView("community/board-detail");
        log.info("{}", board_no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Board board = contentService.getBoard(board_no);

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
                    log.info("farm {}", farm.toString());
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
    public ModelAndView communityBoardsPage() {
        ModelAndView VIEW = new ModelAndView("community/boards");
        return VIEW;
    }

    @RequestMapping(value = "/farm/detail", method = RequestMethod.GET)
    public ModelAndView communityFarmDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/farm-detail");
        return VIEW;
    }

    @RequestMapping(value = "/farms", method = RequestMethod.GET)
    public ModelAndView communityFarmsPage() {
        ModelAndView VIEW = new ModelAndView("community/farms");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/detail/{magazine_no}", method = RequestMethod.GET)
    public ModelAndView getMagazineDetail(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        ModelAndView VIEW = new ModelAndView("community/magazine-detail");
        log.info("{}", magazine_no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Magazine magazine = contentService.getMagazine(magazine_no);

        //Get Board Like Bookmark Data
        ArrayList<MagazineTransaction> likes = likeService.getLikesByMagazineNo(magazine_no);
        boolean is_like = false;
        boolean is_bookmark = false;
        if (user_no != null) {
            for (MagazineTransaction like : likes) {
                if (like.getUser_no().intValue() == user_no.intValue()) {
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
                    log.info("farm {}", farm.toString());
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
    public ModelAndView communityMagazinesPage() {
        ModelAndView VIEW = new ModelAndView("community/magazines");
        return VIEW;
    }

    @RequestMapping(value = "/question/detail", method = RequestMethod.GET)
    public ModelAndView getQuestionDetail(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        ModelAndView VIEW = new ModelAndView("community/board-detail");
        log.info("{}", question_no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        //Get Board Detail Data
        Question question = contentService.getQuestion(question_no);

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
                    log.info("farm {}", farm.toString());
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
        ModelAndView VIEW = new ModelAndView("community/qeustions");
        return VIEW;
    }

    @RequestMapping(value = "/tip/detail", method = RequestMethod.GET)
    public ModelAndView communityTipDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/tip-detail");
        return VIEW;
    }

    @RequestMapping(value = "/tips", method = RequestMethod.GET)
    public ModelAndView communityTipsPage() {
        ModelAndView VIEW = new ModelAndView("community/tips");
        return VIEW;
    }

    @RequestMapping(value = "/manuals", method = RequestMethod.GET)
    public ModelAndView communityManualsPage() {
        ModelAndView VIEW = new ModelAndView("community/manuals");
        return VIEW;
    }
}

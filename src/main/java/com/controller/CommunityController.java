package com.controller;

import com.model.User;
import com.model.common.MFile;
import com.model.content.board.Board;
import com.model.content.board.BoardComment;
import com.model.content.board.BoardTransaction;
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
        Board board = contentService.getBoard(board_no);
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

        ArrayList<BoardComment> comments = commentService.getBoardComments(board_no);
        for (BoardComment comment : comments) {
            User commented_user = userService.getUserByNo(comment.getUser_no());
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

            if (user_no != null) {
                comment.set_like(likeService.isCommentLikeByUserNo(comment.getNo(), user_no));
                comment.set_dislike(likeService.isCommentDisLikeByUserNo(comment.getNo(), user_no));
            }

            ArrayList<BoardComment> recomments = commentService.getRecommentByCommentNo(comment.getNo());
            for (BoardComment recomment : recomments) {
                User recommented_user = userService.getUserByNo(recomment.getUser_no());
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

        VIEW.addObject("board", board);
        VIEW.addObject("likes", likes);
        VIEW.addObject("is_like", is_like);
        VIEW.addObject("is_bookmark", is_bookmark);
        VIEW.addObject("comments", comments);
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

    @RequestMapping(value = "/magazine/detail", method = RequestMethod.GET)
    public ModelAndView communityMagazineDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/magazine");
        return VIEW;
    }

    @RequestMapping(value = "/magazines", method = RequestMethod.GET)
    public ModelAndView communityMagazinesPage() {
        ModelAndView VIEW = new ModelAndView("community/magazines");
        return VIEW;
    }

    @RequestMapping(value = "/question/detail", method = RequestMethod.GET)
    public ModelAndView communityQuestionDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/qeustion-detail");
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

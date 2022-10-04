package com.controller;

import com.aws.file.FileUploadUtility;
import com.aws.model.CDNUploadPath;
import com.google.gson.Gson;
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
import com.model.content.tips.Tips;
import com.model.content.tips.TipsComment;
import com.model.content.tips.TipsTransaction;
import com.model.farm.Farm;
import com.model.global.Banner;
import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
import com.model.global.keyword.SearchKeyword;
import com.service.*;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.Format;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
    @Value("${DEFAULT.PROFILE.IMAGE.URL}")
    private String SAMPLE_PROFILE_URL;
    @Value("${DEFAULT.PROFILE.IMAGE.NAME}")
    private String SAMPLE_PROFILE_NAME;
    @Value("${DEFAULT.PROFILE.IMAGE.SIZE}")
    private long SAMPLE_PROFILE_SIZE;
    @Value("${DEFAULT.PROFILE.IMAGE.TYPE}")
    private String SAMPLE_PROFILE_TYPE;

    private ModelAndView VIEW;
    private final EncryptionService encryptionService;
    private final UserService userService;
    private final AdminService adminService;
    private final FarmService farmService;
    private final LikeService likeService;
    private final CommentService commentService;
    private final FileUploadUtility fileUploadUtility;
    private final ContentService contentService;
    private final GlobalService globalService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLogin(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/auth/login");
        return VIEW;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView postLogin(HttpServletRequest request, User user) {
        VIEW = new ModelAndView("admin/auth/login");
        try {
            String token = encryptionService.encryptSHA256(user.getId());
            User admin = userService.getUserByNo(user.getNo());
            if (admin.getEmail().equals(user.getEmail()) && token.equals(admin.getId())) {
                VIEW.addObject("user", user);
                VIEW.addObject("status", true);
                VIEW.addObject("message", "로그인에 성공하셧습니다.");
                user.setId(admin.getId());
                request.getSession().setAttribute(JWTEnum.ADMIN.name(), encryptionService.encryptJWT(user));
            } else {
                VIEW.addObject("user", user);
                VIEW.addObject("status", false);
                VIEW.addObject("message", "로그인에 실패하였습니다. 이메일과 패스워드를 다시 확인해주세요.");
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return VIEW;
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView dashboard(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/dashboard");
        return VIEW;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUserFarms(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/farm/user-farm-manage");
        return VIEW;
    }

    @RequestMapping(value = "/user/detail/{user_no}", method = RequestMethod.GET)
    public ModelAndView getUserDetail(HttpServletRequest request, @PathVariable("user_no") Integer user_no) {
        VIEW = new ModelAndView("admin/farm/user-farm-detail");
        return VIEW;
    }

    @RequestMapping(value = "/boards", method = RequestMethod.GET)
    public ModelAndView getBoards(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/boards");
        ArrayList<Board> boards = adminService.getAllBoards();
        VIEW.addObject("boards", boards);
        for (Board board : boards) {
            //작성자
            Farm farm = farmService.getFarmByFarmNo(board.getFarm_no());
            board.setFarm(farm);
            //좋아요 수
            ArrayList<BoardTransaction> boardTransactions = likeService.getLikesByBoardNo(board.getNo());
            board.setLikes(boardTransactions.size());
            //댓글 수
            ArrayList<BoardComment> comments = commentService.getBoardComments(board.getNo());
            int comment_count = 0;
            for (BoardComment comment : comments) {
                comment_count++;
                ArrayList<BoardComment> recomments = commentService.getBoardRecommentByCommentNo(comment.getNo());
                for (BoardComment recomment : recomments) {
                    comment_count++;
                }
            }
            board.setComments(comment_count);
        }
        return VIEW;
    }

    @RequestMapping(value = "/board/detail/{board_no}", method = RequestMethod.GET)
    public ModelAndView getBoardDetail(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        VIEW = new ModelAndView("admin/community/board-detail");
        Board board = contentService.getBoard(board_no);
        //작성자
        Farm board_farm = farmService.getFarmByFarmNo(board.getFarm_no());
        board.setFarm(board_farm);
        //좋아요 수
        ArrayList<BoardTransaction> boardTransactions = likeService.getLikesByBoardNo(board.getNo());
        board.setLikes(boardTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<BoardComment> comments = commentService.getBoardComments(board_no);
        for (BoardComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<BoardComment> recomments = commentService.getBoardRecommentByCommentNo(comment.getNo());
            for (BoardComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        board.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("board", board);
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{board_no}", method = RequestMethod.GET)
    public ModelAndView getBoardUpdate(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        VIEW = new ModelAndView("admin/community/board-detail-update");
        Board board = contentService.getBoard(board_no);
        //작성자
        Farm board_farm = farmService.getFarmByFarmNo(board.getFarm_no());
        board.setFarm(board_farm);
        //좋아요 수
        ArrayList<BoardTransaction> boardTransactions = likeService.getLikesByBoardNo(board.getNo());
        board.setLikes(boardTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<BoardComment> comments = commentService.getBoardComments(board_no);
        for (BoardComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<BoardComment> recomments = commentService.getBoardRecommentByCommentNo(comment.getNo());
            for (BoardComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        board.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("board", board);

        //카테고리
        CommunityCategory communityCategory = adminService.getCommunityCategory(CATEGORY_TYPE.BOARD);
        VIEW.addObject("communityCategory", communityCategory);
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{no}", method = RequestMethod.POST)
    public ModelAndView postBoardUpdate(HttpServletRequest request, Board board) {
        Board board_dup = contentService.getBoard(board.getNo());
        Farm farm = farmService.getFarmByFarmNo(board_dup.getFarm_no());
        board.setFarm_no(farm.getNo());
        board.setContent(Format.summernoteReplaceCharacter(board.getContent()));
        adminService.updateBoard(board);
        VIEW = getBoardUpdate(request, board.getNo());
        return VIEW;
    }

    @RequestMapping(value = "/questions", method = RequestMethod.GET)
    public ModelAndView getQuestions(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/questions");
        ArrayList<Question> questions = adminService.getAllQuestions();
        VIEW.addObject("questions", questions);
        for (Question question : questions) {
            //작성자
            Farm farm = farmService.getFarmByFarmNo(question.getFarm_no());
            question.setFarm(farm);
            //좋아요 수
            ArrayList<QuestionTransaction> questionTransactions = likeService.getLikesByQuestionNo(question.getNo());
            question.setLikes(questionTransactions.size());
            //댓글 수
            ArrayList<QuestionComment> comments = commentService.getQuestionComments(question.getNo());
            int comment_count = 0;
            for (QuestionComment comment : comments) {
                comment_count++;
                ArrayList<QuestionComment> recomments = commentService.getQuestionRecommentByCommentNo(comment.getNo());
                for (QuestionComment recomment : recomments) {
                    comment_count++;
                }
            }
            question.setComments(comment_count);
        }
        return VIEW;
    }

    @RequestMapping(value = "/question/detail/{question_no}", method = RequestMethod.GET)
    public ModelAndView getQuestionDetail(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        VIEW = new ModelAndView("admin/community/question-detail");
        Question question = contentService.getQuestion(question_no);
        //작성자
        Farm question_farm = farmService.getFarmByFarmNo(question.getFarm_no());
        question.setFarm(question_farm);
        //좋아요 수
        ArrayList<QuestionTransaction> questionTransactions = likeService.getLikesByQuestionNo(question.getNo());
        question.setLikes(questionTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<QuestionComment> comments = commentService.getQuestionComments(question_no);
        for (QuestionComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<QuestionComment> recomments = commentService.getQuestionRecommentByCommentNo(comment.getNo());
            for (QuestionComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        question.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("question", question);
        return VIEW;
    }

    @RequestMapping(value = "/question/update/{question_no}", method = RequestMethod.GET)
    public ModelAndView getQuestionUpdate(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        VIEW = new ModelAndView("admin/community/question-detail-update");
        Question question = contentService.getQuestion(question_no);
        //작성자
        Farm question_farm = farmService.getFarmByFarmNo(question.getFarm_no());
        question.setFarm(question_farm);
        //좋아요 수
        ArrayList<QuestionTransaction> questionTransactions = likeService.getLikesByQuestionNo(question.getNo());
        question.setLikes(questionTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<QuestionComment> comments = commentService.getQuestionComments(question_no);
        for (QuestionComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<QuestionComment> recomments = commentService.getQuestionRecommentByCommentNo(comment.getNo());
            for (QuestionComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        question.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("question", question);
        //카테고리
        CommunityCategory communityCategory = adminService.getCommunityCategory(CATEGORY_TYPE.QUESTION);
        VIEW.addObject("communityCategory", communityCategory);
        return VIEW;
    }

    @RequestMapping(value = "/question/update/{no}", method = RequestMethod.POST)
    public ModelAndView postQuestionUpdate(HttpServletRequest request, Question question) {
        Question question_dup = contentService.getQuestion(question.getNo());
        Farm farm = farmService.getFarmByFarmNo(question_dup.getFarm_no());
        question.setFarm_no(farm.getNo());
        question.setContent(Format.summernoteReplaceCharacter(question.getContent()));
        adminService.updateQuestion(question);
        VIEW = getQuestionUpdate(request, question.getNo());
        return VIEW;
    }

    @RequestMapping(value = "/tips", method = RequestMethod.GET)
    public ModelAndView getTips(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/tips");
        ArrayList<Tips> tips = adminService.getAllTips();
        VIEW.addObject("tips", tips);
        for (Tips tip : tips) {
            //작성자
            Farm farm = farmService.getFarmByFarmNo(tip.getFarm_no());
            tip.setFarm(farm);
            //좋아요 수
            ArrayList<TipsTransaction> tipsTransactions = likeService.getLikesByTipsNo(tip.getNo());
            tip.setLikes(tipsTransactions.size());
            //댓글 수
            ArrayList<TipsComment> comments = commentService.getTipsComments(tip.getNo());
            int comment_count = 0;
            for (TipsComment comment : comments) {
                comment_count++;
                ArrayList<TipsComment> recomments = commentService.getTipsRecommentByCommentNo(comment.getNo());
                for (TipsComment recomment : recomments) {
                    comment_count++;
                }
            }
            tip.setComments(comment_count);
        }
        return VIEW;
    }

    @RequestMapping(value = "/tip/detail/{tip_no}", method = RequestMethod.GET)
    public ModelAndView getTipDetail(HttpServletRequest request, @PathVariable("tip_no") int tip_no) {
        VIEW = new ModelAndView("admin/community/tip-detail");
        Tips tip = contentService.getTip(tip_no);
        //작성자
        Farm board_farm = farmService.getFarmByFarmNo(tip.getFarm_no());
        tip.setFarm(board_farm);
        //좋아요 수
        ArrayList<TipsTransaction> tipsTransactions = likeService.getLikesByTipsNo(tip.getNo());
        tip.setLikes(tipsTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<TipsComment> comments = commentService.getTipsComments(tip_no);
        for (TipsComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<TipsComment> recomments = commentService.getTipsRecommentByCommentNo(comment.getNo());
            for (TipsComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        tip.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("tip", tip);
        return VIEW;
    }

    @RequestMapping(value = "/tip/update/{tip_no}", method = RequestMethod.GET)
    public ModelAndView getTipUpdate(HttpServletRequest request, @PathVariable("tip_no") int tip_no) {
        VIEW = new ModelAndView("admin/community/tip-detail-update");
        Tips tip = contentService.getTip(tip_no);
        //작성자
        Farm tip_farm = farmService.getFarmByFarmNo(tip.getFarm_no());
        tip.setFarm(tip_farm);
        //좋아요 수
        ArrayList<TipsTransaction> tipsTransactions = likeService.getLikesByTipsNo(tip.getNo());
        tip.setLikes(tipsTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<TipsComment> comments = commentService.getTipsComments(tip_no);
        for (TipsComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<TipsComment> recomments = commentService.getTipsRecommentByCommentNo(comment.getNo());
            for (TipsComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        tip.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("tip", tip);

        //카테고리
        CommunityCategory communityCategory = adminService.getCommunityCategory(CATEGORY_TYPE.TIP);
        VIEW.addObject("communityCategory", communityCategory);
        return VIEW;
    }

    @RequestMapping(value = "/tip/update/{no}", method = RequestMethod.POST)
    public ModelAndView postTipUpdate(HttpServletRequest request, Tips tip, MultipartFile file) {
        Tips tip_dup = contentService.getTip(tip.getNo());
        log.info(tip.toString());
        Farm farm = farmService.getFarmByFarmNo(tip_dup.getFarm_no());
        tip.setFarm_no(farm.getNo());
        tip.setContent(Format.summernoteReplaceCharacter(tip.getContent()));
        MFile mFile = null;
        if (file != null && file.getSize() != 0) {
            mFile = fileUploadUtility.uploadFile(file, CDNUploadPath.COMMUNITY.getPath());
        } else {
            try {
                mFile = new Gson().fromJson(tip.getOrigin_thumbnail(), MFile.class);
            } catch (Exception e) {
                mFile = null;
            }
        }
        log.info("mfile -> {}", mFile.toString());
        tip.setThumbnail(mFile);

        adminService.updateTip(tip);
        VIEW = getTipUpdate(request, tip.getNo());
        return VIEW;
    }

    @RequestMapping(value = "/manuals", method = RequestMethod.GET)
    public ModelAndView getManuals(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/manuals");
        ArrayList<Manual> manuals = adminService.getAllManuals();
        VIEW.addObject("manuals", manuals);
        for (Manual manual : manuals) {
            //작성자
            Farm farm = farmService.getFarmByFarmNo(manual.getFarm_no());
            manual.setFarm(farm);
            //좋아요 수
            ArrayList<ManualTransaction> manualTransactions = likeService.getLikesByManualNo(manual.getNo());
            manual.setLikes(manualTransactions.size());
            //댓글 수
            ArrayList<ManualComment> comments = commentService.getManualComments(manual.getNo());
            int comment_count = 0;
            for (ManualComment comment : comments) {
                comment_count++;
                ArrayList<ManualComment> recomments = commentService.getManualRecommentByCommentNo(comment.getNo());
                for (ManualComment recomment : recomments) {
                    comment_count++;
                }
            }
            manual.setComments(comment_count);
        }
        return VIEW;
    }

    @RequestMapping(value = "/manual/detail/{manual_no}", method = RequestMethod.GET)
    public ModelAndView getManualDetail(HttpServletRequest request, @PathVariable("manual_no") int manual_no) {
        VIEW = new ModelAndView("admin/community/manual-detail");
        Manual manual = contentService.getManual(manual_no);
        //작성자
        Farm manual_farm = farmService.getFarmByFarmNo(manual.getFarm_no());
        manual.setFarm(manual_farm);
        //좋아요 수
        ArrayList<ManualTransaction> manualTransactions = likeService.getLikesByManualNo(manual.getNo());
        manual.setLikes(manualTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<ManualComment> comments = commentService.getManualComments(manual_no);
        for (ManualComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<ManualComment> recomments = commentService.getManualRecommentByCommentNo(comment.getNo());
            for (ManualComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        manual.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("manual", manual);
        return VIEW;
    }

    @RequestMapping(value = "/manual/update/{manual_no}", method = RequestMethod.GET)
    public ModelAndView getManualUpdate(HttpServletRequest request, @PathVariable("manual_no") int manual_no) {
        VIEW = new ModelAndView("admin/community/manual-detail-update");
        Manual manual = contentService.getManual(manual_no);
        //작성자
        Farm manual_farm = farmService.getFarmByFarmNo(manual.getFarm_no());
        manual.setFarm(manual_farm);
        //좋아요 수
        ArrayList<ManualTransaction> manualTransactions = likeService.getLikesByManualNo(manual.getNo());
        manual.setLikes(manualTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<ManualComment> comments = commentService.getManualComments(manual_no);
        for (ManualComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<ManualComment> recomments = commentService.getManualRecommentByCommentNo(comment.getNo());
            for (ManualComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        manual.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("manual", manual);

        //카테고리
        CommunityCategory communityCategory = adminService.getCommunityCategory(CATEGORY_TYPE.MANUAL);
        VIEW.addObject("communityCategory", communityCategory);
        return VIEW;
    }

    @RequestMapping(value = "/manual/update/{no}", method = RequestMethod.POST)
    public ModelAndView postManualUpdate(HttpServletRequest request, Manual manual, MultipartFile file) {
        Manual manual_dup = contentService.getManual(manual.getNo());
        Farm farm = farmService.getFarmByFarmNo(manual_dup.getFarm_no());
        manual.setFarm_no(farm.getNo());
        manual.setContent(Format.summernoteReplaceCharacter(manual.getContent()));
        MFile mFile = null;
        if (file != null && file.getSize() != 0) {
            mFile = fileUploadUtility.uploadFile(file, CDNUploadPath.COMMUNITY.getPath());
        } else {
            try {
                mFile = new Gson().fromJson(manual.getOrigin_thumbnail(), MFile.class);
            } catch (Exception e) {
                mFile = null;
            }
        }
        manual.setThumbnail(mFile);
        adminService.updateManual(manual);
        VIEW = getManualUpdate(request, manual.getNo());
        return VIEW;
    }

    @RequestMapping(value = "/magazines", method = RequestMethod.GET)
    public ModelAndView getMagazines(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/magazines");
        ArrayList<Magazine> magazines = adminService.getAllMagazines();
        VIEW.addObject("magazines", magazines);
        for (Magazine magazine : magazines) {
            //작성자
            Farm farm = farmService.getFarmByUserNo(0);
            magazine.setFarm(farm);
            //좋아요 수
            ArrayList<MagazineTransaction> magazineTransactions = likeService.getLikesByMagazineNo(magazine.getNo());
            magazine.setLikes(magazineTransactions.size());
            //댓글 수
            ArrayList<MagazineComment> comments = commentService.getMagazineComments(magazine.getNo());
            int comment_count = 0;
            for (MagazineComment comment : comments) {
                comment_count++;
                ArrayList<MagazineComment> recomments = commentService.getMagazineRecommentByCommentNo(comment.getNo());
                for (MagazineComment recomment : recomments) {
                    comment_count++;
                }
            }
            magazine.setComments(comment_count);
        }
        return VIEW;
    }

    @RequestMapping(value = "/magazine/detail/{magazine_no}", method = RequestMethod.GET)
    public ModelAndView getMagazineDetail(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        VIEW = new ModelAndView("admin/community/magazine-detail");
        Magazine magazine = contentService.getMagazineExcludeShow(magazine_no);
        //작성자
        Farm magazine_farm = farmService.getFarmByUserNo(0);
        magazine.setFarm(magazine_farm);
        //좋아요 수
        ArrayList<MagazineTransaction> magazineTransactions = likeService.getLikesByMagazineNo(magazine.getNo());
        magazine.setLikes(magazineTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<MagazineComment> comments = commentService.getMagazineComments(magazine_no);
        for (MagazineComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<MagazineComment> recomments = commentService.getMagazineRecommentByCommentNo(comment.getNo());
            for (MagazineComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        magazine.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("magazine", magazine);
        return VIEW;
    }

    @RequestMapping(value = "/magazine/update/{magazine_no}", method = RequestMethod.GET)
    public ModelAndView getMagazineUpdate(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        VIEW = new ModelAndView("admin/community/magazine-detail-update");
        Magazine magazine = contentService.getMagazineExcludeShow(magazine_no);
        //작성자
        Farm magazine_farm = farmService.getFarmByUserNo(0);
        magazine.setFarm(magazine_farm);
        //좋아요 수
        ArrayList<MagazineTransaction> magazineTransactions = likeService.getLikesByMagazineNo(magazine.getNo());
        magazine.setLikes(magazineTransactions.size());

        //Get Comment Logic
        int comment_count = 0;
        ArrayList<MagazineComment> comments = commentService.getMagazineComments(magazine_no);
        for (MagazineComment comment : comments) {
            comment_count++;
            User commented_user = null;
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    comment.setUser(commented_user);
                } else {
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

            ArrayList<MagazineComment> recomments = commentService.getMagazineRecommentByCommentNo(comment.getNo());
            for (MagazineComment recomment : recomments) {
                comment_count++;
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
            }
            comment.setComments(recomments);
        }
        //댓글 수
        magazine.setComments(comment_count);
        //댓글
        VIEW.addObject("comments", comments);
        VIEW.addObject("magazine", magazine);
        //카테고리
        CommunityCategory communityCategory = adminService.getCommunityCategory(CATEGORY_TYPE.MAGAZINE);
        VIEW.addObject("communityCategory", communityCategory);
        return VIEW;
    }

    @RequestMapping(value = "/magazine/update/{no}", method = RequestMethod.POST)
    public ModelAndView postMagazineUpdate(HttpServletRequest request, Magazine magazine, MultipartFile file) {
        Farm farm = farmService.getFarmByUserNo(0);
        magazine.setFarm_no(farm.getNo());
        magazine.setContent(Format.summernoteReplaceCharacter(magazine.getContent()));
        MFile mFile = null;
        if (file != null && file.getSize() != 0) {
            mFile = fileUploadUtility.uploadFile(file, CDNUploadPath.COMMUNITY.getPath());
        } else {
            try {
                mFile = new Gson().fromJson(magazine.getOrigin_thumbnail(), MFile.class);
            } catch (Exception e) {
                mFile = null;
            }
        }
        magazine.setThumbnail(mFile);
        adminService.updateMagazine(magazine);
        VIEW = getMagazineUpdate(request, magazine.getNo());
        return VIEW;
    }

    @RequestMapping(value = "/magazine/create", method = RequestMethod.GET)
    public ModelAndView getMagazineCreate(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/magazine-detail-create");
        Farm farm = farmService.getFarmByUserNo(0);
        VIEW.addObject("farm", farm);
        //카테고리
        CommunityCategory communityCategory = adminService.getCommunityCategory(CATEGORY_TYPE.MAGAZINE);
        VIEW.addObject("communityCategory", communityCategory);
        return VIEW;
    }

    @RequestMapping(value = "/magazine/create", method = RequestMethod.POST)
    public ModelAndView postMagazineCreate(HttpServletRequest request, Magazine magazine, MultipartFile file) {
        VIEW = new ModelAndView("admin/community/magazine-detail-create");
        Farm farm = farmService.getFarmByUserNo(0);
        magazine.setFarm_no(farm.getNo());
        magazine.setContent(Format.summernoteReplaceCharacter(magazine.getContent()));
        MFile mFile = null;
        if (file != null && file.getSize() != 0) {
            mFile = fileUploadUtility.uploadFile(file, CDNUploadPath.COMMUNITY.getPath());
        } else {
            try {
                mFile = new Gson().fromJson(magazine.getOrigin_thumbnail(), MFile.class);
            } catch (Exception e) {
                mFile = null;
            }
        }
        magazine.setThumbnail(mFile);
        int created_magazine_no = adminService.createMagazine(magazine);
        VIEW.addObject("status", true);
        VIEW.addObject("created_magazine_no", created_magazine_no);
        return VIEW;
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public ModelAndView getCategories(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/category/categories");
        ArrayList<CommunityCategory> communityCategories = (ArrayList<CommunityCategory>) adminService.getAllCategories();
        VIEW.addObject("communityCategories", communityCategories);
        return VIEW;
    }

    @RequestMapping(value = "/trace/traces", method = RequestMethod.GET)
    public ModelAndView getTraces(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/trace/traces");
        return VIEW;
    }

    @RequestMapping(value = "/trace/detail/trace/{trace_no}", method = RequestMethod.GET)
    public ModelAndView getTraceDetail(HttpServletRequest request, @PathVariable("trace_no") int trace_no) {
        VIEW = new ModelAndView("admin/trace/trace-detail");
        return VIEW;
    }

    @RequestMapping(value = "/trace/update/{trace_no}", method = RequestMethod.GET)
    public ModelAndView getTraceUpdate(HttpServletRequest request, @PathVariable("trace_no") int trace_no) {
        VIEW = new ModelAndView("admin/trace/trace-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/trace/update/{trace_no}", method = RequestMethod.POST)
    public ModelAndView postTraceUpdate(HttpServletRequest request, @PathVariable("trace_no") int trace_no) {
        VIEW = new ModelAndView("admin/trace/trace-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/trace/bundles", method = RequestMethod.GET)
    public ModelAndView getBundles(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/trace/trace-bundles");
        return VIEW;
    }

    @RequestMapping(value = "/trace/detail/bundle/{bundle_no}", method = RequestMethod.GET)
    public ModelAndView getBundleDetail(HttpServletRequest request, @PathVariable("bundle_no") int bundle_no) {
        VIEW = new ModelAndView("admin/trace/trace-bundle-detail");
        return VIEW;
    }

    @RequestMapping(value = "/banners", method = RequestMethod.GET)
    public ModelAndView getBanners(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/banner/banner-manage");
        ArrayList<Banner> banners = (ArrayList<Banner>) adminService.getBanners();
        VIEW.addObject("banners", banners);
        return VIEW;
    }

    @RequestMapping(value = "/banners/banner/update/{no}", method = RequestMethod.POST)
    public ModelAndView updateBanner(HttpServletRequest request, Banner banner, MultipartFile file) {
        if (file != null && file.getSize() != 0) {
            log.info("file -> {}", file.getOriginalFilename());
            log.info("file -> {}", file.getSize());
            log.info("file -> {}", file.getName());
            log.info("file -> {}", file.getContentType());
            MFile banner_image = fileUploadUtility.uploadFile(file, CDNUploadPath.BANNER.getPath());
            banner.setBanner_image(banner_image);
        } else {
            banner.setBanner_image(new Gson().fromJson(banner.getOrigin_banner_image(), MFile.class));
        }
        log.info(banner.toString());
        adminService.updateBanner(banner);
        request.setAttribute("status", true);
        request.setAttribute("message", "해당 배너를 업데이트 하였습니다.");
        return getBanners(request);
    }

    @RequestMapping(value = "/banners/banner/create", method = RequestMethod.POST)
    public ModelAndView createBanner(HttpServletRequest request, Banner banner, MultipartFile file) {
        if (file != null && file.getSize() != 0) {
            log.info("file -> {}", file.getOriginalFilename());
            log.info("file -> {}", file.getSize());
            log.info("file -> {}", file.getName());
            log.info("file -> {}", file.getContentType());
            MFile banner_image = fileUploadUtility.uploadFile(file, CDNUploadPath.BANNER.getPath());
            banner.setBanner_image(banner_image);
            adminService.insertBanner(banner);
            request.setAttribute("status", true);
            request.setAttribute("message", "배너를 생성 하였습니다.");
        } else {
            request.setAttribute("status", false);
            request.setAttribute("message", "배너를 생성할 수 없습니다.");
        }
        log.info(banner.toString());
        return getBanners(request);
    }

    @RequestMapping(value = "/search/keywords", method = RequestMethod.GET)
    public ModelAndView getSearchKeywords(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/search/search");
        ArrayList<SearchKeyword> searchKeywords = (ArrayList<SearchKeyword>) adminService.getAllKeywords();
        VIEW.addObject("recommend", searchKeywords.get(0));
        VIEW.addObject("search", searchKeywords.get(1));
        return VIEW;
    }
}

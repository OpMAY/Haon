package com.controller;

import com.aws.file.FileUploadUtility;
import com.aws.model.CDNUploadPath;
import com.dao.CommunityCategoryDao;
import com.google.gson.Gson;
import com.model.User;
import com.model.common.MFile;
import com.model.content.board.Board;
import com.model.content.board.BoardComment;
import com.model.content.common.*;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.tips.Tips;
import com.model.farm.Farm;
import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    @Value("${DEFAULT.PROFILE.IMAGE.URL}")
    private String SAMPLE_PROFILE_URL;
    @Value("${DEFAULT.PROFILE.IMAGE.NAME}")
    private String SAMPLE_PROFILE_NAME;
    @Value("${DEFAULT.PROFILE.IMAGE.SIZE}")
    private long SAMPLE_PROFILE_SIZE;
    @Value("${DEFAULT.PROFILE.IMAGE.TYPE}")
    private String SAMPLE_PROFILE_TYPE;
    private final ContentService contentService;
    private final FileUploadUtility fileUploadUtility;
    private final EncryptionService encryptionService;
    private final UserService userService;
    private final FarmService farmService;
    private final ReadService readService;
    private final CommentService commentService;
    private final GlobalService globalService;
    private final LikeService likeService;

    private final TraceService traceService;
    private final AdminService adminService;

    @RequestMapping(value = "/alarm", method = RequestMethod.GET)
    public ModelAndView getAlarm() {
        ModelAndView VIEW = new ModelAndView("user/alarm");
        return VIEW;
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.GET)
    public ModelAndView getBoardWrite() {
        ModelAndView VIEW = new ModelAndView("user/board-write");
        VIEW.addObject("categories", adminService.getAllCategories());
        return VIEW;
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.POST)
    public ModelAndView postBoardWrite(HttpServletRequest request, ContentForm contentForm) {
        ModelAndView VIEW = new ModelAndView("user/board-write");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        contentForm.setFarm_no(farm.getNo());
        contentForm.setContent(Format.summernoteReplaceCharacter(contentForm.getContent()));
        switch (contentForm.getCommunity_type()) {
            case BOARD:
            case QUESTION:
                contentService.insertCommunity(contentForm);
                VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                VIEW.addObject("status", true);
                break;
            case TIP:
            case MANUAL:
            case MAGAZINE:
                if (contentForm.getFile() != null && contentForm.getFile().getSize() != 0) {
                    MFile thumbnail = fileUploadUtility.uploadFile(contentForm.getFile(), CDNUploadPath.COMMUNITY.getPath() + "/" + contentForm.getCommunity_type().name() + "/" + farm.getNo());
                    contentService.insertCommunityThumbnail(contentForm, thumbnail);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                } else {
                    contentService.insertCommunityThumbnail(contentForm, null);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                }
                break;
            default:
                VIEW.addObject("message", "게시판 타입을 올바르게 설정해주세요.");
                VIEW.addObject("status", false);
        }
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{type}/{no}", method = RequestMethod.GET)
    public ModelAndView getBoardUpdate(@PathVariable COMMENT_TYPE type, @PathVariable int no) {
        ModelAndView VIEW = new ModelAndView("user/board-update");
        /*TODO This Board Detail Update*/
        ContentForm contentForm = null;
        switch (type) {
            case BOARD:
                contentForm = contentService.getContentFormByBoardNo(no);
                VIEW.addObject("category", adminService.getCommunityCategory(CATEGORY_TYPE.BOARD));
                break;
            case QUESTION:
                contentForm = contentService.getContentFormByQuestionNo(no);
                VIEW.addObject("category", adminService.getCommunityCategory(CATEGORY_TYPE.QUESTION));
                break;
            case MAGAZINE:
                contentForm = contentService.getContentFormByMagazineNo(no);
                VIEW.addObject("category", adminService.getCommunityCategory(CATEGORY_TYPE.MAGAZINE));
                break;
            case MANUAL:
                contentForm = contentService.getContentFormByManualNo(no);
                VIEW.addObject("category", adminService.getCommunityCategory(CATEGORY_TYPE.MANUAL));
                break;
            case TIP:
                contentForm = contentService.getContentFormByTipNo(no);
                VIEW.addObject("category", adminService.getCommunityCategory(CATEGORY_TYPE.TIP));
                break;
        }
        contentForm.setCommunity_type(type);
        VIEW.addObject("contentForm", contentForm);
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{no}", method = RequestMethod.POST)
    public ModelAndView postBoardUpdate(HttpServletRequest request, ContentForm contentForm) {
        ModelAndView VIEW = new ModelAndView("/user/board-update");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        contentForm.setFarm_no(farm.getNo());
        contentForm.setContent(Format.summernoteReplaceCharacter(contentForm.getContent()));
        MFile thumbnail = null;
        switch (contentForm.getCommunity_type()) {
            case BOARD:
            case QUESTION:
                contentService.updateCommunity(contentForm);
                VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                VIEW.addObject("status", true);
                break;
            case TIP:
            case MANUAL:
            case MAGAZINE:
                if (contentForm.getFile() != null && contentForm.getFile().getSize() != 0) {
                    thumbnail = fileUploadUtility.uploadFile(contentForm.getFile(), CDNUploadPath.COMMUNITY.getPath() + "/" + contentForm.getCommunity_type().name() + "/" + farm.getNo());
                    contentService.updateCommunityThumbnail(contentForm, thumbnail);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                } else {
                    try {
                        thumbnail = new Gson().fromJson(contentForm.getOrigin_thumbnail(), MFile.class);
                    } catch (Exception e) {
                        thumbnail = null;
                    }
                    contentService.updateCommunityThumbnail(contentForm, thumbnail);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                }
                break;
            default:
                VIEW.addObject("message", "게시판 타입을 올바르게 설정해주세요.");
                VIEW.addObject("status", false);
        }
        VIEW.addObject("contentForm", contentForm);
        return VIEW;
    }

    @RequestMapping(value = "/bookmark", method = RequestMethod.GET)
    public ModelAndView getBookmark(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("user/bookmark");

        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());

        ArrayList<Board> boards = contentService.getBookmarkBoards(user_no);
        ArrayList<Tips> tips = contentService.getBookmarkTips(user_no);
        for (Tips tip : tips) {
            tip.setProfile_image(farmService.getFarmByFarmNo(tip.getFarm_no()).getProfile_image());
        }
        ArrayList<Manual> manuals = contentService.getBookmarkManuals(user_no);
        for (Manual manual : manuals) {
            manual.setProfile_image(farmService.getFarmByFarmNo(manual.getFarm_no()).getProfile_image());
        }
        ArrayList<Question> questions = contentService.getBookmarkQuestions(user_no);
        ArrayList<Magazine> magazines = contentService.getBookmarkMagazines(user_no);
        for (Magazine magazine : magazines) {
            magazine.setProfile_image(farmService.getFarmByFarmNo(magazine.getFarm_no()).getProfile_image());
        }

        VIEW.addObject("boards", boards);
        VIEW.addObject("tips", tips);
        VIEW.addObject("manuals", manuals);
        VIEW.addObject("questions", questions);
        VIEW.addObject("magazines", magazines);
        return VIEW;
    }

    @RequestMapping(value = "/farm/manage", method = RequestMethod.GET)
    public ModelAndView getFarmDetailManage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("user/farm-manage");
        return VIEW;
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView getUserHome(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("user/home");
        /*
         * 내가 작성한 게시글
         * 자유게시판
         * 팁과 노하우
         * 축산 메뉴얼
         * 질문과 답변
         * 최신 매거진(필요 없음)
         * */
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);

        ArrayList<Board> boards = contentService.getBoards(farm.getNo());
        for (Board board : boards) {
            board.set_new_comment(readService.ownerCheck(COMMENT_TYPE.BOARD, board.getNo()));
        }

        ArrayList<Tips> tips = contentService.getTips(farm.getNo());
        for (Tips tip : tips) {
            tip.set_new_comment(readService.ownerCheck(COMMENT_TYPE.BOARD, tip.getNo()));
        }

        ArrayList<Manual> manuals = contentService.getManuals(farm.getNo());
        for (Manual manual : manuals) {
            manual.set_new_comment(readService.ownerCheck(COMMENT_TYPE.BOARD, manual.getNo()));
        }

        ArrayList<Question> questions = contentService.getQuestions(farm.getNo());
        for (Question question : questions) {
            question.set_new_comment(readService.ownerCheck(COMMENT_TYPE.BOARD, question.getNo()));
        }
        /*
         * 내가 작성한 댓글
         * */
        ArrayList<Comment> commentsMadeMe = commentService.getCommentsMadeMe(user_no);
        log.info(commentsMadeMe.toString());
        ContentForm contentForm = null;
        for (Comment comment : commentsMadeMe) {
            Comment originComment = comment;
            switch (comment.getType()) {
                case BOARD:
                    contentForm = contentService.getContentFormByBoardNo(comment.getCommunity_no());
                    contentForm.setContent(null);
                    comment.setContentForm(contentForm);
                    break;
                case QUESTION:
                    contentForm = contentService.getContentFormByQuestionNo(comment.getCommunity_no());
                    contentForm.setContent(null);
                    comment.setContentForm(contentForm);
                    break;
                case MANUAL:
                    contentForm = contentService.getContentFormByManualNo(comment.getCommunity_no());
                    contentForm.setContent(null);
                    comment.setContentForm(contentForm);
                    break;
                case TIP:
                    contentForm = contentService.getContentFormByTipNo(comment.getCommunity_no());
                    contentForm.setContent(null);
                    comment.setContentForm(contentForm);
                    break;
                case MAGAZINE:
                    contentForm = contentService.getContentFormByMagazineNo(comment.getCommunity_no());
                    contentForm.setContent(null);
                    comment.setContentForm(contentForm);
                    break;
                case FARM:
                    comment.setFarm(farmService.getFarmByUserNo(user_no));
                    break;
            }
            if (comment.getRecomment() != 0) {
                log.info("comment : {}", comment);
                Comment mainComment = null;
                switch (comment.getType()) {
                    case BOARD:
                        mainComment = commentService.getBoardCommentByNo(comment.getRecomment());
                        break;
                    case QUESTION:
                        mainComment = commentService.getQuestionCommentByNo(comment.getRecomment());
                        break;
                    case MANUAL:
                        mainComment = commentService.getManualCommentByNo(comment.getRecomment());
                        break;
                    case TIP:
                        mainComment = commentService.getTipsCommentByNo(comment.getRecomment());
                        break;
                    case MAGAZINE:
                        mainComment = commentService.getMagazineCommentByNo(comment.getRecomment());
                        break;
                    case FARM:
                        mainComment = commentService.getFarmCommentByNo(comment.getRecomment());
                        break;
                }
                if (mainComment != null && !mainComment.is_blocked()) {
                    ArrayList<Comment> myComment = new ArrayList<>();
                    myComment.add(comment);
                    mainComment.setRecomments(myComment);
                    mainComment.setContentForm(comment.getContentForm());
                    mainComment.setType(comment.getType());
                    comment = mainComment;
                    commentsMadeMe.set(commentsMadeMe.indexOf(originComment), comment);
                }
            }
        }
        /*
         * 나에게 온 댓글
         * */
        ArrayList<Comment> comments = commentService.getCommentsByMe(farm.getNo());
        User commented_user = null;
        ArrayList<Comment> recomments = null;
        for (Comment comment : comments) {
            if (comment.getUser_no() != null) {
                commented_user = userService.getUserByNo(comment.getUser_no());
            }
            User recommented_user = null;
            setComment(comment, commented_user);
            switch (comment.getType()) {
                case BOARD:
                    comment.setLike_count(likeService.getLikesByComment(comment));
                    comment.setDislike_count(likeService.getDislikesByComment(comment));
                    comment.set_like(likeService.isCommentBoardLikeByUserNo(comment.getNo(), user_no));
                    comment.set_dislike(likeService.isCommentBoardDislikeByUserNo(comment.getNo(), user_no));
                    recomments = commentService.getRecommentByCommentNo(comment);
                    for (Comment recomment : recomments) {
                        if (recomment.getUser_no() != null) {
                            recommented_user = userService.getUserByNo(recomment.getUser_no());
                        }
                        setComment(recomment, recommented_user);
                        if (user_no != null && recommented_user != null && (user_no.intValue() == recommented_user.getNo())) {
                            recomment.setOwner_checked(true);
                        } else {
                            recomment.setOwner_checked(false);
                        }
                    }
                    comment.setRecomments(recomments);
                    if (user_no != null && commented_user != null && user_no.intValue() == commented_user.getNo()) {
                        comment.setOwner_checked(true);
                    } else {
                        comment.setOwner_checked(false);
                    }
                    comment.set_best(commentService.isBestComment(comment));
                    break;
                case QUESTION:
                    comment.setLike_count(likeService.getLikesByComment(comment));
                    comment.setDislike_count(likeService.getDislikesByComment(comment));
                    comment.set_like(likeService.isCommentQuestionLikeByUserNo(comment.getNo(), user_no));
                    comment.set_dislike(likeService.isCommentQuestionDislikeByUserNo(comment.getNo(), user_no));
                    recomments = commentService.getRecommentByCommentNo(comment);
                    for (Comment recomment : recomments) {
                        if (recomment.getUser_no() != null) {
                            recommented_user = userService.getUserByNo(recomment.getUser_no());
                        }
                        setComment(recomment, recommented_user);
                        if (user_no != null && recommented_user != null && (user_no.intValue() == recommented_user.getNo())) {
                            recomment.setOwner_checked(true);
                        } else {
                            recomment.setOwner_checked(false);
                        }
                    }
                    comment.setRecomments(recomments);
                    if (user_no != null && commented_user != null && user_no.intValue() == commented_user.getNo()) {
                        comment.setOwner_checked(true);
                    } else {
                        comment.setOwner_checked(false);
                    }
                    comment.set_best(commentService.isBestComment(comment));
                    break;
                case TIP:
                    comment.setLike_count(likeService.getLikesByComment(comment));
                    comment.setDislike_count(likeService.getDislikesByComment(comment));
                    comment.set_like(likeService.isCommentTipsLikeByUserNo(comment.getNo(), user_no));
                    comment.set_dislike(likeService.isCommentTipsDislikeByUserNo(comment.getNo(), user_no));
                    recomments = commentService.getRecommentByCommentNo(comment);
                    for (Comment recomment : recomments) {
                        if (recomment.getUser_no() != null) {
                            recommented_user = userService.getUserByNo(recomment.getUser_no());
                        }
                        setComment(recomment, recommented_user);
                        if (user_no != null && recommented_user != null && (user_no.intValue() == recommented_user.getNo())) {
                            recomment.setOwner_checked(true);
                        } else {
                            recomment.setOwner_checked(false);
                        }
                    }
                    comment.setRecomments(recomments);
                    if (user_no != null && commented_user != null && user_no.intValue() == commented_user.getNo()) {
                        comment.setOwner_checked(true);
                    } else {
                        comment.setOwner_checked(false);
                    }
                    comment.set_best(commentService.isBestComment(comment));
                    break;
                case MANUAL:
                    comment.setLike_count(likeService.getLikesByComment(comment));
                    comment.setDislike_count(likeService.getDislikesByComment(comment));
                    comment.set_like(likeService.isCommentManualLikeByUserNo(comment.getNo(), user_no));
                    comment.set_dislike(likeService.isCommentManualDislikeByUserNo(comment.getNo(), user_no));
                    recomments = commentService.getRecommentByCommentNo(comment);
                    for (Comment recomment : recomments) {
                        if (recomment.getUser_no() != null) {
                            recommented_user = userService.getUserByNo(recomment.getUser_no());
                        }
                        setComment(recomment, recommented_user);
                        if (user_no != null && recommented_user != null && (user_no.intValue() == recommented_user.getNo())) {
                            recomment.setOwner_checked(true);
                        } else {
                            recomment.setOwner_checked(false);
                        }
                    }
                    comment.setRecomments(recomments);
                    if (user_no != null && commented_user != null && user_no.intValue() == commented_user.getNo()) {
                        comment.setOwner_checked(true);
                    } else {
                        comment.setOwner_checked(false);
                    }
                    comment.set_best(commentService.isBestComment(comment));
                    break;
                case FARM:
                    comment.setLike_count(likeService.getLikesByComment(comment));
                    comment.setDislike_count(likeService.getDislikesByComment(comment));
                    comment.set_like(likeService.isCommentFarmLikeByUserNo(comment.getNo(), user_no));
                    comment.set_dislike(likeService.isCommentFarmDislikeByUserNo(comment.getNo(), user_no));
                    recomments = commentService.getRecommentByCommentNo(comment);
                    for (Comment recomment : recomments) {
                        if (recomment.getUser_no() != null) {
                            recommented_user = userService.getUserByNo(recomment.getUser_no());
                        }
                        setComment(recomment, recommented_user);
                        if (user_no != null && recommented_user != null && (user_no.intValue() == recommented_user.getNo())) {
                            recomment.setOwner_checked(true);
                        } else {
                            recomment.setOwner_checked(false);
                        }
                    }
                    comment.setRecomments(recomments);
                    if (user_no != null && commented_user != null && user_no.intValue() == commented_user.getNo()) {
                        comment.setOwner_checked(true);
                    } else {
                        comment.setOwner_checked(false);
                    }
                    comment.set_best(commentService.isBestComment(comment));
                    break;
            }
        }
        VIEW.addObject("boards", boards);
        VIEW.addObject("tips", tips);
        VIEW.addObject("manuals", manuals);
        VIEW.addObject("questions", questions);
        VIEW.addObject("commentsMadeMe", commentsMadeMe);
        log.info(comments.toString());
        VIEW.addObject("comments", comments);
        return VIEW;
    }

    @RequestMapping(value = "/trace", method = RequestMethod.GET)
    public ModelAndView userTracePage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("user/trace");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        VIEW.addObject("traces", traceService.getFarmTraces(user_no));
        VIEW.addObject("bundles", traceService.getFarmBundles(user_no));
        VIEW.addObject("farmType", farmService.getFarmByUserNo(user_no).getType());
        return VIEW;
    }

    @RequestMapping(value = "/unregister", method = RequestMethod.GET)
    public ModelAndView userUnregisterPage() {
        ModelAndView VIEW = new ModelAndView("user/unregister");
        return VIEW;
    }

    public void setComment(Comment comment, User user) {
        if (comment.getUser_no() != null) {
            user = userService.getUserByNo(comment.getUser_no());
            if (globalService.checkFarm(user.getNo())) {
                Farm commented_user_farm = farmService.getFarmByUserNo(user.getNo());
                user.setProfile_img(commented_user_farm.getProfile_image());
                user.setName(commented_user_farm.getName());
                comment.setUser(user);
            } else {
                log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);

                user.setProfile_img(profile);
                comment.setUser(user);
            }
        } else {
            user = new User();
            log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
            MFile profile = new MFile();
            profile.setUrl(SAMPLE_PROFILE_URL);
            profile.setName(SAMPLE_PROFILE_NAME);
            profile.setSize(SAMPLE_PROFILE_SIZE);
            profile.setType(SAMPLE_PROFILE_TYPE);
            user.setName("관리자");
            user.setProfile_img(profile);
            comment.setContent("삭제된 메세지입니다.");
            comment.setUser(user);
        }
    }
}

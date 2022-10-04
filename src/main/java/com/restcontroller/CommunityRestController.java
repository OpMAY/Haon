package com.restcontroller;

import com.model.FarmComment;
import com.model.User;
import com.model.common.MFile;
import com.model.content.board.BoardComment;
import com.model.content.common.COMMENT_TYPE;
import com.model.content.magazine.Magazine;
import com.model.content.magazine.MagazineComment;
import com.model.content.manual.Manual;
import com.model.content.manual.ManualComment;
import com.model.content.question.QuestionComment;
import com.model.content.common.ORDER_TYPE;
import com.model.content.tips.Tips;
import com.model.content.tips.TipsComment;
import com.model.farm.Farm;
import com.response.DefaultRes;
import com.response.Message;
import com.service.*;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class CommunityRestController {
    @Value("${DEFAULT.PROFILE.IMAGE.URL}")
    private String SAMPLE_PROFILE_URL;
    @Value("${DEFAULT.PROFILE.IMAGE.NAME}")
    private String SAMPLE_PROFILE_NAME;
    @Value("${DEFAULT.PROFILE.IMAGE.SIZE}")
    private long SAMPLE_PROFILE_SIZE;
    @Value("${DEFAULT.PROFILE.IMAGE.TYPE}")
    private String SAMPLE_PROFILE_TYPE;

    private final CommentService commentService;
    private final EncryptionService encryptionService;
    private final UserService userService;
    private final FarmService farmService;
    private final GlobalService globalService;
    private final ContentService contentService;

    @RequestMapping(value = "/review/create", method = RequestMethod.POST)
    public ResponseEntity<String> insertReview(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        COMMENT_TYPE type = COMMENT_TYPE.valueOf(map.get("type").toString());
        Integer no = Integer.valueOf(map.get("no").toString());
        String content = map.get("content").toString();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        int created_comment_no = 0;
        User commented_user = null;
        switch (type) {
            case BOARD:
                //Create Comment
                BoardComment boardComment = new BoardComment();
                boardComment.setBoard_no(no);
                boardComment.setUser_no(user_no);
                boardComment.setContent(content);
                boardComment.set_blocked(false);
                boardComment.setOwner_checked(false);
                //Comment Insert
                created_comment_no = commentService.insertBoardComment(boardComment);
                //Get Inserted Comment
                boardComment = commentService.getBoardCommentByNo(created_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(boardComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    boardComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    boardComment.setUser(commented_user);
                }

                message.put("comment", boardComment);
                message.put("status", true);
                break;
            case MAGAZINE:
                //Create Comment
                MagazineComment magazineComment = new MagazineComment();
                magazineComment.setMagazine_no(no);
                magazineComment.setUser_no(user_no);
                magazineComment.setContent(content);
                magazineComment.set_blocked(false);
                magazineComment.setOwner_checked(false);
                //Comment Insert
                created_comment_no = commentService.insertMagazineComment(magazineComment);
                //Get Inserted Comment
                magazineComment = commentService.getMagazineCommentByNo(created_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(magazineComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    magazineComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    magazineComment.setUser(commented_user);
                }

                message.put("comment", magazineComment);
                message.put("status", true);
                break;
            case MANUAL:
                //Create Comment
                ManualComment manualComment = new ManualComment();
                manualComment.setManual_no(no);
                manualComment.setUser_no(user_no);
                manualComment.setContent(content);
                manualComment.set_blocked(false);
                manualComment.setOwner_checked(false);
                //Comment Insert
                created_comment_no = commentService.insertManualComment(manualComment);
                //Get Inserted Comment
                manualComment = commentService.getManualCommentByNo(created_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(manualComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    manualComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    manualComment.setUser(commented_user);
                }

                message.put("comment", manualComment);
                message.put("status", true);
                break;
            case QUESTION:
                //Create Comment
                QuestionComment questionComment = new QuestionComment();
                questionComment.setQuestion_no(no);
                questionComment.setUser_no(user_no);
                questionComment.setContent(content);
                questionComment.set_blocked(false);
                questionComment.setOwner_checked(false);
                //Comment Insert
                created_comment_no = commentService.insertQuestionComment(questionComment);
                //Get Inserted Comment
                questionComment = commentService.getQuestionCommentByNo(created_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(questionComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    questionComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    questionComment.setUser(commented_user);
                }

                message.put("comment", questionComment);
                message.put("status", true);
                break;
            case TIP:
                //Create Comment
                TipsComment tipsComment = new TipsComment();
                tipsComment.setTips_no(no);
                tipsComment.setUser_no(user_no);
                tipsComment.setContent(content);
                tipsComment.set_blocked(false);
                tipsComment.setOwner_checked(false);
                //Comment Insert
                created_comment_no = commentService.insertTipsComment(tipsComment);
                //Get Inserted Comment
                tipsComment = commentService.getTipsCommentByNo(created_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(tipsComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    tipsComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    tipsComment.setUser(commented_user);
                }

                message.put("comment", tipsComment);
                message.put("status", true);
                break;
            case FARM:
                //Create Comment
                FarmComment farmComment = new FarmComment();
                farmComment.setFarm_no(no);
                farmComment.setUser_no(user_no);
                farmComment.setContent(content);
                farmComment.set_blocked(false);
                farmComment.setOwner_checked(false);
                //Comment Insert
                created_comment_no = commentService.insertFarmComment(farmComment);
                //Get Inserted Comment
                farmComment = commentService.getFarmCommentByNo(created_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(farmComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    farmComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    farmComment.setUser(commented_user);
                }

                message.put("comment", farmComment);
                message.put("status", true);
                break;
            default:
                message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/review/reply/create", method = RequestMethod.POST)
    public ResponseEntity<String> insertReviewReply(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        COMMENT_TYPE type = COMMENT_TYPE.valueOf(map.get("type").toString());
        Integer no = Integer.valueOf(map.get("no").toString());
        String content = map.get("content").toString();
        Integer comment_no = Integer.valueOf(map.get("comment_no").toString());
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        int created_reply_comment_no = 0;
        User commented_user = null;
        switch (type) {
            case BOARD:
                //Create Comment
                BoardComment boardComment = new BoardComment();
                boardComment.setBoard_no(no);
                boardComment.setUser_no(user_no);
                boardComment.setContent(content);
                boardComment.setRecomment(comment_no);
                boardComment.set_blocked(false);
                boardComment.setOwner_checked(false);
                //Comment Insert
                created_reply_comment_no = commentService.insertBoardCommentReply(boardComment);
                //Get Inserted Comment
                boardComment = commentService.getBoardCommentByNo(created_reply_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(boardComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    boardComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    boardComment.setUser(commented_user);
                }

                message.put("comment", boardComment);
                message.put("status", true);
                break;
            case MAGAZINE:
                //Create Comment
                MagazineComment magazineComment = new MagazineComment();
                magazineComment.setMagazine_no(no);
                magazineComment.setUser_no(user_no);
                magazineComment.setContent(content);
                magazineComment.setRecomment(comment_no);
                magazineComment.set_blocked(false);
                magazineComment.setOwner_checked(false);
                //Comment Insert
                created_reply_comment_no = commentService.insertMagazineCommentReply(magazineComment);
                //Get Inserted Comment
                magazineComment = commentService.getMagazineCommentByNo(created_reply_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(magazineComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    magazineComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    magazineComment.setUser(commented_user);
                }

                message.put("comment", magazineComment);
                message.put("status", true);
                break;
            case MANUAL:
                //Create Comment
                ManualComment manualComment = new ManualComment();
                manualComment.setManual_no(no);
                manualComment.setUser_no(user_no);
                manualComment.setContent(content);
                manualComment.setRecomment(comment_no);
                manualComment.set_blocked(false);
                manualComment.setOwner_checked(false);
                //Comment Insert
                created_reply_comment_no = commentService.insertManualCommentReply(manualComment);
                //Get Inserted Comment
                manualComment = commentService.getManualCommentByNo(created_reply_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(manualComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    manualComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    manualComment.setUser(commented_user);
                }

                message.put("comment", manualComment);
                message.put("status", true);
                break;
            case QUESTION:
                //Create Comment
                QuestionComment questionComment = new QuestionComment();
                questionComment.setQuestion_no(no);
                questionComment.setUser_no(user_no);
                questionComment.setContent(content);
                questionComment.setRecomment(comment_no);
                questionComment.set_blocked(false);
                questionComment.setOwner_checked(false);
                //Comment Insert
                created_reply_comment_no = commentService.insertQuestionCommentReply(questionComment);
                //Get Inserted Comment
                questionComment = commentService.getQuestionCommentByNo(created_reply_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(questionComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    questionComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    questionComment.setUser(commented_user);
                }

                message.put("comment", questionComment);
                message.put("status", true);
                break;
            case TIP:
                //Create Comment
                TipsComment tipsComment = new TipsComment();
                tipsComment.setTips_no(no);
                tipsComment.setUser_no(user_no);
                tipsComment.setContent(content);
                tipsComment.setRecomment(comment_no);
                tipsComment.set_blocked(false);
                tipsComment.setOwner_checked(false);
                //Comment Insert
                created_reply_comment_no = commentService.insertTipsCommentReply(tipsComment);
                //Get Inserted Comment
                tipsComment = commentService.getTipsCommentByNo(created_reply_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(tipsComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    tipsComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    tipsComment.setUser(commented_user);
                }

                message.put("comment", tipsComment);
                message.put("status", true);
                break;
            case FARM:
                //Create Comment
                FarmComment farmComment = new FarmComment();
                farmComment.setFarm_no(no);
                farmComment.setUser_no(user_no);
                farmComment.setContent(content);
                farmComment.setRecomment(comment_no);
                farmComment.set_blocked(false);
                farmComment.setOwner_checked(false);
                //Comment Insert
                created_reply_comment_no = commentService.insertFarmCommentReply(farmComment);
                //Get Inserted Comment
                farmComment = commentService.getFarmCommentByNo(created_reply_comment_no);
                //Comment Setting
                commented_user = userService.getUserByNo(farmComment.getUser_no());

                if (globalService.checkFarm(commented_user.getNo())) {
                    Farm farm = farmService.getFarmByUserNo(commented_user.getNo());
                    log.info("farm {}", farm.toString());
                    commented_user.setProfile_img(farm.getProfile_image());
                    commented_user.setName(farm.getName());
                    farmComment.setUser(commented_user);
                } else {
                    log.info("SAMPLE_PROFILE_URL {}", SAMPLE_PROFILE_URL);
                    MFile profile = new MFile();
                    profile.setUrl(SAMPLE_PROFILE_URL);
                    profile.setName(SAMPLE_PROFILE_NAME);
                    profile.setSize(SAMPLE_PROFILE_SIZE);
                    profile.setType(SAMPLE_PROFILE_TYPE);

                    commented_user.setProfile_img(profile);
                    farmComment.setUser(commented_user);
                }

                message.put("comment", farmComment);
                message.put("status", true);
                break;
            default:
                message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/review/reply/delete", method = RequestMethod.POST)
    public ResponseEntity<String> deleteReviewReply(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        COMMENT_TYPE type = COMMENT_TYPE.valueOf(map.get("type").toString());
        Integer comment_no = Integer.valueOf(map.get("no").toString());
        MFile profile = null;
        User user = null;
        switch (type) {
            case BOARD:
                commentService.deleteBoardCommentByNoAndUserNo(0, comment_no);

                profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                BoardComment boardComment = new BoardComment();
                boardComment.setUser(user);
                boardComment.setContent("삭제된 메세지입니다.");

                message.put("comment", boardComment);
                message.put("status", true);
                break;
            case MAGAZINE:
                commentService.deleteMagazineCommentByNoAndUserNo(0, comment_no);

                profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                MagazineComment magazineComment = new MagazineComment();
                magazineComment.setUser(user);
                magazineComment.setContent("삭제된 메세지입니다.");

                message.put("comment", magazineComment);
                message.put("status", true);
                break;
            case MANUAL:
                commentService.deleteManualCommentByNoAndUserNo(0, comment_no);

                profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                ManualComment manualComment = new ManualComment();
                manualComment.setUser(user);
                manualComment.setContent("삭제된 메세지입니다.");

                message.put("comment", manualComment);
                message.put("status", true);
                break;
            case QUESTION:
                commentService.deleteQuestionCommentByNoAndUserNo(0, comment_no);

                profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                QuestionComment questionComment = new QuestionComment();
                questionComment.setUser(user);
                questionComment.setContent("삭제된 메세지입니다.");

                message.put("comment", questionComment);
                message.put("status", true);
                break;
            case TIP:
                commentService.deleteTipsCommentByNoAndUserNo(0, comment_no);

                profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                TipsComment tipsComment = new TipsComment();
                tipsComment.setUser(user);
                tipsComment.setContent("삭제된 메세지입니다.");

                message.put("comment", tipsComment);
                message.put("status", true);
                break;
            case FARM:
                commentService.deleteFarmCommentByNoAndUserNo(0, comment_no);

                profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                FarmComment farmComment = new FarmComment();
                farmComment.setUser(user);
                farmComment.setContent("삭제된 메세지입니다.");

                message.put("comment", farmComment);
                message.put("status", true);
                break;
            default:
                message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/search/recent", method = RequestMethod.POST)
    public ResponseEntity<String> selectSearchRecent(HttpServletRequest request) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }


    @RequestMapping(value = "/search/recom", method = RequestMethod.POST)
    public ResponseEntity<String> selectSearchRecom(HttpServletRequest request) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/review/reply/create", method = RequestMethod.POST)
    public ResponseEntity<String> insertMyReviewReply(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        // Request
        String type = map.get("type").toString();
        Integer no = Integer.valueOf(map.get("no").toString());
        String content = map.get("content").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/content/unlike/{no}/recom", method = RequestMethod.POST)
    public ResponseEntity<String> deleteContentLike(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/content/delete/{community_no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyContent(HttpServletRequest request, @PathVariable("type") COMMENT_TYPE type, @PathVariable("community_no") Integer community_no) throws Exception {
        Message message = new Message();
        contentService.deleteContent(type, community_no);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/{type}/comment/{content_no}/{last_comment_no}", method = RequestMethod.GET)
    public ResponseEntity getMoreComments(@PathVariable("type") String type, @PathVariable("content_no") int content_no, @PathVariable("last_comment_no") int last_comment_no) {
        Message message = commentService.getMoreComments(type, content_no, last_comment_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/{type}/content/{content_no}", method = RequestMethod.GET)
    public ResponseEntity getContentList(@PathVariable("type") String type,
                                         @PathVariable("content_no") int content_no,
                                         @RequestParam("order") ORDER_TYPE order_type,
                                         @RequestParam("category") String category,
                                         HttpServletRequest request) {
        Message message = contentService.getContentList(type, content_no, order_type, category, request);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/{type}/farm/{farm_no}/content/{content_no}", method = RequestMethod.GET)
    public ResponseEntity getFarmContentList(@PathVariable("type") String type,
                                             @PathVariable("content_no") int content_no,
                                             @PathVariable("farm_no") int farm_no,
                                             @RequestParam("category") String category,
                                             HttpServletRequest request) {
        Message message = contentService.getFarmContentList(type, content_no, farm_no, category, request);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

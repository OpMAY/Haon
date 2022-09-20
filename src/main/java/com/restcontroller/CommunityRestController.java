package com.restcontroller;

import com.model.User;
import com.model.common.MFile;
import com.model.content.board.BoardComment;
import com.model.content.common.COMMENT_TYPE;
import com.model.farm.Farm;
import com.response.DefaultRes;
import com.response.Message;
import com.service.CommentService;
import com.service.FarmService;
import com.service.GlobalService;
import com.service.UserService;
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

    @RequestMapping(value = "/review/create", method = RequestMethod.POST)
    public ResponseEntity<String> insertReview(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        // Request
        String type = map.get("type").toString();
        Integer no = Integer.valueOf(map.get("no").toString());
        String content = map.get("content").toString();

        // Response
        message.put("a", "a");
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
                int created_reply_comment_no = commentService.insertBoardCommentReply(boardComment);
                //Get Inserted Comment
                boardComment = commentService.getBoardCommentByNo(created_reply_comment_no);
                //Comment Setting
                User commented_user = userService.getUserByNo(boardComment.getUser_no());

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
                message.put("status", true);
                break;
            case MANUAL:
                message.put("status", true);
                break;
            case QUESTION:
                message.put("status", true);
                break;
            case TIP:
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
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        switch (type) {
            case BOARD:
                commentService.deleteBoardCommentByNoAndUserNo(user_no, comment_no);

                MFile profile = new MFile();
                profile.setUrl(SAMPLE_PROFILE_URL);
                profile.setName(SAMPLE_PROFILE_NAME);
                profile.setSize(SAMPLE_PROFILE_SIZE);
                profile.setType(SAMPLE_PROFILE_TYPE);
                User user = new User();
                user.setProfile_img(profile);
                user.setName("관리자");

                BoardComment boardComment = new BoardComment();
                boardComment.setUser(user);
                boardComment.setContent("삭제된 메세지입니다.");

                message.put("comment", boardComment);
                message.put("status", true);
                break;
            case MAGAZINE:
                message.put("status", true);
                break;
            case MANUAL:
                message.put("status", true);
                break;
            case QUESTION:
                message.put("status", true);
                break;
            case TIP:
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

    @RequestMapping(value = "/{type}/content/delete/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyContent(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }


}

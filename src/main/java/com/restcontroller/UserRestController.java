package com.restcontroller;

import com.aws.file.FileUploadUtility;
import com.aws.model.CDNUploadPath;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.model.ALARM_TYPE;
import com.model.Agree;
import com.model.User;
import com.model.common.MFile;
import com.model.content.common.BOOKMARK_TYPE;
import com.model.content.common.COMMENT_TYPE;
import com.model.farm.Farm;
import com.model.farm.FarmSns;
import com.response.DefaultRes;
import com.response.Message;
import com.service.*;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.Format;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class UserRestController {
    private final GlobalService globalService;
    private final EncryptionService encryptionService;
    private final BookmarkService bookmarkService;
    private final LikeService likeService;
    private final FarmService farmService;
    private final FileUploadUtility fileUploadUtility;
    private final UserService userService;

    @RequestMapping(value = "/{type}/bookmark/like/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> insertBookMark(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/bookmark/unlike/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteBookMark(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/like/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> insertFarmHouseLike(HttpServletRequest request, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/unlike/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFarmHouseLike(HttpServletRequest request, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/review/{no}/{status}", method = RequestMethod.POST)
    public ResponseEntity<String> updateMyReviewLike(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no, @PathVariable("status") String status) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/review/delete/{no}/", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyReview(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/review/{no}/delete/{reply_no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyReviewReply(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no, @PathVariable("reply_no") int reply_no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/{type}/content/like/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> insertContentLike(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/content/review/{no}/{status}", method = RequestMethod.POST)
    public ResponseEntity<String> updateMyReviewLock(HttpServletRequest request, @PathVariable("no") int no, @PathVariable("status") String status) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/profile", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseName(MultipartHttpServletRequest request) throws Exception {
        Message message = new Message();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        MultipartFile file = request.getFile("file");
        if (file != null && file.getSize() != 0) {
            log.info(file.getName());
            log.info(file.getOriginalFilename());
            log.info("{}", file.getSize());
            log.info(file.getContentType());
            MFile uploaded_file = fileUploadUtility.uploadFile(file, CDNUploadPath.USER.getPath() + user_no + "/profile/");
            farmService.updateFarmProfile(farm.getNo(), uploaded_file);
            message.put("file", uploaded_file);
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/banner", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseBanner(MultipartHttpServletRequest request) throws Exception {
        Message message = new Message();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        MultipartFile file = request.getFile("file");
        if (file != null && file.getSize() != 0) {
            log.info(file.getName());
            log.info(file.getOriginalFilename());
            log.info("{}", file.getSize());
            log.info(file.getContentType());
            MFile uploaded_file = fileUploadUtility.uploadFile(file, CDNUploadPath.USER.getPath() + user_no + "/farm/");
            farmService.updateFarmBanner(farm.getNo(), uploaded_file);
            message.put("file", uploaded_file);
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/name", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseName(HttpServletRequest request, @RequestBody Map<String, Object> map) throws Exception {
        Message message = new Message();
        String name = map.get("name").toString();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        farmService.updateFarmName(farm.getNo(), name);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/type/{type}", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseType(HttpServletRequest request, @PathVariable("type") String type) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/details", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseDetails(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        String details = map.get("details").toString();
        details = Format.summernoteReplaceCharacter(details);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        farmService.updateFarmDescription(farm.getNo(), details);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/hashtag", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseHashTag(HttpServletRequest request, @RequestBody Map<String, Object> map) throws Exception {
        Message message = new Message();
        String hashs_json_string = map.get("hashs").toString();
        Type hash_type = new TypeToken<ArrayList<String>>() {
        }.getType();
        ArrayList<String> hashs = new Gson().fromJson(hashs_json_string, hash_type);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        farmService.updateFarmHashtag(farm.getNo(), hashs);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/sns", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseSNS(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        String instagram = map.get("instagram").toString();
        String blog = map.get("blog").toString();
        String homepage = map.get("homepage").toString();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        FarmSns farmSns = new FarmSns(instagram, blog, homepage);
        farmService.updateFarmSns(farm.getNo(), farmSns);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/alarm/update/{type}/{value}", method = RequestMethod.POST)
    public ResponseEntity<String> updateAlarm(HttpServletRequest request, @PathVariable("type") ALARM_TYPE type, @PathVariable("value") boolean value) throws Exception {
        Message message = new Message();
        log.info("type -> {}, value -> {}", type, value);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        User user = userService.getUserByNo(user_no);
        switch (type) {
            case COMMENT_EMAIL_ALARM:
                user.getAgree().setComment_email_alarm(value);
                break;
            case COMMENT_KAKAO_ALARM:
                user.getAgree().setComment_kakao_alarm(value);
                break;
            case SERVICE_EMAIL_ALARM:
                user.getAgree().setService_email_alarm(value);
                break;
            case SERVICE_KAKAO_ALARM:
                user.getAgree().setService_kakao_alarm(value);
                break;
            case COMMUNITY_EMAIL_ALARM:
                user.getAgree().setCommunity_email_alarm(value);
                break;
            case COMMUNITY_KAKAO_ALARM:
                user.getAgree().setCommunity_kakao_alarm(value);
                break;
        }
        userService.updateAgree(user);
        message.put("status", true);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farm/check", method = RequestMethod.POST)
    public ResponseEntity<String> checkFarm(HttpServletRequest request) throws Exception {
        Message message = new Message();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        boolean check = false;
        if (user_no != null) {
            check = globalService.checkFarm(user_no);
        }
        message.put("status", check);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/login/suspension", method = RequestMethod.POST)
    public ResponseEntity<String> checkSuspension(HttpServletRequest request) throws Exception {
        Message message = new Message();
        message.put("status", false);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/login/check", method = RequestMethod.POST)
    public ResponseEntity<String> checkLogin(HttpServletRequest request) throws Exception {
        Message message = new Message();
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        message.put("status", user_no != null ? true : false);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/bookmark/update/{type}/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> updateBookMark(HttpServletRequest request, @PathVariable("type") BOOKMARK_TYPE type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        log.info("{},{}", type, no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        if (BOOKMARK_TYPE.BOARD == type) {
            if (bookmarkService.isBoardBookmarkByUserNo(no, user_no)) {
                //북마크 해제
                bookmarkService.deleteBoardBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //북마크 등록
                bookmarkService.insertBoardBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.MAGAZINE == type) {
            if (bookmarkService.isMagazineBookmarkByUserNo(no, user_no)) {
                //북마크 해제
                bookmarkService.deleteMagazineBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //북마크 등록
                bookmarkService.insertMagazineBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.MANUAL == type) {
            if (bookmarkService.isManualBookmarkByUserNo(no, user_no)) {
                //북마크 해제
                bookmarkService.deleteManualBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //북마크 등록
                bookmarkService.insertManualBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.TIP == type) {
            if (bookmarkService.isTipBookmarkByUserNo(no, user_no)) {
                //북마크 해제
                bookmarkService.deleteTipBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //북마크 등록
                bookmarkService.insertTipBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.QUESTION == type) {
            if (bookmarkService.isQuestionBookmarkByUserNo(no, user_no)) {
                //북마크 해제
                bookmarkService.deleteQuestionBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //북마크 등록
                bookmarkService.insertQuestionBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.FARM == type) {
            if (bookmarkService.isFarmBookmarkByUserNo(no, user_no)) {
                //북마크 해제
                bookmarkService.deleteFarmBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //북마크 등록
                bookmarkService.insertFarmBookmark(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else {
            throw new RuntimeException();
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/like/update/{type}/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> updateLike(HttpServletRequest request, @PathVariable("type") BOOKMARK_TYPE type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        log.info("{},{}", type, no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        if (BOOKMARK_TYPE.BOARD == type) {
            if (likeService.isBoardLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteBoardLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertBoardLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.MAGAZINE == type) {
            if (likeService.isMagazineLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteMagazineLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertMagazineLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.MANUAL == type) {
            if (likeService.isManualLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteManualLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertManualLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.TIP == type) {

        } else if (BOOKMARK_TYPE.QUESTION == type) {
            if (likeService.isQuestionLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteQuestionLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertQuestionLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else {
            throw new RuntimeException();
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/like/comment/update/{type}/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> updateCommentLike(HttpServletRequest request, @PathVariable("type") COMMENT_TYPE type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        log.info("{},{}", type, no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        if (COMMENT_TYPE.BOARD == type) {
            if (likeService.isCommentBoardLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteBoardCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertBoardCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (COMMENT_TYPE.MAGAZINE == type) {
            if (likeService.isCommentMagazineLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteMagazineCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertMagazineCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (COMMENT_TYPE.MANUAL == type) {
            if (likeService.isCommentManualLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteManualCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertManualCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (COMMENT_TYPE.TIP == type) {
            if (likeService.isCommentTipsLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteTipsCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertTipsCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (COMMENT_TYPE.QUESTION == type) {
            if (likeService.isCommentQuestionLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteQuestionCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertQuestionCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (COMMENT_TYPE.FARM == type) {
            if (likeService.isCommentFarmLikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteFarmCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertFarmCommentLike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else {
            throw new RuntimeException();
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/dislike/comment/update/{type}/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> updateCommentDislike(HttpServletRequest request, @PathVariable("type") BOOKMARK_TYPE type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        log.info("{},{}", type, no);
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        if (BOOKMARK_TYPE.BOARD == type) {
            if (likeService.isCommentBoardDislikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteBoardCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertBoardCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.MAGAZINE == type) {
            if (likeService.isCommentMagazineDislikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteMagazineCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertMagazineCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.MANUAL == type) {
            if (likeService.isCommentManualDislikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteManualCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertManualCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.TIP == type) {
            if (likeService.isCommentTipsDislikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteTipsCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertTipsCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.QUESTION == type) {
            if (likeService.isCommentQuestionDislikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteQuestionCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertQuestionCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else if (BOOKMARK_TYPE.FARM == type) {
            if (likeService.isCommentFarmDislikeByUserNo(no, user_no)) {
                //좋아요 해제
                likeService.deleteFarmCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "delete");
            } else {
                //좋아요 등록
                likeService.insertFarmCommentDislike(no, user_no);
                message.put("status", true);
                message.put("type", "insert");
            }
        } else {
            throw new RuntimeException();
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

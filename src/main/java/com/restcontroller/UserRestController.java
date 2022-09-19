package com.restcontroller;

import com.model.content.common.BOOKMARK_TYPE;
import com.response.DefaultRes;
import com.response.Message;
import com.service.BookmarkService;
import com.service.GlobalService;
import com.service.LikeService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/farmhouse/change/name/{name}", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseName(HttpServletRequest request, @PathVariable("name") String name) throws Exception {
        Message message = new Message();
        message.put("example", "example");
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
        // Request
        String details = map.get("details").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/hashtag/{tag}", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseHashTag(HttpServletRequest request, @PathVariable("tag") String tag) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/farmhouse/change/sns", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseSNS(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        Message message = new Message();
        // Request
        String insta = map.get("insta").toString();
        String blog = map.get("blog").toString();
        String home = map.get("home").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/alarm/{type}/{status}/{value}", method = RequestMethod.POST)
    public ResponseEntity<String> updateAlarm(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("status") String stauts, @PathVariable("value") boolean value) throws Exception {
        Message message = new Message();
        message.put("example", "example");
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

        } else if (BOOKMARK_TYPE.MANUAL == type) {

        } else if (BOOKMARK_TYPE.TIP == type) {

        } else if (BOOKMARK_TYPE.QUESTION == type) {

        } else {
            throw new RuntimeException();
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

package com.restcontroller;

import com.response.DefaultRes;
import com.response.Message;
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
public class UserRestController {

    @RequestMapping(value = "/api/${type}/bookmark/like/${no}", method = RequestMethod.POST)
    public ResponseEntity<String> insertBookMark(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/bookmark/unlike/${no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteBookMark(HttpServletRequest request, @PathVariable("type") String type,@PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/like/${no}", method = RequestMethod.POST)
    public ResponseEntity<String> insertFarmHouseLike(HttpServletRequest request, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/unlike/${no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFarmHouseLike(HttpServletRequest request, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/review/${no}/${status}", method = RequestMethod.POST)
    public ResponseEntity<String> updateMyReviewLike(HttpServletRequest request,@PathVariable("type") String type, @PathVariable("no") int no, @PathVariable("status") String status) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/review/delete/${no}/", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyReview(HttpServletRequest request,@PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/review/${no}/delete/${reply_no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyReviewReply(HttpServletRequest request,@PathVariable("type") String type, @PathVariable("no") int no, @PathVariable("reply_no") int reply_no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/content/like/${no}", method = RequestMethod.POST)
    public ResponseEntity<String> insertContentLike(HttpServletRequest request,@PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/content/review/${no}/${status}", method = RequestMethod.POST)
    public ResponseEntity<String> updateMyReviewLock(HttpServletRequest request, @PathVariable("no") int no, @PathVariable("status") String status) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/change/name/${name}", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseName(HttpServletRequest request, @PathVariable("name") String name) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/change/type/${type}", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseType(HttpServletRequest request, @PathVariable("type") String type) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/change/details", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseDetails(HttpServletRequest request, @RequestBody Map<String, Object> map ) {
        Message message = new Message();
        // Request
        String details = map.get("details").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/change/hashtag/${tag}", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseHashTag(HttpServletRequest request, @PathVariable("tag") String tag) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/change/sns", method = RequestMethod.POST)
    public ResponseEntity<String> updateFarmHouseSNS(HttpServletRequest request, @RequestBody Map<String, Object> map ) {
        Message message = new Message();
        // Request
        String insta = map.get("insta").toString();
        String blog = map.get("blog").toString();
        String home = map.get("home").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/alarm/${type}/${status}/${value}", method = RequestMethod.POST)
    public ResponseEntity<String> updateAlarm(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("status") String stauts, @PathVariable("value") boolean value) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

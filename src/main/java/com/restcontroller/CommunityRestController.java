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
public class CommunityRestController {

    @RequestMapping(value = "/api/review/create", method = RequestMethod.POST)
    public ResponseEntity<String> insertReview(HttpServletRequest request, @RequestBody Map<String, Object> map ) {
        Message message = new Message();
        // Request
        String type = map.get("type").toString();
        Integer no = Integer.valueOf(map.get("no").toString());
        String content = map.get("content").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/search/recent", method = RequestMethod.POST)
    public ResponseEntity<String> selectSearchRecent(HttpServletRequest request) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }


    @RequestMapping(value = "/api/search/recom", method = RequestMethod.POST)
    public ResponseEntity<String> selectSearchRecom(HttpServletRequest request) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/farmhouse/review/reply/create", method = RequestMethod.POST)
    public ResponseEntity<String> insertMyReviewReply(HttpServletRequest request, @RequestBody Map<String, Object> map ) {
        Message message = new Message();
        // Request
        String type = map.get("type").toString();
        Integer no = Integer.valueOf(map.get("no").toString());
        String content = map.get("content").toString();

        // Response
        message.put("a", "a");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/content/unlike/${no}/recom", method = RequestMethod.POST)
    public ResponseEntity<String> deleteContentLike(HttpServletRequest request,@PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/api/${type}/content/delete/${no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteMyContent(HttpServletRequest request,@PathVariable("type") String type, @PathVariable("no") int no) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }



}

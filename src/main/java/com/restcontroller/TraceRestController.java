package com.restcontroller;

import com.response.DefaultRes;
import com.response.Message;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class TraceRestController {

    @RequestMapping(value = "/trace/{type}/{value}", method = RequestMethod.POST)
    public ResponseEntity<String> selectTrace(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("value") String value) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }




}

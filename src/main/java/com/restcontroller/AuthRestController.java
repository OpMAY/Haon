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
public class AuthRestController {
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ResponseEntity<String> logout(HttpServletRequest request) {
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/{database_no}/tables", method = RequestMethod.GET)
    public ResponseEntity<String> getTables(@PathVariable("database_no") String database_hash) throws Exception {
        Message message = new Message();
        message.put("lines", "");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

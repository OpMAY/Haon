package com.restcontroller;

import com.response.DefaultRes;
import com.response.Message;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/summernote")
public class SummernoteRestController {
    @RequestMapping(value = "/file/upload")
    public ResponseEntity<String> summernoteFileUpload() {
        Message message = new Message();
        message.put("data", "success");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

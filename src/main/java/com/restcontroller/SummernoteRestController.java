package com.restcontroller;

import com.aws.file.FileUploadUtility;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.model.common.MFile;
import com.response.DefaultRes;
import com.response.Message;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/summernote")
public class SummernoteRestController {
    private final FileUploadUtility fileUploadUtility;

    @RequestMapping(value = "/file/upload")
    public ResponseEntity<String> summernoteFileUpload(MultipartFile file) {
        Message message = new Message();
        if (file != null && file.getSize() != 0) {
            log.info(file.getOriginalFilename());
            log.info(file.getName());
            log.info(file.getContentType());
            log.info("size -> {}", file.getSize());
            MFile uploadedFile = fileUploadUtility.uploadFile(file, "/summernote/rest/file/");
            message.put("file", uploadedFile);
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }
}

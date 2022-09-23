package com.model.content.common;

import com.model.common.Time;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ContentForm extends Time {
    private int no;
    private int farm_no;
    private String title;
    private String content;
    private int views;
    private String category;
    private boolean is_bookmark;

    //업로드 전용 변수
    private MultipartFile file;
    private COMMENT_TYPE community_type;
}

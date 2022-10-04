package com.model.content.common;

import com.model.common.MFile;
import com.model.common.Time;
import com.model.content.board.BoardComment;
import com.model.farm.Farm;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

@Data
public class ContentForm extends Time {
    private int no;
    private int farm_no;
    private Farm farm;
    private String title;
    private String content;
    private int views;
    private int likes;
    private int comments;
    private String category;
    private boolean is_bookmark;
    private MFile thumbnail;

    //업로드 전용 변수
    private MultipartFile file;
    private COMMENT_TYPE community_type;
    //수정 전용 변수
    private String origin_thumbnail;
}

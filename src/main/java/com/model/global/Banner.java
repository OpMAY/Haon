package com.model.global;

import com.model.common.MFile;
import com.model.common.Time;
import lombok.Data;

@Data
public class Banner extends Time {
    private int no;
    private MFile banner_image;
    private String link;
    private String top_text;
    private String middle_text;
    private String bottom_text;

    //update 전용
    private String origin_banner_image;
}

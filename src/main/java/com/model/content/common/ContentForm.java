package com.model.content.common;

import com.model.common.Time;
import lombok.Data;

@Data
public class ContentForm extends Time {
    private int no;
    private int farm_no;
    private String title;
    private String content;
    private int views;
}

package com.model.content.common;

import com.model.common.Time;
import lombok.Data;

@Data
public class Comment extends Time {
    private int no;
    private Integer user_no;
    private int recomment;
    private String content;
    private boolean is_like;
    private boolean is_dislike;
    private boolean is_blocked;
    private boolean is_new;
    private boolean is_best;
    private int like_count;
    private int dislike_count;
    private Integer count;
}

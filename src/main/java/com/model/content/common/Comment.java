package com.model.content.common;

import com.model.common.Time;
import lombok.Data;

@Data
public class Comment extends Time {
    private int no;
    private int user_no;
    private int recomment;
    private String content;
    private boolean is_blocked;
}

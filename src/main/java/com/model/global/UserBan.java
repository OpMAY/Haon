package com.model.global;

import com.model.common.Time;
import lombok.Data;

@Data
public class UserBan extends Time {
    private int no;
    private int user_no;
    private String reason;
    private int days;
    private boolean status;
}

package com.model.content.common;

import lombok.Data;

@Data
public class UserCommentTransaction {
    private int user_no;
    private int comment_no;
    // Type 에 따라 DB 선택
    private COMMENT_TYPE type;
}

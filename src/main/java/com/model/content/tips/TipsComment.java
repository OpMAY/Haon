package com.model.content.tips;

import com.model.content.common.Comment;
import lombok.Data;

@Data
public class TipsComment extends Comment {
    private int tips_no;
    private boolean owner_checked;
}

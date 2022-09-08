package com.model.content.manual;

import com.model.content.common.Comment;
import lombok.Data;

@Data
public class ManualComment extends Comment {
    private int manual_no;
    private boolean owner_checked;
}

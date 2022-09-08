package com.model.content.board;

import com.model.content.common.Comment;
import lombok.Data;

@Data
public class BoardComment extends Comment {
    private int board_no;
    private boolean owner_checked;
}

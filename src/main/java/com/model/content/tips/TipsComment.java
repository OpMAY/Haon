package com.model.content.tips;

import com.model.User;
import com.model.content.board.BoardComment;
import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class TipsComment extends Comment {
    private int tips_no;
    private boolean owner_checked;
    /*Recomment*/
    private ArrayList<TipsComment> comments;
    private User user;
}

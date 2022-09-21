package com.model.content.manual;

import com.model.User;
import com.model.content.board.BoardComment;
import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class ManualComment extends Comment {
    private int manual_no;
    private boolean owner_checked;
    /*Recomment*/
    private ArrayList<ManualComment> comments;
    private User user;
}

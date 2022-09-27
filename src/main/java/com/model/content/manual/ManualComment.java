package com.model.content.manual;

import com.model.User;
import com.model.content.board.BoardComment;
import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class ManualComment extends Comment {
    private int manual_no;
    /*Recomment*/
    private ArrayList<ManualComment> comments;
}

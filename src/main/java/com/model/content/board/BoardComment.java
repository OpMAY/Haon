package com.model.content.board;

import com.model.User;
import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class BoardComment extends Comment {
    private int board_no;
    /*Recomment*/
    private ArrayList<BoardComment> comments;
}

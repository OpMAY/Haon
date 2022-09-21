package com.model.content.question;

import com.model.User;
import com.model.content.board.BoardComment;
import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class QuestionComment  extends Comment {
    private int question_no;
    private boolean owner_checked;
    /*Recomment*/
    private ArrayList<QuestionComment> comments;
    private User user;
}

package com.model.content.question;

import com.model.content.common.Comment;
import lombok.Data;

@Data
public class QuestionComment  extends Comment {
    private int question_no;
    private boolean owner_checked;
}

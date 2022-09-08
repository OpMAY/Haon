package com.model.content.question;

import com.model.content.common.UserContentTransaction;
import lombok.Data;

/**
 * Question Like, Question Bookmark 에서 모두 쓰임
 * **/
@Data
public class QuestionTransaction extends UserContentTransaction {
    private int question_no;
}

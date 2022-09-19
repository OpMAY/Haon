package com.model.content.question;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class QuestionSummary {
    private Question question;
    private LocalDateTime reg_datetime;
    private String best_comment;
    private Integer best_comment_no;
}

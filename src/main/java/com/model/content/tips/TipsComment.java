package com.model.content.tips;

import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class TipsComment extends Comment {
    private int tips_no;
    /*Recomment*/
    private ArrayList<TipsComment> comments;
}

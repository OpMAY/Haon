package com.model;

import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class FarmComment extends Comment {
    private int farm_no;
    private boolean owner_checked;
    /*Recomment*/
    private ArrayList<FarmComment> comments;
    private User user;
}

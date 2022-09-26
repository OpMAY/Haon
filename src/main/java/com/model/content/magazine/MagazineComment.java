package com.model.content.magazine;

import com.model.User;
import com.model.content.board.BoardComment;
import com.model.content.common.Comment;
import lombok.Data;

import java.util.ArrayList;

@Data
public class MagazineComment extends Comment {
    private int magazine_no;
    /*Recomment*/
    private ArrayList<MagazineComment> comments;
}

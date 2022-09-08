package com.model.content.magazine;

import com.model.content.common.Comment;
import lombok.Data;

@Data
public class MagazineComment extends Comment {
    private int magazine_no;
}

package com.model.content.board;

import com.model.content.common.ContentForm;
import lombok.Data;

@Data
public class Board extends ContentForm {
    private boolean is_new_comment;
}

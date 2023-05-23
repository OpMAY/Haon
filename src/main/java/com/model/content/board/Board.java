package com.model.content.board;

import com.model.common.MFile;
import com.model.content.common.ContentForm;
import lombok.Data;

import java.util.ArrayList;

@Data
public class Board extends ContentForm {
    private boolean is_new_comment;
    private MFile profile_image;

    //관리자 전용 변수
    private ArrayList<BoardComment> boardComments;

    @Override
    public String toString() {
        return "Board{" +
                "is_new_comment=" + is_new_comment +
                ", boardComments=" + boardComments +
                super.toString() +
                '}';
    }
}

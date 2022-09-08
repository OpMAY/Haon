package com.model.content.board;

import com.model.content.common.UserContentTransaction;
import lombok.Data;
/**
 * Board Like, Board Bookmark 에서 모두 쓰임
 * **/
@Data
public class BoardTransaction extends UserContentTransaction {
    private int board_no;
}

package com.mapper;

import com.model.content.board.BoardComment;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface CommentMapper {
    ArrayList<BoardComment> getBoardComments(@Param("board_no") int board_no);

    ArrayList<BoardComment> getRecommentByCommentNo(@Param("comment_no") int comment_no);

    BoardComment getBestBoardComment(@Param("board_no") int board_no);
}

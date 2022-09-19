package com.mapper;

import com.model.content.board.BoardTransaction;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface LikeMapper {
    ArrayList<BoardTransaction> getLikesByBoardNo(@Param("board_no") int board_no);

    boolean isBoardLikeByUserNo(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void insertBoardLike(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void deleteBoardLike(@Param("board_no") int board_no, @Param("user_no") int user_no);

    boolean isCommentLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);
    boolean isCommentDisLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);
}

package com.mapper;

import org.apache.ibatis.annotations.Param;

public interface BookmarkMapper {
    boolean isBoardBookmarkByUserNo(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void insertBoardBookmark(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void deleteBoardBookmark(@Param("board_no") int board_no, @Param("user_no") int user_no);
}

package com.mapper;

import org.apache.ibatis.annotations.Param;

public interface BookmarkMapper {
    boolean isBoardBookmarkByUserNo(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void insertBoardBookmark(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void deleteBoardBookmark(@Param("board_no") int board_no, @Param("user_no") int user_no);

    boolean isMagazineBookmarkByUserNo(@Param("magazine_no") int magazine_no, @Param("user_no") int user_no);

    void deleteMagazineBookmark(@Param("magazine_no") int magazine_no, @Param("user_no") int user_no);

    void insertMagazineBookmark(@Param("magazine_no") int magazine_no, @Param("user_no") int user_no);

    boolean isManualBookmarkByUserNo(@Param("manual_no") int manual_no, @Param("user_no") int user_no);

    void deleteManualBookmark(@Param("manual_no") int manual_no, @Param("user_no") int user_no);

    void insertManualBookmark(@Param("manual_no") int manual_no, @Param("user_no") int user_no);

    boolean isTipBookmarkByUserNo(@Param("tip_no") int tip_no, @Param("user_no") int user_no);

    void deleteTipBookmark(@Param("tip_no") int tip_no, @Param("user_no") int user_no);

    void insertTipBookmark(@Param("tip_no") int tip_no, @Param("user_no") int user_no);

    boolean isQuestionBookmarkByUserNo(@Param("question_no") int question_no, @Param("user_no") int user_no);

    void deleteQuestionBookmark(@Param("question_no") int question_no, @Param("user_no") int user_no);

    void insertQuestionBookmark(@Param("question_no") int question_no, @Param("user_no") int user_no);

    boolean isFarmBookmarkByUserNo(@Param("farm_no") int farm_no, @Param("user_no") int user_no);

    void deleteFarmBookmark(@Param("farm_no") int farm_no,@Param("user_no") int user_no);

    void insertFarmBookmark(@Param("farm_no") int farm_no,@Param("user_no") int user_no);
}

package com.mapper;

import com.model.content.board.BoardTransaction;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.question.QuestionTransaction;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface LikeMapper {
    ArrayList<BoardTransaction> getLikesByBoardNo(@Param("board_no") int board_no);

    boolean isBoardLikeByUserNo(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void insertBoardLike(@Param("board_no") int board_no, @Param("user_no") int user_no);

    void deleteBoardLike(@Param("board_no") int board_no, @Param("user_no") int user_no);

    boolean isCommentBoardLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteBoardCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertBoardCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentBoardDislikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteBoardCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertBoardCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    ArrayList<MagazineTransaction> getLikesByMagazineNo(@Param("magazine_no") int magazine_no);

    boolean isMagazineLikeByUserNo(@Param("magazine_no") int magazine_no, @Param("user_no") int user_no);

    void deleteMagazineLike(@Param("magazine_no") int magazine_no, @Param("user_no") int user_no);

    void insertMagazineLike(@Param("magazine_no") int magazine_no, @Param("user_no") int user_no);

    boolean isCommentMagazineLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteMagazineCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertMagazineCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentMagazineDislikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteMagazineCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertMagazineCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    ArrayList<QuestionTransaction> getLikesByQuestionNo(@Param("question_no") int question_no);

    boolean isCommentQuestionLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentQuestionDislikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);
}

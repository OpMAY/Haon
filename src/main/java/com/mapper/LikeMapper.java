package com.mapper;

import com.model.content.board.BoardTransaction;
import com.model.content.common.Comment;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.manual.ManualTransaction;
import com.model.content.question.QuestionTransaction;
import com.model.content.tips.TipsTransaction;
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

    boolean isQuestionLikeByUserNo(@Param("question_no") int question_no, @Param("user_no") int user_no);

    void deleteQuestionLike(@Param("question_no") int question_no, @Param("user_no") int user_no);

    void insertQuestionLike(@Param("question_no") int question_no, @Param("user_no") int user_no);

    void deleteQuestionCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertQuestionCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteQuestionCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertQuestionCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    ArrayList<ManualTransaction> getLikesByManualNo(@Param("manual_no") int manual_no);

    boolean isCommentManualLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentManualDislikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isManualLikeByUserNo(@Param("manual_no") int manual_no, @Param("user_no") int user_no);

    void deleteManualLike(@Param("manual_no") int manual_no, @Param("user_no") int user_no);

    void insertManualLike(@Param("manual_no") int manual_no, @Param("user_no") int user_no);

    void deleteManualCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertManualCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    ArrayList<TipsTransaction> getLikesByTipsNo(@Param("tips_no") int tips_no);

    boolean isCommentTipsLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentTipsDislikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteTipsCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertTipsCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentFarmLikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteFarmCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertFarmCommentLike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteTipsCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertTipsCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteManualCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertManualCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    boolean isCommentFarmDislikeByUserNo(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void deleteFarmCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    void insertFarmCommentDislike(@Param("comment_no") int comment_no, @Param("user_no") int user_no);

    int getLikesByComment(Comment comment);

    int getDislikesByComment(Comment comment);

    boolean isTipLikeByUserNo(@Param("tip_no") int tip_no, @Param("user_no") int user_no);

    void deleteTipLike(@Param("tip_no") int tip_no, @Param("user_no") int user_no);

    void insertTipLike(@Param("tip_no") int tip_no, @Param("user_no") int user_no);
}

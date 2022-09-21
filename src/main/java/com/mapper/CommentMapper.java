package com.mapper;

import com.model.content.board.BoardComment;
import com.model.content.magazine.MagazineComment;
import com.model.content.question.QuestionComment;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface CommentMapper {
    ArrayList<BoardComment> getBoardComments(@Param("board_no") int board_no);

    ArrayList<BoardComment> getBoardRecommentByCommentNo(@Param("comment_no") int comment_no);

    BoardComment getBestBoardComment(@Param("board_no") int board_no);

    int insertBoardCommentReply(BoardComment boardComment);

    BoardComment getBoardCommentByNo(@Param("comment_no") int comment_no);

    void deleteBoardCommentByNoAndUserNo(@Param("user_no") int user_no, @Param("comment_no") int comment_no);

    boolean checkQuestionLastCommentExists(@Param("last_comment_no") int last_comment_no);

    List<QuestionComment> getMoreQuestionComments(@Param("content_no") int content_no, @Param("last_comment_no") int last_comment_no);

    void insertBoardComment(BoardComment boardComment);

    ArrayList<MagazineComment> getMagazineComments(@Param("magazine_no") int magazine_no);

    ArrayList<MagazineComment> getMagazineRecommentByCommentNo(@Param("comment_no") int comment_no);

    MagazineComment getBestMagazineComment(@Param("magazine_no") int magazine_no);

    void insertMagazineComment(MagazineComment magazineComment);

    MagazineComment getMagazineCommentByNo(@Param("comment_no") int comment_no);

    void insertMagazineCommentReply(MagazineComment magazineComment);

    void deleteMagazineCommentByNoAndUserNo(@Param("user_no") int user_no, @Param("comment_no") int comment_no);

    ArrayList<QuestionComment> getQuestionComments(@Param("question_no") int question_no);

    ArrayList<QuestionComment> getQuestionRecommentByCommentNo(@Param("comment_no") int comment_no);

    QuestionComment getBestQuestionComment(@Param("question_no") int question_no);

    void insertQuestionComment(QuestionComment questionComment);

    QuestionComment getQuestionCommentByNo(@Param("comment_no") int comment_no);

    void insertQuestionCommentReply(QuestionComment questionComment);

    void deleteQuestionCommentByNoAndUserNo(@Param("user_no") int user_no, @Param("comment_no") int comment_no);
}

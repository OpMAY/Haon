package com.mapper;

import com.model.content.board.BoardComment;
import com.model.content.question.QuestionComment;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface CommentMapper {
    ArrayList<BoardComment> getBoardComments(@Param("board_no") int board_no);

    ArrayList<BoardComment> getRecommentByCommentNo(@Param("comment_no") int comment_no);

    BoardComment getBestBoardComment(@Param("board_no") int board_no);

    int insertBoardCommentReply(BoardComment boardComment);

    BoardComment getBoardCommentByNo(@Param("comment_no") int created_reply_comment_no);

    void deleteBoardCommentByNoAndUserNo(@Param("user_no") int user_no, @Param("comment_no") int comment_no);

    boolean checkQuestionLastCommentExists(@Param("last_comment_no") int last_comment_no);

    List<QuestionComment> getMoreQuestionComments(@Param("content_no") int content_no, @Param("last_comment_no") int last_comment_no);
}

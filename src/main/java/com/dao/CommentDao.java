package com.dao;

import com.mapper.CommentMapper;
import com.model.content.board.BoardComment;
import com.model.content.question.QuestionComment;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class CommentDao {
    private CommentMapper mapper;

    private CommentDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(CommentMapper.class);
    }

    public ArrayList<BoardComment> getBoardComments(int board_no) {
        return mapper.getBoardComments(board_no);
    }

    public ArrayList<BoardComment> getRecommentByCommentNo(int comment_no) {
        return mapper.getRecommentByCommentNo(comment_no);
    }

    public BoardComment getBestBoardComment(int board_no) {
        return mapper.getBestBoardComment(board_no);
    }

    public List<QuestionComment> getMoreQuestionComments(int content_no, int last_comment_no) {
        return mapper.getMoreQuestionComments(content_no, last_comment_no);
    }

    public boolean checkQuestionLastCommentExists(int last_comment_no) {
        return mapper.checkQuestionLastCommentExists(last_comment_no);
    }
}
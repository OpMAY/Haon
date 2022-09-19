package com.dao;

import com.mapper.CommentMapper;
import com.model.content.board.BoardComment;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

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
}
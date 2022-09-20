package com.dao;

import com.mapper.LikeMapper;
import com.mapper.TestMapper;
import com.model.content.board.BoardTransaction;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Slf4j
@Repository
public class LikeDao {
    private LikeMapper mapper;

    private LikeDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(LikeMapper.class);
    }

    public ArrayList<BoardTransaction> getLikesByBoardNo(int board_no) {
        return mapper.getLikesByBoardNo(board_no);
    }

    public boolean isBoardLikeByUserNo(int board_no, int user_no) {
        return mapper.isBoardLikeByUserNo(board_no, user_no);
    }

    public void insertBoardLike(int board_no, int user_no) {
        mapper.insertBoardLike(board_no, user_no);
    }

    public void deleteBoardLike(int board_no, int user_no) {
        mapper.deleteBoardLike(board_no, user_no);
    }

    public boolean isCommentLikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentLikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentLike(int comment_no, int user_no) {
        mapper.deleteBoardCommentLike(comment_no, user_no);
    }

    public void insertBoardCommentLike(int comment_no, int user_no) {
        mapper.insertBoardCommentLike(comment_no, user_no);
    }

    public boolean isCommentDislikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentDislikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentDislike(int comment_no, int user_no) {
        mapper.deleteBoardCommentDislike(comment_no, user_no);
    }

    public void insertBoardCommentDislike(int comment_no, int user_no) {
        mapper.insertBoardCommentDislike(comment_no, user_no);
    }
}
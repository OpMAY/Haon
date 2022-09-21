package com.dao;

import com.mapper.LikeMapper;
import com.mapper.TestMapper;
import com.model.content.board.BoardTransaction;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.manual.ManualTransaction;
import com.model.content.question.QuestionTransaction;
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

    public boolean isCommentBoardLikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentBoardLikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentLike(int comment_no, int user_no) {
        mapper.deleteBoardCommentLike(comment_no, user_no);
    }

    public void insertBoardCommentLike(int comment_no, int user_no) {
        mapper.insertBoardCommentLike(comment_no, user_no);
    }

    public boolean isCommentBoardDislikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentBoardDislikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentDislike(int comment_no, int user_no) {
        mapper.deleteBoardCommentDislike(comment_no, user_no);
    }

    public void insertBoardCommentDislike(int comment_no, int user_no) {
        mapper.insertBoardCommentDislike(comment_no, user_no);
    }

    public ArrayList<MagazineTransaction> getLikesByMagazineNo(int magazine_no) {
        return mapper.getLikesByMagazineNo(magazine_no);
    }

    public boolean isMagazineLikeByUserNo(int magazine_no, int user_no) {
        return mapper.isMagazineLikeByUserNo(magazine_no, user_no);
    }

    public void deleteMagazineLike(int magazine_no, int user_no) {
        mapper.deleteMagazineLike(magazine_no, user_no);
    }

    public void insertMagazineLike(int magazine_no, int user_no) {
        mapper.insertMagazineLike(magazine_no, user_no);
    }

    public boolean isCommentMagazineLikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentMagazineLikeByUserNo(comment_no, user_no);
    }

    public void deleteMagazineCommentLike(int comment_no, int user_no) {
        mapper.deleteMagazineCommentLike(comment_no, user_no);
    }

    public void insertMagazineCommentLike(int comment_no, int user_no) {
        mapper.insertMagazineCommentLike(comment_no, user_no);
    }

    public boolean isCommentMagazineDislikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentMagazineDislikeByUserNo(comment_no, user_no);
    }

    public void deleteMagazineCommentDislike(int comment_no, int user_no) {
        mapper.deleteMagazineCommentDislike(comment_no, user_no);
    }

    public void insertMagazineCommentDislike(int comment_no, int user_no) {
        mapper.insertMagazineCommentDislike(comment_no, user_no);
    }

    public ArrayList<QuestionTransaction> getLikesByQuestionNo(int question_no) {
        return mapper.getLikesByQuestionNo(question_no);
    }

    public boolean isCommentQuestionLikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentQuestionLikeByUserNo(comment_no, user_no);
    }

    public boolean isCommentQuestionDislikeByUserNo(int comment_no, int user_no) {
        return mapper.isCommentQuestionDislikeByUserNo(comment_no, user_no);
    }

    public boolean isQuestionLikeByUserNo(int question_no, int user_no) {
        return mapper.isQuestionLikeByUserNo(question_no, user_no);
    }

    public void deleteQuestionLike(int question_no, int user_no) {
        mapper.deleteQuestionLike(question_no, user_no);
    }

    public void insertQuestionLike(int question_no, int user_no) {
        mapper.insertQuestionLike(question_no, user_no);
    }

    public void deleteQuestionCommentLike(int comment_no, int user_no) {
        mapper.deleteQuestionCommentLike(comment_no, user_no);
    }

    public void insertQuestionCommentLike(int comment_no, int user_no) {
        mapper.insertQuestionCommentLike(comment_no, user_no);
    }

    public void deleteQuestionCommentDislike(int comment_no, int user_no) {
        mapper.deleteQuestionCommentDislike(comment_no, user_no);
    }

    public void insertQuestionCommentDislike(int comment_no, int user_no) {
        mapper.insertQuestionCommentDislike(comment_no, user_no);
    }

    public ArrayList<ManualTransaction> getLikesByManualNo(int manual_no) {
        return mapper.getLikesByManualNo(manual_no);
    }

    public boolean isCommentManualLikeByUserNo(int manual_no, int user_no) {
        return mapper.isCommentManualLikeByUserNo(manual_no, user_no);
    }

    public boolean isCommentManualDislikeByUserNo(int manual_no, int user_no) {
        return mapper.isCommentManualDislikeByUserNo(manual_no, user_no);
    }

    public boolean isManualLikeByUserNo(int manual_no, int user_no) {
        return mapper.isManualLikeByUserNo(manual_no, user_no);
    }

    public void deleteManualLike(int manual_no, int user_no) {
        mapper.deleteManualLike(manual_no, user_no);
    }

    public void insertManualLike(int manual_no, int user_no) {
        mapper.insertManualLike(manual_no, user_no);
    }

    public void deleteManualCommentLike(int comment_no, int user_no) {
        mapper.deleteManualCommentLike(comment_no, user_no);
    }

    public void insertManualCommentLike(int comment_no, int user_no) {
        mapper.insertManualCommentLike(comment_no, user_no);
    }
}
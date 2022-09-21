package com.service;

import com.dao.LikeDao;
import com.model.content.board.BoardTransaction;
import com.model.content.magazine.Magazine;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.question.QuestionTransaction;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
@RequiredArgsConstructor
public class LikeService {
    private final LikeDao likeDao;

    public ArrayList<BoardTransaction> getLikesByBoardNo(int board_no) {
        return likeDao.getLikesByBoardNo(board_no);
    }

    public boolean isBoardLikeByUserNo(int board_no, int user_no) {
        return likeDao.isBoardLikeByUserNo(board_no, user_no);
    }

    public void insertBoardLike(int board_no, int user_no) {
        likeDao.insertBoardLike(board_no, user_no);
    }

    public void deleteBoardLike(int board_no, int user_no) {
        likeDao.deleteBoardLike(board_no, user_no);
    }

    public boolean isCommentBoardLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentBoardLikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentLike(int comment_no, int user_no) {
        likeDao.deleteBoardCommentLike(comment_no, user_no);
    }

    public void insertBoardCommentLike(int comment_no, int user_no) {
        likeDao.insertBoardCommentLike(comment_no, user_no);
    }

    public boolean isCommentBoardDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentBoardDislikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentDislike(int comment_no, int user_no) {
        likeDao.deleteBoardCommentDislike(comment_no, user_no);
    }

    public void insertBoardCommentDislike(int comment_no, int user_no) {
        likeDao.insertBoardCommentDislike(comment_no, user_no);
    }

    public ArrayList<MagazineTransaction> getLikesByMagazineNo(int magazine_no) {
        return likeDao.getLikesByMagazineNo(magazine_no);
    }

    public boolean isMagazineLikeByUserNo(int magazine_no, int user_no) {
        return likeDao.isMagazineLikeByUserNo(magazine_no, user_no);
    }

    public void deleteMagazineLike(int magazine_no, int user_no) {
        likeDao.deleteMagazineLike(magazine_no, user_no);
    }

    public void insertMagazineLike(int magazine_no, int user_no) {
        likeDao.insertMagazineLike(magazine_no, user_no);
    }

    public boolean isCommentMagazineLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentMagazineLikeByUserNo(comment_no, user_no);
    }

    public void deleteMagazineCommentLike(int comment_no, int user_no) {
        likeDao.deleteMagazineCommentLike(comment_no, user_no);
    }

    public void insertMagazineCommentLike(int comment_no, int user_no) {
        likeDao.insertMagazineCommentLike(comment_no, user_no);
    }

    public boolean isCommentMagazineDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentMagazineDislikeByUserNo(comment_no, user_no);
    }

    public void deleteMagazineCommentDislike(int comment_no, int user_no) {
        likeDao.deleteMagazineCommentDislike(comment_no, user_no);
    }

    public void insertMagazineCommentDislike(int comment_no, int user_no) {
        likeDao.insertMagazineCommentDislike(comment_no, user_no);
    }

    public ArrayList<QuestionTransaction> getLikesByQuestionNo(int question_no) {
        return likeDao.getLikesByQuestionNo(question_no);
    }

    public boolean isCommentQuestionLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentQuestionLikeByUserNo(comment_no, user_no);
    }

    public boolean isCommentQuestionDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentQuestionDislikeByUserNo(comment_no, user_no);
    }
}

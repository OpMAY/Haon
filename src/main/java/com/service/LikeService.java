package com.service;

import com.dao.LikeDao;
import com.model.content.board.BoardTransaction;
import com.model.content.common.Comment;
import com.model.content.magazine.Magazine;
import com.model.content.magazine.MagazineTransaction;
import com.model.content.manual.ManualTransaction;
import com.model.content.question.QuestionTransaction;
import com.model.content.tips.TipsTransaction;
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

    public boolean isQuestionLikeByUserNo(int question_no, int user_no) {
        return likeDao.isQuestionLikeByUserNo(question_no, user_no);
    }

    public void deleteQuestionLike(int question_no, int user_no) {
        likeDao.deleteQuestionLike(question_no, user_no);
    }

    public void insertQuestionLike(int question_no, int user_no) {
        likeDao.insertQuestionLike(question_no, user_no);
    }

    public void deleteQuestionCommentLike(int comment_no, int user_no) {
        likeDao.deleteQuestionCommentLike(comment_no, user_no);
    }

    public void insertQuestionCommentLike(int comment_no, int user_no) {
        likeDao.insertQuestionCommentLike(comment_no, user_no);
    }

    public void deleteQuestionCommentDislike(int comment_no, int user_no) {
        likeDao.deleteQuestionCommentDislike(comment_no, user_no);
    }

    public void insertQuestionCommentDislike(int comment_no, int user_no) {
        likeDao.insertQuestionCommentDislike(comment_no, user_no);
    }

    public ArrayList<ManualTransaction> getLikesByManualNo(int manual_no) {
        return likeDao.getLikesByManualNo(manual_no);
    }

    public boolean isCommentManualLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentManualLikeByUserNo(comment_no, user_no);
    }

    public boolean isCommentManualDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentManualDislikeByUserNo(comment_no, user_no);
    }

    public boolean isManualLikeByUserNo(int manual_no, int user_no) {
        return likeDao.isManualLikeByUserNo(manual_no, user_no);
    }

    public void deleteManualLike(int manual_no, int user_no) {
        likeDao.deleteManualLike(manual_no, user_no);
    }

    public void insertManualLike(int manual_no, int user_no) {
        likeDao.insertManualLike(manual_no, user_no);
    }

    public void deleteManualCommentLike(int comment_no, int user_no) {
        likeDao.deleteManualCommentLike(comment_no, user_no);
    }

    public void insertManualCommentLike(int comment_no, int user_no) {
        likeDao.insertManualCommentLike(comment_no, user_no);
    }

    public ArrayList<TipsTransaction> getLikesByTipsNo(int tips_no) {
        return likeDao.getLikesByTipsNo(tips_no);
    }

    public boolean isCommentTipsLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentTipsLikeByUserNo(comment_no, user_no);
    }

    public boolean isCommentTipsDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentTipsDislikeByUserNo(comment_no, user_no);
    }

    public void deleteTipsCommentLike(int comment_no, int user_no) {
        likeDao.deleteTipsCommentLike(comment_no, user_no);
    }

    public void insertTipsCommentLike(int comment_no, int user_no) {
        likeDao.insertTipsCommentLike(comment_no, user_no);
    }

    public boolean isCommentFarmLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentFarmLikeByUserNo(comment_no, user_no);
    }

    public void deleteFarmCommentLike(int comment_no, int user_no) {
        likeDao.deleteFarmCommentLike(comment_no, user_no);
    }

    public void insertFarmCommentLike(int comment_no, int user_no) {
        likeDao.insertFarmCommentLike(comment_no, user_no);
    }

    public void deleteTipsCommentDislike(int comment_no, int user_no) {
        likeDao.deleteTipsCommentDislike(comment_no, user_no);
    }

    public void insertTipsCommentDislike(int comment_no, int user_no) {
        likeDao.insertTipsCommentDislike(comment_no, user_no);
    }

    public void deleteManualCommentDislike(int comment_no, int user_no) {
        likeDao.deleteManualCommentDislike(comment_no, user_no);
    }

    public void insertManualCommentDislike(int comment_no, int user_no) {
        likeDao.insertManualCommentDislike(comment_no, user_no);
    }

    public boolean isCommentFarmDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentFarmDislikeByUserNo(comment_no, user_no);
    }

    public void deleteFarmCommentDislike(int comment_no, int user_no) {
        likeDao.deleteFarmCommentDislike(comment_no, user_no);
    }

    public void insertFarmCommentDislike(int comment_no, int user_no) {
        likeDao.insertFarmCommentDislike(comment_no, user_no);
    }

    public int getLikesByComment(Comment comment) {
        return likeDao.getLikesByComment(comment);
    }

    public int getDislikesByComment(Comment comment) {
        return likeDao.getDislikesByComment(comment);
    }

    public boolean isTipLikeByUserNo(int tip_no, int user_no) {
        return likeDao.isTipLikeByUserNo(tip_no, user_no);
    }

    public void deleteTipLike(int tip_no, int user_no) {
        likeDao.deleteTipLike(tip_no, user_no);
    }

    public void insertTipLike(int tip_no, int user_no) {
        likeDao.insertTipLike(tip_no, user_no);
    }
}

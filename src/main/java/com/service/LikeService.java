package com.service;

import com.dao.LikeDao;
import com.model.content.board.BoardTransaction;
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

    public boolean isCommentLikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentLikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentLike(int comment_no, int user_no) {
        likeDao.deleteBoardCommentLike(comment_no, user_no);
    }

    public void insertBoardCommentLike(int comment_no, int user_no) {
        likeDao.insertBoardCommentLike(comment_no, user_no);
    }

    public boolean isCommentDislikeByUserNo(int comment_no, int user_no) {
        return likeDao.isCommentDislikeByUserNo(comment_no, user_no);
    }

    public void deleteBoardCommentDislike(int comment_no, int user_no) {
        likeDao.deleteBoardCommentDislike(comment_no, user_no);
    }

    public void insertBoardCommentDislike(int comment_no, int user_no) {
        likeDao.insertBoardCommentDislike(comment_no, user_no);
    }
}

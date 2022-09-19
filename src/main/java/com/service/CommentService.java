package com.service;

import com.dao.CommentDao;
import com.model.content.board.BoardComment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentDao commentDao;

    public ArrayList<BoardComment> getBoardComments(int board_no) {
        return commentDao.getBoardComments(board_no);
    }

    public ArrayList<BoardComment> getRecommentByCommentNo(int comment_no) {
        return commentDao.getRecommentByCommentNo(comment_no);
    }

    public BoardComment getBestBoardComment(int board_no) {
        return commentDao.getBestBoardComment(board_no);
    }

    public boolean isBestBoardComment(int board_no, int comment_no) {
        return commentDao.getBestBoardComment(board_no).getNo() == comment_no;
    }
}
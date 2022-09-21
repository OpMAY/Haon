package com.service;

import com.dao.*;
import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentService {
    // user Part
    private final UserDao userDao;
    private final FarmDao farmDao;

    // content part
    private final ContentDao contentDao;
    private final BookmarkDao bookmarkDao;
    private final LikeDao likeDao;
    private final DislikeDao dislikeDao;

    // comment part
    private final CommentDao commentDao;
    private final CommentDislikeDao commentDislikeDao;
    private final CommentLikeDao commentLikeDao;

    // traces & bundle part
    private final BundleDao bundleDao;
    private final BundleTracesDao bundleTracesDao;
    private final TraceDao traceDao;


    public Board getBoard(int board_no) {
        return contentDao.getBoard(board_no);
    }

    @Transactional
    public void updateBoardViews(int board_no) {
        contentDao.updateBoardViews(board_no);
    }

    public ArrayList<Board> getBoards(int farm_no) {
        return contentDao.getBoards(farm_no);
    }

    public ArrayList<Board> getFameBoards(int farm_no) {
        return contentDao.getFameBoards(farm_no);
    }

    public Magazine getMagazine(int magazine_no) {
        return contentDao.getMagazine(magazine_no);
    }

    public ArrayList<Magazine> getFameMagazines() {
        return contentDao.getFameMagazines();
    }

    public Question getQuestion(int question_no) {
        return contentDao.getQuestion(question_no);
    }

    public ArrayList<Question> getFameQuestions(int farm_no) {
        return contentDao.getFameQuestions(farm_no);
    }

    public ArrayList<Question> getQuestions(int farm_no) {
        return contentDao.getQuestions(farm_no);
    }

    public Manual getManual(int manual_no) {
        return contentDao.getManual(manual_no);
    }

    public ArrayList<Manual> getManuals(int farm_no) {
        return contentDao.getManuals(farm_no);
    }
}

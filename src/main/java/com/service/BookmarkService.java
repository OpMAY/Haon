package com.service;

import com.dao.BookmarkDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class BookmarkService {
    private final BookmarkDao bookmarkDao;

    public boolean isBoardBookmarkByUserNo(int board_no, int user_no) {
        return bookmarkDao.isBoardBookmarkByUserNo(board_no, user_no);
    }

    public void insertBoardBookmark(int board_no, int user_no) {
        bookmarkDao.insertBoardBookmark(board_no, user_no);
    }

    public void deleteBoardBookmark(int board_no, int user_no) {
        bookmarkDao.deleteBoardBookmark(board_no, user_no);
    }

    public boolean isMagazineBookmarkByUserNo(int magazine_no, int user_no) {
        return bookmarkDao.isMagazineBookmarkByUserNo(magazine_no, user_no);
    }

    public void deleteMagazineBookmark(int magazine_no, int user_no) {
        bookmarkDao.deleteMagazineBookmark(magazine_no, user_no);
    }

    public void insertMagazineBookmark(int magazine_no, int user_no) {
        bookmarkDao.insertMagazineBookmark(magazine_no, user_no);
    }

    public boolean isManualBookmarkByUserNo(int manual_no, int user_no) {
        return bookmarkDao.isManualBookmarkByUserNo(manual_no, user_no);
    }

    public void deleteManualBookmark(int manual_no, int user_no) {
        bookmarkDao.deleteManualBookmark(manual_no, user_no);
    }

    public void insertManualBookmark(int manual_no, int user_no) {
        bookmarkDao.insertManualBookmark(manual_no, user_no);
    }

    public boolean isTipBookmarkByUserNo(int tip_no, int user_no) {
        return bookmarkDao.isTipBookmarkByUserNo(tip_no, user_no);
    }

    public void deleteTipBookmark(int tip_no, int user_no) {
        bookmarkDao.deleteTipBookmark(tip_no, user_no);
    }

    public void insertTipBookmark(int tip_no, int user_no) {
        bookmarkDao.insertTipBookmark(tip_no, user_no);
    }

    public boolean isQuestionBookmarkByUserNo(int question_no, int user_no) {
        return bookmarkDao.isQuestionBookmarkByUserNo(question_no, user_no);
    }

    public void deleteQuestionBookmark(int question_no, int user_no) {
        bookmarkDao.deleteQuestionBookmark(question_no, user_no);
    }

    public void insertQuestionBookmark(int question_no, int user_no) {
        bookmarkDao.insertQuestionBookmark(question_no, user_no);
    }

    public boolean isFarmBookmarkByUserNo(int farm_no, int user_no) {
        return bookmarkDao.isFarmBookmarkByUserNo(farm_no, user_no);
    }

    public void deleteFarmBookmark(int farm_no, int user_no) {
        bookmarkDao.deleteFarmBookmark(farm_no, user_no);
    }

    public void insertFarmBookmark(int farm_no, int user_no) {
        bookmarkDao.insertFarmBookmark(farm_no, user_no);
    }
}

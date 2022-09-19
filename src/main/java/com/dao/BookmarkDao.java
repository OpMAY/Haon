package com.dao;

import com.mapper.BookmarkMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class BookmarkDao {
    private BookmarkMapper mapper;

    private BookmarkDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BookmarkMapper.class);
    }

    public boolean isBoardBookmarkByUserNo(int board_no, int user_no) {
        return mapper.isBoardBookmarkByUserNo(board_no, user_no);
    }

    public void insertBoardBookmark(int board_no, int user_no) {
        mapper.insertBoardBookmark(board_no, user_no);
    }

    public void deleteBoardBookmark(int board_no, int user_no) {
        mapper.deleteBoardBookmark(board_no, user_no);
    }

    public boolean isMagazineBookmarkByUserNo(int magazine_no, int user_no) {
        return mapper.isMagazineBookmarkByUserNo(magazine_no, user_no);
    }

    public void deleteMagazineBookmark(int magazine_no, int user_no) {
        mapper.deleteMagazineBookmark(magazine_no, user_no);
    }

    public void insertMagazineBookmark(int magazine_no, int user_no) {
        mapper.insertMagazineBookmark(magazine_no, user_no);
    }

    public boolean isManualBookmarkByUserNo(int manual_no, int user_no) {
        return mapper.isManualBookmarkByUserNo(manual_no, user_no);
    }

    public void deleteManualBookmark(int manual_no, int user_no) {
        mapper.deleteManualBookmark(manual_no, user_no);
    }

    public void insertManualBookmark(int manual_no, int user_no) {
        mapper.insertManualBookmark(manual_no, user_no);
    }

    public boolean isTipBookmarkByUserNo(int tip_no, int user_no) {
        return mapper.isTipBookmarkByUserNo(tip_no, user_no);
    }

    public void deleteTipBookmark(int tip_no, int user_no) {
        mapper.deleteTipBookmark(tip_no, user_no);
    }

    public void insertTipBookmark(int tip_no, int user_no) {
        mapper.insertTipBookmark(tip_no, user_no);
    }

    public boolean isQuestionBookmarkByUserNo(int question_no, int user_no) {
        return mapper.isQuestionBookmarkByUserNo(question_no, user_no);
    }

    public void deleteQuestionBookmark(int question_no, int user_no) {
        mapper.deleteQuestionBookmark(question_no, user_no);
    }

    public void insertQuestionBookmark(int question_no, int user_no) {
        mapper.insertQuestionBookmark(question_no, user_no);
    }

    public boolean isFarmBookmarkByUserNo(int farm_no, int user_no) {
        return mapper.isFarmBookmarkByUserNo(farm_no, user_no);
    }

    public void deleteFarmBookmark(int farm_no, int user_no) {
        mapper.deleteFarmBookmark(farm_no, user_no);
    }

    public void insertFarmBookmark(int farm_no, int user_no) {
        mapper.insertFarmBookmark(farm_no, user_no);
    }
}
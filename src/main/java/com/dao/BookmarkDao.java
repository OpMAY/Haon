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
}
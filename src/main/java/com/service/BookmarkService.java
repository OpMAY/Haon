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
}

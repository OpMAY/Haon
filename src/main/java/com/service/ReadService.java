package com.service;

import com.dao.CommentDao;
import com.model.content.common.COMMENT_TYPE;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReadService {
    private final CommentDao commentDao;

    public boolean ownerCheck(COMMENT_TYPE type, int no) {
        boolean check = false;
        switch (type) {
            case BOARD:
                check = commentDao.boardOwnerCheck(no);
                break;
            case TIP:
                check = commentDao.tipOwnerCheck(no);
                break;
            case MANUAL:
                check = commentDao.manualOwnerCheck(no);
                break;
            case QUESTION:
                check = commentDao.questionOwnerCheck(no);
                break;
        }
        return check;
    }
}

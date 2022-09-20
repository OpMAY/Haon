package com.dao;

import com.mapper.ContentMapper;
import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ContentDao {
    private ContentMapper mapper;
    private ContentDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(ContentMapper.class);
    }

    public List<Board> getLiveBoards() {
        return mapper.getLiveBoards();
    }

    public List<Tips> getMainTips() {
        return mapper.getMainTips();
    }

    public List<Manual> getMainManuals() {
        return mapper.getMainManuals();
    }

    public List<Magazine> getMainMagazines() {
        return mapper.getMainMagazines();
    }

    public List<QuestionSummary> getMainQuestions() {
        return mapper.getMainQuestions();
    }

    public Board getBoard(int board_no) {
        return mapper.getBoard(board_no);
    }

    public void updateBoardViews(int board_no) {
        mapper.updateBoardViews(board_no);
    }

    public boolean checkQuestionContentExists(int question_no) {
        return mapper.checkQuestionContentExists(question_no);
    }

    public List<Board> getCommunityBoardsOrderByRecent(String category) {
        return mapper.getCommunityBoardsOrderByRecent(category);
    }

    public List<Board> getCommunityBoardsOrderByViews(String category) {
        return mapper.getCommunityBoardsOrderByViews(category);
    }

    public List<Board> getCommunityBoardsOrderByComments(String category) {
        return mapper.getCommunityBoardsOrderByComments(category);
    }

    public List<Board> getCommunityBoardsOrderByLikes(String category) {
        return mapper.getCommunityBoardsOrderByLikes(category);
    }

    public List<Board> getCommunityBoardsOrderByBookmarks(String category) {
        return mapper.getCommunityBoardsOrderByBookmarks(category);
    }

    public List<Board> getCommunityBoardsOrderByRecentReload(String category, int content_no) {
        return mapper.getCommunityBoardsOrderByRecentReload(category, content_no);
    }

    public List<Board> getCommunityBoardsOrderByViewsReload(String category, int content_no) {
        return mapper.getCommunityBoardsOrderByViewsReload(category, content_no);
    }

    public List<Board> getCommunityBoardsOrderByCommentsReload(String category, int content_no) {
        return mapper.getCommunityBoardsOrderByCommentsReload(category, content_no);
    }

    public List<Board> getCommunityBoardsOrderByLikesReload(String category, int content_no) {
        return mapper.getCommunityBoardsOrderByLikesReload(category, content_no);
    }

    public List<Board> getCommunityBoardsOrderByBookmarksReload(String category, int content_no) {
        return mapper.getCommunityBoardsOrderByBookmarksReload(category, content_no);
    }
}
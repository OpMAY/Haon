package com.dao;

import com.mapper.ContentMapper;
import com.model.content.board.Board;
import com.model.content.common.ContentForm;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
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

    public void updateMagazineViews(int magazine_no) {
        mapper.updateMagazineViews(magazine_no);
    }

    public void updateManualViews(int manual_no) {
        mapper.updateManualViews(manual_no);
    }

    public void updateQuestionViews(int question_no) {
        mapper.updateQuestionViews(question_no);
    }

    public void updateTipViews(int tip_no) {
        mapper.updateTipViews(tip_no);
    }

    public boolean checkQuestionContentExists(int question_no) {
        return mapper.checkQuestionContentExists(question_no);
    }

    public ArrayList<Board> getBoards(int farm_no) {
        return mapper.getBoards(farm_no);
    }

    public ArrayList<Board> getFameBoards(int farm_no) {
        return mapper.getFameBoards(farm_no);
    }

    public Magazine getMagazine(int magazine_no) {
        return mapper.getMagazine(magazine_no);
    }

    public ArrayList<Magazine> getFameMagazines() {
        return mapper.getFameMagazines();
    }

    public Question getQuestion(int question_no) {
        return mapper.getQuestion(question_no);
    }

    public ArrayList<Question> getFameQuestions(int farm_no) {
        return mapper.getFameQuestions(farm_no);
    }

    public ArrayList<Question> getQuestions(int farm_no) {
        return mapper.getQuestions(farm_no);
    }

    public Manual getManual(int manual_no) {
        return mapper.getManual(manual_no);
    }

    public ArrayList<Manual> getManuals(int farm_no) {
        return mapper.getManuals(farm_no);
    }

    // BOARDS
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

    // TIPS
    public List<Tips> getCommunityTipsOrderByRecent(String category) {
        return mapper.getCommunityTipsOrderByRecent(category);
    }

    public List<Tips> getCommunityTipsOrderByViews(String category) {
        return mapper.getCommunityTipsOrderByViews(category);
    }

    public List<Tips> getCommunityTipsOrderByComments(String category) {
        return mapper.getCommunityTipsOrderByComments(category);
    }

    public List<Tips> getCommunityTipsOrderByLikes(String category) {
        return mapper.getCommunityTipsOrderByLikes(category);
    }

    public List<Tips> getCommunityTipsOrderByBookmarks(String category) {
        return mapper.getCommunityTipsOrderByBookmarks(category);
    }

    public List<Tips> getCommunityTipsOrderByRecentReload(String category, int content_no) {
        return mapper.getCommunityTipsOrderByRecentReload(category, content_no);
    }

    public List<Tips> getCommunityTipsOrderByViewsReload(String category, int content_no) {
        return mapper.getCommunityTipsOrderByViewsReload(category, content_no);
    }

    public List<Tips> getCommunityTipsOrderByCommentsReload(String category, int content_no) {
        return mapper.getCommunityTipsOrderByCommentsReload(category, content_no);
    }

    public List<Tips> getCommunityTipsOrderByLikesReload(String category, int content_no) {
        return mapper.getCommunityTipsOrderByLikesReload(category, content_no);
    }

    public List<Tips> getCommunityTipsOrderByBookmarksReload(String category, int content_no) {
        return mapper.getCommunityTipsOrderByBookmarksReload(category, content_no);
    }


    // MANUALS
    public List<Manual> getCommunityManualsOrderByRecent(String category) {
        return mapper.getCommunityManualsOrderByRecent(category);
    }

    public List<Manual> getCommunityManualsOrderByViews(String category) {
        return mapper.getCommunityManualsOrderByViews(category);
    }

    public List<Manual> getCommunityManualsOrderByComments(String category) {
        return mapper.getCommunityManualsOrderByComments(category);
    }

    public List<Manual> getCommunityManualsOrderByLikes(String category) {
        return mapper.getCommunityManualsOrderByLikes(category);
    }

    public List<Manual> getCommunityManualsOrderByBookmarks(String category) {
        return mapper.getCommunityManualsOrderByBookmarks(category);
    }

    public List<Manual> getCommunityManualsOrderByRecentReload(String category, int content_no) {
        return mapper.getCommunityManualsOrderByRecentReload(category, content_no);
    }

    public List<Manual> getCommunityManualsOrderByViewsReload(String category, int content_no) {
        return mapper.getCommunityManualsOrderByViewsReload(category, content_no);
    }

    public List<Manual> getCommunityManualsOrderByCommentsReload(String category, int content_no) {
        return mapper.getCommunityManualsOrderByCommentsReload(category, content_no);
    }

    public List<Manual> getCommunityManualsOrderByLikesReload(String category, int content_no) {
        return mapper.getCommunityManualsOrderByLikesReload(category, content_no);
    }

    public List<Manual> getCommunityManualsOrderByBookmarksReload(String category, int content_no) {
        return mapper.getCommunityManualsOrderByBookmarksReload(category, content_no);
    }


    // MAGAZINES
    public List<Magazine> getCommunityMagazinesOrderByRecent(String category) {
        return mapper.getCommunityMagazinesOrderByRecent(category);
    }

    public List<Magazine> getCommunityMagazinesOrderByViews(String category) {
        return mapper.getCommunityMagazinesOrderByViews(category);
    }

    public List<Magazine> getCommunityMagazinesOrderByComments(String category) {
        return mapper.getCommunityMagazinesOrderByComments(category);
    }

    public List<Magazine> getCommunityMagazinesOrderByLikes(String category) {
        return mapper.getCommunityMagazinesOrderByLikes(category);
    }

    public List<Magazine> getCommunityMagazinesOrderByBookmarks(String category) {
        return mapper.getCommunityMagazinesOrderByBookmarks(category);
    }

    public List<Magazine> getCommunityMagazinesOrderByRecentReload(String category, int content_no) {
        return mapper.getCommunityMagazinesOrderByRecentReload(category, content_no);
    }

    public List<Magazine> getCommunityMagazinesOrderByViewsReload(String category, int content_no) {
        return mapper.getCommunityMagazinesOrderByViewsReload(category, content_no);
    }

    public List<Magazine> getCommunityMagazinesOrderByCommentsReload(String category, int content_no) {
        return mapper.getCommunityMagazinesOrderByCommentsReload(category, content_no);
    }

    public List<Magazine> getCommunityMagazinesOrderByLikesReload(String category, int content_no) {
        return mapper.getCommunityMagazinesOrderByLikesReload(category, content_no);
    }

    public List<Magazine> getCommunityMagazinesOrderByBookmarksReload(String category, int content_no) {
        return mapper.getCommunityMagazinesOrderByBookmarksReload(category, content_no);
    }


    // QUESTIONS
    public List<QuestionSummary> getCommunityQuestionsOrderByRecent(String category) {
        return mapper.getCommunityQuestionsOrderByRecent(category);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByViews(String category) {
        return mapper.getCommunityQuestionsOrderByViews(category);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByComments(String category) {
        return mapper.getCommunityQuestionsOrderByComments(category);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByLikes(String category) {
        return mapper.getCommunityQuestionsOrderByLikes(category);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByBookmarks(String category) {
        return mapper.getCommunityQuestionsOrderByBookmarks(category);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByRecentReload(String category, int content_no) {
        return mapper.getCommunityQuestionsOrderByRecentReload(category, content_no);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByViewsReload(String category, int content_no) {
        return mapper.getCommunityQuestionsOrderByViewsReload(category, content_no);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByCommentsReload(String category, int content_no) {
        return mapper.getCommunityQuestionsOrderByCommentsReload(category, content_no);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByLikesReload(String category, int content_no) {
        return mapper.getCommunityQuestionsOrderByLikesReload(category, content_no);
    }

    public List<QuestionSummary> getCommunityQuestionsOrderByBookmarksReload(String category, int content_no) {
        return mapper.getCommunityQuestionsOrderByBookmarksReload(category, content_no);
    }

    public Tips getTip(int tip_no) {
        return mapper.getTip(tip_no);
    }

    public ArrayList<Tips> getTips(int farm_no) {
        return mapper.getTips(farm_no);
    }

    public void insertBoard(Board board) {
        mapper.insertBoard(board);
    }

    public void insertQuestion(Question question) {
        mapper.insertQuestion(question);
    }

    public void insertTips(Tips tips) {
        mapper.insertTips(tips);
    }

    public void insertManual(Manual manual) {
        mapper.insertManual(manual);
    }

    public void insertMagazine(Magazine magazine) {
        mapper.insertMagazine(magazine);
    }

    public List<Board> getBoardSearchResult(String query, int last_content_no) {
        return mapper.getBoardSearchResult(query, last_content_no);
    }

    public List<Tips> getTipsSearchResult(String query, int last_content_no) {
        return mapper.getTipsSearchResult(query, last_content_no);
    }

    public List<Manual> getManualSearchResult(String query, int last_content_no) {
        return mapper.getManualSearchResult(query, last_content_no);
    }

    public List<Magazine> getMagazineSearchResult(String query, int last_content_no) {
        return mapper.getMagazineSearchResult(query, last_content_no);
    }

    public List<QuestionSummary> getQuestionSearchResult(String query, int last_content_no) {
        return mapper.getQuestionSearchResult(query, last_content_no);
    }

    public ArrayList<Board> getBookmarkBoards(int user_no) {
        return mapper.getBookmarkBoards(user_no);
    }

    public ArrayList<Tips> getBookmarkTips(int user_no) {
        return mapper.getBookmarkTips(user_no);
    }

    public ArrayList<Manual> getBookmarkManuals(int user_no) {
        return mapper.getBookmarkManuals(user_no);
    }

    public ArrayList<Question> getBookmarkQuestions(int user_no) {
        return mapper.getBookmarkQuestions(user_no);
    }

    public ArrayList<Magazine> getBookmarkMagazines(int user_no) {
        return mapper.getBookmarkMagazines(user_no);
    }

    public List<Board> getFarmBoards(int farm_no, int content_no, String category) {
        return mapper.getFarmBoards(farm_no, content_no, category);
    }

    public List<Tips> getFarmTips(int farm_no, int content_no, String category) {
        return mapper.getFarmTips(farm_no, content_no, category);
    }

    public List<QuestionSummary> getFarmQuestions(int farm_no, int content_no, String category) {
        return mapper.getFarmQuestions(farm_no, content_no, category);
    }

    public List<Manual> getFarmManuals(int farm_no, int content_no, String category) {
        return mapper.getFarmManuals(farm_no, content_no, category);
    }

    public ContentForm getContentFormByBoardNo(int board_no) {
        return mapper.getContentFormByBoardNo(board_no);
    }

    public ContentForm getContentFormByQuestionNo(int question_no) {
        return mapper.getContentFormByQuestionNo(question_no);
    }

    public ContentForm getContentFormByMagazineNo(int magazine_no) {
        return mapper.getContentFormByMagazineNo(magazine_no);
    }

    public ContentForm getContentFormByManualNo(int manual_no) {
        return mapper.getContentFormByManualNo(manual_no);
    }

    public ContentForm getContentFormByTipNo(int tips_no) {
        return mapper.getContentFormByTipNo(tips_no);
    }

    public void updateBoard(Board board) {
        mapper.updateBoard(board);
    }

    public void updateQuestion(Question question) {
        mapper.updateQuestion(question);
    }

    public void updateTips(Tips tips) {
        mapper.updateTips(tips);
    }

    public void updateManual(Manual manual) {
        mapper.updateManual(manual);
    }

    public void updateMagazine(Magazine magazine) {
        mapper.updateMagazine(magazine);
    }

    public void deleteBoard(int board_no) {
        mapper.deleteBoard(board_no);
    }

    public void deleteQuestion(int question_no) {
        mapper.deleteQuestion(question_no);
    }

    public void deleteTip(int tip_no) {
        mapper.deleteTip(tip_no);
    }

    public void deleteManual(int manual_no) {
        mapper.deleteManual(manual_no);
    }

    public void deleteMagazine(int magazine_no) {
        mapper.deleteManual(magazine_no);
    }

    public ArrayList<Board> getAllBoards() {
        return mapper.getAllBoards();
    }

    public void updateBoardBlockByCommentNo(int comment_no, boolean block) {
        mapper.updateBoardBlockByCommentNo(comment_no, block);
    }
    public void updateQuestionBlockByCommentNo(int comment_no, boolean block) {
        mapper.updateQuestionBlockByCommentNo(comment_no, block);
    }
    public void updateTipBlockByCommentNo(int comment_no, boolean block) {
        mapper.updateTipBlockByCommentNo(comment_no, block);
    }
    public void updateManualBlockByCommentNo(int comment_no, boolean block) {
        mapper.updateManualBlockByCommentNo(comment_no, block);
    }
    public void updateMagazineBlockByCommentNo(int comment_no, boolean block) {
        mapper.updateMagazineBlockByCommentNo(comment_no, block);
    }
    public void updateFarmBlockByCommentNo(int comment_no, boolean block) {
        mapper.updateFarmBlockByCommentNo(comment_no, block);
    }

    public ArrayList<Tips> getAllTips() {
        return mapper.getAllTips();
    }
}
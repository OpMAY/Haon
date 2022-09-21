package com.mapper;

import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface ContentMapper {
    List<Board> getLiveBoards();

    List<Tips> getMainTips();

    List<Manual> getMainManuals();

    List<Magazine> getMainMagazines();

    List<QuestionSummary> getMainQuestions();

    Board getBoard(@Param("board_no") int board_no);

    void updateBoardViews(@Param("board_no") int board_no);

    boolean checkQuestionContentExists(@Param("question_no") int question_no);

    ArrayList<Board> getBoards(@Param("farm_no") int farm_no);

    ArrayList<Board> getFameBoards(@Param("farm_no") int farm_no);

    Magazine getMagazine(@Param("magazine_no") int magazine_no);

    ArrayList<Magazine> getFameMagazines();

    Question getQuestion(@Param("question_no") int question_no);

    ArrayList<Question> getFameQuestions(@Param("farm_no") int farm_no);

    ArrayList<Question> getQuestions(@Param("farm_no") int farm_no);

    Manual getManual(@Param("manual_no") int manual_no);

    ArrayList<Manual> getManuals(@Param("farm_no") int farm_no);
  
    // BOARDS
    List<Board> getCommunityBoardsOrderByRecent(String category);

    List<Board> getCommunityBoardsOrderByViews(String category);

    List<Board> getCommunityBoardsOrderByComments(String category);

    List<Board> getCommunityBoardsOrderByLikes(String category);

    List<Board> getCommunityBoardsOrderByBookmarks(String category);

    List<Board> getCommunityBoardsOrderByRecentReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Board> getCommunityBoardsOrderByViewsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Board> getCommunityBoardsOrderByCommentsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Board> getCommunityBoardsOrderByLikesReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Board> getCommunityBoardsOrderByBookmarksReload(@Param("category") String category, @Param("content_no") int content_no);

    // TIPS
    List<Tips> getCommunityTipsOrderByRecent(String category);

    List<Tips> getCommunityTipsOrderByViews(String category);

    List<Tips> getCommunityTipsOrderByComments(String category);

    List<Tips> getCommunityTipsOrderByLikes(String category);

    List<Tips> getCommunityTipsOrderByBookmarks(String category);

    List<Tips> getCommunityTipsOrderByRecentReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Tips> getCommunityTipsOrderByViewsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Tips> getCommunityTipsOrderByCommentsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Tips> getCommunityTipsOrderByLikesReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Tips> getCommunityTipsOrderByBookmarksReload(@Param("category") String category, @Param("content_no") int content_no);

    // Manuals
    List<Manual> getCommunityManualsOrderByRecent(String category);

    List<Manual> getCommunityManualsOrderByViews(String category);

    List<Manual> getCommunityManualsOrderByComments(String category);

    List<Manual> getCommunityManualsOrderByLikes(String category);

    List<Manual> getCommunityManualsOrderByBookmarks(String category);

    List<Manual> getCommunityManualsOrderByRecentReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Manual> getCommunityManualsOrderByViewsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Manual> getCommunityManualsOrderByCommentsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Manual> getCommunityManualsOrderByLikesReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Manual> getCommunityManualsOrderByBookmarksReload(@Param("category") String category, @Param("content_no") int content_no);


    // MAGAZINES
    List<Magazine> getCommunityMagazinesOrderByRecent(String category);

    List<Magazine> getCommunityMagazinesOrderByViews(String category);

    List<Magazine> getCommunityMagazinesOrderByComments(String category);

    List<Magazine> getCommunityMagazinesOrderByLikes(String category);

    List<Magazine> getCommunityMagazinesOrderByBookmarks(String category);

    List<Magazine> getCommunityMagazinesOrderByRecentReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Magazine> getCommunityMagazinesOrderByViewsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Magazine> getCommunityMagazinesOrderByCommentsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Magazine> getCommunityMagazinesOrderByLikesReload(@Param("category") String category, @Param("content_no") int content_no);

    List<Magazine> getCommunityMagazinesOrderByBookmarksReload(@Param("category") String category, @Param("content_no") int content_no);


    // QUESTIONS
    List<QuestionSummary> getCommunityQuestionsOrderByRecent(String category);

    List<QuestionSummary> getCommunityQuestionsOrderByViews(String category);

    List<QuestionSummary> getCommunityQuestionsOrderByComments(String category);

    List<QuestionSummary> getCommunityQuestionsOrderByLikes(String category);

    List<QuestionSummary> getCommunityQuestionsOrderByBookmarks(String category);

    List<QuestionSummary> getCommunityQuestionsOrderByRecentReload(@Param("category") String category, @Param("content_no") int content_no);

    List<QuestionSummary> getCommunityQuestionsOrderByViewsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<QuestionSummary> getCommunityQuestionsOrderByCommentsReload(@Param("category") String category, @Param("content_no") int content_no);

    List<QuestionSummary> getCommunityQuestionsOrderByLikesReload(@Param("category") String category, @Param("content_no") int content_no);

    List<QuestionSummary> getCommunityQuestionsOrderByBookmarksReload(@Param("category") String category, @Param("content_no") int content_no);
}

package com.mapper;

import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import org.apache.ibatis.annotations.Param;

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
}

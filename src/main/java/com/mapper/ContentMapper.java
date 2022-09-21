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
}

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
}

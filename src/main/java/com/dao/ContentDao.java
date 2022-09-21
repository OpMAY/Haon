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
}
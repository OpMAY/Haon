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
}
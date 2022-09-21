package com.dao;

import com.mapper.CommentMapper;
import com.model.FarmComment;
import com.model.content.board.BoardComment;
import com.model.content.magazine.MagazineComment;
import com.model.content.manual.ManualComment;
import com.model.content.question.QuestionComment;
import com.model.content.tips.TipsComment;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class CommentDao {
    private CommentMapper mapper;

    private CommentDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(CommentMapper.class);
    }

    public ArrayList<BoardComment> getBoardComments(int board_no) {
        return mapper.getBoardComments(board_no);
    }

    public ArrayList<BoardComment> getBoardRecommentByCommentNo(int comment_no) {
        return mapper.getBoardRecommentByCommentNo(comment_no);
    }

    public BoardComment getBestBoardComment(int board_no) {
        return mapper.getBestBoardComment(board_no);
    }

    public void insertBoardCommentReply(BoardComment boardComment) {
        mapper.insertBoardCommentReply(boardComment);
    }

    public BoardComment getBoardCommentByNo(int comment_no) {
        return mapper.getBoardCommentByNo(comment_no);
    }

    public void deleteBoardCommentByNoAndUserNo(int user_no, int comment_no) {
        mapper.deleteBoardCommentByNoAndUserNo(user_no, comment_no);
    }

    public List<QuestionComment> getMoreQuestionComments(int content_no, int last_comment_no) {
        return mapper.getMoreQuestionComments(content_no, last_comment_no);
    }

    public boolean checkQuestionLastCommentExists(int last_comment_no) {
        return mapper.checkQuestionLastCommentExists(last_comment_no);
    }

    public void insertBoardComment(BoardComment boardComment) {
        mapper.insertBoardComment(boardComment);
    }

    public ArrayList<MagazineComment> getMagazineComments(int magazine_no) {
        return mapper.getMagazineComments(magazine_no);
    }

    public ArrayList<MagazineComment> getMagazineRecommentByCommentNo(int comment_no) {
        return mapper.getMagazineRecommentByCommentNo(comment_no);
    }

    public MagazineComment getBestMagazineComment(int magazine_no) {
        return mapper.getBestMagazineComment(magazine_no);
    }

    public void insertMagazineComment(MagazineComment magazineComment) {
        mapper.insertMagazineComment(magazineComment);
    }

    public MagazineComment getMagazineCommentByNo(int comment_no) {
        return mapper.getMagazineCommentByNo(comment_no);
    }

    public void insertMagazineCommentReply(MagazineComment magazineComment) {
        mapper.insertMagazineCommentReply(magazineComment);
    }

    public void deleteMagazineCommentByNoAndUserNo(int user_no, int comment_no) {
        mapper.deleteMagazineCommentByNoAndUserNo(user_no, comment_no);
    }

    public ArrayList<QuestionComment> getQuestionComments(int question_no) {
        return mapper.getQuestionComments(question_no);
    }

    public ArrayList<QuestionComment> getQuestionRecommentByCommentNo(int comment_no) {
        return mapper.getQuestionRecommentByCommentNo(comment_no);
    }

    public QuestionComment getBestQuestionComment(int question_no) {
        return mapper.getBestQuestionComment(question_no);
    }

    public void insertQuestionComment(QuestionComment questionComment) {
        mapper.insertQuestionComment(questionComment);
    }

    public QuestionComment getQuestionCommentByNo(int comment_no) {
        return mapper.getQuestionCommentByNo(comment_no);
    }

    public void insertQuestionCommentReply(QuestionComment questionComment) {
        mapper.insertQuestionCommentReply(questionComment);
    }

    public void deleteQuestionCommentByNoAndUserNo(int user_no, int comment_no) {
        mapper.deleteQuestionCommentByNoAndUserNo(user_no, comment_no);
    }

    public ArrayList<ManualComment> getManualComments(int manual_no) {
        return mapper.getManualComments(manual_no);
    }

    public ArrayList<ManualComment> getManualRecommentByCommentNo(int comment_no) {
        return mapper.getManualRecommentByCommentNo(comment_no);
    }

    public ManualComment getBestManualComment(int manual_no) {
        return mapper.getBestManualComment(manual_no);
    }

    public ArrayList<TipsComment> getTipsComments(int tips_no) {
        return mapper.getTipsComments(tips_no);
    }

    public ArrayList<TipsComment> getTipsRecommentByCommentNo(int comment_no) {
        return mapper.getTipsRecommentByCommentNo(comment_no);
    }

    public TipsComment getBestTipsComment(int tips_no) {
        return mapper.getBestTipsComment(tips_no);
    }

    public void insertManualComment(ManualComment manualComment) {
        mapper.insertManualComment(manualComment);
    }

    public ManualComment getManualCommentByNo(int comment_no) {
        return mapper.getManualCommentByNo(comment_no);
    }

    public void insertTipsComment(TipsComment tipsComment) {
        mapper.insertTipsComment(tipsComment);
    }

    public TipsComment getTipsCommentByNo(int comment_no) {
        return mapper.getTipsCommentByNo(comment_no);
    }

    public void insertManualCommentReply(ManualComment manualComment) {
        mapper.insertManualCommentReply(manualComment);
    }

    public void insertTipsCommentReply(TipsComment tipsComment) {
        mapper.insertTipsCommentReply(tipsComment);
    }

    public void deleteManualCommentByNoAndUserNo(int user_no, int comment_no) {
        mapper.deleteManualCommentByNoAndUserNo(user_no, comment_no);
    }

    public void deleteTipsCommentByNoAndUserNo(int user_no, int comment_no) {
        mapper.deleteTipsCommentByNoAndUserNo(user_no, comment_no);
    }

    public void insertFarmCommentReply(FarmComment farmComment) {
        mapper.insertFarmCommentReply(farmComment);
    }

    public FarmComment getFarmCommentByNo(int comment_no) {
        return mapper.getFarmCommentByNo(comment_no);
    }

    public void insertFarmComment(FarmComment farmComment) {
        mapper.insertFarmComment(farmComment);
    }

    public void deleteFarmCommentByNoAndUserNo(int user_no, int comment_no) {
        mapper.deleteFarmCommentByNoAndUserNo(user_no, comment_no);
    }

    public ArrayList<FarmComment> getFarmComments(int farm_no) {
        return mapper.getFarmComments(farm_no);
    }

    public ArrayList<FarmComment> getFarmRecommentByCommentNo(int comment_no) {
        return mapper.getFarmRecommentByCommentNo(comment_no);
    }

    public FarmComment getBestFarmComment(int farm_no) {
        return mapper.getBestFarmComment(farm_no);
    }
}
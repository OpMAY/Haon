package com.service;

import com.dao.CommentDao;
import com.dao.ContentDao;
import com.model.FarmComment;
import com.model.content.board.BoardComment;
import com.model.content.common.Comment;
import com.model.content.common.UserContentTransaction;
import com.model.content.magazine.MagazineComment;
import com.model.content.manual.ManualComment;
import com.model.content.question.QuestionComment;
import com.model.content.tips.TipsComment;
import com.response.Message;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentDao commentDao;
    private final ContentDao contentDao;

    public ArrayList<BoardComment> getBoardComments(int board_no) {
        return commentDao.getBoardComments(board_no);
    }

    public ArrayList<BoardComment> getBoardRecommentByCommentNo(int comment_no) {
        return commentDao.getBoardRecommentByCommentNo(comment_no);
    }

    public BoardComment getBestBoardComment(int board_no) {
        return commentDao.getBestBoardComment(board_no);
    }

    public boolean isBestBoardComment(int board_no, int comment_no) {
        BoardComment boardComment = commentDao.getBestBoardComment(board_no);
        if (boardComment.getCount() != null && boardComment.getCount().intValue() != 0) {
            return boardComment.getNo() == comment_no;
        }
        return false;
    }

    public int insertBoardCommentReply(BoardComment boardComment) {
        commentDao.insertBoardCommentReply(boardComment);
        return boardComment.getNo();
    }

    public BoardComment getBoardCommentByNo(int comment_no) {
        return commentDao.getBoardCommentByNo(comment_no);
    }

    public void deleteBoardCommentByNoAndUserNo(int user_no, int comment_no) {
        commentDao.deleteBoardCommentByNoAndUserNo(user_no, comment_no);
    }

    public Message getMoreComments(String type, int content_no, int last_comment_no) {
        Message message = new Message();
        // types : BOARD, MAGAZINE, MANUAL, TIP, QUESTION
        // last_comment_no 기준 뒤의 것 5개
        // 마지막 comment 일 경우 is_last = true
        // content_no에 해당하는 content 검사, last_comment_no에 해당하는 comment 존재하는지 검사
        switch (type) {
            case "board":
                break;
            case "magazine":
                break;
            case "manual":
                break;
            case "tip":
                break;
            case "question":
                if (!contentDao.checkQuestionContentExists(content_no)) {
                    message.put("status", false);
                } else if (!commentDao.checkQuestionLastCommentExists(last_comment_no)) {
                    message.put("status", false);
                } else {
                    List<QuestionComment> questionComments = commentDao.getMoreQuestionComments(content_no, last_comment_no);
                    message.put("comments", questionComments);
                    message.put("status", !questionComments.isEmpty());
                }
                break;
            default:
                throw new RuntimeException();
        }
        return message;
    }

    public int insertBoardComment(BoardComment boardComment) {
        commentDao.insertBoardComment(boardComment);
        return boardComment.getNo();
    }

    public ArrayList<MagazineComment> getMagazineComments(int magazine_no) {
        return commentDao.getMagazineComments(magazine_no);
    }

    public ArrayList<MagazineComment> getMagazineRecommentByCommentNo(int comment_no) {
        return commentDao.getMagazineRecommentByCommentNo(comment_no);
    }

    public boolean isBestMagazineComment(int magazine_no, int comment_no) {
        MagazineComment magazineComment = commentDao.getBestMagazineComment(magazine_no);
        if (magazineComment.getCount() != null && magazineComment.getCount().intValue() != 0) {
            return magazineComment.getNo() == comment_no;
        }
        return false;
    }

    public int insertMagazineComment(MagazineComment magazineComment) {
        commentDao.insertMagazineComment(magazineComment);
        return magazineComment.getNo();
    }

    public MagazineComment getMagazineCommentByNo(int comment_no) {
        return commentDao.getMagazineCommentByNo(comment_no);
    }

    public int insertMagazineCommentReply(MagazineComment magazineComment) {
        commentDao.insertMagazineCommentReply(magazineComment);
        return magazineComment.getNo();
    }

    public void deleteMagazineCommentByNoAndUserNo(int user_no, int comment_no) {
        commentDao.deleteMagazineCommentByNoAndUserNo(user_no, comment_no);
    }

    public ArrayList<QuestionComment> getQuestionComments(int question_no) {
        return commentDao.getQuestionComments(question_no);
    }

    public ArrayList<QuestionComment> getQuestionRecommentByCommentNo(int comment_no) {
        return commentDao.getQuestionRecommentByCommentNo(comment_no);
    }

    public boolean isBestQuestionComment(int question_no, int comment_no) {
        QuestionComment questionComment = commentDao.getBestQuestionComment(question_no);
        if (questionComment.getCount() != null && questionComment.getCount().intValue() != 0) {
            return questionComment.getNo() == comment_no;
        }
        return false;
    }

    public int insertQuestionComment(QuestionComment questionComment) {
        commentDao.insertQuestionComment(questionComment);
        return questionComment.getNo();
    }

    public QuestionComment getQuestionCommentByNo(int comment_no) {
        return commentDao.getQuestionCommentByNo(comment_no);
    }

    public int insertQuestionCommentReply(QuestionComment questionComment) {
        commentDao.insertQuestionCommentReply(questionComment);
        return questionComment.getNo();
    }

    public void deleteQuestionCommentByNoAndUserNo(int user_no, int comment_no) {
        commentDao.deleteQuestionCommentByNoAndUserNo(user_no, comment_no);
    }

    public ArrayList<ManualComment> getManualComments(int manual_no) {
        return commentDao.getManualComments(manual_no);
    }

    public ArrayList<ManualComment> getManualRecommentByCommentNo(int comment_no) {
        return commentDao.getManualRecommentByCommentNo(comment_no);
    }

    public boolean isBestManualComment(int manual_no, int comment_no) {
        ManualComment manualComment = commentDao.getBestManualComment(manual_no);
        if (manualComment.getCount() != null && manualComment.getCount().intValue() != 0) {
            return manualComment.getNo() == comment_no;
        }
        return false;
    }

    public ArrayList<TipsComment> getTipsComments(int tips_no) {
        return commentDao.getTipsComments(tips_no);
    }

    public ArrayList<TipsComment> getTipsRecommentByCommentNo(int comment_no) {
        return commentDao.getTipsRecommentByCommentNo(comment_no);
    }

    public boolean isBestTipsComment(int tips_no, int comment_no) {
        TipsComment tipsComment = commentDao.getBestTipsComment(tips_no);
        if (tipsComment.getCount() != null && tipsComment.getCount().intValue() != 0) {
            return tipsComment.getNo() == comment_no;
        }
        return false;
    }

    public int insertManualComment(ManualComment manualComment) {
        commentDao.insertManualComment(manualComment);
        return manualComment.getNo();
    }

    public ManualComment getManualCommentByNo(int comment_no) {
        return commentDao.getManualCommentByNo(comment_no);
    }

    public int insertTipsComment(TipsComment tipsComment) {
        commentDao.insertTipsComment(tipsComment);
        return tipsComment.getNo();
    }

    public TipsComment getTipsCommentByNo(int comment_no) {
        return commentDao.getTipsCommentByNo(comment_no);
    }

    public int insertManualCommentReply(ManualComment manualComment) {
        commentDao.insertManualCommentReply(manualComment);
        return manualComment.getNo();
    }

    public int insertTipsCommentReply(TipsComment tipsComment) {
        commentDao.insertTipsCommentReply(tipsComment);
        return tipsComment.getNo();
    }

    public void deleteManualCommentByNoAndUserNo(int user_no, int comment_no) {
        commentDao.deleteManualCommentByNoAndUserNo(user_no, comment_no);
    }

    public void deleteTipsCommentByNoAndUserNo(int user_no, int comment_no) {
        commentDao.deleteTipsCommentByNoAndUserNo(user_no, comment_no);
    }

    public int insertFarmCommentReply(FarmComment farmComment) {
        commentDao.insertFarmCommentReply(farmComment);
        return farmComment.getNo();
    }

    public FarmComment getFarmCommentByNo(int comment_no) {
        return commentDao.getFarmCommentByNo(comment_no);
    }

    public int insertFarmComment(FarmComment farmComment) {
        commentDao.insertFarmComment(farmComment);
        return farmComment.getNo();
    }

    public void deleteFarmCommentByNoAndUserNo(int user_no, int comment_no) {
        commentDao.deleteFarmCommentByNoAndUserNo(user_no, comment_no);
    }

    public ArrayList<FarmComment> getFarmComments(int farm_no) {
        return commentDao.getFarmComments(farm_no);
    }

    public ArrayList<FarmComment> getFarmRecommentByCommentNo(int comment_no) {
        return commentDao.getFarmRecommentByCommentNo(comment_no);
    }

    public boolean isBestFarmComment(int farm_no, int comment_no) {
        FarmComment farmComment = commentDao.getBestFarmComment(farm_no);
        if (farmComment.getCount() != null && farmComment.getCount().intValue() != 0) {
            return farmComment.getNo() == comment_no;
        }
        return false;
    }

    public ArrayList<Comment> getCommentsMadeMe(int user_no) {
        return commentDao.getCommentsMadeMe(user_no);
    }

    public ArrayList<Comment> getCommentsByMe(int farm_no) {
        return commentDao.getCommentsByMe(farm_no);
    }

    public ArrayList<Comment> getRecommentByCommentNo(Comment comment) {
        return commentDao.getRecommentByCommentNo(comment);
    }

    public boolean isBestComment(Comment comment) {
        switch (comment.getType()) {
            case BOARD:
                BoardComment boardComment = commentDao.getBestBoardComment(comment.getCommunity_no());
                if (boardComment.getCount() != null && boardComment.getCount().intValue() != 0) {
                    return boardComment.getNo() == comment.getCommunity_no();
                }
                return false;
            case QUESTION:
                QuestionComment questionComment = commentDao.getBestQuestionComment(comment.getCommunity_no());
                if (questionComment.getCount() != null && questionComment.getCount().intValue() != 0) {
                    return questionComment.getNo() == comment.getCommunity_no();
                }
                return false;
            case MANUAL:
                ManualComment manualComment = commentDao.getBestManualComment(comment.getCommunity_no());
                if (manualComment.getCount() != null && manualComment.getCount().intValue() != 0) {
                    return manualComment.getNo() == comment.getCommunity_no();
                }
                return false;
            case TIP:
                TipsComment tipsComment = commentDao.getBestTipsComment(comment.getCommunity_no());
                if (tipsComment.getCount() != null && tipsComment.getCount().intValue() != 0) {
                    return tipsComment.getNo() == comment.getCommunity_no();
                }
                return false;
            case FARM:
                FarmComment farmComment = commentDao.getBestFarmComment(comment.getCommunity_no());
                if (farmComment.getCount() != null && farmComment.getCount().intValue() != 0) {
                    return farmComment.getNo() == comment.getCommunity_no();
                }
                return false;
            default:
                return false;
        }
    }
}

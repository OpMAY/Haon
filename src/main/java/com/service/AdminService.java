package com.service;

import com.dao.*;
import com.model.content.board.Board;
import com.model.content.manual.Manual;
import com.model.content.tips.Tips;
import com.model.global.Banner;
import com.model.global.UserBan;
import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
import com.model.global.keyword.SearchKeyword;
import com.response.Message;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdminService {
    private final UserBanDao userBanDao;
    private final BannerDao bannerDao;
    private final SearchKeywordDao searchKeywordDao;
    private final CommunityCategoryDao communityCategoryDao;
    private final ContentDao contentDao;
    private final CommentDao commentDao;
    private final TraceDao traceDao;
    private final BundleDao bundleDao;
    private final BundleTracesDao bundleTracesDao;
    private final UserDao userDao;
    private final FarmDao farmDao;

    // Ban
    public boolean isUserBan(int user_no) {
        return userBanDao.isUserBan(user_no);
    }

    @Transactional
    public void insertUserBan(UserBan userBan) {
        Message message = new Message();
        if (userBan != null) {
            if (!userBanDao.isUserBan(userBan.getUser_no())) {
                userBanDao.insertUserBan(userBan);
            } else {
                message.put("status", false);
            }
        } else {
            message.put("status", false);
        }
    }

    @Transactional
    public void removeUserBan(int user_no) {
        userBanDao.removeUserBan(user_no);
    }

    // 배너 (GET 함수는 mainService에 있음)
    @Transactional
    public void insertBanner(Banner banner) {
        bannerDao.insertBanner(banner);
    }

    @Transactional
    public void removeBanner(int banner_no) {
        bannerDao.removeBanner(banner_no);
    }

    @Transactional
    public void updateBanner(Banner banner) {
        bannerDao.updateBanner(banner);
    }

    // Search Keywords
    public List<SearchKeyword> getAllKeywords() {
        return searchKeywordDao.getAllKeywords();
    }

    @Transactional
    public void updateSearchKeyword(SearchKeyword searchKeyword) {
        searchKeywordDao.updateSearchKeyword(searchKeyword);
    }

    // Category

    @Transactional
    public void updateCategory(CommunityCategory category) {
        communityCategoryDao.updateCategory(category);
    }

    public List<CommunityCategory> getAllCategories() {
        return communityCategoryDao.getAllCategories();
    }

    public List<Banner> getBanners() {
        return bannerDao.getBanners();
    }

    public CommunityCategory getCommunityCategory(CATEGORY_TYPE type) {
        return communityCategoryDao.getCommunityCategory(type);
    }

    public ArrayList<Board> getAllBoards() {
        return contentDao.getAllBoards();
    }

    public void deleteBoard(int board_no) {
        contentDao.deleteBoard(board_no);
    }

    public void updateBoard(Board board) {
        contentDao.updateBoard(board);
    }

    public void updateBoardBlockByCommentNo(int comment_no, boolean block) {
        contentDao.updateBoardBlockByCommentNo(comment_no, block);
    }

    public void updateQuestionBlockByCommentNo(int comment_no, boolean block) {
        contentDao.updateQuestionBlockByCommentNo(comment_no, block);
    }

    public void updateTipBlockByCommentNo(int comment_no, boolean block) {
        contentDao.updateTipBlockByCommentNo(comment_no, block);
    }

    public void updateManualBlockByCommentNo(int comment_no, boolean block) {
        contentDao.updateManualBlockByCommentNo(comment_no, block);
    }

    public void updateMagazineBlockByCommentNo(int comment_no, boolean block) {
        contentDao.updateMagazineBlockByCommentNo(comment_no, block);
    }

    public void updateFarmBlockByCommentNo(int comment_no, boolean block) {
        contentDao.updateFarmBlockByCommentNo(comment_no, block);
    }

    public ArrayList<Tips> getAllTips() {
        return contentDao.getAllTips();
    }

    public void updateTip(Tips tip) {
        contentDao.updateTips(tip);
    }

    public void deleteQuestion(int question_no) {
        contentDao.deleteQuestion(question_no);
    }

    public void deleteTip(int tip_no) {
        contentDao.deleteTip(tip_no);
    }

    public void deleteManual(int manual_no) {
        contentDao.deleteManual(manual_no);
    }

    public void deleteMagazine(int magazine_no) {
        contentDao.deleteMagazine(magazine_no);
    }

    public ArrayList<Manual> getAllManuals() {
        return contentDao.getAllManuals();
    }

    public void updateManual(Manual manual) {
        contentDao.updateManual(manual);
    }
}

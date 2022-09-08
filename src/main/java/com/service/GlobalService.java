package com.service;

import com.dao.*;
import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import com.model.global.Banner;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class GlobalService {
    private final BannerDao bannerDao;
    private final UserDao userDao;
    private final FarmDao farmDao;
    private final ContentDao contentDao;
    private final LikeDao likeDao;
    private final BookmarkDao bookmarkDao;

    public ModelAndView getMain(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        /**
         * 1. 배너
         * 2. 추천 게시글
         * 3. 키워드
         * 4. board
         * 5. tips
         * 6. manual
         * 7. magazine
         * 8. questions
         * 9. farms
         * **/
        List<Banner> banners = bannerDao.getBanners();
        // TODO 추천 게시글 Format?
        // TODO Keywords
        List<Board> live_boards = contentDao.getLiveBoards();
        List<Tips> tips = contentDao.getMainTips();
        List<Manual> manuals = contentDao.getMainManuals();
        List<Magazine> magazines = contentDao.getMainMagazines();
        List<QuestionSummary> questions = contentDao.getMainQuestions();
        return view;
    }
}

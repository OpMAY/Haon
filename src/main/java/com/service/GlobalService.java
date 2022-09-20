package com.service;

import com.dao.*;
import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import com.model.farm.Farm;
import com.model.global.Banner;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
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

    private final EncryptionService encryptionService;

    public ModelAndView getMain(HttpServletRequest request) {
        ModelAndView view = new ModelAndView("main/home");
        /**
         * 1. 배너 O
         * 2. 추천 게시글
         * 3. 키워드
         * 4. board O
         * 5. tips O
         * 6. manual O
         * 7. magazine O
         * 8. questions O
         * 9. farms O
         * **/
        List<Banner> banners = bannerDao.getBanners();
        // TODO 추천 게시글 Format?
        // TODO Keywords
        List<Board> live_boards = contentDao.getLiveBoards();
        List<Tips> tips = contentDao.getMainTips();
        List<Manual> manuals = contentDao.getMainManuals();
        List<Magazine> magazines = contentDao.getMainMagazines();
        List<QuestionSummary> questions = contentDao.getMainQuestions();
        List<Farm> farms = farmDao.getMainFarms();
        Integer userNo = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());

        if (userNo != null) {
            // Like 및 Scrap 정보 by user
            for (Board board : live_boards) {
                board.set_bookmark(bookmarkDao.isBoardBookmarkByUserNo(board.getNo(), userNo));
            }

            for (Magazine magazine : magazines) {
                magazine.set_bookmark(bookmarkDao.isMagazineBookmarkByUserNo(magazine.getNo(), userNo));
            }

            for (QuestionSummary questionSummary : questions) {
                questionSummary.getQuestion().set_bookmark(bookmarkDao.isQuestionBookmarkByUserNo(questionSummary.getQuestion().getNo(), userNo));
            }

            for (Farm farm : farms) {
                farm.set_bookmark(bookmarkDao.isFarmBookmarkByUserNo(farm.getNo(), userNo));
            }
        }

        for (Tips tip : tips) {
            if (userNo != null)
                tip.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(tip.getNo(), userNo));
            tip.setProfile_image(farmDao.getFarmByNo(tip.getFarm_no()).getProfile_image());
        }

        for (Manual manual : manuals) {
            if (userNo != null)
                manual.set_bookmark(bookmarkDao.isManualBookmarkByUserNo(manual.getNo(), userNo));
            manual.setProfile_image(farmDao.getFarmByNo(manual.getFarm_no()).getProfile_image());
        }

        view.addObject("banners", banners);
        view.addObject("live_boards", live_boards);
        view.addObject("tips", tips);
        view.addObject("manuals", manuals);
        view.addObject("magazines", magazines);
        view.addObject("questions", questions);
        view.addObject("farms", farms);
        return view;
    }

    public boolean checkFarm(int user_no) {
        return farmDao.getFarm(user_no);
    }
}

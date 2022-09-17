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
        view.addObject("banners", banners);
        view.addObject("live_boards", live_boards);
        view.addObject("tips", tips);
        view.addObject("manuals", manuals);
        view.addObject("magazines", magazines);
        view.addObject("questions", questions);
        view.addObject("farms", farms);
//        HashMap<String, Object> hashMap = new EncryptionService().decryptJWT(request.getSession().getAttribute(JWTEnum.JWTToken.name()).toString());
//        Integer userNo = (Integer) hashMap.get(JWTEnum.NO.name());
//        if (userNo != null) {
//            // TODO Like 및 Scrap 정보 by user
//        }
        return view;
    }

    public boolean checkFarm(int user_no) {
        return farmDao.getFarm(user_no);
    }
}

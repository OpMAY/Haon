package com.controller;

import com.dao.BookmarkDao;
import com.dao.SearchKeywordDao;
import com.model.content.board.Board;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.QuestionSummary;
import com.model.content.tips.Tips;
import com.model.farm.Farm;
import com.model.global.keyword.SearchKeyword;
import com.service.ContentService;
import com.service.GlobalService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {
    private final GlobalService globalService;
    private final ContentService contentService;
    private final SearchKeywordDao searchKeywordDao;
    private final EncryptionService encryptionService;
    private final BookmarkDao bookmarkDao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView mainHomePage(HttpServletRequest request) {
        return globalService.getMain(request);
    }

    @RequestMapping(value = "/search/{query}", method = RequestMethod.GET)
    public ModelAndView searchResultPage(HttpServletRequest request, @PathVariable("query") String query) {
        ModelAndView VIEW = new ModelAndView("main/search");
        /**
         * TODO SEARCH RESULT
         * 1. 테마 별 키워드
         * 2. 자유 게시판
         * 3. 팁과 노하우
         * 4. 축산 메뉴얼
         * 5. 축산 매거진
         * 6. 질문과 답변
         * 7. 다양한 축산농가
         * 8. 각자 리로딩 ?
         * */
        try {
            query = URLDecoder.decode(query, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        List<Board> boards = contentService.getBoardSearchResult(query, 0);
        List<Tips> tips = contentService.getTipsSearchResult(query, 0);
        List<Manual> manuals = contentService.getManualSearchResult(query, 0);
        List<Magazine> magazines = contentService.getMagazineSearchResult(query, 0);
        List<QuestionSummary> questions = contentService.getQuestionSearchResult(query, 0);
        List<Farm> farms = contentService.getFarmSearchResult(query, 0);
        if(user_no != null) {
            for(Tips tip : tips) {
                tip.set_bookmark(bookmarkDao.isTipBookmarkByUserNo(tip.getNo(), user_no));
            }

            for(Manual manual : manuals) {
                manual.set_bookmark(bookmarkDao.isManualBookmarkByUserNo(manual.getNo(), user_no));
            }

            for(Magazine magazine : magazines) {
                magazine.set_bookmark(bookmarkDao.isMagazineBookmarkByUserNo(magazine.getNo(), user_no));
            }

            for(Farm farm : farms) {
                farm.set_bookmark(bookmarkDao.isFarmBookmarkByUserNo(farm.getNo(), user_no));
            }
        }
        List<SearchKeyword> keywords = searchKeywordDao.getAllKeywords();
        VIEW.addObject("boards", boards);
        VIEW.addObject("tips", tips);
        VIEW.addObject("manuals", manuals);
        VIEW.addObject("magazines", magazines);
        VIEW.addObject("questions", questions);
        VIEW.addObject("farms", farms);
        VIEW.addObject("query", query);
        VIEW.addObject("keywords", keywords);
        return VIEW;
    }
}

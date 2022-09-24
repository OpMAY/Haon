package com.controller;

import com.aws.file.FileUploadUtility;
import com.model.common.MFile;
import com.model.content.board.Board;
import com.model.content.common.BOOKMARK_TYPE;
import com.model.content.common.COMMENT_TYPE;
import com.model.content.common.ContentForm;
import com.model.content.magazine.Magazine;
import com.model.content.manual.Manual;
import com.model.content.question.Question;
import com.model.content.tips.Tips;
import com.model.farm.Farm;
import com.service.ContentService;
import com.service.FarmService;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.Format;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final ContentService contentService;
    private final FileUploadUtility fileUploadUtility;
    private final EncryptionService encryptionService;
    private final UserService userService;
    private final FarmService farmService;

    @RequestMapping(value = "/alarm", method = RequestMethod.GET)
    public ModelAndView userAlarmPage() {
        ModelAndView VIEW = new ModelAndView("user/alarm");
        return VIEW;
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.GET)
    public ModelAndView getBoardWrite() {
        ModelAndView VIEW = new ModelAndView("user/board-write");
        return VIEW;
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.POST)
    public ModelAndView postBoardWrite(HttpServletRequest request, ContentForm contentForm) {
        ModelAndView VIEW = new ModelAndView("user/board-write");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        contentForm.setFarm_no(farm.getNo());
        contentForm.setContent(Format.summernoteReplaceCharacter(contentForm.getContent()));
        switch (contentForm.getCommunity_type()) {
            case BOARD:
            case QUESTION:
                contentService.insertCommunity(contentForm);
                VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                VIEW.addObject("status", true);
                break;
            case TIP:
            case MANUAL:
            case MAGAZINE:
                if (contentForm.getFile() != null && contentForm.getFile().getSize() != 0) {
                    MFile thumbnail = fileUploadUtility.uploadFile(contentForm.getFile(), "/board/");
                    contentService.insertCommunityThumbnail(contentForm, thumbnail);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                } else {
                    VIEW.addObject("message", "섬네일을 올바르게 설정해주세요.");
                    VIEW.addObject("status", false);
                }
                break;
            default:
                VIEW.addObject("message", "게시판 타입을 올바르게 설정해주세요.");
                VIEW.addObject("status", false);
        }
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{type}/{no}", method = RequestMethod.GET)
    public ModelAndView getBoardUpdate(@PathVariable COMMENT_TYPE type, @PathVariable int no) {
        ModelAndView VIEW = new ModelAndView("user/board-update");
        /*TODO This Board Detail Update*/
        ContentForm contentForm = null;
        switch (type) {
            case BOARD:
                contentForm = contentService.getContentFormByBoardNo(no);
                break;
            case QUESTION:
                contentForm = contentService.getContentFormByQuestionNo(no);
                break;
            case MAGAZINE:
                contentForm = contentService.getContentFormByMagazineNo(no);
                break;
            case MANUAL:
                contentForm = contentService.getContentFormByManualNo(no);
                break;
            case TIP:
                contentForm = contentService.getContentFormByTipNo(no);
                break;
        }
        contentForm.setCommunity_type(type);
        VIEW.addObject("contentForm", contentForm);
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{no}", method = RequestMethod.POST)
    public ModelAndView postBoardUpdate(HttpServletRequest request, ContentForm contentForm) {
        ModelAndView VIEW = new ModelAndView("/user/board-update");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Farm farm = farmService.getFarmByUserNo(user_no);
        contentForm.setFarm_no(farm.getNo());
        contentForm.setContent(Format.summernoteReplaceCharacter(contentForm.getContent()));
        log.info("contentForm -> {}", contentForm);
        switch (contentForm.getCommunity_type()) {
            case BOARD:
            case QUESTION:
                contentService.updateCommunity(contentForm);
                VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                VIEW.addObject("status", true);
                break;
            case TIP:
            case MANUAL:
            case MAGAZINE:
                if (contentForm.getFile() != null && contentForm.getFile().getSize() != 0) {
                    MFile thumbnail = fileUploadUtility.uploadFile(contentForm.getFile(), "/board/");
                    contentService.updateCommunityThumbnail(contentForm, thumbnail);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                } else {
                    contentService.updateCommunityThumbnail(contentForm, null);
                    VIEW.addObject("message", "게시글 등록이 완료되었습니다.");
                    VIEW.addObject("status", true);
                }
                break;
            default:
                VIEW.addObject("message", "게시판 타입을 올바르게 설정해주세요.");
                VIEW.addObject("status", false);
        }
        VIEW.addObject("contentForm", contentForm);
        return VIEW;
    }

    @RequestMapping(value = "/bookmark", method = RequestMethod.GET)
    public ModelAndView getBookmark(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("user/bookmark");

        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());

        ArrayList<Board> boards = contentService.getBookmarkBoards(user_no);
        ArrayList<Tips> tips = contentService.getBookmarkTips(user_no);
        for (Tips tip : tips) {
            tip.setProfile_image(farmService.getFarmByFarmNo(tip.getFarm_no()).getProfile_image());
        }
        ArrayList<Manual> manuals = contentService.getBookmarkManuals(user_no);
        for (Manual manual : manuals) {
            manual.setProfile_image(farmService.getFarmByFarmNo(manual.getFarm_no()).getProfile_image());
        }
        ArrayList<Question> questions = contentService.getBookmarkQuestions(user_no);
        ArrayList<Magazine> magazines = contentService.getBookmarkMagazines(user_no);
        for (Magazine magazine : magazines) {
            magazine.setProfile_image(farmService.getFarmByFarmNo(magazine.getFarm_no()).getProfile_image());
        }

        VIEW.addObject("boards", boards);
        VIEW.addObject("tips", tips);
        VIEW.addObject("manuals", manuals);
        VIEW.addObject("questions", questions);
        VIEW.addObject("magazines", magazines);
        return VIEW;
    }

    @RequestMapping(value = "/farm/manage", method = RequestMethod.GET)
    public ModelAndView getFarmDetailManage(HttpServletRequest request) {
        ModelAndView VIEW = new ModelAndView("user/farm-manage");
        return VIEW;
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView userHomePage() {
        ModelAndView VIEW = new ModelAndView("user/home");
        return VIEW;
    }

    @RequestMapping(value = "/package/trace", method = RequestMethod.GET)
    public ModelAndView userPackageTracePage() {
        ModelAndView VIEW = new ModelAndView("user/package-trace");
        return VIEW;
    }

    @RequestMapping(value = "/trace", method = RequestMethod.GET)
    public ModelAndView userTracePage() {
        ModelAndView VIEW = new ModelAndView("user/trace");
        return VIEW;
    }

    @RequestMapping(value = "/unregister", method = RequestMethod.GET)
    public ModelAndView userUnregisterPage() {
        ModelAndView VIEW = new ModelAndView("user/unregister");
        return VIEW;
    }
}

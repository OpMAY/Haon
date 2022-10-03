package com.controller;

import com.aws.file.FileUploadUtility;
import com.aws.model.CDNUploadPath;
import com.google.gson.Gson;
import com.model.User;
import com.model.common.MFile;
import com.model.global.Banner;
import com.model.global.category.CommunityCategory;
import com.model.global.keyword.SearchKeyword;
import com.model.jwt.RootUser;
import com.service.AdminService;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
    private ModelAndView VIEW;
    private final EncryptionService encryptionService;
    private final UserService userService;
    private final AdminService adminService;
    private final FileUploadUtility fileUploadUtility;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLogin(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/auth/login");
        return VIEW;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView postLogin(HttpServletRequest request, User user) {
        VIEW = new ModelAndView("admin/auth/login");
        try {
            String token = encryptionService.encryptSHA256(user.getId());
            User admin = userService.getUserByNo(user.getNo());
            if (admin.getEmail().equals(user.getEmail()) && token.equals(admin.getId())) {
                VIEW.addObject("user", user);
                VIEW.addObject("status", true);
                VIEW.addObject("message", "로그인에 성공하셧습니다.");
                user.setId(admin.getId());
                request.getSession().setAttribute(JWTEnum.ADMIN.name(), encryptionService.encryptJWT(user));
                log.info(encryptionService.encryptJWT(user).toString());
            } else {
                VIEW.addObject("user", user);
                VIEW.addObject("status", false);
                VIEW.addObject("message", "로그인에 실패하였습니다. 이메일과 패스워드를 다시 확인해주세요.");
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return VIEW;
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView dashboard(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/dashboard");
        return VIEW;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUserFarms(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/farm/user-farm-manage");
        return VIEW;
    }

    @RequestMapping(value = "/user/detail/{user_no}", method = RequestMethod.GET)
    public ModelAndView getUserDetail(HttpServletRequest request, @PathVariable("user_no") Integer user_no) {
        VIEW = new ModelAndView("admin/farm/user-farm-detail");
        return VIEW;
    }

    @RequestMapping(value = "/boards", method = RequestMethod.GET)
    public ModelAndView getBoards(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/boards");
        return VIEW;
    }

    @RequestMapping(value = "/board/detail/{board_no}", method = RequestMethod.GET)
    public ModelAndView getBoardDetail(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        VIEW = new ModelAndView("admin/community/board-detail");
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{board_no}", method = RequestMethod.GET)
    public ModelAndView getBoardUpdate(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        VIEW = new ModelAndView("admin/community/board-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/board/update/{board_no}", method = RequestMethod.POST)
    public ModelAndView postBoardUpdate(HttpServletRequest request, @PathVariable("board_no") int board_no) {
        VIEW = new ModelAndView("admin/community/board-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/questions", method = RequestMethod.GET)
    public ModelAndView getQuestions(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/questions");
        return VIEW;
    }

    @RequestMapping(value = "/question/detail/{question_no}", method = RequestMethod.GET)
    public ModelAndView getQuestionDetail(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        VIEW = new ModelAndView("admin/community/question-detail");
        return VIEW;
    }

    @RequestMapping(value = "/question/update/{question_no}", method = RequestMethod.GET)
    public ModelAndView getQuestionUpdate(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        VIEW = new ModelAndView("admin/community/question-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/question/update/{question_no}", method = RequestMethod.POST)
    public ModelAndView postQuestionUpdate(HttpServletRequest request, @PathVariable("question_no") int question_no) {
        VIEW = new ModelAndView("admin/community/question-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/tips", method = RequestMethod.GET)
    public ModelAndView getTips(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/tips");
        return VIEW;
    }

    @RequestMapping(value = "/tip/detail/{question_no}", method = RequestMethod.GET)
    public ModelAndView getTipDetail(HttpServletRequest request, @PathVariable("tip_no") int tip_no) {
        VIEW = new ModelAndView("admin/community/tip-detail");
        return VIEW;
    }

    @RequestMapping(value = "/tip/update/{tip_no}", method = RequestMethod.GET)
    public ModelAndView getTipUpdate(HttpServletRequest request, @PathVariable("tip_no") int tip_no) {
        VIEW = new ModelAndView("admin/community/tip-detail");
        return VIEW;
    }

    @RequestMapping(value = "/tip/update/{tip_no}", method = RequestMethod.POST)
    public ModelAndView postTipUpdate(HttpServletRequest request, @PathVariable("tip_no") int tip_no) {
        VIEW = new ModelAndView("admin/community/tip-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/manuals", method = RequestMethod.GET)
    public ModelAndView getManuals(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/manuals");
        return VIEW;
    }

    @RequestMapping(value = "/manual/detail/{manual_no}", method = RequestMethod.GET)
    public ModelAndView getManualDetail(HttpServletRequest request, @PathVariable("manual_no") int manual_no) {
        VIEW = new ModelAndView("admin/community/manual-detail");
        return VIEW;
    }

    @RequestMapping(value = "/manual/update/{manual_no}", method = RequestMethod.GET)
    public ModelAndView getManualUpdate(HttpServletRequest request, @PathVariable("manual_no") int manual_no) {
        VIEW = new ModelAndView("admin/community/manual-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/manual/update/{manual_no}", method = RequestMethod.POST)
    public ModelAndView postManualUpdate(HttpServletRequest request, @PathVariable("manual_no") int manual_no) {
        VIEW = new ModelAndView("admin/community/manual-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/magazines", method = RequestMethod.GET)
    public ModelAndView getMagazines(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/magazines");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/detail/{magazine_no}", method = RequestMethod.GET)
    public ModelAndView getMagazineDetail(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        VIEW = new ModelAndView("admin/community/magazine-detail");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/update/{magazine_no}", method = RequestMethod.GET)
    public ModelAndView getMagazineUpdate(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        VIEW = new ModelAndView("admin/community/magazine-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/update/{magazine_no}", method = RequestMethod.POST)
    public ModelAndView postMagazineUpdate(HttpServletRequest request, @PathVariable("magazine_no") int magazine_no) {
        VIEW = new ModelAndView("admin/community/magazine-detail-create");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/create", method = RequestMethod.GET)
    public ModelAndView getMagazineCreate(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/magazine-detail-create");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/create", method = RequestMethod.POST)
    public ModelAndView postMagazineCreate(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/community/magazine-detail-create");
        return VIEW;
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    public ModelAndView getCategories(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/category/categories");
        ArrayList<CommunityCategory> communityCategories = (ArrayList<CommunityCategory>) adminService.getAllCategories();
        VIEW.addObject("communityCategories", communityCategories);
        return VIEW;
    }

    @RequestMapping(value = "/trace/traces", method = RequestMethod.GET)
    public ModelAndView getTraces(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/trace/traces");
        return VIEW;
    }

    @RequestMapping(value = "/trace/detail/trace/{trace_no}", method = RequestMethod.GET)
    public ModelAndView getTraceDetail(HttpServletRequest request, @PathVariable("trace_no") int trace_no) {
        VIEW = new ModelAndView("admin/trace/trace-detail");
        return VIEW;
    }

    @RequestMapping(value = "/trace/update/{trace_no}", method = RequestMethod.GET)
    public ModelAndView getTraceUpdate(HttpServletRequest request, @PathVariable("trace_no") int trace_no) {
        VIEW = new ModelAndView("admin/trace/trace-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/trace/update/{trace_no}", method = RequestMethod.POST)
    public ModelAndView postTraceUpdate(HttpServletRequest request, @PathVariable("trace_no") int trace_no) {
        VIEW = new ModelAndView("admin/trace/trace-detail-update");
        return VIEW;
    }

    @RequestMapping(value = "/trace/bundles", method = RequestMethod.GET)
    public ModelAndView getBundles(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/trace/trace-bundles");
        return VIEW;
    }

    @RequestMapping(value = "/trace/detail/bundle/{bundle_no}", method = RequestMethod.GET)
    public ModelAndView getBundleDetail(HttpServletRequest request, @PathVariable("bundle_no") int bundle_no) {
        VIEW = new ModelAndView("admin/trace/trace-bundle-detail");
        return VIEW;
    }

    @RequestMapping(value = "/banners", method = RequestMethod.GET)
    public ModelAndView getBanners(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/banner/banner-manage");
        ArrayList<Banner> banners = (ArrayList<Banner>) adminService.getBanners();
        VIEW.addObject("banners", banners);
        return VIEW;
    }

    @RequestMapping(value = "/banners/banner/update/{no}", method = RequestMethod.POST)
    public ModelAndView updateBanner(HttpServletRequest request, Banner banner, MultipartFile file) {
        if (file != null && file.getSize() != 0) {
            log.info("file -> {}", file.getOriginalFilename());
            log.info("file -> {}", file.getSize());
            log.info("file -> {}", file.getName());
            log.info("file -> {}", file.getContentType());
            MFile banner_image = fileUploadUtility.uploadFile(file, CDNUploadPath.BANNER.getPath());
            banner.setBanner_image(banner_image);
        } else {
            banner.setBanner_image(new Gson().fromJson(banner.getOrigin_banner_image(), MFile.class));
        }
        log.info(banner.toString());
        adminService.updateBanner(banner);
        request.setAttribute("status", true);
        request.setAttribute("message", "해당 배너를 업데이트 하였습니다.");
        return getBanners(request);
    }

    @RequestMapping(value = "/banners/banner/create", method = RequestMethod.POST)
    public ModelAndView createBanner(HttpServletRequest request, Banner banner, MultipartFile file) {
        if (file != null && file.getSize() != 0) {
            log.info("file -> {}", file.getOriginalFilename());
            log.info("file -> {}", file.getSize());
            log.info("file -> {}", file.getName());
            log.info("file -> {}", file.getContentType());
            MFile banner_image = fileUploadUtility.uploadFile(file, CDNUploadPath.BANNER.getPath());
            banner.setBanner_image(banner_image);
            adminService.insertBanner(banner);
            request.setAttribute("status", true);
            request.setAttribute("message", "배너를 생성 하였습니다.");
        } else {
            request.setAttribute("status", false);
            request.setAttribute("message", "배너를 생성할 수 없습니다.");
        }
        log.info(banner.toString());
        return getBanners(request);
    }

    @RequestMapping(value = "/search/keywords", method = RequestMethod.GET)
    public ModelAndView getSearchKeywords(HttpServletRequest request) {
        VIEW = new ModelAndView("admin/search/search");
        ArrayList<SearchKeyword> searchKeywords = (ArrayList<SearchKeyword>) adminService.getAllKeywords();
        VIEW.addObject("recommend", searchKeywords.get(0));
        VIEW.addObject("search", searchKeywords.get(1));
        return VIEW;
    }
}

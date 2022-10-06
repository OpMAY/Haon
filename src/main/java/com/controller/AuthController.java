package com.controller;

import com.api.LoginAPI;
import com.api.sns.kakao.KakaoAPI;
import com.api.sns.kakao.KakaoInfo;
import com.aws.file.FileUploadUtility;
import com.aws.model.CDNUploadPath;
import com.dao.UserDao;
import com.model.Agree;
import com.model.User;
import com.model.common.MFile;
import com.model.farm.FARM_TYPE;
import com.model.farm.Farm;
import com.response.DefaultRes;
import com.service.FarmService;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.Folder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AuthController {
    private final LoginAPI loginAPI;
    private final FileUploadUtility fileUploadUtility;
    private final FarmService farmService;
    private final UserService userService;
    private final EncryptionService encryptionService;
    private final KakaoAPI kakaoAPI;
    @Value("${DEFAULT.PROFILE.IMAGE.URL}")
    private String DEFAULT_PROFILE_IMAGE_URL;
    @Value("${DEFAULT.PROFILE.IMAGE.NAME}")
    private String DEFAULT_PROFILE_IMAGE_NAME;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView getRegister() {
        ModelAndView VIEW = new ModelAndView("auth/register");
        return VIEW;
    }

    @RequestMapping(value = "/{type}/intro", method = RequestMethod.GET)
    public ModelAndView getRegisterIntro(HttpServletRequest request, @PathVariable("type") FARM_TYPE farm_type) {
        ModelAndView VIEW = new ModelAndView("auth/register-intro");
        KakaoInfo kakaoInfo = kakaoAPI.getUser(encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.TOKEN.name()));
        VIEW.addObject("default_profile_url", kakaoInfo.getProperties().getProfile_image() != null ? kakaoInfo.getProperties().getProfile_image() : kakaoInfo.getProperties().getThumbnail_image() != null ? kakaoInfo.getProperties().getThumbnail_image() : DEFAULT_PROFILE_IMAGE_URL);
        VIEW.addObject("type", farm_type);
        return VIEW;
    }

    @RequestMapping(value = "/{type}/intro", method = RequestMethod.POST)
    public ModelAndView postRegisterIntro(HttpServletRequest request, Farm farm, @PathVariable("type") FARM_TYPE farm_type) {
        ModelAndView VIEW = new ModelAndView("auth/register-intro");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        farm.setType(farm_type);
        farm.setUser_no(user_no);
        MFile profile_image = null;
        if (farm.getProfile_image().getFile() != null && farm.getProfile_image().getFile().getSize() != 0) {
            profile_image = fileUploadUtility.uploadFile(farm.getProfile_image().getFile(), CDNUploadPath.USER.getPath() + user_no + "/profile/");
        } else {
            KakaoInfo kakaoInfo = kakaoAPI.getUser(encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.TOKEN.name()));
            profile_image = new MFile();
            profile_image.setName("default_profile_image");
            profile_image.setSize(0L);
            profile_image.setUrl(kakaoInfo.getProperties().getProfile_image() != null ? kakaoInfo.getProperties().getProfile_image() : kakaoInfo.getProperties().getThumbnail_image() != null ? kakaoInfo.getProperties().getThumbnail_image() : DEFAULT_PROFILE_IMAGE_URL);
            profile_image.setType("image");
        }
        farm.setProfile_image(profile_image);
        MFile farm_image = fileUploadUtility.uploadFile(farm.getFarm_image().getFile(), CDNUploadPath.USER.getPath() + user_no + "/farm/");
        farm.setFarm_image(farm_image);
        farmService.insertFarm(farm);
        VIEW.addObject("status", true);
        return VIEW;
    }

    @RequestMapping(value = "/type", method = RequestMethod.GET)
    public ModelAndView getRegisterType() {
        ModelAndView VIEW = new ModelAndView("auth/register-type");
        return VIEW;
    }

    @RequestMapping(value = "/type", method = RequestMethod.POST)
    public ModelAndView postRegisterType(FARM_TYPE FARM_TYPE) {
        ModelAndView VIEW = new ModelAndView("auth/register-type");
        log.info(FARM_TYPE.toString());
        VIEW.addObject("status", true);
        VIEW.addObject("type", FARM_TYPE);
        return VIEW;
    }

    @RequestMapping(value = "/oauth/callback", method = RequestMethod.GET)
    public ModelAndView kakaoLoginCallBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView VIEW = new ModelAndView("auth/register");
        User user = loginAPI.apiLoginInit(request);
        if (!userService.isRegistered(user.getId())) {
            //test code
            user.setAgree(new Agree());
            userService.register(user);
            VIEW.addObject("type", "register");
        } else {
            user.setAgree(new Agree());
            userService.updateUser(user);
            VIEW.addObject("type", "login");
        }
        int user_no = userService.getUserById(user.getId());
        user.setNo(user_no);
        request.getSession().setAttribute(JWTEnum.JWTToken.name(), encryptionService.encryptJWT(user));
        VIEW.addObject("status", Boolean.TRUE);
        return VIEW;
    }
}

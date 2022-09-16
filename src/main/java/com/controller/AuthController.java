package com.controller;

import com.api.LoginAPI;
import com.model.Agree;
import com.model.User;
import com.response.DefaultRes;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
    private final UserService userService;
    private final EncryptionService encryptionService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView getRegister() {
        ModelAndView VIEW = new ModelAndView("auth/register");
        return VIEW;
    }

    @RequestMapping(value = "/intro", method = RequestMethod.GET)
    public ModelAndView getRegisterIntro() {
        ModelAndView VIEW = new ModelAndView("auth/register-intro");
        return VIEW;
    }

    @RequestMapping(value = "/type", method = RequestMethod.GET)
    public ModelAndView authRegisterTypePage() {
        ModelAndView VIEW = new ModelAndView("auth/register-type");
        return VIEW;
    }

    @RequestMapping(value = "/oauth/callback", method = RequestMethod.GET)
    public ModelAndView kakaoLoginCallBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView VIEW = new ModelAndView("auth/register");
        User user = loginAPI.apiLoginInit(request);
        log.info(user.toString());
        if (!userService.isRegistered(user.getEmail())) {
            //test code
            user.setAgree(new Agree());
            userService.register(user);
        } else {

        }
        request.getSession().setAttribute(JWTEnum.JWTToken.name(), encryptionService.encryptJWT(user));
        VIEW.addObject("status", Boolean.TRUE);
        return VIEW;
    }
}

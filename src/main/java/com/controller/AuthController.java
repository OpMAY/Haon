package com.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AuthController {
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView authRegisterPage() {
        ModelAndView VIEW = new ModelAndView("auth/register");
        return VIEW;
    }

    @RequestMapping(value = "/intro", method = RequestMethod.GET)
    public ModelAndView authRegisterIntroPage() {
        ModelAndView VIEW = new ModelAndView("auth/register-intro");
        return VIEW;
    }

    @RequestMapping(value = "/type", method = RequestMethod.GET)
    public ModelAndView authRegisterTypePage() {
        ModelAndView VIEW = new ModelAndView("auth/register-type");
        return VIEW;
    }
}

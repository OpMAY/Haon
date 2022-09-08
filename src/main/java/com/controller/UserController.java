package com.controller;

import com.service.ContentService;
import com.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final ContentService contentService;
    @RequestMapping(value = "/auth/register", method = RequestMethod.GET)
    public ModelAndView registerPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/auth/register/type", method = RequestMethod.GET)
    public ModelAndView registerTypePage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/auth/register/intro", method = RequestMethod.GET)
    public ModelAndView registerIntroPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/home", method = RequestMethod.GET)
    public ModelAndView userHome() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/bookmarks", method = RequestMethod.GET)
    public ModelAndView userBookmarks() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/alarm", method = RequestMethod.GET)
    public ModelAndView userAlarm() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/withdrawal", method = RequestMethod.GET)
    public ModelAndView userWithdrawal() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/traces", method = RequestMethod.GET)
    public ModelAndView userTraces() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/farm/detail", method = RequestMethod.GET)
    public ModelAndView userFarmDetail() {
        // user Farm edit page
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/user/write/content", method = RequestMethod.GET)
    public ModelAndView userContentWritePage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

}

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
@RequestMapping("/user")
public class UserController {
    @RequestMapping(value = "/alarm", method = RequestMethod.GET)
    public ModelAndView userAlarmPage() {
        ModelAndView VIEW = new ModelAndView("user/alarm");
        return VIEW;
    }

    @RequestMapping(value = "/board/write", method = RequestMethod.GET)
    public ModelAndView userBoardWritePage() {
        ModelAndView VIEW = new ModelAndView("user/board-write");
        return VIEW;
    }

    @RequestMapping(value = "/bookmark", method = RequestMethod.GET)
    public ModelAndView userBookmarkPage() {
        ModelAndView VIEW = new ModelAndView("user/bookmark");
        return VIEW;
    }

    @RequestMapping(value = "/farm/manage", method = RequestMethod.GET)
    public ModelAndView userFarmManagePage() {
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

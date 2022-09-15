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
public class MainController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView mainHomePage() {
        ModelAndView VIEW = new ModelAndView("main/home");
        return VIEW;
    }
}

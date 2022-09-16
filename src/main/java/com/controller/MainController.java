package com.controller;

import com.service.GlobalService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {
    private final GlobalService globalService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView mainHomePage(HttpServletRequest request) {
        return globalService.getMain(request);
    }
}
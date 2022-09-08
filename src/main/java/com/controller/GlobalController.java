package com.controller;

import com.service.ContentService;
import com.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
@RequiredArgsConstructor
public class GlobalController {
    private final UserService userService;
    private final ContentService contentService;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/{search_string}/search", method = RequestMethod.GET)
    public ModelAndView searchResultPage(@PathVariable String search_string) {
        log.info("search_string : {}", search_string);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

}

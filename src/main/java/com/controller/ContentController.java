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
public class ContentController {
    private final UserService userService;
    private final ContentService contentService;
    @RequestMapping(value = "/boards", method = RequestMethod.GET)
    public ModelAndView boardsPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/manuals", method = RequestMethod.GET)
    public ModelAndView manualsPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/magazines", method = RequestMethod.GET)
    public ModelAndView magazinesPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/questions", method = RequestMethod.GET)
    public ModelAndView questionsPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/tips", method = RequestMethod.GET)
    public ModelAndView tipsPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/farms", method = RequestMethod.GET)
    public ModelAndView farmsPage() {
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/board/{board_code}/detail", method = RequestMethod.GET)
    public ModelAndView boardDetailPage(@PathVariable String board_code) {
        log.info("board_code : {}", board_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/magazine/{magazine_code}/detail", method = RequestMethod.GET)
    public ModelAndView magazineDetailPage(@PathVariable String magazine_code) {
        log.info("magazine_code : {}", magazine_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/question/{question_code}/detail", method = RequestMethod.GET)
    public ModelAndView questionDetailPage(@PathVariable String question_code) {
        log.info("question_code : {}", question_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/manual/{tip_code}/detail", method = RequestMethod.GET)
    public ModelAndView manualDetailPage(@PathVariable String tip_code) {
        log.info("tip_code : {}", tip_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/tips/{tip_code}/detail", method = RequestMethod.GET)
    public ModelAndView tipsDetailPage(@PathVariable String tip_code) {
        log.info("tip_code : {}", tip_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/trace/{trace_code}/detail", method = RequestMethod.GET)
    public ModelAndView traceDetailPage(@PathVariable String trace_code) {
        log.info("trace_code : {}", trace_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/bundle/{bundle_code}/detail", method = RequestMethod.GET)
    public ModelAndView bundleDetailPage(@PathVariable String bundle_code) {
        log.info("bundle_code : {}", bundle_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }

    @RequestMapping(value = "/farm/{user_code}/detail", method = RequestMethod.GET)
    public ModelAndView farmDetailPage(@PathVariable String user_code) {
        log.info("user_code : {}", user_code);
        ModelAndView VIEW = new ModelAndView("test");

        return VIEW;
    }
}

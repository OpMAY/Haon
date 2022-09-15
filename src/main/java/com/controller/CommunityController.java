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
@RequestMapping("/community")
public class CommunityController {
    @RequestMapping(value = "/board/detail", method = RequestMethod.GET)
    public ModelAndView communityBoardDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/board-detail");
        return VIEW;
    }

    @RequestMapping(value = "/boards", method = RequestMethod.GET)
    public ModelAndView communityBoardsPage() {
        ModelAndView VIEW = new ModelAndView("community/boards");
        return VIEW;
    }

    @RequestMapping(value = "/farm/detail", method = RequestMethod.GET)
    public ModelAndView communityFarmDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/farm-detail");
        return VIEW;
    }

    @RequestMapping(value = "/farms", method = RequestMethod.GET)
    public ModelAndView communityFarmsPage() {
        ModelAndView VIEW = new ModelAndView("community/farms");
        return VIEW;
    }

    @RequestMapping(value = "/magazine/detail", method = RequestMethod.GET)
    public ModelAndView communityMagazineDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/magazine");
        return VIEW;
    }

    @RequestMapping(value = "/magazines", method = RequestMethod.GET)
    public ModelAndView communityMagazinesPage() {
        ModelAndView VIEW = new ModelAndView("community/magazines");
        return VIEW;
    }

    @RequestMapping(value = "/qeustion/detail", method = RequestMethod.GET)
    public ModelAndView communityQuestionDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/qeustion-detail");
        return VIEW;
    }

    @RequestMapping(value = "/qeustions", method = RequestMethod.GET)
    public ModelAndView communityQuestionsPage() {
        ModelAndView VIEW = new ModelAndView("community/qeustions");
        return VIEW;
    }

    @RequestMapping(value = "/tip/detail", method = RequestMethod.GET)
    public ModelAndView communityTipDetailPage() {
        ModelAndView VIEW = new ModelAndView("community/tip-detail");
        return VIEW;
    }

    @RequestMapping(value = "/tips", method = RequestMethod.GET)
    public ModelAndView communityTipsPage() {
        ModelAndView VIEW = new ModelAndView("community/tips");
        return VIEW;
    }
}

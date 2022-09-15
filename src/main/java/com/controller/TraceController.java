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
@RequestMapping("/trace")
public class TraceController {
    @RequestMapping(value = "/package", method = RequestMethod.GET)
    public ModelAndView tracePackagePage() {
        ModelAndView VIEW = new ModelAndView("trace/package-trace");
        return VIEW;
    }

    @RequestMapping(value = "/single", method = RequestMethod.GET)
    public ModelAndView traceSinglePage() {
        ModelAndView VIEW = new ModelAndView("trace/trace");
        return VIEW;
    }
}

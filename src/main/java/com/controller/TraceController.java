package com.controller;

import com.service.TraceService;
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
@RequestMapping("/trace")
public class TraceController {
    private final TraceService traceService;

    @RequestMapping(value = "/package/{no}", method = RequestMethod.GET)
    public ModelAndView tracePackagePage(@PathVariable Integer no) {
        ModelAndView VIEW = new ModelAndView("trace/package-trace");
        VIEW.addObject("bundle", traceService.getTracePackagePage(no));
        return VIEW;
    }

    @RequestMapping(value = "/single/{no}", method = RequestMethod.GET)
    public ModelAndView traceSinglePage(@PathVariable Integer no) {
        ModelAndView VIEW = new ModelAndView("trace/trace");
        VIEW.addObject("trace", traceService.getTracePage(no));
        return VIEW;
    }
}

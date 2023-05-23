package com.controller;

import com.model.farm.trace.Bundle;
import com.model.farm.trace.Trace;
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
        Bundle bundle = traceService.getTracePackagePage(no);
        if(bundle == null) {
            // No Data ERROR
            throw new RuntimeException();
        }
        VIEW.addObject("bundle", bundle);
        return VIEW;
    }

    @RequestMapping(value = "/single/{no}", method = RequestMethod.GET)
    public ModelAndView traceSinglePage(@PathVariable Integer no) {
        ModelAndView VIEW = new ModelAndView("trace/trace");
        Trace trace = traceService.getTracePage(no);
        log.info("trace : {}", trace);
        if(trace == null) {
            // No Data ERROR
            throw new RuntimeException();
        }
        VIEW.addObject("trace", trace);
        return VIEW;
    }
}

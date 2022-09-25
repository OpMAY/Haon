package com.restcontroller;

import com.response.DefaultRes;
import com.response.Message;
import com.service.TraceService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class TraceRestController {
    private final TraceService traceService;

    @RequestMapping(value = "/trace/{type}/{value}", method = RequestMethod.POST)
    public ResponseEntity<String> selectTrace(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("value") String value) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/public/trace/{trace_code}", method = RequestMethod.GET)
    public ResponseEntity<String> getPublicTraceCode(@PathVariable("trace_code") String trace_code) {
        Message message = traceService.isCodeValid(trace_code);
        /**
         * TraceRestController
         * - Required Methods
         *      1. 번호 조회
         *          1) 농장 종류와 대응하는 번호인지
         *          2) 해당 정보가 맞다면 farm과 connect
         *          3) 번호의 유무
         *          4) 이미 DB에 등록되어 있는 이력인지
         *      2. 새로운 이력 등록
         *          1) 소, 닭, 돼지, 오리가 아닌지 확인
         *          2) data format set
         *          3) 이력 번호 양식 맞춰서 발급
         *      3. 이력 묶음
         *          1) 다른 묶음에 중복해서 묶음 X
         *          2) 묶을 이력끼리 같은 종류인지
         *      4.
         * **/
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }


}

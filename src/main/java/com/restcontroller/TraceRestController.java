package com.restcontroller;

import com.model.farm.trace.Bundle;
import com.model.farm.trace.Trace;
import com.response.DefaultRes;
import com.response.Message;
import com.service.TraceService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.Format;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class TraceRestController {
    private final TraceService traceService;
    private final EncryptionService encryptionService;

    @RequestMapping(value = "/trace/{type}/{value}", method = RequestMethod.POST)
    public ResponseEntity<String> selectTrace(HttpServletRequest request, @PathVariable("type") String type, @PathVariable("value") String value) throws Exception {
        Message message = new Message();
        message.put("example", "example");
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/public/trace/{trace_code}", method = RequestMethod.GET)
    public ResponseEntity<String> getPublicTraceCode(@PathVariable("trace_code") String trace_code, HttpServletRequest request) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.isCodeValid(trace_code, user_no);
        /**
         * TraceRestController
         * - Required Methods
         *      1. 번호 조회
         *          1) 농장 종류와 대응하는 번호인지
         *              -> 회원 가입 시 농장 번호 입력 추가 필요
         *          2) 해당 정보가 맞다면 farm과 connect
         *              -> 당장 여기서 X
         *          3) 번호의 유무
         *              -> O
         *          4) 이미 DB에 등록되어 있는 이력인지
         *              -> O
         *      2. 새로운 이력 등록
         *          1) 소, 닭, 돼지, 오리가 아닌지 확인
         *          2) data format set
         *          3) 이력 번호 양식 맞춰서 발급
         *      3. 이력 묶음
         *          1) 다른 묶음에 중복해서 묶음 X
         *          2) 묶을 이력끼리 같은 종류인지
         *      4. 묶음 이력, 이력 모두 조회 후 데이터 전달 뒤 확인을 누르면 데이터 저장 후 농장과 연결하는 방식
         * **/
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/create/trace", method = RequestMethod.POST)
    public ResponseEntity<String> createTrace(@RequestBody Trace trace, HttpServletRequest request) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.registerTrace(trace, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/delete/trace/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteTrace(@PathVariable Integer no) {
        traceService.deleteTrace(no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/trace/modal/{no}", method = RequestMethod.GET)
    public ResponseEntity<String> getTraceModalData(@PathVariable Integer no) {
        Message message = traceService.getTraceModalData(no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/bundle/modal/{no}", method = RequestMethod.GET)
    public ResponseEntity<String> getBundleModalData(@PathVariable Integer no) {
        Message message = traceService.getBundleModalData(no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/trace/code/{code}", method = RequestMethod.GET)
    public ResponseEntity<String> getTraceByCode(HttpServletRequest request, @PathVariable String code) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.getTraceByCode(code, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/create/bundle/manual", method = RequestMethod.POST)
    public ResponseEntity<String> createManualBundle(HttpServletRequest request, @RequestBody Map<String, Object> map) {
        List<Integer> traceList = (List<Integer>) map.get("list");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.createManualBundle(traceList, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/public/bundle/{bundle_code}", method = RequestMethod.GET)
    public ResponseEntity<String> getPublicBundleCode(@PathVariable("bundle_code") String bundle_code, HttpServletRequest request) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.getPublicBundleCode(bundle_code, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/create/bundle/public", method = RequestMethod.POST)
    public ResponseEntity<String> createPublicBundle(HttpServletRequest request, @RequestBody Bundle bundle) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.createPublicBundle(bundle, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/delete/bundle/{no}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteBundle(@PathVariable int no) {
        traceService.deleteBundle(no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK), HttpStatus.OK);
    }

    @RequestMapping(value = "/search/trace/{code}", method = RequestMethod.GET)
    public ResponseEntity<String> searchByCode(@PathVariable String code) {
        Message message = traceService.searchByCode(code);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/update/trace", method = RequestMethod.POST)
    public ResponseEntity<String> updateTrace(@RequestBody Trace trace, HttpServletRequest request) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.editTrace(trace, user_no, false);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/update/bundle", method = RequestMethod.POST)
    public ResponseEntity<String> updateBundle(@RequestBody Map<String, Object> map, HttpServletRequest request) {
        List<Integer> traceList = (List<Integer>) map.get("list");
        Integer bundle_no = (Integer) map.get("no");
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.updateBundle(traceList, bundle_no, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/trace/bundle_check/{no}", method = RequestMethod.GET)
    public ResponseEntity<String> checkTraceHasBundle(@PathVariable Integer no, HttpServletRequest request) {
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        Message message = traceService.checkTraceInBundle(no, user_no);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message, true), HttpStatus.OK);
    }

}

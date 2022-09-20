package com.restcontroller;

import com.response.DefaultRes;
import com.response.Message;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class AuthRestController {
    @Value("${KAKAO.JAVASCRIPT}")
    private String KAKAO_JAVASCRIPT;

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ResponseEntity<String> postLogout(HttpServletRequest request) {
        if (request.getSession().getAttribute(JWTEnum.JWTToken.name()) != null) {
            request.getSession().removeAttribute(JWTEnum.JWTToken.name());
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK), HttpStatus.OK);
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ResponseEntity<String> getLogout(HttpServletRequest request) {
        if (request.getSession().getAttribute(JWTEnum.JWTToken.name()) != null) {
            request.getSession().removeAttribute(JWTEnum.JWTToken.name());
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK), HttpStatus.OK);
    }

    @RequestMapping(value = "/get/kakao/key", method = RequestMethod.POST)
    public ResponseEntity<String> getKakaoKey(HttpServletRequest request) {
        Message message = new Message();
        message.put("key", KAKAO_JAVASCRIPT);
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message), HttpStatus.OK);
    }

    /**
     * curl -v -X "GET" "http://localhost:8080/api/kakao/disconnect?user_id=0&referrer_type=UNLINK_FROM_APPS" \
     * -H 'Authorization: KakaoAK 8f50c4f6431f08014f13d451e0c703ac'
     */
    @RequestMapping(value = "/kakao/disconnect")
    public void disconnectKakao(HttpServletRequest request, String user_id, String referrer_type) {
        log.info("{},{}", user_id, referrer_type);
    }
}

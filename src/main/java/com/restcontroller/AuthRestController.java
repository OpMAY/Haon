package com.restcontroller;

import com.api.sns.kakao.KakaoAPI;
import com.model.User;
import com.response.DefaultRes;
import com.response.Message;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
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
    private final UserService userService;
    private final EncryptionService encryptionService;
    private final KakaoAPI kakaoAPI;

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
        Integer user_no = userService.getUserById(user_id);
        if (user_no != null) {
            userService.unregister(user_no);
        }
    }

    @RequestMapping(value = "/auth/withdrawal")
    public ResponseEntity<String> unregister(HttpServletRequest request) {
        Message message = new Message();
        if (request.getSession().getAttribute(JWTEnum.JWTToken.name()) != null) {
            Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
            String user_id = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.ID.name());
            log.info("disconnect kakao api");
            if (kakaoAPI.disconnect(user_id).contains(user_id)) {
                userService.unregister(user_no);
                request.getSession().removeAttribute(JWTEnum.JWTToken.name());
                message.put("status", true);
            } else {
                message.put("status", false);
            }
        } else {
            message.put("status", false);
        }
        return new ResponseEntity(DefaultRes.res(HttpStatus.OK, message), HttpStatus.OK);
    }
}

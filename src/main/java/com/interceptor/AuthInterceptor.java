package com.interceptor;

import com.model.User;
import com.model.farm.Farm;
import com.service.FarmService;
import com.service.GlobalService;
import com.service.UserService;
import com.util.Constant;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import com.util.TokenGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Objects;

@Slf4j
@RequiredArgsConstructor
@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {
    private final EncryptionService encryptionService;
    private final GlobalService globalService;
    private final FarmService farmService;
    private final UserService userService;

    @PostConstruct
    public void AuthInterceptor() {
        log.debug("Auth Interceptor Post Initialize");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getSession().getAttribute(JWTEnum.JWTToken.name()) != null) {
            /**Login 했을 때의 Session 필터링*/
            HashMap<String, Object> hashMap = new EncryptionService().decryptJWT(request.getSession().getAttribute(JWTEnum.JWTToken.name()).toString());
            String version = (String) hashMap.get(JWTEnum.VERSION.name());
            if (!Objects.equals(version, Constant.VERSION)) {
                request.getSession().removeAttribute(JWTEnum.JWTToken.name());
                response.sendRedirect("/auth/register");
                return false;
            }
        } else {
            /**Login 하지 않았을 때의 Session 필터링*/
            response.sendRedirect("/auth/register");
            return false;
        }
        Integer user_no = encryptionService.getSessionParameter((String) request.getSession().getAttribute(JWTEnum.JWTToken.name()), JWTEnum.NO.name());
        User user = userService.getUserByNo(user_no);
        if (user != null) {
            if (!globalService.checkFarm(user_no)) {
                response.sendRedirect("/auth/type");
                return false;
            } else {
                Farm farm = farmService.getFarmByUserNo(user_no);
                farm.setUser(userService.getUserByNo(user_no));
                log.info("user -> {}", userService.getUserByNo(user_no));
                request.setAttribute("farm", farm);
            }
        } else {
            response.sendRedirect("/auth/register");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.debug("Auth Interceptor postHandle");
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.debug("Auth Interceptor afterCompletion");
        super.afterCompletion(request, response, handler, ex);
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.debug("Auth Interceptor afterConcurrentHandlingStarted");
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}

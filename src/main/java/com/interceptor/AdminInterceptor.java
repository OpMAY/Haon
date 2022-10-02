package com.interceptor;

import com.model.User;
import com.service.UserService;
import com.util.Encryption.EncryptionService;
import com.util.Encryption.JWTEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {

    private final EncryptionService encryptionService;
    private final UserService userService;

    @PostConstruct
    public void AdminInterceptor() {
        log.debug("Admin Interceptor Post Initialize");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.debug("Admin Interceptor preHandle");
        String token = (String) request.getSession().getAttribute(JWTEnum.ADMIN.name());
        if (token != null) {
            HashMap<String, Object> jwts = encryptionService.decryptJWT(token);
            User admin = userService.getUserByNo((Integer) jwts.get(JWTEnum.NO.name()));
            if (admin != null) {
                if (admin.getId().equals(jwts.get(JWTEnum.ID.name()))) {
                    return true;
                } else {
                    request.getSession().removeAttribute(JWTEnum.ADMIN.name());
                    response.sendRedirect("/admin/login");
                }
            } else {
                request.getSession().removeAttribute(JWTEnum.ADMIN.name());
                response.sendRedirect("/admin/login");
            }
        } else {
            response.sendRedirect("/admin/login");
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.debug("Admin Interceptor postHandle");
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.debug("Admin Interceptor afterCompletion");
        super.afterCompletion(request, response, handler, ex);
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.debug("Admin Interceptor afterConcurrentHandlingStarted");
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}

package com.interceptor;

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

@Slf4j
@RequiredArgsConstructor
@Component
public class AuthInterceptor extends HandlerInterceptorAdapter {
    private final EncryptionService encryptionService;

    @PostConstruct
    public void AuthInterceptor() {
        log.debug("Auth Interceptor Post Initialize");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.debug("Auth Interceptor preHandle");
        Object token = request.getSession().getAttribute(JWTEnum.JWTToken.name());
        if (token != null) {
            return super.preHandle(request, response, handler);
        } else {
            response.sendRedirect("/auth/register");
            return false;
        }
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

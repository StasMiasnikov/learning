package net.guides.springboot2.springboot2jpacrudexample.aspects.http;


import org.springframework.web.servlet.handler.*;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class HTTPrequestInterceptor
        extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler) {
        System.out.print("REQUEST => " + request.toString());
        System.out.print("RESPONSE => " + response.toString());
        return true;
    }

    @Override
    public void afterCompletion(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            Exception ex) {
        System.out.print("REQUEST => " + request.toString());
        System.out.print("RESPONSE => " + response.toString());
    }
}
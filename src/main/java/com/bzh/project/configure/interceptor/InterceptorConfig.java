package com.bzh.project.configure.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InterceptorConfig implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object student = request.getSession().getAttribute("student");
        Object teacher = request.getSession().getAttribute("teacher");
        Object admin = request.getSession().getAttribute("admin");
        if(student == null && teacher == null && admin == null) {
            //没有值，没有登录，返回到登录页面：
            //request.getRequestDispatcher("/login").forward(request, response);
            response.sendRedirect("/login");
            //同时设置错误信息
            //request.setAttribute("msg","没有权限");
            return false;
        }
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

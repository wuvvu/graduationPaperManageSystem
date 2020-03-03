package com.bzh.project.configure.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//继承接口WebMvcConfigurer实现管理SpringMvc
@Configuration
public class ViewControllerImpl implements WebMvcConfigurer {

    //第一种方法：直接编写实现方法
    /*@Override
    public void addInterceptors(InterceptorRegistry registry) {
    //排除"/"下的全部路径，除了"/login.html","/","/user/login"
        registry.addInterceptor(new InterceptorConfig()).addPathPatterns("/**").
                        excludePathPatterns(
                                "/login",
                                "/js/**",
                                "/css/**",
                                "/bootstrap/**",
                                "/student/main",
                                "/teacher/main",
                                "/admin/login",
                                "/admin/loginCheck");

    }*/

    //第二种实现方法：添加WebMvcConfigurer组件
    @Bean
    public WebMvcConfigurer webMvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                //排除"/"下的全部路径，除了后边
                registry.addInterceptor(new InterceptorConfig()).addPathPatterns("/**").
                        excludePathPatterns(
                                "/login",
                                "/js/**",
                                "/css/**",
                                "/img/**",
                                "/bootstrap/**",
                                "/student/main",
                                "/teacher/main",
                                "/admin/login",
                                "/newAdmin/loginCheck");
            }
        };
    }
}
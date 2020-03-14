package com.jshlearn.smicerp.config;

import com.jshlearn.smicerp.filter.ErpInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Description
 * @ClassName WebConfig
 * @Author 蔡明涛
 * @Date 2020/3/8 22:09
 **/
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 默认拦截所有请求,不拦截静态资源
        // TODO 目前无法修改无限轮询的bug
//        registry.addInterceptor(new ErpInterceptor()).addPathPatterns("/**").
//                excludePathPatterns("/css/**","/js/**","/images/**","/user/getUserSession","/userBusiness/getBasicData*","/functions/findMenu","/home.html","/error","/login.html");
    }
}

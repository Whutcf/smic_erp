package com.jshlearn.smicerp.config;

import com.jshlearn.smicerp.filter.ErpInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

/**
 * @Description
 * @ClassName WebConfig
 * @Author 蔡明涛
 * @Date 2020/3/8 22:09
 **/
@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

    @Resource
    private ErpInterceptor erpInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 默认拦截所有请求,不拦截静态资源
        registry.addInterceptor(erpInterceptor).addPathPatterns("/**")
                .excludePathPatterns("/css/**","/js/**","/images/**","/template/**","/reLogin","/login","/register","/user/login","/noPermission","/error");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**").addResourceLocations("classpath:/META-INF/resources/")
                .addResourceLocations("classpath:/resources/").addResourceLocations("classpath:/static/")
                .addResourceLocations("classpath:/public/");
        super.addResourceHandlers(registry);
    }
}

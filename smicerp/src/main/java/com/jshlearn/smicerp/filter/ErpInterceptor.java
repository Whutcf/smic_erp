package com.jshlearn.smicerp.filter;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description 拦截器，需要结合配置类使用，即将拦截器添加到配置中
 * @ClassName ErpInterceptor
 * @Author 蔡明涛
 * @Date 2020/3/8 21:56
 **/
@Component
public class ErpInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getRequestURL());
        Object user = request.getSession().getAttribute("user");
        if (StringUtils.isEmpty(user)) {
            response.sendRedirect("/login.html");
            return false;
        }
        return true;
    }
}

package com.jshlearn.smicerp.filter;

import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.pojo.User;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
@Component
public class ErpInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        log.warn(">>>>>>>> 被拦截的页面: {}",request.getRequestURL());
        if (StringUtils.isEmpty(user)) {
            response.sendRedirect("/reLogin");
            return false;
        }else if (user.getLoginName().equalsIgnoreCase(BusinessConstants.DEMONSTRATE_ACCOUNT)){
            // 演示帐号无法系统操作
            if (request.getRequestURI().contains(BusinessConstants.SYS_OPERATION_PREFIX)){
                response.sendRedirect("/noPermission");
                return false;
            }
        }
        return true;
    }
}

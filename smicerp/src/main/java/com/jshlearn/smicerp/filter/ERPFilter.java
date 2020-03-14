//package com.jshlearn.smicerp.filter;
//
//
//import org.springframework.util.StringUtils;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.annotation.WebInitParam;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
///**
// * 在Springboot项目中不需要如下方法，直接使用spring自带的拦截器 ，这应该是JSH_ERP的“历史的包袱”
// * @Description 自定义过滤器类需要实现Filter接口
// * filterName String 指定过滤器的 name 属性，等价于 <filter-name>
// * value String[] 该属性等价于urlPatterns 属性。但是两者不应该同时使用。
// * urlPatterns  String[] 指定一组过滤器的URL匹配模式。等价于 <url-pattern> 标签。
// * initParams WebInitParam[] 指定一组过滤器初始化参数，等价于 <init-param> 标签
// * @ClassName ERPFilter
// * @Author 蔡明涛
// * @date 2020/3/8 18:43
// */
//@WebFilter(filterName = "logCostFilter",urlPatterns = {"/*"},
//           initParams = {@WebInitParam(name = "ignoreUrl", value = ".css#.js#.jpg#.png#.gif#.ico"),
//                         @WebInitParam(name = "filterPath", value = "/user/login#/user/registerUser")}           )
//public class ERPFilter implements Filter {
//
//    /**
//     * 配合上面的注解配置使用
//     */
//    private static final String FILTER_PATH = "filterPath";
//    private static final String IGNORE_URL = "ignoreUrl";
//    private List<String> ignoreUrlList = new ArrayList<>();
//    private String[]  allowUrls;
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        String filterPath = filterConfig.getInitParameter(FILTER_PATH);
//        if(!StringUtils.isEmpty(filterPath)){
//            allowUrls = filterPath.contains("#") ? filterPath.split("#") : new String[]{filterPath};
//        }
//
//        String ignorePath = filterConfig.getInitParameter(IGNORE_URL);
//        if (!StringUtils.isEmpty(ignorePath)){
//            String[] ignoreUrls = ignorePath.contains("#") ? ignorePath.split("#") : new String[]{ignorePath};
//            ignoreUrlList.addAll(Arrays.asList(ignoreUrls));
//        }
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
//        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//        String requestUri = httpServletRequest.getRequestURI();
//        // 判断用户是否登录，未登录则挑战到登录页面
//        Object user = httpServletRequest.getSession().getAttribute("user");
//        // 如果用户已登录，放行！
//        if(!StringUtils.isEmpty(user)){
//            chain.doFilter(request,response);
//            return;
//        }
//
//        // 如果是去登录或注册页面 放行！
//        boolean toLoginOrRegister = !StringUtils.isEmpty(requestUri) && (requestUri.contains("/login.html") || requestUri.contains("/register.html"));
//        if(toLoginOrRegister){
//            chain.doFilter(request,response);
//            return;
//        }
//
//        // 如果是访问静态资源，放行！
//        if (verify(ignoreUrlList, requestUri)) {
//            chain.doFilter(request, response);
//            return;
//        }
//        if (null != allowUrls && allowUrls.length > 0) {
//            for (String url : allowUrls) {
//                if (requestUri.startsWith(url)) {
//                    chain.doFilter(request, response);
//                    return;
//                }
//            }
//        }
//        httpServletResponse.sendRedirect("/login.html");
//
//    }
//
//    private boolean verify(List<String> ignoreUrlList, String requestUri) {
//        String regexPrefix = "^.*";
//        String regexSuffix = ".*$";
//        for (String regex : ignoreUrlList) {
//            Pattern pattern = Pattern.compile(regexPrefix + regex + regexSuffix);
//            Matcher matcher = pattern.matcher(requestUri);
//            if (matcher.matches()) {
//                return true;
//            }
//        }
//        return false;
//    }
//
//    @Override
//    public void destroy() {
//
//    }
//}

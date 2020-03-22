package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.PageConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description 学习期间充当零时页面跳转功能
 * @ClassName TempController
 * @Author 蔡明涛
 * @Date 2020/3/11 21:35
 **/
@Slf4j
@Controller
public class PageController {

    // 用户管理相关的页面跳转

    @RequestMapping("/login")
    public String toLogin() {
        log.debug("======== 跳转到登录页面 ========");
        return "login";
    }

    @RequestMapping("/register")
    public String toRegister() {
        log.debug("======== 跳转到注册页面 ========");
        return "register";
    }

    @RequestMapping("/index")
    public String toIndex() {
        log.info("======== 跳转到主页 ========");
        return "index";
    }

    @RequestMapping("")
    public String index() {
        log.info("======== 跳转到主页 ========");
        return "index";
    }

    @RequestMapping("/noPermission")
    public String toNoPermission() {
        log.info("======== 跳转到没权限页面 ========");
        return "noPermission";
    }

    @RequestMapping("/reLogin")
    public String toReLogin() {
        log.info("======== 跳转SESSION过期页面 ========");
        return "reLogin";
    }

    @RequestMapping("/home")
    public String toHome() {
        log.info("======== 进入主页 ========");
        return "home";
    }

    @GetMapping("/user/password")
    public String toPassword() {
        log.info("======== 跳转到修改密码页面 ========");
        return "pages/user/password";
    }

    @GetMapping("/user/userHelp")
    public String toUserHelp() {
        log.info("======== 跳转到新手引导页面 ========");
        return "pages/user/userHelp";
    }

    /**
     * 通用跳转页面
     *
     * @param sourceName 页面的分类
     * @param page       跳转的页面
     * @return java.lang.String
     * @author 蔡明涛
     * @date 2020/3/22 14:17
     */
    @GetMapping("/pages/{sourceName}/{page}")
    public String toPage(@PathVariable("sourceName") String sourceName,
                         @PathVariable("page") String page) {
        log.info("========= 跳转" + page + "页面 ========");
        return PageConstants.PAGE_PREFIX + sourceName + "/" + page;
    }
}


package com.jshlearn.smicerp.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    @RequestMapping("/login")
    public String toLogin(){
        log.debug("=====================用户跳转到登录页面======================");
        return "login";
    }
    @RequestMapping("/register")
    public String toRegister(){
        log.debug("======== 跳转到注册页面 ========");
        return "register";
    }

    @RequestMapping("/index")
    public String toIndex(){
        log.info("======== 跳转到主页 ========");
        return "index";
    }

    @RequestMapping("/home")
    public String toHome(){
        log.info("======== 进入主页 ========");
        return "home";
    }

    @GetMapping("/user/password")
    public String toPassword(){
        log.info("======== 跳转到修改密码页面 ========");
        return "pages/user/password";
    }

    @GetMapping("/user/userHelp")
    public String toUserHelp(){
        log.info("======== 跳转到新手引导页面 ========");
        return "pages/user/userHelp";
    }

}

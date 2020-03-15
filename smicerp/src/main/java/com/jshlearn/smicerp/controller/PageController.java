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

    // 用户管理相关的页面跳转

    @RequestMapping("/login")
    public String toLogin(){
        log.debug("======== 跳转到登录页面 ========");
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

    @RequestMapping("/noPermission")
    public String toNoPermission(){
        log.info("======== 跳转到没权限页面 ========");
        return "noPermission";
    }

    @RequestMapping("/reLogin")
    public String toReLogin(){
        log.info("======== 跳转SESSION过期页面 ========");
        return "reLogin";
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


    // 商品相关的页面跳转

    @GetMapping("/pages/materials/material")
    public String toMaterial(){
        log.info("======== 跳转到商品管理页面 ========");
        return "pages/materials/material";
    }

}

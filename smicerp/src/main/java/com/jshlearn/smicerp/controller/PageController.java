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


    // 商品相关的页面跳转

    @GetMapping("/pages/materials/material")
    public String toMaterial() {
        log.info("======== 跳转到商品管理页面 ========");
        return "pages/materials/material";
    }

    // 供应商相关的页面跳转
    
    @GetMapping("/pages/manage/vendor")
    public String toVendor() {
        log.info("======== 跳转到供应商页面 ========");
        return "pages/manage/vendor";
    }

    // 客户相关的页面跳转

    @GetMapping("/pages/manage/customer")
    public String toCustomer() {
        log.info("======== 跳转到客户页面 ========");
        return "pages/manage/customer";
    }

    // 会员相关的页面跳转

    @GetMapping("/pages/manage/member")
    public String toMember() {
        log.info("======== 跳转到会员页面 ========");
        return "pages/manage/member";
    }

    // 仓库相关的页面跳转

    @GetMapping("/pages/manage/depot")
    public String toDepot() {
        log.info("======== 跳转到仓库页面 ========");
        return "pages/manage/depot";
    }

    // 收支项目页面跳转

    @GetMapping("/pages/manage/inOutItem")
    public String toInOutItem(){
        log.info("======== 跳转收支项目页 ========");
        return "pages/manage/inOutItem";
    }

    // 结算账户页面跳转

    @GetMapping("/pages/manage/account")
    public String toAccount(){
        log.info("======== 跳转结算账户页 ========");
        return "pages/manage/account";
    }
}


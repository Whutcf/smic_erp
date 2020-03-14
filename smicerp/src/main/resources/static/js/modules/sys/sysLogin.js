/*!
 * Copyright (c) 2013-Now 华夏erp All rights reserved.
 *
 * @author jishenghua
 * @version 2019-09-14
 */
$(function() {
    //设置显示配置
    var messageOpts = {
        "closeButton" : true,//是否显示关闭按钮
        "debug" : false,//是否使用debug模式
        "positionClass" : "toast-center-center",//弹出窗的位置
        "onclick" : null,
        "showDuration" : "300",//显示的动画时间
        "hideDuration" : "1000",//消失的动画时间
        "timeOut" : "5000",//展现时间
        "extendedTimeOut" : "1000",//加长展示时间
        "showEasing" : "swing",//显示时的动画缓冲方式
        "hideEasing" : "linear",//消失时的动画缓冲方式
        "showMethod" : "fadeIn",//显示时的动画方式
        "hideMethod" : "fadeOut" //消失时的动画方式
    };
    toastr.options = messageOpts;
});
$("#userName, #password").on("focus blur", function () {
    var a = this;
    setTimeout(function () {
        var b = $(a).css("borderColor");
        if (b != "") {
            $(a).prev().css("color", b)
        }
    }, 100)
}).blur();

var userName = localStorage.getItem("userName");
var password = localStorage.getItem("password");
if(userName){
    $("#userName").val(userName);
    setTimeout(function() {
        $("#rememberUserCode").parent().addClass("checked");
    },200);
}
if(password){
    $("#password").val(password);
    setTimeout(function() {
        $("#rememberMe").parent().addClass("checked");
    },200);
}

//初始化键盘enter事件
$(document).keydown(function (event) {
    //兼容 IE和firefox 事件
    var e = window.event || event;
    var k = e.keyCode || e.which || e.charCode;
    //兼容 IE,firefox 兼容
    var obj = e.srcElement ? e.srcElement : e.target;
    //绑定键盘事件为 userName 和password的输入框才可以触发键盘事件 13键盘事件
    if (k == "13" && (obj.id == "userName" || obj.id == "password"))
        loginFun();
});

//登录按钮绑定处理事件
$('#btnSubmit').off("click").on("click", function () {
    var rememberUserCode = $("#rememberUserCode").parent().hasClass("checked");
    var rememberMe = $("#rememberMe").parent().hasClass("checked");
    localStorage.removeItem("userName");
    localStorage.removeItem("password");
    if(rememberUserCode) {
        localStorage.setItem("userName",$("#userName").val());
    }
    if(rememberMe) {
        localStorage.setItem("userName",$("#userName").val());
        localStorage.setItem("password",$("#password").val());
    }
    loginFun();
});
//检测用户输入数据
function loginFun() {
    var userName = $.trim($('#userName').val());
    var password = $.trim($('#password').val());
    if (null == userName || 0 == userName.length) {
        $("#userName").val("").focus();
        return;
    }

    if (null == password || 0 == password.length) {
        $("#password").val("").focus();
        return;
    }
    if (userName != null && userName.length != 0
        && password != null && password.length != 0) {
        $("#userName").focus();
        $.ajax({
            type: "post",
            url: "/user/login",
            dataType: "json",
            data: ({
                loginName: userName,
                password:  hex_md5(password)
            }),
            success: function (res) {
                if(res) {
                    var loginInfoTip = res.message;
                    //用户名不存在，清空输入框并定位到用户名输入框
                    if (loginInfoTip.indexOf("user is not exist") != -1) {
                        $("#userName").val("").focus();
                        $("#password").val("");
                        toastr.warning("用户名不存在");
                        return;
                    }
                    else if (loginInfoTip.indexOf("user password error") != -1) {
                        toastr.warning("用户密码错误");
                        return;
                    }
                    else if (loginInfoTip.indexOf("access service error") != -1) {
                        toastr.warning("后台访问错误");
                        return;
                    }
                    else if(loginInfoTip.indexOf("user is black") != -1){
                        toastr.warning("用户已被封禁，请联系管理员")
                    }
                    //跳转到用户管理界面
                    else if (loginInfoTip.indexOf("user can login") != -1 || loginInfoTip == "user already login") {
                        $.ajax({
                            type: "get",
                            url: "/user/getUserSession",
                            dataType: "json",
                            success: function (res) {
                                if(res && res.code === 200) {
                                    if(res.data) {
                                        var user = res.data;
                                        sessionStorage.setItem("userId", user.id);
                                        sessionStorage.setItem("loginName", user.loginName);
                                        top.location.href = "/index";
                                    }else {
                                        toastr.warning("后台访问错误，请联系管理员！");
                                    }
                                }
                            },
                            //此处添加错误处理
                            error: function () {
                                toastr.warning("后台访问错误，请联系管理员！");
                            }
                        });
                    }
                }
            },
            //此处添加错误处理
            error: function () {
                toastr.warning("后台访问错误，请联系管理员！");
            }
        });
    }
}
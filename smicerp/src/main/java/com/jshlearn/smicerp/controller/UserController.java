package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.pojo.Log;
import com.jshlearn.smicerp.pojo.Tenant;
import com.jshlearn.smicerp.pojo.User;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.service.TenantService;
import com.jshlearn.smicerp.service.UserService;
import com.jshlearn.smicerp.utils.CommonUtils;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

/**
 * @Description 用户处理
 * @ClassName UserController
 * @Author 蔡明涛
 * @Date 2020/3/7 22:40
 **/
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private TenantService tenantService;

    @Resource
    private LogService logService;


    @PostMapping("/login")
    public ResultBean<User> toLogin(@RequestParam(value = "loginName") String loginName,
                                    @RequestParam(value = "password") String password, HttpServletRequest request) {
        log.debug("======================验证用户登录=================================");
        ResultBean<User> resultBean = new ResultBean<>();
        String userName = loginName.trim();
        User user = new User();
        user.setLoginName(userName);
        user.setPassword(password);
        HttpSession session = request.getSession();
        //系统操作日志相关内容
        Log logInfo = ErpCustomUtils.initialLog(request);
        logInfo.setOperation(BusinessConstants.USER_OPERATION_LOGIN);
        logInfo.setContentDetails(BusinessConstants.USER_OPERATION_MANAGE + userName + BusinessConstants.USER_OPERATION_LOGIN);

        //用户登录处理
        Object userInfo = session.getAttribute("user");
        if (!StringUtils.isEmpty(userInfo)) {
            User sessionUser = (User) userInfo;
            if (userName.equalsIgnoreCase(sessionUser.getLoginName())) {
                UserController.log.debug("========用户{}已经登录，login 方法调用结束========", userName);
                resultBean.setMessage("user already login");
                resultBean.setData(sessionUser);
                return resultBean;
            }
        }
        //获取用户是否可以登录的状态状态
        int userStatus = 0;
        try {
            session.removeAttribute("tenantId");
            userStatus = userService.validateUser(user);
        } catch (Exception e) {
            e.printStackTrace();
            UserController.log.info(">>>>>>>>>>>>用户{}登录 login 方法 访问服务层异常！", userName);
            resultBean.setMessage("access service exception");
        }

        if (userStatus != ExceptionConstants.USER_NOT_EXIST_CODE && userStatus != ExceptionConstants.USER_ACCESS_EXCEPTION_CODE) {
            Long userId = userService.getUserIdByUserName(userName);
            logInfo.setUserId(userId);
        }

        //判断用户登陆状态，并存储用户信息进session
        User userDetailInfo = judgeUserLogin(resultBean, userName, user, session, logInfo, userStatus);
        if (!ErpCustomUtils.isEmptyField(userDetailInfo)) {
            resultBean.setData(userDetailInfo);
            resultBean.setCode(ExceptionConstants.SERVICE_SUCCESS_CODE);
        }
        return resultBean;
    }

    /**
     * 判断用户是否可以登录
     *
     * @param resultBean, userName, user, session, logInfo, userStatus
     * @return com.jshlearn.smicerp.pojo.User
     * @author 蔡明涛
     * @date 2020/3/13 22:40
     */
    private User judgeUserLogin(ResultBean<User> resultBean, String userName, User user, HttpSession session, Log logInfo, int userStatus) {
        User userDetailInfo = new User();
        // case 1 2 3 4 5
        switch (userStatus) {
            case 1:
                resultBean.setMessage(ExceptionConstants.USER_NOT_EXIST_MSG);
                break;
            case 2:
                resultBean.setMessage(ExceptionConstants.USER_PASSWORD_ERROR_MSG);
                logInfo.setRemark(userName + " 密码输入错误，登入失败");
                logInfo.setStatus(BusinessConstants.USER_OPERATION_FAIL);
                logService.insertLog(logInfo);
                break;
            case 3:
                resultBean.setMessage(ExceptionConstants.BLACK_USER_MSG);
                logInfo.setRemark(userName + " 已列入黑名单，无法登录");
                logInfo.setStatus(BusinessConstants.USER_OPERATION_FAIL);
                logService.insertLog(logInfo);
                break;
            case 4:
                resultBean.setMessage(ExceptionConstants.USER_ACCESS_EXCEPTION_MSG);
                logInfo.setRemark("后台系统异常，导致 " + userName + " 无法登录系统！");
                logInfo.setStatus(BusinessConstants.USER_OPERATION_FAIL);
                logService.insertLog(logInfo);
                break;
            default:
                resultBean.setMessage(ExceptionConstants.USER_CONDITION_FIT_MSG);
                //用户通过验证，存入session信息，记录登录日志
                userDetailInfo = userService.getUserByName(userName);
                session.setAttribute("user", userDetailInfo);
                if (userDetailInfo.getTenantId() != null) {
                    Tenant tenant = tenantService.getTenantByTenantId(user.getTenantId());
                    if (!StringUtils.isEmpty(tenant)) {
                        Long tenantId = tenant.getTenantId();
                        Integer userNumLimit = tenant.getUserNumLimit();
                        Integer billsNumLimit = tenant.getBillsNumLimit();
                        if (!StringUtils.isEmpty(tenantId)) {
                            session.setAttribute("tenantId", tenantId);
                            session.setAttribute("userNumLimit", userNumLimit);
                            session.setAttribute("billsNumLimit", billsNumLimit);
                        }
                    }
                }
                logInfo.setRemark(userName + " 登录系统成功");
                logService.insertLog(logInfo);
                break;
        }
        return userDetailInfo;
    }

    @GetMapping("/getUserSession")
    public ResultBean<User> getUserSession(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (!StringUtils.isEmpty(user)) {
            user.setPassword(null);
            return ResultBeanUtil.success(user);
        } else {
            log.error(">>>>>>>>>>>>>>获取session异常！");
            return ResultBeanUtil.error(500, "获取Session异常！");
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        // 记录用户操作信息
        Log logInfo = ErpCustomUtils.initialLog(request);
        User user = (User) request.getSession().getAttribute("user");
        logInfo.setOperation(BusinessConstants.USER_OPERATION_LOGOUT);
        logInfo.setContentDetails(BusinessConstants.USER_OPERATION_LOGOUT + user.getUserName() +"("+ user.getLoginName() +") "+BusinessConstants.USER_OPERATION_LOGOUT);

        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("tenantId");
        request.getSession().removeAttribute("userNumLimit");
        request.getSession().removeAttribute("billsNumLimit");
        try {
            response.sendRedirect("/login");
            logInfo.setRemark("成功退出系统");
            logService.insertLog(logInfo);
        } catch (IOException e) {
            logInfo.setStatus(BusinessConstants.USER_OPERATION_FAIL);
            logInfo.setRemark("退出系统异常");
            logService.insertLog(logInfo);
            UserController.log.error(">>>>>>>>>> 用户退出失败",e);
        }
    }

    @PostMapping("/updatePwd")
    public ResultBean<JSONObject> updatePwd(@RequestParam(value = "userId") Long userId,
                                            @RequestParam(value = "password") String password,
                                            @RequestParam(value = "oldpwd") String oldPwd,
                                            HttpServletRequest request){
        User user = userService.getUserById(userId);
        JSONObject jsonObject = new JSONObject();
        Integer flag = 0;
        // 记录用户操作日志
        Log logInfo = ErpCustomUtils.initialLog(request);
        logInfo.setOperation(BusinessConstants.USER_OPERATION_CHANGE_PASSWORD);
        logInfo.setContentDetails(BusinessConstants.USER_OPERATION_MANAGE+user.getUserName()+BusinessConstants.USER_OPERATION_CHANGE_PASSWORD);
        if(password.equalsIgnoreCase(oldPwd)){
            // 新旧密码相同
            flag = 4;
        }else {
            try {
                String oldPassword = CommonUtils.md5Encryp(oldPwd);
                String md5Pwd = CommonUtils.md5Encryp(password);
                if (user.getLoginName().equalsIgnoreCase(BusinessConstants.DEFAULT_MANAGER)){
                    // 管理员不能修改密码
                    flag = 3;
                }else if (user.getLoginName().equalsIgnoreCase(BusinessConstants.DEMONSTRATE_ACCOUNT)){
                    // 演示帐号无法修改密码
                    flag = 5;
                }else {
                    // 原始密码密码必须和旧密码一直，才能更新
                    if (oldPassword.equalsIgnoreCase(user.getPassword())) {
                        user.setPassword(md5Pwd);
                        flag = userService.updateUser(user);
                        logInfo.setRemark(user.getUserName() + "修改密码成功！");
                    } else {
                        // 原始密码不正确
                        flag = 2;
                    }
                }
            } catch (NoSuchAlgorithmException e) {
                logInfo.setStatus(BusinessConstants.USER_OPERATION_FAIL);
                logInfo.setRemark(user.getUserName() + "修改密码失败");
                e.printStackTrace();
                log.error(">>>>>>>>> {}修改密码异常", user.getUserName(), e);
            }
        }
        jsonObject.put("status",flag);
        if (flag > 0){
            return ResultBeanUtil.success(jsonObject);
        }else {
            return ResultBeanUtil.error(ExceptionConstants.USER_EDIT_FAILED_CODE,ExceptionConstants.USER_EDIT_FAILED_MSG);
        }
    }


}

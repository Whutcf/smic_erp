package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.mapper.UserMapper;
import com.jshlearn.smicerp.pojo.User;
import com.jshlearn.smicerp.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartException;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 用户处理层
 * @ClassName UserServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/12 20:34
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public int validateUser(User user) throws Exception {
        LambdaQueryWrapper<User> queryWrapper = Wrappers.lambdaQuery();
        try {
            // 首先判断用户名是否存在
            queryWrapper.eq(user.getLoginName() != null, User::getLoginName, user.getLoginName());
            if (userMapper.selectList(queryWrapper).size() == 0) {
                return ExceptionConstants.USER_NOT_EXIST_CODE;
            } else {
                try {
                    //然后判断密码是否正确
                    queryWrapper.eq(User::getPassword, user.getPassword());
                    List<User> users = userMapper.selectList(queryWrapper);
                    if (users.isEmpty()) {
                        return ExceptionConstants.USER_PASSWORD_ERROR_CODE;
                    }else {
                        if (users.size()==1){
                            for (User userInfo:users) {
                                if (userInfo.getStatus()==2){
                                    return ExceptionConstants.BLACK_USER_CODE;
                                }
                            }
                        }else {
                            MultipartException e = new MultipartException("用户数据不唯一");
                            log.info(">>>>>>>>>>>>>>>>>>>>用户异常，存在同名同密码的情形！");
                            throw e;
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    log.error(">>>>>>>>>>验证用户密码是否存在后台信息异常", e);
                    return ExceptionConstants.USER_ACCESS_EXCEPTION_CODE;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error(">>>>>>>>>>验证用户姓名是否存在后台信息异常", e);
            return ExceptionConstants.USER_ACCESS_EXCEPTION_CODE;
        }

        //姓名和密码验证通过返回可以登录
        return ExceptionConstants.USER_CONDITION_FIT_CODE;

    }

    @Override
    public User getUserByName(String userName) {
        LambdaQueryWrapper<User> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(!StringUtils.isEmpty(userName),User::getLoginName,userName);
        User user = null;
        try {
            user = userMapper.selectOne(queryWrapper);
        } catch (MultipartException e) {
            e.printStackTrace();
            log.error(">>>>>>>>>>>>>>>>>根据用户名查询到多条记录异常！",e);
        }
        return user;
    }

    @Override
    public Long getUserIdByUserName(String userName) {
        Long userId = null;
        try {
            userId = userMapper.getUserIdByUserName(userName);
        } catch (Exception e) {
            e.printStackTrace();
            log.error(">>>>>>>>>>>>>>>>根据用户名查找ID异常！",e);
        }
        return userId;
    }

    @Override
    public User getUserById(Long userId) {
        return userMapper.selectById(userId);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Integer updateUser(User user) {
        return userMapper.updateById(user);
    }

    @Override
    public int getUserCount() {
        LambdaQueryWrapper<User> query = Wrappers.lambdaQuery();
        query.eq(User::getStatus, BusinessConstants.USER_STATUS_NORMAL);
        return userMapper.selectCount(query);
    }
}

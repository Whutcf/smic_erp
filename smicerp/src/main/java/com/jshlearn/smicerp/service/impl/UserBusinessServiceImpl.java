package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.jshlearn.smicerp.exception.ErpException;
import com.jshlearn.smicerp.mapper.UserBusinessMapper;
import com.jshlearn.smicerp.pojo.UserBusiness;
import com.jshlearn.smicerp.service.UserBusinessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 业务字典实现类
 * @ClassName UserBusinessServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/14 12:02
 **/
@Slf4j
@Service
public class UserBusinessServiceImpl implements UserBusinessService {

    @Resource
    private UserBusinessMapper userBusinessMapper;

    @Override
    public List<UserBusiness> getBasicData(String keyId, String type) {

        List<UserBusiness> list = null;
        try {
            list = new LambdaQueryChainWrapper<>(userBusinessMapper).eq(UserBusiness::getKeyId, keyId).eq(UserBusiness::getType, type).list();
        } catch (Exception e) {
            ErpException.readFail(e);
            log.error(">>>>>>>>>>>查询用户权限异常！");
        }
        return list;
    }
}

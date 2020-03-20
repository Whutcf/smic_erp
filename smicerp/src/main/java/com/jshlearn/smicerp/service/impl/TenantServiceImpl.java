package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.jshlearn.smicerp.mapper.TenantMapper;
import com.jshlearn.smicerp.pojo.Tenant;
import com.jshlearn.smicerp.service.TenantService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @Description
 * @ClassName TenantServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/12 21:46
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class TenantServiceImpl implements TenantService {
    @Resource
    private TenantMapper tenantMapper;

    @Override
    public Tenant getTenantByTenantId(Long tenantId) {
        return new LambdaQueryChainWrapper<>(tenantMapper).eq(Tenant::getId,tenantId).one();
    }
}

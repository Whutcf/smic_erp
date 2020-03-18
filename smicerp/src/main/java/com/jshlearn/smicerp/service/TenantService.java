package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Tenant;

/**
 * @Description
 * @ClassName TenantService
 * @Author 蔡明涛
 * @Date 2020/3/12 21:45
 **/
public interface TenantService {
    /**
     * 获取租户Id
     * @param tenantId 租户id
     * @return com.jshlearn.smicerp.pojo.Tenant
     * @author 蔡明涛
     * @date 2020/3/12 21:49
     */
    Tenant getTenantByTenantId(Long tenantId);
}

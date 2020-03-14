package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.UserBusiness;

import java.util.List;

/**
 * @Description 业务字典service
 * @ClassName UserBusinessService
 * @Author 蔡明涛
 * @Date 2020/3/14 12:02
 **/
public interface UserBusinessService {
    /**
     * 获取用户角色清单
     * @param keyId 主Id, type 值
     * @return java.util.List<com.jshlearn.smicerp.pojo.UserBusiness>
     * @author 蔡明涛
     * @date 2020/3/14 12:11
     */
    List<UserBusiness> getBasicData(String keyId, String type);
}

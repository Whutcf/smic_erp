package com.jshlearn.smicerp.service.impl;

import com.jshlearn.smicerp.pojo.Role;

import java.util.List;

/**
 * @Description TODO
 * @ClassName RoleService
 * @Author 蔡明涛
 * @Date 2020/3/21 21:44
 **/
public interface RoleService {
    /**
     * 获取所有角色信息
     * @return java.util.List<com.jshlearn.smicerp.pojo.Role>
     * @author 蔡明涛
     * @date 2020/3/21 22:02
     */
    List<Role> getAll();
}

package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Role;

import java.util.List;
import java.util.Map;

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

    /**
     * 分页查询
     * @param role 角色对象
     * @param currentPage 当前页
     * @param pageSize 每页记录数
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/25 21:23
     */
    Map<String, Object> selectPage(Role role, Integer currentPage, Integer pageSize);
}

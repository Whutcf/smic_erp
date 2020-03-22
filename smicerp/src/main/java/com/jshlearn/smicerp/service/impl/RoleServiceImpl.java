package com.jshlearn.smicerp.service.impl;

import com.jshlearn.smicerp.mapper.RoleMapper;
import com.jshlearn.smicerp.pojo.Role;
import com.jshlearn.smicerp.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description TODO
 * @ClassName RoleServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/21 21:44
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;

    /**
     * 获取所有角色信息
     *
     * @return java.util.List<com.jshlearn.smicerp.pojo.Role>
     * @author 蔡明涛
     * @date 2020/3/21 22:02
     */
    @Override
    public List<Role> getAll() {
        return roleMapper.selectList(null);
    }
}

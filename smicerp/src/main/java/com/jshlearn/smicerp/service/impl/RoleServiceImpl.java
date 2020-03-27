package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.mapper.RoleMapper;
import com.jshlearn.smicerp.pojo.Role;
import com.jshlearn.smicerp.service.RoleService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    /**
     * 分页查询
     *
     * @param role        查询条件
     * @param currentPage 当前页
     * @param pageSize    每页记录数
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/25 21:23
     */
    @Override
    public Map<String, Object> selectPage(Role role, Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Role> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(role.getName()), Role::getName, role.getName())
                .eq(Role::getDeleteFlag, BusinessConstants.DELETE_FLAG_EXISTS);
        Page<Role> page = new Page<>(currentPage, pageSize);
        IPage<Role> iPage = roleMapper.selectPage(page, queryWrapper);
        return EasyUiPageUtil.pageResult(iPage.getTotal(), iPage.getRecords());
    }
}

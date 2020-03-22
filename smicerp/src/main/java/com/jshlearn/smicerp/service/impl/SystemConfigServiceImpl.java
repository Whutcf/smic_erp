package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.SystemConfigMapper;
import com.jshlearn.smicerp.pojo.SystemConfig;
import com.jshlearn.smicerp.service.SystemConfigService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Description
 * @ClassName SystemConfigServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/22 21:38
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class SystemConfigServiceImpl implements SystemConfigService {
    @Resource
    private SystemConfigMapper systemConfigMapper;

    /**
     * 分页获取配置信息
     *
     * @param currentPage 当前页
     * @param pageSize    页面显示记录数
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/22 21:46
     */
    @Override
    public Map<String, Object> selectPage(Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<SystemConfig> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(SystemConfig::getDeleteFlag,"0");
        Page<SystemConfig> page = new Page<>(currentPage,pageSize);
        IPage<SystemConfig> iPage = systemConfigMapper.selectPage(page,queryWrapper);
        return EasyUiPageUtil.pageResult(iPage.getTotal(),iPage.getRecords());
    }
}

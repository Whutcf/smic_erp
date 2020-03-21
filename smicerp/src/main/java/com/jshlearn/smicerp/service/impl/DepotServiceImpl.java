package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.DepotMapper;
import com.jshlearn.smicerp.pojo.Depot;
import com.jshlearn.smicerp.service.DepotService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Description
 * @ClassName DepotServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/18 22:37
 **/
@Slf4j
@Service
public class DepotServiceImpl implements DepotService  {

    @Resource
    private DepotMapper depotMapper;

    @Override
    @Transactional(readOnly = true)
    public Map<String,Object> showDepotDetails(Depot depot, Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Depot> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.like(StringUtils.isNotBlank(depot.getName()),Depot::getName,depot.getName());
        queryWrapper.eq(Depot::getType,depot.getType());
        queryWrapper.like(StringUtils.isNotBlank(depot.getRemark()),Depot::getRemark,depot.getRemark());
        // 要获取未删除的
        queryWrapper.eq(Depot::getDeleteFlag,0);
        Page<Depot> page = new Page<>(currentPage,pageSize);
        IPage<Depot> iPage = depotMapper.selectPage(page,queryWrapper);
        return EasyUiPageUtil.pageResult(iPage.getTotal(),iPage.getRecords());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int setDepotIsDefault(Long id) {

        depotMapper.setNonDefaultDepotById(id);

        return depotMapper.setDefaultDepotById(id);
    }
}

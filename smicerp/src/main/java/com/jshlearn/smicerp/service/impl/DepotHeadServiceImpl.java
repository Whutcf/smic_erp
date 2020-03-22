package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.jshlearn.smicerp.mapper.DepotHeadMapper;
import com.jshlearn.smicerp.pojo.DepotHead;
import com.jshlearn.smicerp.service.DepotHeadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;

/**
 * @Description
 * @ClassName DepotHeadServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/22 15:45
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class DepotHeadServiceImpl implements DepotHeadService {
    @Resource
    private DepotHeadMapper depotHeadMapper;

    /**
     * 根据时间和type获取总金额
     *
     * @param type      出入库类型
     * @param subType   出入库子类
     * @param beginTime 开始时间
     * @param endTime   截至时间
     * @return java.math.BigDecimal
     * @author 蔡明涛
     * @date 2020/3/22 16:21
     */
    @Override
    public BigDecimal getBuyAndSaleStatistics(String type, String subType, String beginTime, String endTime) {
        QueryWrapper<DepotHead> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("ifnull(sum(discount_last_money),0)").eq(StringUtils.isNotBlank(type), "type", type)
                .eq(StringUtils.isNotBlank(subType), "sub_type", subType)
                .ge(StringUtils.isNotBlank(beginTime), "oper_time", beginTime)
                .lt(StringUtils.isNotBlank(endTime), "oper_time", endTime).eq("delete_flag","0");
        return (BigDecimal) depotHeadMapper.selectObjs(queryWrapper).get(0);
    }
}

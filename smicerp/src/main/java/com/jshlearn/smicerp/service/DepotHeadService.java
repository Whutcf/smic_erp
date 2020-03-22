package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.DepotHead;

import java.math.BigDecimal;
import java.util.Map;

/**
 * @Description
 * @ClassName DepotHeadService
 * @Author 蔡明涛
 * @Date 2020/3/22 15:45
 **/
public interface DepotHeadService {
    /**
     * 根据时间和type获取总金额
     * @param type 出入库类型
     * @param subType 出入库子类
     * @param beginTime 开始时间
     * @param endTime 截至时间
     * @return java.math.BigDecimal
     * @author 蔡明涛
     * @date 2020/3/22 16:21
     */
    BigDecimal getBuyAndSaleStatistics(String type, String subType, String beginTime, String endTime);

    /**
     * 分页查询
     * @param depotHead  单据主表对象
     * @param currentPage 当前页
     * @param pageSize 页面条数
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/22 23:05
     */
    Map<String, Object> selectPage(DepotHead depotHead, Integer currentPage, Integer pageSize);
}

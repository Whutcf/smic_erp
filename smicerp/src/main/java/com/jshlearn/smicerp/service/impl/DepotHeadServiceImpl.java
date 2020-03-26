package com.jshlearn.smicerp.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.mapper.DepotHeadMapper;
import com.jshlearn.smicerp.pojo.DepotHead;
import com.jshlearn.smicerp.service.DepotHeadService;
import com.jshlearn.smicerp.utils.CommonUtils;
import com.jshlearn.smicerp.vo.DepotHeadVo4List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

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
                .lt(StringUtils.isNotBlank(endTime), "oper_time", endTime).eq("delete_flag", "0");
        return (BigDecimal) depotHeadMapper.selectObjs(queryWrapper).get(0);
    }

    /**
     * 分页查询
     *
     * @param parseObject 查询参数的json对象
     * @param offSet 起始页
     * @param pageSize    页面条数
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/22 23:05
     */
    @Override
    public Map<String, Object> selectPage(JSONObject parseObject, Integer offSet, Integer pageSize) {
        // parseObject 包含的参数： type,subType,state(未用到),number,beginTime,endTime,materialParam,depotIds
        String type = (String) parseObject.get("type");
        String subType = (String) parseObject.get("subType");
        String number = (String) parseObject.get("number");
        String beginTime = (String) parseObject.get("beginTime");
        String endTime = (String) parseObject.get("endTime");
        String materialParam = (String) parseObject.get("materialParam");
        // string字符串转集合才能用mybatis的foreach，否则直接用${depotIds}就可以了
        // 下面的操作仅仅练习使用，正常不这样操作
        String depotIds = (String) parseObject.get("depotIds");
        // 将字符串分割成数组
        String[] strings = depotIds.split(",");
        // 将数组转换成集合
        List<String> toList = Arrays.asList(strings);
        // 去重
        List<String> depotIdList = CommonUtils.delRepeatWithJava8(toList);
        List<DepotHeadVo4List> list = depotHeadMapper.selectByConditionDeportHead(type, subType, number,
                beginTime, endTime, materialParam, depotIdList, offSet, pageSize);

        List<DepotHeadVo4List> resList = new ArrayList<>();
        // 一些需要单独处理的字段
        if (null != list) {
            for (DepotHeadVo4List dh : list) {
                if (dh.getOtherMoneyList() != null) {
                    // 销售或采购费用中涉及的项目(仓库)id组成的字符串
                    String otherMoneyListStr = dh.getOtherMoneyList().replace("[", "").replace("]", "").replaceAll("\"", "");
                    dh.setOtherMoneyList(otherMoneyListStr);
                }
                // 获取变动金额的绝对值
                if (dh.getChangeAmount() != null) {
                    dh.setChangeAmount(dh.getChangeAmount().abs());
                }
                // 获取合计金额的绝对值
                if (dh.getTotalPrice() != null) {
                    dh.setTotalPrice(dh.getTotalPrice().abs());
                }
                // 获取产品名称+型号的字符串
                dh.setMaterialsList(findMaterialsListByHeaderId(dh.getId()));
                resList.add(dh);
            }
        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put(PageConstants.TOTAL, resList.size());
        resultMap.put(PageConstants.ROWS, resList);
        return resultMap;
    }

    /**
     * 根据单据主表的id及单据子表的headId 和 单据子表中的materialId及产品表的id 取得产品名称加信号的字符串
     * @param id 单据主表的id，对应的是单据子表中的headId
     * @return String 产品名称+型号的字符串
     * @author 蔡明涛
     * @date 2020/3/24 19:09
     */
    private String findMaterialsListByHeaderId(Long id) {
        return depotHeadMapper.findMaterialsListByHeaderId(id);
    }
}

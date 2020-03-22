package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.service.DepotHeadService;
import com.jshlearn.smicerp.service.DepotItemService;
import com.jshlearn.smicerp.utils.DateUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description
 * @ClassName DepotItemController
 * @Author 蔡明涛
 * @Date 2020/3/22 17:13
 **/
@RestController
@Slf4j
@RequestMapping("/depotItem")
public class DepotItemController {
    @Resource
    private DepotItemService depotItemService;
    @Resource
    private DepotHeadService depotHeadService;

    @GetMapping("/buyOrSalePrice")
    public ResultBean<JSONObject> buyOrSalePrice() {
        // 获取前六个月的日期
        List<String> monthsFromNow = DateUtils.getMonthsFromNow(6L);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("monthList", monthsFromNow);


        // 获取前六个月的销售数据(包含零售,剔除退货）
        List<BigDecimal> outPriceList = new ArrayList<>();
        // 注意是0也算一个，所以从5开始
        for (long i = 5L ; i >= 0; i--) {
            String firstDay = DateUtils.getFirstDayOfMonth(LocalDate.now().minusMonths(i)) + " 00:00:00";
            String lastDay = DateUtils.getFirstDayOfMonth(LocalDate.now().minusMonths(i-1)) + " 00:00:00";
            BigDecimal saleStatistics = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_SALES,firstDay,lastDay);
            BigDecimal retailSaleStatistics = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_RETAIL,firstDay,lastDay);
            BigDecimal saleReturnStatistics = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_SALES_RETURNS,firstDay,lastDay);
            BigDecimal retailSaleReturnStatistics = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_RETAIL_RETURNS,firstDay,lastDay);
            BigDecimal outPrice = (saleStatistics.subtract(saleReturnStatistics)).add(retailSaleStatistics.subtract(retailSaleReturnStatistics));
            outPriceList.add(outPrice);
        }
        jsonObject.put("salePriceList",outPriceList);

        // 获取前六个月的采购数据(剔除退货）
        List<BigDecimal> inPriceList = new ArrayList<>();
        for (long i = 5L; i >=0 ; i--) {
            String firstDay = DateUtils.getFirstDayOfMonth(LocalDate.now().minusMonths(i)) + " 00:00:00";
            String lastDay = DateUtils.getFirstDayOfMonth(LocalDate.now().minusMonths(i-1)) + " 00:00:00";
            BigDecimal buyStatistics = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_STORAGE, BusinessConstants.SUB_TYPE_PURCHASE,firstDay,lastDay);
            BigDecimal buyReturnStatistics = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_STORAGE, BusinessConstants.SUB_TYPE_PURCHASE_RETURNS,firstDay,lastDay);
            inPriceList.add(buyStatistics.subtract(buyReturnStatistics));
        }
        jsonObject.put("buyPriceList",inPriceList);

        return ResultBeanUtil.success(jsonObject);
    }
}

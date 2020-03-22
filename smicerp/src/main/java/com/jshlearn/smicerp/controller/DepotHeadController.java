package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.DepotHead;
import com.jshlearn.smicerp.service.DepotHeadService;
import com.jshlearn.smicerp.utils.DateUtils;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description 单据主表处理
 * @ClassName DepotHeadController
 * @Author 蔡明涛
 * @Date 2020/3/22 15:42
 **/
@RestController
@Slf4j
@RequestMapping("/depotHead")
public class DepotHeadController {
    @Resource
    private DepotHeadService depotHeadService;

    /**
     * 获取今日销售额，本月销售额，本月进货额
     *
     * @return com.jshlearn.smicerp.utils.ResultBean<java.util.Map < java.lang.String, java.math.BigDecimal>>
     * @author 蔡明涛
     * @date 2020/3/22 16:03
     */
    @GetMapping("/getBuyAndSaleStatistics")
    public ResultBean<Map<String, BigDecimal>> getBuyAndSaleStatistics() {
        String today = DateUtils.getCurrentDate() + " 00:00:00";
        String firstDay = DateUtils.getFirstDayOfMonth(LocalDate.now()) + " 00:00:00";
        // 今日销售
        BigDecimal todaySale = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_SALES,
                today, DateUtils.getCurrentDateTime());
        // 今日零售
        BigDecimal todayRetailSale = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_RETAIL,
                today, DateUtils.getCurrentDateTime());
        // 本月销售
        BigDecimal monthSale = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_SALES,
                firstDay, DateUtils.getCurrentDateTime());
        // 本月零售
        BigDecimal monthRetailSale = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_OUT, BusinessConstants.SUB_TYPE_RETAIL,
                firstDay, DateUtils.getCurrentDateTime());
        // 本月采购
        BigDecimal monthBuy = depotHeadService.getBuyAndSaleStatistics(BusinessConstants.DEPOTHEAD_TYPE_STORAGE, BusinessConstants.SUB_TYPE_PURCHASE,
                firstDay, DateUtils.getCurrentDateTime());
        Map<String, BigDecimal> map = new HashMap<>(16);
        map.put("todaySale", todaySale.add(todayRetailSale));
        map.put("thisMonthSale", monthSale.add(monthRetailSale));
        map.put("thisMonthBuy", monthBuy);
        return ResultBeanUtil.success(map);
    }

    @GetMapping("/list")
    public ResultBean<Map<String, Object>> getPageRecords(@RequestParam(PageConstants.SEARCH) String search,
                                                          @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                          @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                          HttpServletRequest request) {
        DepotHead depotHead = (DepotHead) ErpCustomUtils.getClassObject(search, DepotHead.class);
        Map<String,Object> pageRecords = depotHeadService.selectPage(depotHead,currentPage,pageSize);
        return ResultBeanUtil.success(pageRecords);
    }
}

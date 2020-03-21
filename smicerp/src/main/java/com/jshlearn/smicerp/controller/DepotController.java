package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Depot;
import com.jshlearn.smicerp.service.DepotService;
import com.jshlearn.smicerp.service.LogService;
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
import java.util.Map;

/**
 * @Description
 * @ClassName DepotController
 * @Author 蔡明涛
 * @Date 2020/3/18 22:40
 **/
@Slf4j
@RestController
@RequestMapping("/depot")
public class DepotController {

    @Resource
    private DepotService depotService;

    @Resource
    private LogService logService;


    @GetMapping("/getDepotList")
    public ResultBean<Map<String,Object>> showDepotDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                    @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                    @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                    HttpServletRequest request){
        // TODO 添加操作日志记录
        Depot depot = (Depot) ErpCustomUtils.getClassObject(search, Depot.class);
        Map<String,Object> pageRecords = depotService.showDepotDetails(depot,currentPage,pageSize);
        return ResultBeanUtil.success(pageRecords);
    }

    @GetMapping("/updateDepotIsDefault")
    public ResultBean<Depot> setDepotIsDefault(@RequestParam("depotId") String depotId,
                                               HttpServletRequest request){
        // TODO 添加操作日志记录
       int i = depotService.setDepotIsDefault(Long.parseLong(depotId));
        if (i > 0){
            return ResultBeanUtil.success();
        } else {
            return ResultBeanUtil.error(ExceptionConstants.DEPOT_EDIT_FAILED_CODE,ExceptionConstants.DEPOT_EDIT_FAILED_MSG);
        }
    }

    // TODO 删除和增加选项由于系统的相关模块还未完善，暂不处理

}

package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Depot;
import com.jshlearn.smicerp.service.DepotService;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Description TODO
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


    @GetMapping("getDepotList")
    public ResultBean<List<Depot>> showDepotDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                    @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                    @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                    HttpServletRequest request){
        JSONObject jsonObject = JSON.parseObject(search);
        Depot depot = JSON.toJavaObject(jsonObject, Depot.class);
        List<Depot> depots = depotService.showDepotDetails(depot,currentPage,pageSize);
        return ResultBeanUtil.success(depots);

    }

}

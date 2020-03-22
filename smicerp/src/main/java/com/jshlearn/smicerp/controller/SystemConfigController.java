package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.service.SystemConfigService;
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
 * @Description 系统参数，如公司相关信息，仓库相关信息配置
 * @ClassName SystemConfigController
 * @Author 蔡明涛
 * @Date 2020/3/22 21:40
 **/
@RestController
@Slf4j
@RequestMapping("/systemConfig")
public class SystemConfigController {
    @Resource
    private SystemConfigService systemConfigService;
    @Resource
    private LogService logService;

    @GetMapping("/list")
    public ResultBean<Map<String,Object>> getPageRecords(@RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                         @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                         HttpServletRequest request){
        Map<String,Object> pageRecords = systemConfigService.selectPage(currentPage,pageSize);
        return ResultBeanUtil.success(pageRecords);
    }
}

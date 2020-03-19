package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.InOutItem;
import com.jshlearn.smicerp.service.InOutItemService;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Description TODO
 * @ClassName InOutItemController
 * @Author 蔡明涛
 * @Date 2020/3/19 22:27
 **/
@Slf4j
@RestController
@RequestMapping("/inOutItem")
public class InOutItemController {

    @Resource
    private InOutItemService inOutItemService;

    @Resource
    private LogService logService;

    @GetMapping("/list")
    public ResultBean<List<InOutItem>> showInOutItemDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                           @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                           @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                           HttpServletRequest request) {
        JSONObject jsonObject = JSON.parseObject(search);
        InOutItem inOutItem = JSON.toJavaObject(jsonObject, InOutItem.class);
        List<InOutItem> inOutItems = inOutItemService.selectPage(inOutItem,currentPage,pageSize);
        return ResultBeanUtil.success(inOutItems);
    }

    @GetMapping("/checkIsNameExist")
    public ResultBean<JSONObject> checkInOutItemName(@RequestParam(PageConstants.NAME) String name,HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        InOutItem inOutItem = inOutItemService.getItemByName(name);
        jsonObject.put("item",inOutItem);
        return ResultBeanUtil.success(jsonObject);
    }

    @PostMapping("/add")
    public ResultBean<InOutItem> add(@RequestParam(PageConstants.INFO) String info,HttpServletRequest request){
        int i = inOutItemService.add(JSON.toJavaObject(JSON.parseObject(info),InOutItem.class));
        return i>0 ?ResultBeanUtil.success():ResultBeanUtil.error(ExceptionConstants.SERVICE_SYSTEM_ERROR_CODE,ExceptionConstants.SERVICE_SYSTEM_ERROR_MSG);
    }

    // TODO 删除模块需要等财务模块写好再重构

}

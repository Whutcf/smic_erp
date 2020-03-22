package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.InOutItem;
import com.jshlearn.smicerp.service.InOutItemService;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @Description 收支项目管理
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
    public ResultBean<Map<String,Object>> showInOutItemDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                           @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                           @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                           HttpServletRequest request) {
        InOutItem inOutItem = (InOutItem) ErpCustomUtils.getClassObject(search, InOutItem.class);
        Map<String,Object> pageRecords = inOutItemService.selectPage(inOutItem,currentPage,pageSize);
        return ResultBeanUtil.success(pageRecords);
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

    @PostMapping("/update")
    public ResultBean<InOutItem> update(@RequestParam(PageConstants.INFO) String info, @RequestParam(PageConstants.ID) Long id, HttpServletRequest request){
        InOutItem inOutItem = (InOutItem)ErpCustomUtils.getClassObject(info,InOutItem.class);
        int i = inOutItemService.update(id,inOutItem);
        return i>0 ? ResultBeanUtil.success(): ResultBeanUtil.error(ExceptionConstants.IN_OUT_ITEM_ADD_FAILED_CODE,ExceptionConstants.IN_OUT_ITEM_EDIT_FAILED_MSG);
    }

    /**
     * 查找收支项目信息-下拉框
     * @param type 收支类型
     * @param request 请求
     * @return com.alibaba.fastjson.JSONArray
     * @author 蔡明涛
     * @date 2020/3/22 22:59
     */
    @GetMapping("/findBySelect")
    public JSONArray findBySelect(@RequestParam(PageConstants.TYPE) String type,HttpServletRequest request){
        JSONArray jsonArray = new JSONArray();
        List<InOutItem> inOutItemList = inOutItemService.findBySelect(type);
        if (inOutItemList != null){
            for (InOutItem inOutItem : inOutItemList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("Id",inOutItem.getId());
                jsonObject.put("InOutItemName",inOutItem.getName());
                jsonArray.add(jsonObject);
            }
        }
        return jsonArray;
    }


    // TODO 删除模块需要等财务模块写好再重构

}

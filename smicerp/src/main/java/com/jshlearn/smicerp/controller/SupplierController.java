package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.gson.JsonObject;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Log;
import com.jshlearn.smicerp.pojo.Supplier;
import com.jshlearn.smicerp.pojo.User;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.service.SupplierService;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Description TODO
 * @ClassName SupplierController
 * @Author 蔡明涛
 * @Date 2020/3/15 20:14
 **/
@Slf4j
@RestController
@RequestMapping("/supplier")
public class SupplierController {

    @Resource
    private SupplierService supplierService;

    @Resource
    private LogService logService;

    @GetMapping("/list")
    public ResultBean<List<Supplier>> showSupplierDetails(@RequestParam(value = PageConstants.SEARCH, required = false) String search,
                                          @RequestParam(value = PageConstants.CURRENT_PAGE, required = false) Integer currentPage,
                                          @RequestParam(value = PageConstants.PAGE_SIZE, required = false) Integer pageSize,
                                          HttpServletRequest request) {
        // 将页面传入的Json字符串转换成Json对象
        JSONObject jsonObject = JSON.parseObject(search);
        // 将转化过来的值直接赋值成 Supplier 的对象
        Supplier supplier = JSON.toJavaObject(jsonObject, Supplier.class);
        // 获取的是供应商信息的集合
        List<Supplier> pageRecords = supplierService.selectPage(supplier,currentPage,pageSize);
        // 记录操作人的日志
        Log logInfo = ErpCustomUtils.initialLog(request);
        User user = (User) request.getSession().getAttribute("user");
        logInfo.setOperation(BusinessConstants.SUPPLIER_MANAGEMENT);
        logInfo.setContentDetails(user.getUserName()+BusinessConstants.LOG_OPERATION_TYPE_SELECT+ ExceptionConstants.SERVICE_SUCCESS_MSG);
        logInfo.setRemark(BusinessConstants.LOG_OPERATION_TYPE_SELECT+ ExceptionConstants.SERVICE_SUCCESS_MSG);
        logService.insertLog(logInfo);

        return ResultBeanUtil.success(pageRecords);
    }

    @PostMapping("/add")
    public ResultBean<Supplier> addSupplier(@RequestParam(value = PageConstants.INFO)String info,HttpServletRequest request){

        JSONObject jsonObject = JSON.parseObject(info);
        Supplier supplier = JSON.toJavaObject(jsonObject,Supplier.class);
        int i = supplierService.save(supplier);
        if (i > 0) {
            return ResultBeanUtil.success();
        }else {
            return ResultBeanUtil.error(ExceptionConstants.SUPPLIER_ADD_FAILED_CODE,ExceptionConstants.SUPPLIER_ADD_FAILED_MSG);
        }

    }
}

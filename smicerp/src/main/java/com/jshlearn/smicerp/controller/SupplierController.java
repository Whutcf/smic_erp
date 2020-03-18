package com.jshlearn.smicerp.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Log;
import com.jshlearn.smicerp.pojo.Supplier;
import com.jshlearn.smicerp.pojo.User;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.service.SupplierService;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ExcelUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description
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

        User user = (User) request.getSession().getAttribute("user");
        Log logInfo = ErpCustomUtils.initialLog(request);
        logInfo.setOperation(BusinessConstants.SUPPLIER_MANAGEMENT);
        logInfo.setContentDetails(user.getUserName()+BusinessConstants.LOG_OPERATION_TYPE_ADD+supplier.getSupplier());

        int i = supplierService.save(supplier);
        if (i > 0) {
            logInfo.setRemark(BusinessConstants.LOG_OPERATION_TYPE_ADD+ExceptionConstants.SERVICE_SUCCESS_MSG);
            logService.insertLog(logInfo);
            return ResultBeanUtil.success();
        }else {
            logInfo.setRemark(ExceptionConstants.SUPPLIER_ADD_FAILED_MSG);
            logService.insertLog(logInfo);
            return ResultBeanUtil.error(ExceptionConstants.SUPPLIER_ADD_FAILED_CODE,ExceptionConstants.SUPPLIER_ADD_FAILED_MSG);
        }
    }

    @GetMapping("/checkIsNameExist")
    public ResultBean<JSONObject> checkIsNameExist(@RequestParam(value = "name")String supplierName,HttpServletRequest request){

        // TODO 记录操作日志表
        JSONObject jsonObject = new JSONObject();

        Boolean flag = supplierService.checkIsNameExist(supplierName);
        jsonObject.put("status",flag);
        if (flag){
            return ResultBeanUtil.success(jsonObject);
        }else {
            return ResultBeanUtil.success();
        }
    }

    @PostMapping("/batchSetEnable")
    public ResultBean<Supplier> batchSetEnable(@RequestParam(value = "enabled") Boolean enabled,
                                          @RequestParam(value = "supplierIDs") String supplierIds,
                                          HttpServletRequest request){

        // TODO 记录操作日志
        int i = supplierService.batchSetEnable(enabled,supplierIds);
        if (i>0){
            return ResultBeanUtil.success();
        }else {
            return ResultBeanUtil.error(ExceptionConstants.USER_EDIT_FAILED_CODE,ExceptionConstants.USER_EDIT_FAILED_MSG);
        }
    }

    //TODO 目前删除接口暂时还不能做，需要等单据接口和财务接口完成后操作

    @GetMapping("/exportExcel")
    public void exportExcel(@RequestParam("supplier")String supplier,
                            @RequestParam("type")String type,
                            @RequestParam("phoneNum")String phoneNum,
                            @RequestParam("telephone")String telephone,
                            @RequestParam("description")String description,
                            HttpServletRequest request, HttpServletResponse response){
        List<Supplier> dataList = supplierService.getExcelData(supplier,type,phoneNum,telephone,description);
        String[] titles = {"名称","联系人","手机号码","电子邮箱","联系电话","传真","预付款","期初应收","期初应付","期末应收","期末应付","税率%","状态"};
        String excelName = "供应商信息";
        List<String[]> exportData = new ArrayList<>();
        if (dataList.size()>0){
            for (Supplier s: dataList) {
                String[] data = new String[13];
                data[0] = s.getSupplier();
                data[1] = s.getContacts();
                data[2] = s.getPhoneNum();
                data[3] = s.getEmail();
                data[4] = s.getTelephone();
                data[5] = s.getFax();
                data[6] = s.getAdvanceIn() == null ? "" : s.getAdvanceIn().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                data[7] = s.getBeginNeedGet() == null ? "" : s.getBeginNeedGet().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                data[8] = s.getBeginNeedPay() == null ? "" : s.getBeginNeedPay().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                data[9] = s.getAllNeedGet() == null ? "" : s.getAllNeedGet().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                data[10] = s.getAllNeedPay() == null ? "" : s.getAllNeedPay().setScale(2, BigDecimal.ROUND_HALF_UP).toString();
                data[11] = s.getTaxRate() == null ? "" : s.getTaxRate().toString();
                data[12] = s.isEnabled() ? "启用" : "禁用";
                exportData.add(data);
            }
        }
        ExcelUtils.export(excelName,titles,exportData,response);
    }

}

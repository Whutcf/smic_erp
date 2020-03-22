package com.jshlearn.smicerp.controller;

import com.jshlearn.smicerp.constants.ExceptionConstants;
import com.jshlearn.smicerp.constants.PageConstants;
import com.jshlearn.smicerp.pojo.Account;
import com.jshlearn.smicerp.service.AccountService;
import com.jshlearn.smicerp.service.LogService;
import com.jshlearn.smicerp.utils.ErpCustomUtils;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Description
 * @ClassName AccountController
 * @Author 蔡明涛
 * @Date 2020/3/20 20:23
 **/
@Slf4j
@RestController
@RequestMapping("/account")
public class AccountController {
    @Resource
    private AccountService accountService;
    @Resource
    private LogService logService;

    @GetMapping("/list")
    public ResultBean<Map<String, Object>> showAccountDetails(@RequestParam(PageConstants.SEARCH) String search,
                                                              @RequestParam(PageConstants.CURRENT_PAGE) Integer currentPage,
                                                              @RequestParam(PageConstants.PAGE_SIZE) Integer pageSize,
                                                              HttpServletRequest request) {
        // TODO 操作日志记录
        Account account = (Account) ErpCustomUtils.getClassObject(search, Account.class);
        Map<String,Object> pageRecords = accountService.selectPage(account,currentPage,pageSize);
        return ResultBeanUtil.success(pageRecords);
    }

    @GetMapping("/checkIsNameExist")
    public ResultBean<Account> checkIsNameExist(@RequestParam("name") String name) {
        Account account= accountService.getOneAccountByName(name);
        return ResultBeanUtil.success(account);
    }

    @PostMapping("/add")
    public ResultBean<Account> add(@RequestParam(PageConstants.INFO) String info,HttpServletRequest request){
        Account account = (Account)ErpCustomUtils.getClassObject(info,Account.class);
        int i = accountService.save(account);
        return i>0 ? ResultBeanUtil.success(): ResultBeanUtil.error(ExceptionConstants.ACCOUNT_ADD_FAILED_CODE,ExceptionConstants.ACCOUNT_ADD_FAILED_MSG);
    }

    @PostMapping("/updateAmountIsDefault")
    public void updateAmountIsDefault(@RequestParam("accountId") Long accountId,@RequestParam("isDefault") Boolean isDefault, HttpServletRequest request){
        accountService.updateAmountIsDefault(accountId,isDefault);
    }

    // TODO 删除接口和账户出入详情接口
}


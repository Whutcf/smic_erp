package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.conditions.update.LambdaUpdateChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jshlearn.smicerp.mapper.AccountMapper;
import com.jshlearn.smicerp.pojo.Account;
import com.jshlearn.smicerp.service.AccountService;
import com.jshlearn.smicerp.utils.EasyUiPageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * @Description
 * @ClassName AccountServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/20 20:08
 **/
@Service
@Slf4j
public class AccountServiceImpl implements AccountService {
    @Resource
    private AccountMapper accountMapper;

    /**
     * 分页查询
     *
     * @param account     账户对象
     * @param currentPage 当前页
     * @param pageSize    页面记录数
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/21 11:03
     */
    @Override
    public Map<String, Object> selectPage(Account account, Integer currentPage, Integer pageSize) {
        LambdaQueryWrapper<Account> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.like(StringUtils.isNotBlank(account.getName()), Account::getName, account.getName());
        queryWrapper.like(StringUtils.isNotBlank(account.getSerialNo()), Account::getSerialNo, account.getSerialNo());
        queryWrapper.like(StringUtils.isNotBlank(account.getRemark()), Account::getRemark, account.getRemark());
        queryWrapper.eq(Account::getDeleteFlag, "0");
        Page<Account> page = new Page<>(currentPage, pageSize);
        IPage<Account> iPage = accountMapper.selectPage(page, queryWrapper);
        return EasyUiPageUtil.pageResult(iPage.getTotal(), iPage.getRecords());
    }

    /**
     * 根据名字获取一个account对象
     *
     * @param name 账户名
     * @return com.jshlearn.smicerp.pojo.Account
     * @author 蔡明涛
     * @date 2020/3/21 12:09
     */
    @Override
    public Account getOneAccountByName(String name) {
        return new LambdaQueryChainWrapper<>(accountMapper).eq(StringUtils.isNotBlank(name), Account::getName, name).one();
    }

    /**
     * 添加账户信息
     *
     * @param account 账户
     * @return int
     * @author 蔡明涛
     * @date 2020/3/21 12:21
     */
    @Override
    public int save(Account account) {
        account.setCreateTime(new Date());
        return accountMapper.insert(account);
    }

    /**
     * 设置默认账户
     *
     * @param accountId 账户id
     * @param isDefault 是否默认
     * @return void
     * @author 蔡明涛
     * @date 2020/3/21 14:55
     */
    @Override
    public void updateAmountIsDefault(Long accountId, Boolean isDefault) {
        new LambdaUpdateChainWrapper<>(accountMapper).eq(Account::getId,accountId).set(Account::getIsDefault,isDefault).set(Account::getUpdateTime,new Date()).update();
    }
}

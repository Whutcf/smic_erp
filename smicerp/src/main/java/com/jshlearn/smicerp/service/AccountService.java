package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Account;

import java.util.Map;

/**
 * @Description
 * @ClassName AccountService
 * @Author 蔡明涛
 * @Date 2020/3/20 20:07
 **/
public interface AccountService {
    /**
     * 分页查询
     * @param account 账户对象
     * @param currentPage 当前页
     * @param pageSize 页面记录数
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/21 11:03
     */
    Map<String, Object> selectPage(Account account, Integer currentPage, Integer pageSize);

    /**
     * 根据名字获取一个account对象
     * @param name
     * @return com.jshlearn.smicerp.pojo.Account
     * @author 蔡明涛
     * @date 2020/3/21 12:09
     */
    Account getOneAccountByName(String name);

    /**
     * 添加账户信息
     * @param account 账户
     * @return int
     * @author 蔡明涛
     * @date 2020/3/21 12:21
     */
    int save(Account account);

    /**
     *  设置默认账户
     * @param accountId 账户id
     * @param isDefault 是否默认
     * @return void
     * @author 蔡明涛
     * @date 2020/3/21 14:55
     */
    void updateAmountIsDefault(Long accountId, Boolean isDefault);

    /**
     *  更新账户信息
     * @param id 账户id
     * @param account 账户信息
     * @return int
     * @author 蔡明涛
     * @date 2020/3/22 11:47
     */
    int update(Long id, Account account);
}

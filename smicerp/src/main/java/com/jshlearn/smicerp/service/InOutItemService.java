package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.InOutItem;

import java.util.Map;

/**
 * @Description
 * @ClassName InOutItemService
 * @Author 蔡明涛
 * @Date 2020/3/19 22:25
 **/
public interface InOutItemService {
    /**
     * 分页查询收支项目
     *
     * @param inOutItem   收支项目类
     * @param currentPage 当前页
     * @param pageSize    页面记录数
     * @return Map<String, Object>
     * @author 蔡明涛
     * @date 2020/3/21 10:25
     */
    Map<String, Object> selectPage(InOutItem inOutItem, Integer currentPage, Integer pageSize);

    /**
     * 根据名字查找对象
     *
     * @param name 收支项目名称
     * @return com.jshlearn.smicerp.pojo.InOutItem
     * @author 蔡明涛
     * @date 2020/3/19 22:52
     */
    InOutItem getItemByName(String name);

    /**
     * 新增收支项目
     *
     * @param inOutItem 收支项目对象
     * @return int
     * @author 蔡明涛
     * @date 2020/3/19 23:07
     */
    int add(InOutItem inOutItem);

    /**
     * 更新
     * @param id Long id
     * @param inOutItem 不包含id和time的实体对象
     * @return int
     * @author 蔡明涛
     * @date 2020/3/22 12:06
     */
    int update(Long id, InOutItem inOutItem);
}

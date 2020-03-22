package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Person;

import java.util.Map;

/**
 * @Description
 * @ClassName PersonService
 * @Author 蔡明涛
 * @Date 2020/3/21 20:32
 **/
public interface PersonService {
    /**
     * 分页获取经手人管理
     * @param person 经手人对象
     * @param currentPage 当前页
     * @param pageSize 当前页记录数
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/21 20:44
     */
    Map<String, Object> selectPage(Person person, Integer currentPage, Integer pageSize);

    /**
     * 保存经手人
     * @param person 经手人对象
     * @return int
     * @author 蔡明涛
     * @date 2020/3/22 0:18
     */
    int savePerson(Person person);

    /**
     * 根据id修改type
     * @param id Long id
     * @Param type  经手人的角色
     * @return boolean
     * @author 蔡明涛
     * @date 2020/3/22 11:11
     */
    boolean updatePerson(Long id, String type);
}

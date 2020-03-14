package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Functions;

import java.util.List;

/**
 * @Description
 * @ClassName FunctionsService
 * @Author 蔡明涛
 * @Date 2020/3/14 12:44
 **/
public interface FunctionsService {
    /**
     * 根据层级编号获取功能菜单
     * @param pNumber 层级编号
     * @return java.util.List<com.jshlearn.smicerp.pojo.Functions>
     * @author 蔡明涛
     * @date 2020/3/14 13:53
     */
    List<Functions> getRoleFunctions(String pNumber);
}

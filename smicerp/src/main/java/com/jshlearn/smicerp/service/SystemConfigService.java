package com.jshlearn.smicerp.service;

import java.util.Map;

/**
 * @Description
 * @ClassName SystemConfigService
 * @Author 蔡明涛
 * @Date 2020/3/22 21:38
 **/
public interface SystemConfigService {
    /**
     * 分页获取配置信息
     * @param currentPage 当前页
     * @param pageSize 页面显示记录数
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @author 蔡明涛
     * @date 2020/3/22 21:46
     */
    Map<String, Object> selectPage(Integer currentPage, Integer pageSize);
}

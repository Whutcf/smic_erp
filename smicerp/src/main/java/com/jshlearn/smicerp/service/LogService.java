package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.Log;

/**
 * @Description 记录系统操作信息
 * @ClassName LogService
 * @Author 蔡明涛
 * @Date 2020/3/12 22:01
 **/
public interface LogService {
    /**
     * 记录系统操作日志
     * @param logInfo 操作信息实体
     * @return void
     * @author 蔡明涛
     * @date 2020/3/12 23:04
     */
    void insertLog(Log logInfo);
}

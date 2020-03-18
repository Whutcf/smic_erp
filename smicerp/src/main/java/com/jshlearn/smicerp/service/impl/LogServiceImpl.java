package com.jshlearn.smicerp.service.impl;

import com.jshlearn.smicerp.exception.ErpException;
import com.jshlearn.smicerp.mapper.LogMapper;
import com.jshlearn.smicerp.pojo.Log;
import com.jshlearn.smicerp.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @Description
 * @ClassName LogServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/12 22:02
 **/
@Slf4j
@Service
public class LogServiceImpl implements LogService {
    @Resource
    private LogMapper logMapper;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void insertLog(Log logInfo) {
        try {
            logMapper.insert(logInfo);
        } catch (Exception e) {
            e.printStackTrace();
            ErpException.writeFail(e);
        }
    }
}

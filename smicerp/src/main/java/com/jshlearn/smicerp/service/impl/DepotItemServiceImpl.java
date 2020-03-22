package com.jshlearn.smicerp.service.impl;

import com.jshlearn.smicerp.mapper.DepotItemMapper;
import com.jshlearn.smicerp.service.DepotItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @Description
 * @ClassName DepotItemServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/22 17:11
 **/
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class DepotItemServiceImpl implements DepotItemService {
    @Resource
    private DepotItemMapper depotItemMapper;
}

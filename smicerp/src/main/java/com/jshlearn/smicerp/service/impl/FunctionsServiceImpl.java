package com.jshlearn.smicerp.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jshlearn.smicerp.constants.BusinessConstants;
import com.jshlearn.smicerp.exception.ErpException;
import com.jshlearn.smicerp.mapper.FunctionsMapper;
import com.jshlearn.smicerp.pojo.Functions;
import com.jshlearn.smicerp.service.FunctionsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description TODO
 * @ClassName FunctionsServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/14 12:45
 **/
@Slf4j
@Service
public class FunctionsServiceImpl implements FunctionsService {
    @Resource
    private FunctionsMapper functionsMapper;

    @Override
    public List<Functions> getRoleFunctions(String pNumber) {
        LambdaQueryWrapper<Functions> queryWrapper = Wrappers.lambdaQuery();
        queryWrapper.eq(Functions::getPNumber,pNumber).eq(Functions::isEnabled,true).eq(Functions::getDeleteFlag, BusinessConstants.DELETE_FLAG_EXISTS);
        queryWrapper.orderByAsc(Functions::getSort);
        List<Functions> list = null;
        try {
            list = functionsMapper.selectList(queryWrapper);
        } catch (Exception e) {
            log.error(">>>>>>>>>>查询功能列表失败！");
            ErpException.readFail(e);
        }
        return list;
    }
}

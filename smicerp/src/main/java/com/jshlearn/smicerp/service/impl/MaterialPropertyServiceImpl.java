package com.jshlearn.smicerp.service.impl;

import com.jshlearn.smicerp.mapper.MaterialPropertyMapper;
import com.jshlearn.smicerp.pojo.MaterialProperty;
import com.jshlearn.smicerp.service.MaterialPropertyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

/**
 * @Description TODO
 * @ClassName MaterialPropertyServiceImpl
 * @Author 蔡明涛
 * @Date 2020/3/15 17:23
 **/
@Slf4j
@Service
public class MaterialPropertyServiceImpl implements MaterialPropertyService {

    @Resource
    private MaterialPropertyMapper mapper;

    @Override
    public ArrayList<MaterialProperty> getAll() {
        return (ArrayList<MaterialProperty>) mapper.selectList(null);
    }
}

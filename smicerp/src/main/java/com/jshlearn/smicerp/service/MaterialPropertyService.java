package com.jshlearn.smicerp.service;

import com.jshlearn.smicerp.pojo.MaterialProperty;

import java.util.ArrayList;

/**
 * @Description
 * @ClassName MaterialPropertyService
 * @Author 蔡明涛
 * @Date 2020/3/15 17:21
 **/
public interface MaterialPropertyService {
    /**
     * 获取所有
     *
     * @return java.util.ArrayList<com.jshlearn.smicerp.pojo.MaterialProperty>
     * @author 蔡明涛
     * @date 2020/3/15 17:28
     */
    ArrayList<MaterialProperty> getAll();
}

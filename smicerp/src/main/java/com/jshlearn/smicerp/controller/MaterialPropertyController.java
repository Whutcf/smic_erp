package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.pojo.MaterialProperty;
import com.jshlearn.smicerp.service.MaterialPropertyService;
import com.jshlearn.smicerp.utils.ResultBean;
import com.jshlearn.smicerp.utils.ResultBeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description 产品扩展属性处理类
 * @ClassName MaterialPropertyController
 * @Author 蔡明涛
 * @Date 2020/3/15 17:19
 **/
@Slf4j
@RestController
@RequestMapping("/materialProperty")
public class MaterialPropertyController {

    @Resource
    private MaterialPropertyService service;

    @GetMapping("/list")
    public ResultBean<JSONObject> getAll() {
        JSONObject jsonObject = new JSONObject();
        ArrayList<MaterialProperty> list = service.getAll();
        jsonObject.put("rows", list);
        return ResultBeanUtil.success(jsonObject);
    }
}

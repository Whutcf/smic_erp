package com.jshlearn.smicerp.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jshlearn.smicerp.pojo.Functions;
import com.jshlearn.smicerp.service.FunctionsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Description 菜单栏控制类
 * @ClassName FunctionsController
 * @Author 蔡明涛
 * @Date 2020/3/14 12:42
 **/
@Slf4j
@RestController
@RequestMapping("/functions")
public class FunctionsController {

    @Resource
    private FunctionsService functionsService;

    @PostMapping("/findMenu")
    private JSONArray findMenu(@RequestParam(value = "pNumber") String pNumber,
                               @RequestParam(value = "hasFunctions") String hasFunctions) {
        // 用于存放json格式的数组，里面存放的是菜单的json数据
        JSONArray jsonParentArray = new JSONArray();
        // 获取父菜单目录合集
        List<Functions> parentFunctionsList = functionsService.getRoleFunctions(pNumber);

        if (null != parentFunctionsList) {
            for (Functions parentFunctions : parentFunctionsList) {
                // 存放父菜单的基本属性
                JSONObject parentItem = new JSONObject();
                parentItem.put("id",parentFunctions.getId());
                parentItem.put("text",parentFunctions.getName());
                parentItem.put("icon",parentFunctions.getIcon());
                // 获取一级子菜单
                List<Functions> firstChildrenFunctionsList = functionsService.getRoleFunctions(parentFunctions.getNumber());
                JSONArray jsonFirstChildrenArray = new JSONArray();
                // 如果一级子菜单是否存在
                if (firstChildrenFunctionsList.size()>0){
                    // 设置子菜单的属性为open
                    parentItem.put("state","open");
                    // 用来存放二级菜单的属性
                    JSONObject childrenItem = new JSONObject();
                    for (Functions firstChildrenFunctions : firstChildrenFunctionsList) {
                        // 判断用户是否拥有该角色Id
                        if (hasFunctions.contains("[" + firstChildrenFunctions.getId() + "]")){
                            childrenItem.put("id",firstChildrenFunctions.getId());
                            childrenItem.put("text",firstChildrenFunctions.getName());
                            childrenItem.put("icon",firstChildrenFunctions.getIcon());
                            // 判断一级子菜单是否存在下级菜单，存在即为目录
                            List<Functions> secondChildrenFunctions = functionsService.getRoleFunctions(firstChildrenFunctions.getNumber());
                            // 只有当一级子菜单不是目录的时候才会存在链接地址
                            if (secondChildrenFunctions.size()==0){
                                childrenItem.put("url",firstChildrenFunctions.getUrl());
                            }else {
                                // TODO 目前该项目只存在两级目录，所以不继续向下扩展
                                log.info(">>>>>>>>>> 项目存在三级目录，需要扩展！");
                            }
                            jsonFirstChildrenArray.add(childrenItem);
                            // 给父菜单添加子菜单的属性值
                            parentItem.put("children",jsonFirstChildrenArray);
                        }
                    }
                }
                // 将父菜单的json对象存放到json集合中
                jsonParentArray.add(parentItem);
            }
        }
        return jsonParentArray;
    }

}

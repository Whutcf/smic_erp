package com.jshlearn.smicerp.utils;

import com.jshlearn.smicerp.constants.PageConstants;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description 专门用来封装后台查询到的结果集
 * @ClassName EasyUIPage
 * @Author 蔡明涛
 * @Date 2020/3/21 9:26
 **/
public class EasyUiPageUtil {

    public static Map<String,Object> pageResult(long total,List<?> rows){
        Map<String,Object> map = new HashMap<>(16);
        map.put(PageConstants.TOTAL,total);
        map.put(PageConstants.ROWS,rows);
        return map;
    }


}

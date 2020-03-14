package com.jshlearn.smicerp.utils;

import com.jshlearn.smicerp.constants.ExceptionConstants;

/**
 * @Description 封装 ResultBean 的结果
 * @ClassName ResultBeanUtil
 * @Author 蔡明涛
 * @Date 2020/3/14 11:18
 **/
public class ResultBeanUtil {

    public static <V> ResultBean<V> error(int code, String message){
        ResultBean<V> resultBean = new ResultBean<>();
        resultBean.setCode(code);
        resultBean.setMessage(message);
        return resultBean;
    }

    public static <V> ResultBean<V> success(){
        ResultBean<V> resultBean = new ResultBean<>();
        resultBean.setCode(ExceptionConstants.SERVICE_SUCCESS_CODE);
        resultBean.setMessage("Success!");
        return resultBean;
    }

    public static <V> ResultBean<V> success(V data){
        ResultBean<V> resultBean = new ResultBean<>();
        resultBean.setCode(ExceptionConstants.SERVICE_SUCCESS_CODE);
        resultBean.setMessage("Success!");
        resultBean.setData(data);
        return resultBean;
    }
}

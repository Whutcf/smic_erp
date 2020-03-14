package com.jshlearn.smicerp.utils;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @Description 返回结果集
 * @ClassName ResultBean
 * @Author 蔡明涛
 * @Date 2020/3/12 19:58
 **/
@Data
public class ResultBean<T> implements Serializable {
    private static final long serialVersionUID = -5133843810880576057L;
    private int code;
    private String message;
    private T data;
}

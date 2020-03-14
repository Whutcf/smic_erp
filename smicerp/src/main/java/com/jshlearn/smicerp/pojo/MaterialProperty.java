package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 产品扩展字段表
 * @ClassName MaterialProperty
 * @Author 蔡明涛
 * @Date 2020/3/7 12:07
 **/
@Data
public class MaterialProperty {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 原始名称
     */
    private String nativeName;
    /**
     * 启用 0-禁用  1-启用
     */
    private boolean enabled;
    /**
     * 排序
     */
    private String sort;
    /**
     * 别名
     */
    private String anotherName;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}

package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 经手人表
 * @ClassName Person
 * @Author 蔡明涛
 * @Date 2020/3/7 12:53
 **/
@Data
public class Person {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 类型
     */
    private String type;
    /**
     * 姓名
     */
    private String name;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}

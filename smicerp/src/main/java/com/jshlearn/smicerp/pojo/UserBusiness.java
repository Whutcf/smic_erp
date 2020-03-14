package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @Description 用户/角色/模块关系表
 * @ClassName UserBusiness
 * @Author 蔡明涛
 * @Date 2020/3/7 15:04
 **/
@Data
public class UserBusiness {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 类别
     */
    private String type;
    /**
     * 主ID
     */
    private String keyId;
    /**
     * 值
     */
    private String value;
    /**
     * 按钮权限
     */
    private String btnStr;
    /**
     * 删除标记，0未删除，1删除
     */
    private String delete_Flag;
}

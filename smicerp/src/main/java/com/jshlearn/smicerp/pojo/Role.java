package com.jshlearn.smicerp.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * @Description 角色表
 * @ClassName Role
 * @Author 蔡明涛
 * @Date 2020/3/7 12:53
 **/
@Data
public class Role {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    /**
     * 名称
     */
    private String name;
    /**
     * 类型
     */
    private String type;
    /**
     * 值
     */
    private String value;
    /**
     * 描述
     */
    private String description;
    /**
     * 租户id
     */
    private Long tenantId;
    /**
     * 删除标记，0未删除，1删除
     */
    private String deleteFlag;
}
